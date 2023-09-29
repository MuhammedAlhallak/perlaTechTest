import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perlatech/Auth/user/presentation/controllers/user_info_bloc.dart';
import 'package:perlatech/core/localization/app_lang.dart';

import 'package:perlatech/resources/assets_manager.dart';
import 'package:perlatech/resources/color_manager.dart';
import 'package:perlatech/resources/font_manager.dart';
import 'package:perlatech/resources/styles_manager.dart';
import 'package:perlatech/resources/values_manager.dart';

import '../../../Auth/login/presentation/components/custom_textfield.dart';
import '../../../core/services/services_locator.dart';
import '../../../resources/strings_manager.dart';
import '../components/drawer.dart';
import '../controllers/home_bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final TextEditingController controller = TextEditingController();
  final bloc = HomeBloc();

  @override
  void initState() {
    bloc.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      extendBody: true,
      extendBodyBehindAppBar: true,
      drawer: CustomDrawer(),
      body: BlocProvider(
        create: (context) => UserInfoBloc(sl(), sl()),
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: bloc,
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPading.p24.w,
                      top: AppPading.p48.h,
                      right: AppPading.p24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: AppSize.s40.h,
                          height: AppSize.s40.h,
                          decoration: BoxDecoration(
                            color: sl<ColorsManager>().textFieldBackground,
                            borderRadius: BorderRadius.circular(AppSize.s20.h),
                          ),
                          padding: EdgeInsets.all(AppPading.p8.h),
                          child: SvgPicture.asset(
                            ImagesAssets.menu,
                            width: AppSize.s24.h,
                            height: AppSize.s24.h,
                          ),
                        ),
                        onTap: () => _scaffoldState.currentState?.openDrawer(),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: AppMargin.m32.h,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: AppSize.s252.w,
                              height: AppSize.s48.h,
                              child: CustomTextField(
                                controller: controller,
                                hintText: AppStrings.enterYourText.tr(context),
                              ),
                            ),
                            SizedBox(
                              width: AppSize.s8.w,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                bloc.setData(controller.text);
                                controller.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                    AppSize.s82.w,
                                    AppSize.s48.h,
                                  ),
                                  backgroundColor: sl<ColorsManager>().primary),
                              child: Text(AppStrings.add.tr(context),
                                  style: getMediumMontesertStyle(
                                      color: sl<ColorsManager>().white,
                                      fontSzie: AppSize.s16.sp)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: AppSize.s342.w,
                        height: AppSize.s40.h,
                        color: sl<ColorsManager>().tableTitleBackground,
                        padding:
                            EdgeInsets.symmetric(vertical: AppPading.p13.h),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: AppMargin.m24.w),
                              child: Text(AppStrings.text.tr(context),
                                  style: getMediumMontesertStyle(
                                      color: sl<ColorsManager>().textTable,
                                      fontSzie: FontSzie.s12.sp),
                                  textAlign: TextAlign.center),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: AppMargin.m155.w),
                              child: Text(AppStrings.date.tr(context),
                                  style: getMediumMontesertStyle(
                                      color: sl<ColorsManager>().textTable,
                                      fontSzie: FontSzie.s12.sp),
                                  textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return Container(
                            height: AppSize.s1.h,
                            width: AppSize.s342.w,
                            color: sl<ColorsManager>().divider,
                          );
                        },
                        itemCount: state.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: AppSize.s342.w,
                            height: AppSize.s40.h,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: AppMargin.m24.w,
                                    top: AppMargin.m13.h,
                                    bottom: AppMargin.m10.h,
                                  ),
                                  width: AppSize.s133.w,
                                  child: Text(
                                    state.data[index].text,
                                    style: getRegularInterStyle(
                                        color: sl<ColorsManager>().darkGrey,
                                        fontSzie: FontSzie.s12.sp),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: AppMargin.m48.w,
                                    top: AppMargin.m14.h,
                                    bottom: AppMargin.m12.h,
                                  ),
                                  width: AppSize.s62.w,
                                  child: Text(
                                    state.data[index].date,
                                    style: getRegularMontesertStyle(
                                        color: sl<ColorsManager>().darkGrey,
                                        fontSzie: FontSzie.s10.sp),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: AppMargin.m27.w,
                                    top: AppMargin.m12.h,
                                    bottom: AppMargin.m10.h,
                                  ),
                                  width: AppSize.s16.w,
                                  height: AppSize.s16.w,
                                  child: SvgPicture.asset(ImagesAssets.edit),
                                ),
                                InkWell(
                                  onTap: () {
                                    bloc.deleteData(state.data[index].uuid);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: AppMargin.m8.w,
                                      top: AppMargin.m12.h,
                                      bottom: AppMargin.m10.h,
                                      right: AppMargin.m8.w,
                                    ),
                                    width: AppSize.s16.w,
                                    height: AppSize.s16.w,
                                    child: SvgPicture.asset(ImagesAssets.trash),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// غير مكان الليسنر
// Center(
//               child: BlocBuilder<UserInfoBloc, UserInfoState>(
//                 builder: (context, state) {
//                   return SizedBox(
//                     width: 100.w,
//                     height: 100.h,
//                     child: InkWell(
//                         child: const Text("hi"),
//                         onTap: () {
//                           context.read<UserInfoBloc>().add(LogOutEvent());
//                         }),
//                   );
//                 },
//               ),
//             ),
