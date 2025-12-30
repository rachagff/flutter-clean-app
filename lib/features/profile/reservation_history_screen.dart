import 'package:flutter/material.dart';

class ReservationHistoryScreen extends StatefulWidget {
  const ReservationHistoryScreen({super.key});

  @override
  _ReservationHistoryScreenState createState() => _ReservationHistoryScreenState();
}

class _ReservationHistoryScreenState extends State<ReservationHistoryScreen> {
  final List<Reservation> _reservations = [
    Reservation(
      id: 'RES001',
      service: 'Nettoyage de Maison Complet',
      date: DateTime.now().subtract(const Duration(days: 2)),
      time: const TimeOfDay(hour: 10, minute: 0),
      duration: 3,
      address: '123 Rue de Paris, 75001 Paris',
      price: '3500 DZD',
      status: 'Complété',
      cleaner: 'Mohamed Ahmed',
      rating: 5,
    ),
    Reservation(
      id: 'RES002',
      service: 'Nettoyage Profond',
      date: DateTime.now().subtract(const Duration(days: 7)),
      time: const TimeOfDay(hour: 14, minute: 30),
      duration: 4,
      address: '456 Avenue des Champs, 75008 Paris',
      price: '8000 DZD',
      status: 'Complété',
      cleaner: 'Fatima Zohra',
      rating: 4,
    ),
    Reservation(
      id: 'RES003',
      service: 'Nettoyage de Vitres',
      date: DateTime.now().add(const Duration(days: 2)),
      time: const TimeOfDay(hour: 9, minute: 0),
      duration: 2,
      address: '789 Boulevard Saint-Germain, 75006 Paris',
      price: '2500 DZD',
      status: 'Confirmé',
      cleaner: 'Karim Ben',
    ),
    Reservation(
      id: 'RES004',
      service: 'Service de Blanchisserie',
      date: DateTime.now().add(const Duration(days: 5)),
      time: const TimeOfDay(hour: 11, minute: 0),
      duration: 2,
      address: '321 Rue de Rivoli, 75004 Paris',
      price: '1500 DZD',
      status: 'En attente',
    ),
    Reservation(
      id: 'RES005',
      service: 'Nettoyage de Bureau',
      date: DateTime.now().subtract(const Duration(days: 15)),
      time: const TimeOfDay(hour: 8, minute: 0),
      duration: 5,
      address: '654 Rue de la Paix, 75002 Paris',
      price: '2500 DZD',
      status: 'Annulé',
      cleaner: 'Ali Hassan',
      rating: 3,
    ),
  ];

  String _selectedFilter = 'Tous';

  final List<String> _filters = ['Tous', 'À venir', 'Complétés', 'En attente', 'Annulés'];

