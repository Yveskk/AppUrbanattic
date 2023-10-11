import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:urbanattic/constants/global_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NouvelleReservation extends StatefulWidget {
  const NouvelleReservation({super.key});

  @override
  State<NouvelleReservation> createState() => _NouvelleReservationState();
}

class _NouvelleReservationState extends State<NouvelleReservation> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedArrivalTime;
  TimeOfDay? _selectedDepartureTime;
  int _selectedNumberOfPeople = 1;

  final TextEditingController _grenierController =
      TextEditingController(); // Ajout du contrôleur

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: _selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        )) ??
        DateTime.now();

    if (picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(
    BuildContext context,
    bool isArrivalTime,
  ) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        if (isArrivalTime) {
          _selectedArrivalTime = selectedTime;
        } else {
          _selectedDepartureTime = selectedTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          AppLocalizations.of(context)!.reservationTitle,
          style: const TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: pagePadding),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.dateCalendrier,
                  suffixIcon: IconButton(
                    icon: const Icon(Iconsax.calendar),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ),
                readOnly: true,
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? DateFormat.yMd().format(_selectedDate!)
                      : '',
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.heureArrive,
                  suffixIcon: IconButton(
                    icon: const Icon(Iconsax.clock),
                    onPressed: () {
                      _selectTime(context, true);
                    },
                  ),
                ),
                readOnly: true,
                controller: TextEditingController(
                  text: _selectedArrivalTime != null
                      ? _selectedArrivalTime!.format(context)
                      : '',
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.heureDepart,
                  suffixIcon: IconButton(
                    icon: const Icon(Iconsax.clock),
                    onPressed: () {
                      _selectTime(context, false);
                    },
                  ),
                ),
                readOnly: true,
                controller: TextEditingController(
                  text: _selectedDepartureTime != null
                      ? _selectedDepartureTime!.format(context)
                      : '',
                ),
              ),
              const SizedBox(height: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nombre de Personnes',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  DropdownButtonFormField<int>(
                    value: _selectedNumberOfPeople,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedNumberOfPeople = newValue!;
                      });
                    },
                    items: List.generate(10, (index) => index + 1)
                        .map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      hintText: '',
                      suffixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.grenie,
                ),
                controller:
                    _grenierController, // Associez le contrôleur au champ de texte
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push("/afficherReservation");
        },
        label: Text(AppLocalizations.of(context)!.saveButtonText),
      ),
    );
  }
}
