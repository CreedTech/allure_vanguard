library widgets;

import 'dart:math' as math;
import 'package:allure_vanguard/bloc/get_hot_news_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../bloc/get_top_headlines_bloc.dart';
import '../../config/utils/loader.dart';
import '../../models/article.dart';
import '../../models/article_response.dart';

import '../../config/constants/assets.dart';
import '../../config/constants/palettes.dart';
import '../../config/constants/styles.dart';
part 'home/home_app_bar.dart';
part 'splash/splash_animation.dart';
part 'custom_paint.dart';
part 'headline_slider.dart';
part 'error_widget.dart';
part 'section_header_widget.dart';
part 'news_card.dart';
part 'button_widget.dart';
part 'news_list.dart';