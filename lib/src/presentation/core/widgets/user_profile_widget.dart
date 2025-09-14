import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/src/presentation/core/application_state/user_provider.dart';

class UserProfileWidget extends ConsumerWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(user.profileImageUrl),
        ),
        const SizedBox(height: 16),
        Text(
          'Hello, ${user.name}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
