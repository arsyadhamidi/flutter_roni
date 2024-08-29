import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roni_api/ui/login/login_page.dart';
import 'package:roni_api/ui/registrasi/registrasi_provider.dart';

class RegistrasiPage extends StatelessWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegistrasiProvider(),
      child: Consumer<RegistrasiProvider>(
        builder: (context, registrasi, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: registrasi.registrasiFormKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image(
                                  image: AssetImage("assets/images/logo.png"),
                                  fit: BoxFit.fill),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Form Registrasi",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18)),
                                Container(
                                    width: 230,
                                    child: Text(
                                      "Silahkan buat akun anda dengan benar",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: Colors.grey),
                                    )),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(height: 10),

                        // NIK
                        Text("Nomor Induk Kependudukan (NIK)",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: registrasi.nikTxt,
                          decoration: InputDecoration(
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              filled: true,
                              hintText: "Masukan nomor induk kependudukan",
                              prefixIcon: Icon(
                                CupertinoIcons.number,
                                color: Colors.grey,
                              ),
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nomor Induk Kependudukan wajib diisi';
                            } else if (value.length < 16) {
                              return 'Nomor Induk Kependudukan minimal 16 Karakter';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        // Nama Lengkap
                        Text("Nama Lengkap",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: registrasi.namaLengkapTxt,
                          decoration: InputDecoration(
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              filled: true,
                              hintText: "Masukan nama lengkap",
                              prefixIcon: Icon(
                                CupertinoIcons.person_alt,
                                color: Colors.grey,
                              ),
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama Lengkap wajib diisi';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        // Email Address
                        Text("Email Address",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: registrasi.emailAddressTxt,
                          decoration: InputDecoration(
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              filled: true,
                              hintText: "Masukan email address",
                              prefixIcon: Icon(
                                CupertinoIcons.envelope_fill,
                                color: Colors.grey,
                              ),
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email wajib diisi';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Format email tidak valid';
                            }
                            return null;
                          },
                        ),

                        // Telepon
                        SizedBox(height: 20),
                        Text("Nomor Telepon",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: registrasi.teleponTxt,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 16),
                              filled: true,
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              hintText: "Entry phone number",
                              hintStyle: GoogleFonts.poppins(fontSize: 14),
                              prefixIcon: DropdownButton<String>(
                                value: registrasi.countryCode,
                                onChanged: registrasi.selectCountry,
                                underline: Container(),
                                items: [
                                  DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.withOpacity(0.2),
                                            backgroundImage: AssetImage(
                                                'assets/images/malaysia.jpg'),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "+60",
                                            style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
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
                                              backgroundColor:
                                                  Colors.grey.withOpacity(0.2),
                                              backgroundImage: AssetImage(
                                                  'assets/images/indonesia.jpg'),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "+62",
                                              style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      value: '62'),
                                ],
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number.';
                            }
                            if (value.length < 10) {
                              return 'Enter a phone number of at least 10 characters';
                            } else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(height: 20),

                        // Password
                        Text("Password",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 10),
                        TextFormField(
                          obscureText: registrasi.isObscurePass,
                          controller: registrasi.passwordTxt,
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
                                  registrasi.isObscurePass
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  registrasi.inHidePassword();
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

                        SizedBox(height: 20),

                        // Confirmation Password
                        Text("Konfirmasi Password",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 10),
                        TextFormField(
                          obscureText: registrasi.isObscureConfTxt,
                          controller: registrasi.konfirmPasswordTxt,
                          decoration: InputDecoration(
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              filled: true,
                              hintText: "Masukan konfirmasi password",
                              prefixIcon: Icon(
                                CupertinoIcons.lock_fill,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  registrasi.isObscureConfTxt
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  registrasi.inHidePasswordConfirm();
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
                              return 'Konfirmasi Password wajib diisi';
                            } else if (value.length < 8) {
                              return 'Konfirmasi Password minimal 8 karakter';
                            } else if (value != registrasi.passwordTxt.text) {
                              return 'Password dan konfirmasi password tidak sesuai.';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        // Tanggal Lahir
                        Text("Tanggal Lahir",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: registrasi.tglLahirTxt,
                          readOnly: true,
                          decoration: InputDecoration(
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              filled: true,
                              hintText: "Masukan tanggal lahir",
                              prefixIcon: Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              )),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              registrasi.setDate(pickedDate);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tanggal Lahir wajib diisi';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        // Jenis Kelamin
                        Text("Jenis Kelamin",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500)),
                        Row(children: [
                          Expanded(
                            child: RadioListTile<String>(
                              activeColor: Colors.blue,
                              title: Text('Pria'),
                              value: 'Pria',
                              groupValue: registrasi.selectedGender,
                              onChanged: (String? value) {
                                if (value != null) {
                                  registrasi.selectGender(value);
                                }
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              activeColor: Colors.blue,
                              title: Text('Wanita'),
                              value: 'Wanita',
                              groupValue: registrasi.selectedGender,
                              onChanged: (String? value) {
                                if (value != null) {
                                  registrasi.selectGender(value);
                                }
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ]),
                        SizedBox(height: 20),

                        // Nama Keluarga
                        Text("Nama Keluarga",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: registrasi.namaKeluargaTxt,
                          decoration: InputDecoration(
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              filled: true,
                              hintText: "Masukan nama keluarga",
                              prefixIcon: Icon(
                                CupertinoIcons.person_alt,
                                color: Colors.grey,
                              ),
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama Keluarga wajib diisi';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        // Alamat
                        Text("Alamat Domisili",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: 5,
                          controller: registrasi.alamatTxt,
                          decoration: InputDecoration(
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              filled: true,
                              hintText: "Masukan alamat domisili",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Alamat domisili wajib diisi';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 50),
                        MaterialButton(
                          height: 48,
                          minWidth: double.infinity,
                          color: Color.fromRGBO(55, 168, 53, 1),
                          onPressed: () async {
                            if (registrasi.registrasiFormKey.currentState
                                    ?.validate() ==
                                true) {
                              await registrasi.addRegister(context);
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide.none,
                          ),
                          child: Text("Daftar",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),

                        //Button
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sudah punya akun ? "),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginPageView()));
                                },
                                child: Text(
                                  "Login !",
                                  style: GoogleFonts.poppins(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
