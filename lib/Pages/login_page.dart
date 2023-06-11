import 'package:ecom_app/core/constaints/my_colors.dart';
import 'package:ecom_app/providers/auth_provider.dart';
import 'package:ecom_app/route/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const _AppBarSection(),
          const _LogoSection(),
          _LogInSignUpSection(),
        ],
      ),
    ));
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26.0),
      child: Center(
        child: Image.asset(
          "assets/graphics/common/logo.png",
          width: 177.w,
        ),
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget {
  const _AppBarSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Welcome 👋",
                style: TextStyle(fontSize: 14.sp),
              ),
              Text(
                "Lets Login or Signup",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/graphics/common/avater.png"),
          )
        ],
      ),
    );
  }
}

class _LogInSignUpSection extends StatelessWidget {
  _LogInSignUpSection();

  final TextEditingController _usernameEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "username",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
          ),
          TextField(
            controller: _usernameEditingController,
            decoration: InputDecoration(
              hintText: "example: Nafiz",
              fillColor: Mycolors.inputBackground,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 26.0, horizontal: 18.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
          ),
          TextField(
            controller: _passwordEditingController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Type your password here",
              fillColor: Mycolors.inputBackground,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 26.0, horizontal: 18.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
          const SizedBox(height: 26.0),
          Consumer<Authprovider>(
            builder: (context, authprovider, _) => authprovider.haserror
                ? Center(
                    child: Text(
                      "${authprovider.errormessage}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            // : const Center(
            //     child: Text(
            //       "Login Successfully!",
            //       style: TextStyle(color: Colors.red),
            //     ),
            //   ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: () async {
                //Getting username and password
                String username = _usernameEditingController.text;
                String password = _passwordEditingController.text;
                print("username: $username\nPassword: $password");

                //making http post request
                bool isLoginSucced =
                    await Provider.of<Authprovider>(context, listen: false)
                        .login(username, password);
                if (isLoginSucced) {
                  context.goNamed(RouteNames.HOME_PAGE);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Mycolors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              child: Consumer<Authprovider>(
                builder: (context, authprovider, _) => authprovider.isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "LogIn",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 26.0),
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "SignUp",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Mycolors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
