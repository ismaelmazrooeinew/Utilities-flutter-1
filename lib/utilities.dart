import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'dart:ui' as ui show WindowPadding;

import 'package:app_settings/app_settings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

export 'dart:async';
export 'dart:convert';

export 'package:carousel_slider/carousel_slider.dart';
export 'package:file_picker/file_picker.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:group_button/group_button.dart';
export 'package:intl/intl.dart';
// export 'package:meta/meta.dart';
// export 'package:path_provider/path_provider.dart';
export 'package:persian_tools/persian_tools.dart';
export 'package:share_plus/share_plus.dart';
export 'package:smooth_page_indicator/smooth_page_indicator.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:webview_flutter/webview_flutter.dart';

part 'extensions/align_extension.dart';

part 'extensions/center_extension.dart';

part 'extensions/container_extension.dart';

part 'extensions/date_extension.dart';

part 'extensions/gesture_detector_extension.dart';

part 'extensions/number_extension.dart';

part 'extensions/padding_extension.dart';

part 'extensions/shimmer_extension.dart';

part 'extensions/size_box_extension.dart';

part 'extensions/text_extension.dart';

part 'extensions/text_style_extension.dart';

part 'extensions/tooltip_extension.dart';

part 'extras/constants.dart';

part 'extras/error.dart';

part 'utils/availability.dart';

part 'utils/device_settings.dart';

part 'utils/download.dart';

part 'utils/file.dart';

part 'utils/get.dart';

part 'utils/http_interceptor.dart';

part 'utils/image.dart';

part 'utils/launch.dart';

part 'utils/local_storage.dart';

part 'utils/share.dart';

part 'utils/status_bar.dart';

part 'utils/string.dart';

part 'utils/utils.dart';

part 'widgets/container.dart';

part 'widgets/image.dart';

part 'widgets/menu/bottom_sheet.dart';

part 'widgets/menu/drop_down_form_field.dart';

part 'widgets/menu/picker_view.dart';
