import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sejun2_portfolio/providers/theme_provider.dart';
import 'package:sejun2_portfolio/ui/my_theme.dart';
import 'package:sejun2_portfolio/view/v_aside.dart';
import 'package:sejun2_portfolio/view/v_main_content.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final xPosition = useState(0.0);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.white10,
        onPressed: () {
          ref.read(themeProvider.notifier).toggleTheme();
        },
        child: Theme.of(context).brightness == Brightness.light
            ? const Icon(Icons.dark_mode)
            : const Icon(
                Icons.light_mode,
                color: Colors.white,
              ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // header
            Container(
              height: 50,
              width: double.infinity,
              color: dark1,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  // xPosition.value = Random().nextDouble() * 800;
                },
                child: AnimatedContainer(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  duration: const Duration(milliseconds: 300),
                  transform: Matrix4.translationValues(xPosition.value, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/ic_dart_logo.png',
                        width: 35,
                      ),
                      const Gap(12),
                      const Text(
                        'sejun2.dev',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      const Spacer(),
                      Image.asset('assets/images/img_runcat.gif', scale: 18,),
                    ],
                  ),
                ),
              ),
            ),
            //locale change button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () async {
                        await context
                            .setLocale(context.locale == const Locale('en') ? const Locale('ko') : const Locale('en'));
                        setState(() {});
                      },
                      icon: const Icon(Icons.language)),
                  Text(context.locale.toString() == 'ko' ? 'korean' : 'english').tr(),
                ],
              ),
            ),
            const Gap(70),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainContentView(
                        width: constraints.maxWidth - 250 > 400 ? min(850, constraints.maxWidth - 250) : 400,
                        isAsideVisible: constraints.maxWidth > 650,
                      ),
                      const SizedBox(width: 26),
                      if (constraints.maxWidth > 650) AsideView(),
                    ],
                  );
                }),
              ),
            ),
            // body

            // footer
          ],
        ),
      ),
    );
  }
}
