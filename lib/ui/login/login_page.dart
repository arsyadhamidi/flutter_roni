import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roni_api/ui/login/login_provider.dart';
import 'package:roni_api/ui/registrasi/registrasi_page.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        child: Consumer<LoginProvider>(
          builder: (context, login, child) {
            return Scaffold(
                backgroundColor: Colors.white,
                body: Form(
              key: login.loginFormKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(children: [
                      SizedBox(height: 50),
                      Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          child: Image(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.fill),
                        ),
                      ),

                      // Email Address
                      SizedBox(height: 30),
                      Text("Nomor Telepon",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: login.teleponTxt,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                            filled: true,
                            fillColor: Color.fromRGBO(243, 243, 243, 1),
                            hintText: "Entry phone number",
                            hintStyle: GoogleFonts.poppins(fontSize: 14),
                            prefixIcon: DropdownButton<String>(
                              value: login.countryCode,
                              onChanged: login.selectCountry,
                              underline: Container(),
                              items: [
                                DropdownMenuItem (
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.grey.withOpacity(0.2),
                                          backgroundImage: AssetImage('assets/images/malaysia.jpg'),
                                        ),
                                        SizedBox(width: 5),
                                        Text("+60", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ),
                                  value: '60',
                                ),
                                DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.grey.withOpacity(0.2),
                                            backgroundImage: AssetImage('assets/images/indonesia.jpg'),
                                          ),
                                          SizedBox(width: 5),
                                          Text("+62", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),),
                                        ],
                                      ),
                                    ),
                                    value: '62'
                                ),
                              ],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number.';
                          }
                          if(value.length < 10){
                            return 'Enter a phone number of at least 10 characters';
                          }else{
                            return null;
                          }
                        },
                      ),

                      // Password
                      SizedBox(height: 25),
                      Text("Password",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: login.passwordTxt,
                        obscureText: login.isObscureTxt,
                        decoration: InputDecoration(
                            fillColor: Color.fromRGBO(243, 243, 243, 1),
                            filled: true,
                            hintText: "Masukan password",
                            prefixIcon: Icon(
                              CupertinoIcons.lock_fill,
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                login.isObscureTxt
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                login.inHidePassword();
                              },
                            ),
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password wajib diisi';
                          } else if (value.length < 8) {
                            return 'Password minimal 8 karakter';
                          }
                          return null;
                        },
                      ),

                      //  Button
                      SizedBox(height: 50),
                      MaterialButton(
                        height: 48,
                        minWidth: 270,
                        color: Color.fromRGBO(55, 168, 53, 1),
                        onPressed: login.isLoading
                            ? null
                            : () {
                          if (login.loginFormKey.currentState
                              ?.validate() ==
                              true) {
                            login.loginAuth(context);
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide.none,
                        ),
                        child: login.isLoading
                            ? CircularProgressIndicator(
                            valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.blue))
                            : Text(
                          "Masuk",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Kamu belum punya akun ? "),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrasiPage()));
                              },
                              child: Text(
                                "Registrasi !",
                                style: GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ])),
              ),
            ));
          },
        ));
  }
}