  @override
  Widget build(BuildContext context) {
    final filteredReservations = _getFilteredReservations();

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
          'Historique des Réservations',
          style: TextStyle(
            color: Color(0xFF1C768C),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: const Color(0xFFF8FDFE),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.map((filter) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FilterChip(
                      label: Text(filter),
                      selected: _selectedFilter == filter,
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      selectedColor: const Color(0xFF21BBC7),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: _selectedFilter == filter ? Colors.white : const Color(0xFF1C768C),
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: _selectedFilter == filter
                              ? const Color(0xFF21BBC7)
                              : const Color(0xFFBBF0F4),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Statistics Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF21BBC7),
                  Color(0xFF1C768C),
                ],
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  Icons.calendar_today,
                  '${_reservations.where((r) => r.status == 'À venir' || r.status == 'Confirmé' || r.status == 'En attente').length}',
                  'À venir',
                ),
                _buildStatItem(
                  Icons.check_circle,
                  '${_reservations.where((r) => r.status == 'Complété').length}',
                  'Complétés',
                ),
                _buildStatItem(
                  Icons.attach_money,
                  '${_calculateTotalSpent()} DZD',
                  'Total',
                ),
              ],
            ),
          ),

          // Reservations List
          Expanded(
            child: filteredReservations.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Aucune réservation',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Vous n\'avez pas de réservations',
                    style: TextStyle(
                      color: Color(0xFF999999),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/services');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF21BBC7),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Réserver un Service'),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: filteredReservations.length,
              itemBuilder: (context, index) {
                return ReservationCard(
                  reservation: filteredReservations[index],
                  onTap: () {
                    _showReservationDetails(filteredReservations[index]);
                  },
                  onReorder: filteredReservations[index].status == 'À venir' ||
                      filteredReservations[index].status == 'Confirmé' ||
                      filteredReservations[index].status == 'En attente'
                      ? () {
                    _showReorderDialog(filteredReservations[index]);
                  }
                      : null,
                  onCancel: filteredReservations[index].status == 'À venir' ||
                      filteredReservations[index].status == 'Confirmé' ||
                      filteredReservations[index].status == 'En attente'
                      ? () {
                    _showCancelDialog(filteredReservations[index]);
                  }
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFFBBF0F4),
          ),
        ),
      ],
    );
  }

  List<Reservation> _getFilteredReservations() {
    switch (_selectedFilter) {
      case 'À venir':
        return _reservations
            .where((r) => r.status == 'À venir' || r.status == 'Confirmé' || r.status == 'En attente')
            .toList();
      case 'Complétés':
        return _reservations.where((r) => r.status == 'Complété').toList();
      case 'En attente':
        return _reservations.where((r) => r.status == 'En attente').toList();
      case 'Annulés':
        return _reservations.where((r) => r.status == 'Annulé').toList();
      default:
        return _reservations;
    }
  }

  String _calculateTotalSpent() {
    double total = 0;
    for (var reservation in _reservations.where((r) => r.status == 'Complété')) {
      final price = double.tryParse(reservation.price.replaceAll(RegExp(r'[^0-9.]'), ''));
      if (price != null) {
        total += price;
      }
    }
    return total.toInt().toString();
  }

  void _showReservationDetails(Reservation reservation) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return ReservationDetailsSheet(reservation: reservation);
      },
    );
  }

  void _showReorderDialog(Reservation reservation) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Reprogrammer',
          style: TextStyle(
            color: Color(0xFF1C768C),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Voulez-vous reprogrammer cette réservation?',
          style: TextStyle(
            color: Color(0xFF666666),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Annuler',
              style: TextStyle(color: Color(0xFF666666)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                '/reservation',
                arguments: {
                  'title': reservation.service,
                  'price': reservation.price,
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF21BBC7),
              foregroundColor: Colors.white,
            ),
            child: const Text('Reprogrammer'),
          ),
        ],
      ),
    );
  }

  void _showCancelDialog(Reservation reservation) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Annuler la Réservation',
          style: TextStyle(
            color: Color(0xFF1C768C),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Êtes-vous sûr de vouloir annuler cette réservation?',
          style: TextStyle(
            color: Color(0xFF666666),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Non',
              style: TextStyle(color: Color(0xFF666666)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                reservation.status = 'Annulé';
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Réservation annulée avec succès'),
                  backgroundColor: const Color(0xFF21BBC7),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Oui, annuler'),
          ),
        ],
      ),
    );
  }
}

class Reservation {
  final String id;
  final String service;
  final DateTime date;
  final TimeOfDay time;
  final int duration;
  final String address;
  final String price;
  String status;
  final String? cleaner;
  final int? rating;

  Reservation({
    required this.id,
    required this.service,
    required this.date,
    required this.time,
    required this.duration,
    required this.address,
    required this.price,
    required this.status,
    this.cleaner,
    this.rating,
  });
}

class ReservationCard extends StatelessWidget {
  final Reservation reservation;
  final VoidCallback onTap;
  final VoidCallback? onReorder;
  final VoidCallback? onCancel;

