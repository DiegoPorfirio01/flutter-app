import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            readOnly: true,
            icon: Icons.person_outline,
            label: 'Nome',
            initialValue: appData.user.nome,
          ),
          CustomTextField(
            readOnly: true,
            icon: Icons.phone,
            label: 'Telefone',
            initialValue: appData.user.telefone,
          ),
          CustomTextField(
            readOnly: true,
            icon: Icons.email,
            label: 'E-mail',
            initialValue: appData.user.email,
          ),
          CustomTextField(
            readOnly: true,
            icon: Icons.file_copy_outlined,
            label: 'CPF',
            isSecret: true,
            initialValue: appData.user.cpf,
          ),
          SizedBox(
            height: 50,
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    CustomColors.customSwatchColor,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                onPressed: () {
                  updatePassword();
                },
                child: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  'Alterar Senha',
                )),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Alterar Senha',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha Atual',
                        isSecret: true,
                      ),
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Nova Senha',
                        isSecret: true,
                      ),
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Confirme Nova Senha',
                        isSecret: true,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColors.customSwatchColor,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Alterar Senha',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
