import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  final String? serviceTitle;
  final String? servicePrice;
  final SpecialOffer? offer; // Add offer parameter

  const ReservationScreen({
    super.key,
    this.serviceTitle,
    this.servicePrice,
    this.offer,
  });

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = const TimeOfDay(hour: 9, minute: 0);
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  int _selectedDuration = 2; // hours
  bool _isRecurring = false;
  String _recurrence = 'Une fois';
  bool _isOfferApplied = false;
  double _originalPrice = 15000; // Default price in DZD
  double _discountedPrice = 15000;

  final List<String> _durations = ['1 heure', '2 heures', '3 heures', '4 heures', '5 heures', '6+ heures'];
  final List<String> _recurrenceOptions = ['Une fois', 'Hebdomadaire', 'Bi-hebdomadaire', 'Mensuel'];

  @override
  void initState() {
    super.initState();
    // Calculate discounted price if offer exists
    if (widget.offer != null) {
      _applyOffer();
    }
  }

  void _applyOffer() {
    if (widget.offer != null) {
      // Extract discount percentage from offer text
      String discountText = widget.offer!.discount;
      double discountPercent = 0;

      if (discountText.contains('%')) {
        try {
          discountPercent = double.parse(discountText.replaceAll(RegExp(r'[^0-9]'), '')) / 100;
        } catch (e) {
          discountPercent = 0.2; // Default 20%
        }
      } else if (discountText.contains('DZD')) {
        try {
          double discountAmount = double.parse(discountText.replaceAll(RegExp(r'[^0-9]'), ''));
          discountPercent = discountAmount / _originalPrice;
        } catch (e) {
          discountPercent = 0.1; // Default 10%
        }
      }

      _discountedPrice = _originalPrice * (1 - discountPercent);
      _isOfferApplied = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1C768C)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Réserver un Service',
          style: TextStyle(
            color: Color(0xFF1C768C),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Info Card with Offer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FDFE),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFBBF0F4)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: widget.offer?.color.withOpacity(0.1) ?? const Color(0xFF21BBC7).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      widget.offer?.icon ?? Icons.cleaning_services,
                      color: widget.offer?.color ?? const Color(0xFF1C768C),
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.serviceTitle ?? 'Nettoyage de Maison',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C768C),
                          ),
                        ),
                        const SizedBox(height: 5),
                        if (widget.offer != null && _isOfferApplied) ...[
                          Row(
                            children: [
                              Text(
                                '${_originalPrice.toStringAsFixed(0)} DZD',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF666666),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '${_discountedPrice.toStringAsFixed(0)} DZD',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: widget.offer!.color,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: widget.offer!.color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Économie: ${(_originalPrice - _discountedPrice).toStringAsFixed(0)} DZD',
                              style: TextStyle(
                                fontSize: 12,
                                color: widget.offer!.color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ] else ...[
                          Text(
                            widget.servicePrice ?? 'À partir de 3500 DZD',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF21BBC7),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Offer Banner (if offer exists)
            if (widget.offer != null) ...[
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      widget.offer!.color,
                      widget.offer!.color.withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: widget.offer!.color.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.local_offer,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.offer!.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.offer!.discount,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isOfferApplied = !_isOfferApplied;
                          if (_isOfferApplied) {
                            _applyOffer();
                          } else {
                            _discountedPrice = _originalPrice;
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _isOfferApplied ? 'APPLIQUÉE' : 'APPLIQUER',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: widget.offer!.color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 30),

            // Calendar Section
            const Text(
              'Sélectionnez une Date',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 15),

            // Calendar Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(color: const Color(0xFFBBF0F4)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Month and Year
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left, color: Color(0xFF1C768C)),
                          onPressed: () {
                            setState(() {
                              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
                            });
                          },
                        ),
                        Text(
                          '${_getMonthName(_selectedDate.month)} ${_selectedDate.year}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C768C),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right, color: Color(0xFF1C768C)),
                          onPressed: () {
                            setState(() {
                              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Days of Week
                    Row(
                      children: ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim']
                          .map((day) => Expanded(
                        child: Text(
                          day,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C768C),
                          ),
                        ),
                      ))
                          .toList(),
                    ),

                    const SizedBox(height: 15),

                    // Calendar Days
                    _buildCalendar(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Time Selection
            const Text(
              'Sélectionnez l\'Heure',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(color: const Color(0xFFBBF0F4)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, color: Color(0xFF21BBC7)),
                        onPressed: () {
                          setState(() {
                            final newHour = _selectedTime.hour - 1;
                            if (newHour >= 8) {
                              _selectedTime = TimeOfDay(hour: newHour, minute: 0);
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: _selectedTime,
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Color(0xFF21BBC7),
                                  ),
                                  buttonTheme: const ButtonThemeData(
                                    textTheme: ButtonTextTheme.primary,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (picked != null) {
                            setState(() {
                              _selectedTime = picked;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FDFE),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF21BBC7)),
                          ),
                          child: Text(
                            '${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C768C),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, color: Color(0xFF21BBC7)),
                        onPressed: () {
                          setState(() {
                            final newHour = _selectedTime.hour + 1;
                            if (newHour <= 20) {
                              _selectedTime = TimeOfDay(hour: newHour, minute: 0);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Horaires disponibles: 8:00 - 20:00',
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Duration Selection
            const Text(
              'Durée du Service',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _durations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDuration = index + 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 15, left: index == 0 ? 0 : 0),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: _selectedDuration == index + 1
                            ? const Color(0xFF21BBC7)
                            : const Color(0xFFF8FDFE),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _selectedDuration == index + 1
                              ? const Color(0xFF21BBC7)
                              : const Color(0xFFBBF0F4),
                        ),
                      ),
                      child: Text(
                        _durations[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _selectedDuration == index + 1
                              ? Colors.white
                              : const Color(0xFF1C768C),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Address Field
            const Text(
              'Adresse de Nettoyage',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: _addressController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Saisissez l\'adresse complète',
                hintStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                filled: true,
                fillColor: const Color(0xFFF8FDFE),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF21BBC7), width: 2),
                ),
                prefixIcon: const Icon(Icons.location_on, color: Color(0xFF21BBC7)),
              ),
            ),

            const SizedBox(height: 30),

            // Notes Field
            const Text(
              'Notes Spéciales (Optionnel)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C768C),
              ),
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: _notesController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Instructions spéciales, accès, animaux de compagnie, etc.',
                hintStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                filled: true,
                fillColor: const Color(0xFFF8FDFE),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFBBF0F4)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF21BBC7), width: 2),
                ),
                prefixIcon: const Icon(Icons.note, color: Color(0xFF21BBC7)),
              ),
            ),

            const SizedBox(height: 30),

            // Recurring Service
            Row(
              children: [
                Checkbox(
                  value: _isRecurring,
                  onChanged: (value) {
                    setState(() {
                      _isRecurring = value!;
                    });
                  },
                  activeColor: const Color(0xFF21BBC7),
                  checkColor: Colors.white,
                ),
                const Text(
                  'Répéter ce service',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C768C),
                  ),
                ),
              ],
            ),

            if (_isRecurring) ...[
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _recurrenceOptions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _recurrence = _recurrenceOptions[index];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15, left: index == 0 ? 0 : 0),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: _recurrence == _recurrenceOptions[index]
                              ? const Color(0xFF21BBC7)
                              : const Color(0xFFF8FDFE),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _recurrence == _recurrenceOptions[index]
                                ? const Color(0xFF21BBC7)
                                : const Color(0xFFBBF0F4),
                          ),
                        ),
                        child: Text(
                          _recurrenceOptions[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _recurrence == _recurrenceOptions[index]
                                ? Colors.white
                                : const Color(0xFF1C768C),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],

            const SizedBox(height: 40),

            // Summary Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(color: const Color(0xFFBBF0F4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Résumé de la Commande',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C768C),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Price details
                  _buildSummaryRow('Service:', widget.serviceTitle ?? 'Nettoyage de Maison'),
                  _buildSummaryRow('Date:', '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                  _buildSummaryRow('Heure:', '${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}'),
                  _buildSummaryRow('Durée:', _durations[_selectedDuration - 1]),

                  const Divider(height: 20),

                  // Price calculation
                  if (widget.offer != null && _isOfferApplied) ...[
                    _buildPriceRow('Prix original:', '${_originalPrice.toStringAsFixed(0)} DZD'),
                    _buildPriceRow(
                      'Remise ${widget.offer!.discount}:',
                      '-${(_originalPrice - _discountedPrice).toStringAsFixed(0)} DZD',
                      isDiscount: true,
                    ),
                    const Divider(height: 20),
                  ],

                  _buildPriceRow(
                    'Total à payer:',
                    '${_discountedPrice.toStringAsFixed(0)} DZD',
                    isTotal: true,
                    color: widget.offer?.color ?? const Color(0xFF21BBC7),
                  ),

                  if (widget.offer != null && _isOfferApplied) ...[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.offer!.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.local_offer, color: widget.offer!.color, size: 16),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Offre appliquée: ${widget.offer!.title}',
                              style: TextStyle(
                                fontSize: 14,
                                color: widget.offer!.color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Reserve Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  _confirmReservation();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.offer?.color ?? const Color(0xFF21BBC7),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  shadowColor: (widget.offer?.color ?? const Color(0xFF21BBC7)).withOpacity(0.3),
                ),
                child: Text(
                  widget.offer != null && _isOfferApplied
                      ? 'Réserver avec l\'Offre'
                      : 'Confirmer la Réservation',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    final firstDay = DateTime(_selectedDate.year, _selectedDate.month, 1);
    final lastDay = DateTime(_selectedDate.year, _selectedDate.month + 1, 0);
    final startingWeekday = firstDay.weekday;
    final totalDays = lastDay.day;

    List<Widget> days = [];

    // Add empty days for the beginning of the month
    for (int i = 1; i < startingWeekday; i++) {
      days.add(const Expanded(child: SizedBox()));
    }

    // Add days of the month
    for (int day = 1; day <= totalDays; day++) {
      final currentDay = DateTime(_selectedDate.year, _selectedDate.month, day);
      final isToday = _isSameDay(currentDay, DateTime.now());
      final isSelected = _isSameDay(currentDay, _selectedDate);
      final isPast = currentDay.isBefore(DateTime.now().subtract(const Duration(days: 1)));

      days.add(
        Expanded(
          child: GestureDetector(
            onTap: isPast
                ? null
                : () {
              setState(() {
                _selectedDate = currentDay;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isSelected
                    ? (widget.offer?.color ?? const Color(0xFF21BBC7))
                    : isToday
                    ? const Color(0xFFBBF0F4)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: isToday
                    ? Border.all(color: const Color(0xFF21BBC7))
                    : null,
              ),
              child: Center(
                child: Text(
                  day.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isPast
                        ? Colors.grey[400]
                        : isSelected
                        ? Colors.white
                        : isToday
                        ? const Color(0xFF1C768C)
                        : const Color(0xFF666666),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Create rows of 7 days each
    List<Widget> rows = [];
    for (int i = 0; i < days.length; i += 7) {
      final end = i + 7;
      rows.add(
        Row(
          children: days.sublist(i, end > days.length ? days.length : end),
        ),
      );
      if (end < days.length) {
        rows.add(const SizedBox(height: 10));
      }
    }

    return Column(
      children: rows,
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF666666),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1C768C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isDiscount = false, bool isTotal = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 15,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? const Color(0xFF1C768C) : const Color(0xFF666666),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 15,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
              color: isDiscount
                  ? const Color(0xFF4CAF50)
                  : (isTotal ? (color ?? const Color(0xFF21BBC7)) : const Color(0xFF1C768C)),
            ),
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1: return 'Janvier';
      case 2: return 'Février';
      case 3: return 'Mars';
      case 4: return 'Avril';
      case 5: return 'Mai';
      case 6: return 'Juin';
      case 7: return 'Juillet';
      case 8: return 'Août';
      case 9: return 'Septembre';
      case 10: return 'Octobre';
      case 11: return 'Novembre';
      case 12: return 'Décembre';
      default: return '';
    }
  }

  void _confirmReservation() {
    if (_addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez saisir l\'adresse de nettoyage'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final formattedDate = '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
    final formattedTime = '${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Confirmation de Réservation',
          style: TextStyle(
            color: Color(0xFF1C768C),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.serviceTitle ?? 'Nettoyage de Maison',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C768C),
              ),
            ),
            const SizedBox(height: 10),
            Text('📅 Date: $formattedDate'),
            Text('🕐 Heure: $formattedTime'),
            Text('⏱️ Durée: ${_durations[_selectedDuration - 1]}'),
            Text('📍 Adresse: ${_addressController.text}'),
            if (_notesController.text.isNotEmpty) Text('📝 Notes: ${_notesController.text}'),
            if (_isRecurring) Text('🔁 Répétition: $_recurrence'),

            // Offer information
            if (widget.offer != null && _isOfferApplied) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: widget.offer!.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Icon(Icons.local_offer, color: widget.offer!.color, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.offer!.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: widget.offer!.color,
                            ),
                          ),
                          Text(
                            'Économie: ${(_originalPrice - _discountedPrice).toStringAsFixed(0)} DZD',
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.offer!.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Price summary
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:'),
                Text(
                  '${_discountedPrice.toStringAsFixed(0)} DZD',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: widget.offer?.color ?? const Color(0xFF21BBC7),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            const Text(
              'Notre équipe vous contactera pour confirmer.',
              style: TextStyle(
                color: Color(0xFF21BBC7),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Modifier',
              style: TextStyle(color: Color(0xFF666666)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    widget.offer != null && _isOfferApplied
                        ? 'Réservation avec offre confirmée!'
                        : 'Réservation confirmée avec succès!',
                  ),
                  backgroundColor: widget.offer?.color ?? const Color(0xFF21BBC7),
                  duration: const Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
              Navigator.pop(context); // Go back to services
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.offer?.color ?? const Color(0xFF21BBC7),
              foregroundColor: Colors.white,
            ),
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }
}

// Add SpecialOffer class definition
class SpecialOffer {
  final String title;
  final String discount;
  final String description;
  final IconData icon;
  final String imagePath;
  final String validity;
  final Color color;

  const SpecialOffer(
      this.title,
      this.discount,
      this.description,
      this.icon,
      this.imagePath,
      this.validity,
      this.color,
      );
}