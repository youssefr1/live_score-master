import 'package:flutter/material.dart';
import 'package:live_score/src/core/extensions/nums.dart';
import 'package:live_score/src/core/extensions/strings.dart';

import 'package:live_score/src/core/domain/entities/teams.dart';
import 'package:live_score/src/core/utils/app_colors.dart';
import 'package:live_score/src/core/widgets/custom_image.dart';

class ViewTeam extends StatelessWidget {
  final Team team;

  const ViewTeam({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImage(width: 50.radius, height: 50.radius, imageUrl: team.logo),
        SizedBox(height: 10.height),
        FittedBox(
          child: Text(
            team.name.teamName,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
