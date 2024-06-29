import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/my_theme.dart';

class AsideView extends StatelessWidget {
  const AsideView({super.key, this.width = 200});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // scores
          _buildScores(context),
          _buildVerticalDivider(),
          // publisher
          _buildPublisher(context),
          _buildVerticalDivider(),
          // Metadata
          _buildMetadata(),
          _buildVerticalDivider(),
          // Documentation
          _buildDocumentation(),
          _buildVerticalDivider(),
          // License
          _buildLicense(),
          _buildVerticalDivider(),
          // Dependencies
          _buildDependencies(),
          _buildVerticalDivider(),
        ],
      ),
    );
  }

  _buildDependencies() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DEPENDENCIES',
          style: TextStyle(
            fontSize: 11,
          ),
        ),
        Gap(6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('flutter', style: TextStyle(color: lightBlue)),
            Gap(4),
            Text('flutter_test', style: TextStyle(color: lightBlue)),
            Gap(4),
            Text(
              'sejun2_portfolio',
              style: TextStyle(color: lightBlue),
            ),
          ],
        ),
      ],
    );
  }

  _buildLicense() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LICENSE',
          style: TextStyle(
            fontSize: 11,
          ),
        ),
        Gap(6),
        Text(
          'MIT LICENSE',
          style: TextStyle(
            color: lightBlue,
          ),
        ),
      ],
    );
  }

  Row _buildScores(BuildContext context) {
    return Row(
      children: [
        _buildScore(score: '11', title: 'LIKES', context: context),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 38,
          width: 1,
          color: lightGrey2,
        ),
        _buildScore(score: '4.5', title: 'PUB POINTS', context: context),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 38,
          width: 1,
          color: lightGrey2,
        ),
        _buildScore(score: '72%', title: 'POPULARITY', context: context),
      ],
    );
  }

  _buildDocumentation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DOCUMENTATION',
          style: TextStyle(
            fontSize: 11,
          ),
        ),
        const Gap(6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: const Text(
                'API reference',
                style: TextStyle(color: lightBlue),
              ),
              onTap: () {
                launchUrl(Uri.parse('https://pub.dev/packages/sejun2_portfolio/documentation'),
                    mode: LaunchMode.inAppBrowserView);
              },
            ),
          ],
        ),
      ],
    );
  }

  Column _buildPublisher(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PUBLISHER',
          style: TextStyle(
            fontSize: 11,
          ),
        ),
        const Gap(4),
        Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/icons/ic_dart_logo.png'),
            ),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'sejun2',
                  style: TextStyle(
                    color: normalBlue,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'sejun2.dev',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelSmall?.color,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Container _buildVerticalDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 1,
      width: double.maxFinite,
      color: lightGrey2,
    );
  }

  _buildScore({required String score, required String title, required BuildContext context, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            score,
            style: const TextStyle(
              color: normalBlue,
              fontSize: 18,
            ),
          ),
          Text(title,
              style: TextStyle(
                color: Theme.of(context).textTheme.labelSmall?.color,
                fontSize: 9,
              )),
        ],
      ),
    );
  }

  _buildMetadata() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'METADATA',
          style: TextStyle(
            fontSize: 11,
          ),
        ),
        const Gap(6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('metadata'.tr()),
            const Gap(7),
            InkWell(
              child: const Text(
                'Repository (Github)',
                style: TextStyle(color: lightBlue),
              ),
              onTap: () {
                launchUrl(Uri.parse('https://github.com/sejun2'));
              },
            ),
            const Gap(2),
            const InkWell(
              child: Text(
                'View/report issues',
                style: TextStyle(
                  color: lightBlue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
