import 'package:cached_network_image/cached_network_image.dart';
import 'package:college_cupid/models/user_profile.dart';
import 'package:college_cupid/screens/profile/view_profile/user_profile_screen.dart';
import 'package:college_cupid/services/api.dart';
import 'package:college_cupid/shared/colors.dart';
import 'package:college_cupid/shared/enums.dart';
import 'package:college_cupid/shared/globals.dart';
import 'package:college_cupid/stores/blocked_users_store.dart';
import 'package:college_cupid/widgets/global/custom_loader.dart';
import 'package:flutter/material.dart';

class BlockedUserInfoTile extends StatelessWidget {
  final String email;
  final int index;
  final BlockedUsersStore blockedUsersStore;

  const BlockedUserInfoTile(
      {required this.email,
      required this.blockedUsersStore,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      height: 66,
      width: 295,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: CupidColors.pinkColor),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: FutureBuilder(
        future: APIService().getUserProfile(email),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomLoader();
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProfileScreen(
                            isMine: false,
                            userProfile:
                                UserProfile.fromJson(snapshot.data!))));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'profilePic',
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(19), right: Radius.zero),
                      // Image border
                      child: SizedBox.fromSize(
                        child: CachedNetworkImage(
                            imageUrl:
                                snapshot.data!['profilePicUrl'].toString(),
                            cacheManager: customCacheManager,
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    const CustomLoader(),
                            fit: BoxFit.cover,
                            width: 64,
                            height: 66),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(snapshot.data!['name'],
                              style: const TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  color: CupidColors.blackColor,
                                  fontFamily: 'Sk-Modernist')),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            "${Program.values.firstWhere((p) => p.databaseString == snapshot.data!['program']).displayString} '${snapshot.data!['yearOfJoin']}",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: CupidColors.blackColor,
                                fontFamily: 'Sk-Modernist')),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () async {
                      await blockedUsersStore.unblockUser(index);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.close,
                        color: CupidColors.pinkColor,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
