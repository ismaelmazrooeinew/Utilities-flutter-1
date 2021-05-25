part of '../utilities.dart';

class AutoSizeGroup {
  final _listeners = <_AutoSizeTextState, double>{};
  var _widgetsNotified = false;
  double _fontSize = double.infinity;

  _register(_AutoSizeTextState text) => _listeners[text] = double.infinity;

  _updateFontSize(_AutoSizeTextState text, double maxFontSize) {
    var oldFontSize = _fontSize;
    if (maxFontSize <= _fontSize) {
      _fontSize = maxFontSize;
      _listeners[text] = maxFontSize;
    } else if (_listeners[text] == _fontSize) {
      _listeners[text] = maxFontSize;
      _fontSize = double.infinity;
      for (var size in _listeners.values) {
        if (size < _fontSize) _fontSize = size;
      }
    } else
      _listeners[text] = maxFontSize;

    if (oldFontSize != _fontSize) {
      _widgetsNotified = false;
      scheduleMicrotask(_notifyListeners);
    }
  }

  _notifyListeners() {
    if (_widgetsNotified)
      return;
    else
      _widgetsNotified = true;

    for (var textState in _listeners.keys) {
      if (textState.mounted) textState._notifySync();
    }
  }

  _remove(_AutoSizeTextState text) {
    _updateFontSize(text, double.infinity);
    _listeners.remove(text);
  }
}

class AutoSizeText extends StatefulWidget {
  const AutoSizeText(String this.data,
      {Key? key,
      this.textKey,
      this.style,
      this.strutStyle,
      this.minFontSize = 12,
      this.maxFontSize = double.infinity,
      this.stepGranularity = 1,
      this.presetFontSizes,
      this.group,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.wrapWords = true,
      this.overflow,
      this.overflowReplacement,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel})
      : textSpan = null,
        super(key: key);

  const AutoSizeText.rich(TextSpan this.textSpan,
      {Key? key,
      this.textKey,
      this.style,
      this.strutStyle,
      this.minFontSize = 12,
      this.maxFontSize = double.infinity,
      this.stepGranularity = 1,
      this.presetFontSizes,
      this.group,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.wrapWords = true,
      this.overflow,
      this.overflowReplacement,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel})
      : data = null,
        super(key: key);
  final Key? textKey;
  final String? data;
  final TextSpan? textSpan;
  final TextStyle? style;
  static const double _defaultFontSize = 14.0;
  final StrutStyle? strutStyle;
  final double minFontSize;
  final double maxFontSize;
  final double stepGranularity;
  final List<double>? presetFontSizes;
  final AutoSizeGroup? group;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final bool wrapWords;
  final TextOverflow? overflow;
  final Widget? overflowReplacement;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;

  @override
  _AutoSizeTextState createState() => _AutoSizeTextState();
}

class _AutoSizeTextState extends State<AutoSizeText> {
  @override
  initState() {
    super.initState();
    if (widget.group != null) widget.group!._register(this);
  }

