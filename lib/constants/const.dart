import 'package:flutter/material.dart';

const String homeScreenTitle =
    'Создавайте видеоролики, которые\n поражают воображение';
const String firstPrice = r'23.99 $/год';
const String firstPricePart = '           ---\n временное \nпредложение';
const String secondPrice = r'11.99 $/месяц';
const String secondPricePart =
    '               ---\n Получите полный\n   доступ ко всем\n        шаблонам';
const String saveBought = 'Восстановить покупки ';
const String confidan = 'Политика конфиденциальности           ';
const String cancellation = '      Отменить подписку';
const String a =
    '                                  Автовозобновляемая подписка.\n              Платная подписка за указанный перод представляет доступ к\n    использованию приложения без рекламы ко всем коллекциям Reelscope.\n     Подписка продлевается автоматически, если автовосстановление\n       не будет отключено за 24 часа до окончания текущего периода.\n Оплата за продление подписки будет взиматься согласно выбранному\n     плану в течении 24 часов до окончания текущей подписки. Вы записи\n            в любой момент после покупки, и это не повлияет на текущий\n                                     активный период подписки.';
const String categories = 'Название категории';
const String trendCnahge = 'Тренды быстро меняются';
const String notif = 'Уведомлять о выходе новых шаблонов';
const String template = 'Шаблоны';
const String favorite = 'Изранное';
const String myProject = 'Проекты';
const String setting = 'Настройки';

final List<String> types = [
  'Рилс',
  'Пост',
  'Сторис',
  'Сторис',
  'TikTok',
  'YouTube video',
];

final List<String> iconTypes = [
  'assets/icons/insta_icon.svg',
  'assets/icons/insta_icon.svg',
  'assets/icons/insta_icon.svg',
  'assets/icons/telegram_icon.svg',
  'assets/icons/tiktok_icon.svg',
  'assets/icons/youtube_icon.svg',
];
final List<Widget> firstphotos = [
  Image.asset('assets/images/photo1.png', scale: 4),
  Image.asset('assets/images/photo3.png', scale: 4),
  Image.asset('assets/images/photo8.png', scale: 4),
  Image.asset('assets/images/photo7.png', scale: 4),
  Image.asset('assets/images/photo2.png', scale: 4),
  Image.asset('assets/images/photo9.png', scale: 4),
  Image.asset('assets/images/photo12.png', scale: 4),
  Image.asset('assets/images/photo11.png', scale: 4),
  Image.asset('assets/images/photo6.png', scale: 4),
  Image.asset('assets/images/photo4.png', scale: 4),
];

final List<String> reelsPhotos = [
  'assets/images/reels1.png',
  'assets/images/reels2.png',
  'assets/images/reels3.png',
  'assets/images/reels4.png',
  'assets/images/reels5.png',
  'assets/images/reels6.png',
];

bool isActiveIcon = true;