  const ReservationCard({
    super.key,
    required this.reservation,
    required this.onTap,
    this.onReorder,
    this.onCancel,
  });

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Complété':
        return const Color(0xFF4CAF50);
      case 'Confirmé':
        return const Color(0xFF2196F3);
      case 'En attente':
        return const Color(0xFFFF9800);
      case 'Annulé':
        return Colors.red;
      default:
        return const Color(0xFF21BBC7);
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Complété':
        return Icons.check_circle;
      case 'Confirmé':
        return Icons.confirmation_number;
      case 'En attente':
        return Icons.access_time;
      case 'Annulé':
        return Icons.cancel;
      default:
        return Icons.calendar_today;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = '${reservation.date.day}/${reservation.date.month}/${reservation.date.year}';
    final formattedTime = '${reservation.time.hour.toString().padLeft(2, '0')}:${reservation.time.minute.toString().padLeft(2, '0')}';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      reservation.service,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C768C),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(reservation.status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _getStatusColor(reservation.status)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getStatusIcon(reservation.status),
                          color: _getStatusColor(reservation.status),
                          size: 14,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          reservation.status,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _getStatusColor(reservation.status),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Text(
                    '$formattedTime (${reservation.duration}h)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      reservation.address,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              if (reservation.cleaner != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.person, size: 16, color: Colors.grey.shade600),
                    const SizedBox(width: 8),
                    Text(
                      'Nettoyeur: ${reservation.cleaner}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],

              if (reservation.rating != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 8),
                    Text(
                      'Note: ${reservation.rating}/5',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    reservation.price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C768C),
                    ),
                  ),
                  Row(
                    children: [
                      if (onReorder != null)
                        TextButton(
                          onPressed: onReorder,
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF21BBC7),
                          ),
                          child: const Text('Reprogrammer'),
                        ),
                      if (onCancel != null)
                        TextButton(
                          onPressed: onCancel,
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                          child: const Text('Annuler'),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservationDetailsSheet extends StatelessWidget {
  final Reservation reservation;

  const ReservationDetailsSheet({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    final formattedDate = '${reservation.date.day}/${reservation.date.month}/${reservation.date.year}';
    final formattedTime = '${reservation.time.hour.toString().padLeft(2, '0')}:${reservation.time.minute.toString().padLeft(2, '0')}';

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(20),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Détails de la Réservation',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C768C),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              _buildDetailItem('ID Réservation', reservation.id, Icons.confirmation_number),
              _buildDetailItem('Service', reservation.service, Icons.cleaning_services),
              _buildDetailItem('Date', formattedDate, Icons.calendar_today),
              _buildDetailItem('Heure', '$formattedTime (${reservation.duration} heures)', Icons.access_time),
              _buildDetailItem('Adresse', reservation.address, Icons.location_on),
              _buildDetailItem('Prix', reservation.price, Icons.attach_money),
              _buildDetailItem('Statut', reservation.status, Icons.info),

              if (reservation.cleaner != null)
                _buildDetailItem('Nettoyeur Assigné', reservation.cleaner!, Icons.person),

              if (reservation.rating != null)
                _buildDetailItem('Votre Note', '${reservation.rating}/5 étoiles', Icons.star),

              const SizedBox(height: 40),

              if (reservation.status == 'Complété' && reservation.rating == null)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showRatingDialog(context, reservation);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF21BBC7),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Noter le Service',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailItem(String label, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FDFE),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBBF0F4)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF21BBC7).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF1C768C), size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C768C),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showRatingDialog(BuildContext context, Reservation reservation) {
    int rating = 5;
    String comment = '';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text(
              'Noter le Service',
              style: TextStyle(
                color: Color(0xFF1C768C),
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Comment était le service?',
                  style: TextStyle(
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          rating = index + 1;
                        });
                      },
                      icon: Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 40,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Commentaire (optionnel)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    comment = value;
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Annuler',
                  style: TextStyle(color: Color(0xFF666666)),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Merci pour votre note!'),
                      backgroundColor: const Color(0xFF21BBC7),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                  // In real app, you would update the reservation with rating
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF21BBC7),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Soumettre'),
              ),
            ],
          );
        },
      ),
    );
  }
}