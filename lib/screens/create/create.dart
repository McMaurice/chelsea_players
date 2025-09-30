import 'package:game_characters/models/character.dart';
import 'package:game_characters/models/vocation.dart';
import 'package:game_characters/screens/create/vocation_card.dart';
import 'package:game_characters/services/character_store.dart';
import 'package:game_characters/shared/styled_button.dart';
import 'package:game_characters/shared/styled_text.dart';
import 'package:game_characters/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();
  
  // Handling selections
  Vocation selectedVocation = Vocation.junkie;

  //disposes controllers when not in use
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      //Handles error dialog
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading('Nameless Legend!🤔'),
            content: const StyledText("Give your legend a captivating name..."),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const StyledHeading('Okay Sensei 🙏🏾'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      //Handles error dialog
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading('Missing Slogan!🤔'),
            content: const StyledText(
              'A hero without a slogan is unheard. Choose yours...',
            ),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const StyledHeading('Okay Sensei 🙏🏾'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }

    Provider.of<CharacterStore>(context, listen: false).addCharacter(
      Character(
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
        id: uuid.v4(),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle('create your legend')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Welcome new player!')),
              const Center(
                child: StyledText('Create a name and slogan for this legend'),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText("Enter Name of legend"),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText("Enter Slogan"),
                ),
              ),
              const SizedBox(height: 30),

              //Select a vocation
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Choose a vocation')),
              const Center(
                child: StyledText('This determines your available skills'),
              ),
              const SizedBox(height: 30),

              //vocation cards
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                selectedCard: updateVocation,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                selectedCard: updateVocation,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                selectedCard: updateVocation,
                vocation: Vocation.wizard,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                selectedCard: updateVocation,
                vocation: Vocation.raider,
              ),

              // Goodluck message
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Godspeed warrior!')),
              const Center(
                child: StyledText('May fortune favor your quest...'),
              ),
              const SizedBox(height: 30),

              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: const StyledHeading('Create Legend'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
