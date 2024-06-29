import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:sejun2_portfolio/change_log_screen.dart';
import 'package:sejun2_portfolio/installing_screen.dart';
import 'package:sejun2_portfolio/read_me_screen.dart';
import 'package:sejun2_portfolio/scores_screen.dart';
import 'package:sejun2_portfolio/versions_screen.dart';
import 'package:sejun2_portfolio/view/v_aside.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/my_theme.dart';
import '../widgets/header_desc.dart';
import '../widgets/underlined_tab.dart';

class MainContentView extends HookWidget {
  const MainContentView({required this.width, required this.isAsideVisible, super.key});

  final double width;
  final bool isAsideVisible;

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState(0);
    final controller = usePageController(initialPage: 0);

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'sejun2_portfolio 1.0.0',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
          const Gap(14),
          Wrap(
            children: [
              const Text(
                'Published in 2024.06.29',
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse('https://github.com/sejun2'), mode: LaunchMode.inAppBrowserView);
                },
                splashColor: lightBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
                hoverColor: Colors.transparent,
                child: const Text('github.com/sejun2', style: TextStyle(color: lightBlue)),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse('https://sejun2.tistory.com'), mode: LaunchMode.inAppBrowserView);
                },
                splashColor: lightBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
                hoverColor: Colors.transparent,
                child: const Text('sejun2.tistory.com', style: TextStyle(color: lightBlue)),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: lightBlue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Text(
                  'Dart 3 compatible',
                  style: TextStyle(
                    color: lightBlue,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          const HeaderDesc(
            title: 'SDK',
            desc: [
              'Flutter',
              'Android',
              'Dart',
              'Kotlin',
              'Java',
            ],
          ),
          const Gap(4.0),
          const HeaderDesc(
            title: 'Platform',
            desc: [
              'Flutter',
            ],
          ),
          if (!isAsideVisible) ...[
            const Gap(16),
            Text('metadata').tr(),
            const Gap(20),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Text(
                  'more'.tr(),
                  style: TextStyle(color: lightBlue),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                            appBar: AppBar(
                              backgroundColor: Colors.transparent,
                            ),
                            body: const Center(
                                child: AsideView(
                              width: 400,
                            )))),
                  );
                },
              ),
            ),
          ],
          const Gap(20),
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            color: Theme.of(context).brightness == Brightness.light ? lightGrey : dark1,
            width: double.infinity,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                UnderlinedTab(
                    text: 'ReadMe',
                    isSelected: tabIndex.value == 0,
                    onTap: () {
                      tabIndex.value = 0;
                      controller.jumpToPage(0);
                    }),
                UnderlinedTab(
                    text: 'ChangeLog',
                    isSelected: tabIndex.value == 1,
                    onTap: () {
                      tabIndex.value = 1;
                      controller.jumpToPage(1);
                    }),
                UnderlinedTab(
                    text: 'Installing',
                    isSelected: tabIndex.value == 2,
                    onTap: () {
                      tabIndex.value = 2;
                      controller.jumpToPage(2);
                    }),
                UnderlinedTab(
                    text: 'Versions',
                    isSelected: tabIndex.value == 3,
                    onTap: () {
                      tabIndex.value = 3;
                      controller.jumpToPage(3);
                    }),
                UnderlinedTab(
                    text: 'Scores',
                    isSelected: tabIndex.value == 4,
                    onTap: () {
                      tabIndex.value = 4;
                      controller.jumpToPage(4);
                    }),
              ],
            ),
          ),
          const Gap(24),
          SizedBox(
            height: 1800,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: [
                ReadMeScreen(),
                ChangeLogScreen(),
                InstallingScreen(),
                VersionsScreen(),
                ScoresScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