  @override
  void didUpdateWidget(AutoSizeText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.group != widget.group) {
      oldWidget.group?._remove(this);
      widget.group?._register(this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      var defaultTextStyle = DefaultTextStyle.of(context);
      var style = widget.style;
      if (widget.style == null || widget.style!.inherit) style = defaultTextStyle.style.merge(widget.style);
      if (style!.fontSize == null) style = style.copyWith(fontSize: AutoSizeText._defaultFontSize);
      var maxLines = widget.maxLines ?? defaultTextStyle.maxLines;
      _sanityCheck(style, maxLines);
      var result = _calculateFontSize(size, style, maxLines);
      var fontSize = result[0] as double;
      var textFits = result[1] as bool;
      Widget text;
      if (widget.group != null) {
        widget.group!._updateFontSize(this, fontSize);
        text = _buildText(widget.group!._fontSize, style, maxLines);
      } else
        text = _buildText(fontSize, style, maxLines);

      if (widget.overflowReplacement != null && !textFits)
        return widget.overflowReplacement!;
      else
        return text;
    });
  }

  void _sanityCheck(TextStyle? style, int? maxLines) {
    assert(widget.overflow == null || widget.overflowReplacement == null, 'Either overflow or overflowReplacement have to be null.');
    assert(maxLines == null || maxLines > 0, 'MaxLines has to be grater than or equal to 1.');
    assert(widget.key == null || widget.key != widget.textKey, 'Key and textKey cannot be the same.');
    if (widget.presetFontSizes == null) {
      assert(widget.stepGranularity >= 0.1, 'StepGranularity has to be greater than or equal to 0.1. It is not a good idea to resize the font with a higher accuracy.');
      assert(widget.minFontSize >= 0, 'MinFontSize has to be greater than or equal to 0.');
      assert(widget.maxFontSize > 0, 'MaxFontSize has to be greater than 0.');
      assert(widget.minFontSize <= widget.maxFontSize, 'MinFontSize has to be smaller or equal than maxFontSize.');
      assert(widget.minFontSize / widget.stepGranularity % 1 == 0, 'MinFontSize has to be multiples of stepGranularity.');
      if (widget.maxFontSize != double.infinity) assert(widget.maxFontSize / widget.stepGranularity % 1 == 0, 'MaxFontSize has to be multiples of stepGranularity.');
    } else
      assert(widget.presetFontSizes!.isNotEmpty, 'PresetFontSizes has to be nonempty.');
  }

  List _calculateFontSize(BoxConstraints size, TextStyle? style, int? maxLines) {
    var span = TextSpan(
      style: widget.textSpan?.style ?? style,
      text: widget.textSpan?.text ?? widget.data,
      children: widget.textSpan?.children,
      recognizer: widget.textSpan?.recognizer,
    );
    var userScale = widget.textScaleFactor ?? MediaQuery.textScaleFactorOf(context!);
    int left;
    int right;
    var presetFontSizes = widget.presetFontSizes?.reversed.toList();
    if (presetFontSizes == null) {
      num defaultFontSize = style!.fontSize!.clamp(widget.minFontSize, widget.maxFontSize);
      var defaultScale = defaultFontSize * userScale / style.fontSize!;
      if (_checkTextFits(span, defaultScale, maxLines, size)) return [defaultFontSize * userScale, true];
      left = (widget.minFontSize / widget.stepGranularity).floor();
      right = (defaultFontSize / widget.stepGranularity).ceil();
    } else {
      left = 0;
      right = presetFontSizes.length - 1;
    }
    var lastValueFits = false;
    while (left <= right) {
      var mid = (left + (right - left) / 2).toInt();
      double scale;
      if (presetFontSizes == null)
        scale = mid * userScale * widget.stepGranularity / style!.fontSize!;
      else
        scale = presetFontSizes[mid] * userScale / style!.fontSize!;
      if (_checkTextFits(span, scale, maxLines, size)) {
        left = mid + 1;
        lastValueFits = true;
      } else
        right = mid - 1;
    }
    if (!lastValueFits) right += 1;
    double fontSize;
    if (presetFontSizes == null)
      fontSize = right * userScale * widget.stepGranularity;
    else
      fontSize = presetFontSizes[right] * userScale;
    return [fontSize, lastValueFits];
  }

  bool _checkTextFits(TextSpan text, double scale, int? maxLines, BoxConstraints constraints) {
    if (!widget.wrapWords) {
      var words = text.toPlainText().split(RegExp('\\s+'));
      var wordWrapTp = TextPainter(
          text: TextSpan(style: text.style, text: words.join('\n')),
          textAlign: widget.textAlign ?? TextAlign.left,
          textScaleFactor: scale,
          maxLines: words.length,
          locale: widget.locale,
          strutStyle: widget.strutStyle);
      wordWrapTp.layout(maxWidth: constraints.maxWidth);
      if (wordWrapTp.didExceedMaxLines || wordWrapTp.width > constraints.maxWidth) return false;
    }

    var tp = TextPainter(
        text: text,
        textAlign: widget.textAlign ?? TextAlign.left,
        textScaleFactor: scale,
        maxLines: maxLines,
        locale: widget.locale,
        strutStyle: widget.strutStyle);
    tp.layout(maxWidth: constraints.maxWidth);
    return !(tp.didExceedMaxLines || tp.height > constraints.maxHeight || tp.width > constraints.maxWidth);
  }

  Widget _buildText(double fontSize, TextStyle? style, int? maxLines) {
    if (widget.data != null)
      return Text(widget.data!,
          key: widget.textKey,
          style: style!.copyWith(fontSize: fontSize),
          strutStyle: widget.strutStyle,
          textAlign: widget.textAlign,
          // textDirection: widget.textDirection,
          locale: widget.locale,
          softWrap: widget.softWrap,
          overflow: widget.overflow,
          textScaleFactor: 1,
          maxLines: maxLines,
          semanticsLabel: widget.semanticsLabel);
    else
      return Text.rich(widget.textSpan!,
          key: widget.textKey,
          style: style,
          strutStyle: widget.strutStyle,
          textAlign: widget.textAlign,
          // textDirection: widget.textDirection,
          locale: widget.locale,
          softWrap: widget.softWrap,
          overflow: widget.overflow,
          textScaleFactor: fontSize / style!.fontSize!,
          maxLines: maxLines,
          semanticsLabel: widget.semanticsLabel);
  }

  _notifySync() => setState(() {});

  @override
  void dispose() {
    if (widget.group != null) widget.group!._remove(this);
    super.dispose();
  }
}
