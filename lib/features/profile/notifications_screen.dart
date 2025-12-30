import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _bookingNotifications = true;
  bool _promotionNotifications = true;
  bool _reminderNotifications = true;
  bool _ratingNotifications = true;
  bool _newsletterNotifications = false;
  bool _systemNotifications = true;
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _smsNotifications = false;
  bool _quietHoursEnabled = false;
  TimeOfDay _quietStartTime = const TimeOfDay(hour: 22, minute: 0);
  TimeOfDay _quietEndTime = const TimeOfDay(hour: 7, minute: 0);

  final List<NotificationItem> _notificationHistory = [
    NotificationItem(
      title: 'Réservation confirmée',
      message: 'Votre nettoyage de maison est confirmé pour demain à 10:00',
      time: DateTime.now().subtract(const Duration(minutes: 5)),
      type: NotificationType.booking,
      isRead: true,
    ),
    NotificationItem(
      title: 'Offre spéciale',
      message: '30% de réduction sur votre prochain nettoyage',
      time: DateTime.now().subtract(const Duration(hours: 2)),
      type: NotificationType.promotion,
      isRead: true,
    ),
    NotificationItem(
      title: 'Rappel',
      message: 'N\'oubliez pas votre rendez-vous de nettoyage demain',
      time: DateTime.now().subtract(const Duration(hours: 5)),
      type: NotificationType.reminder,
      isRead: false,
    ),
    NotificationItem(
      title: 'Noter le service',
      message: 'Comment était votre nettoyage d\'hier?',
      time: DateTime.now().subtract(const Duration(days: 1)),
      type: NotificationType.rating,
      isRead: true,
    ),
    NotificationItem(
      title: 'Nettoyeur en route',
      message: 'Votre nettoyeur est en route vers votre adresse',
      time: DateTime.now().subtract(const Duration(days: 2)),
      type: NotificationType.booking,
      isRead: true,
    ),
    NotificationItem(
      title: 'Service complété',
      message: 'Votre nettoyage a été complété avec succès',
      time: DateTime.now().subtract(const Duration(days: 3)),
      type: NotificationType.booking,
      isRead: true,
    ),
    NotificationItem(
      title: 'Nouveau service disponible',
      message: 'Découvrez notre nouveau service de nettoyage écologique',
      time: DateTime.now().subtract(const Duration(days: 5)),
      type: NotificationType.promotion,
      isRead: true,
    ),
    NotificationItem(
      title: 'Maintenance système',
      message: 'Maintenance prévue ce soir de 23h à 2h',
      time: DateTime.now().subtract(const Duration(days: 7)),
      type: NotificationType.system,
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final unreadCount = _notificationHistory.where((n) => !n.isRead).length;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1C768C)),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Notifications',
            style: TextStyle(
              color: Color(0xFF1C768C),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: const Color(0xFF21BBC7),
            labelColor: const Color(0xFF1C768C),
            unselectedLabelColor: const Color(0xFF666666),
            labelStyle: const TextStyle(fontWeight: FontWeight.w600),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Paramètres'),
                    if (unreadCount > 0) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF21BBC7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          unreadCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const Tab(text: 'Historique'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Settings Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Types de Notifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C768C),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Choisissez les types de notifications que vous souhaitez recevoir',
                    style: TextStyle(
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Notification Types
                  _buildNotificationTypeCard(
                    'Réservations',
                    'Confirmation, rappels, et mises à jour de vos réservations',
                    _bookingNotifications,
                    Icons.calendar_today,
                        (value) => setState(() => _bookingNotifications = value),
                  ),
                  _buildNotificationTypeCard(
                    'Promotions et Offres',
                    'Offres spéciales, réductions et nouvelles promotions',
                    _promotionNotifications,
                    Icons.local_offer,
                        (value) => setState(() => _promotionNotifications = value),
                  ),
                  _buildNotificationTypeCard(
                    'Rappels',
                    'Rappels avant vos rendez-vous de nettoyage',
                    _reminderNotifications,
                    Icons.notifications_active,
                        (value) => setState(() => _reminderNotifications = value),
                  ),
                  _buildNotificationTypeCard(
                    'Évaluations',
                    'Demandes pour noter vos services',
                    _ratingNotifications,
                    Icons.star,
                        (value) => setState(() => _ratingNotifications = value),
                  ),
                  _buildNotificationTypeCard(
                    'Newsletter',
                    'Nouvelles, conseils et mises à jour de l\'application',
                    _newsletterNotifications,
                    Icons.email,
                        (value) => setState(() => _newsletterNotifications = value),
                  ),
                  _buildNotificationTypeCard(
                    'Système',
                    'Maintenance et mises à jour importantes',
                    _systemNotifications,
                    Icons.settings,
                        (value) => setState(() => _systemNotifications = value),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Méthodes de Notification',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C768C),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Choisissez comment vous souhaitez recevoir les notifications',
                    style: TextStyle(
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Notification Methods
                  _buildNotificationMethodCard(
                    'Notifications Push',
                    'Recevez des notifications sur votre appareil',
                    _pushNotifications,
                    Icons.notifications,
                        (value) => setState(() => _pushNotifications = value),
                  ),
                  _buildNotificationMethodCard(
                    'Email',
                    'Recevez des notifications par email',
                    _emailNotifications,
                    Icons.mail,
                        (value) => setState(() => _emailNotifications = value),
                  ),
                  _buildNotificationMethodCard(
                    'SMS',
                    'Recevez des notifications par SMS',
                    _smsNotifications,
                    Icons.sms,
                        (value) => setState(() => _smsNotifications = value),
                  ),

                  const SizedBox(height: 30),

                  // Quiet Hours
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FDFE),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFFBBF0F4)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Heures Silencieuses',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1C768C),
                              ),
                            ),
                            Switch(
                              value: _quietHoursEnabled,
                              onChanged: (value) {
                                setState(() {
                                  _quietHoursEnabled = value;
                                });
                              },
                              activeColor: const Color(0xFF21BBC7),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Ne pas déranger pendant ces heures',
                          style: TextStyle(
                            color: Color(0xFF666666),
                          ),
                        ),
                        if (_quietHoursEnabled) ...[
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Début',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    GestureDetector(
                                      onTap: () async {
                                        final TimeOfDay? picked = await showTimePicker(
                                          context: context,
                                          initialTime: _quietStartTime,
                                        );
                                        if (picked != null) {
                                          setState(() {
                                            _quietStartTime = picked;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: const Color(0xFFBBF0F4)),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.access_time, color: Color(0xFF21BBC7)),
                                            const SizedBox(width: 10),
                                            Text(
                                              '${_quietStartTime.hour.toString().padLeft(2, '0')}:${_quietStartTime.minute.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF1C768C),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Fin',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    GestureDetector(
                                      onTap: () async {
                                        final TimeOfDay? picked = await showTimePicker(
                                          context: context,
                                          initialTime: _quietEndTime,
                                        );
                                        if (picked != null) {
                                          setState(() {
                                            _quietEndTime = picked;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: const Color(0xFFBBF0F4)),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.access_time, color: Color(0xFF21BBC7)),
                                            const SizedBox(width: 10),
                                            Text(
                                              '${_quietEndTime.hour.toString().padLeft(2, '0')}:${_quietEndTime.minute.toString().padLeft(2, '0')}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF1C768C),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _markAllAsRead();
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Toutes les notifications marquées comme lues'),
                                backgroundColor: Color(0xFF21BBC7),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF21BBC7),
                            side: const BorderSide(color: Color(0xFF21BBC7)),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Tout marquer comme lu'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _saveSettings();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF21BBC7),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Enregistrer'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),

            // History Tab
            _buildHistoryTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTypeCard(String title, String description, bool value, IconData icon, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FDFE),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFBBF0F4)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF21BBC7).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1C768C), size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C768C),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF21BBC7),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationMethodCard(String title, String description, bool value, IconData icon, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FDFE),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFBBF0F4)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF21BBC7).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1C768C), size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C768C),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF21BBC7),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    final unreadNotifications = _notificationHistory.where((n) => !n.isRead).toList();
    final readNotifications = _notificationHistory.where((n) => n.isRead).toList();

    return Column(
      children: [
        // Clear All Button
        Container(
          padding: const EdgeInsets.all(16),
          color: const Color(0xFFF8FDFE),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _clearAllNotifications();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Toutes les notifications ont été effacées'),
                      backgroundColor: Color(0xFF21BBC7),
                    ),
                  );
                },
                child: const Text(
                  'Tout effacer',
                  style: TextStyle(
                    color: Color(0xFF21BBC7),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Notifications List
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              if (unreadNotifications.isNotEmpty) ...[
                const Text(
                  'Non lues',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C768C),
                  ),
                ),
                const SizedBox(height: 15),
                ...unreadNotifications.map((notification) => _buildNotificationCard(notification)).toList(),
                const SizedBox(height: 30),
              ],

              if (readNotifications.isNotEmpty) ...[
                const Text(
                  'Plus anciennes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C768C),
                  ),
                ),
                const SizedBox(height: 15),
                ...readNotifications.map((notification) => _buildNotificationCard(notification)).toList(),
              ],

              if (_notificationHistory.isEmpty) ...[
                const SizedBox(height: 100),
                Icon(
                  Icons.notifications_none,
                  size: 80,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Aucune notification',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Vous n\'avez pas encore reçu de notifications',
                  style: TextStyle(
                    color: Color(0xFF999999),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    final timeAgo = _getTimeAgo(notification.time);

    return GestureDetector(
      onTap: () {
        setState(() {
          notification.isRead = true;
        });
        _showNotificationDetails(notification);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: notification.isRead ? Colors.white : const Color(0xFFF8FDFE),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: notification.isRead ? const Color(0xFFBBF0F4) : const Color(0xFF21BBC7),
            width: notification.isRead ? 1 : 2,
          ),
          boxShadow: notification.isRead
              ? []
              : [
            BoxShadow(
              color: const Color(0xFF21BBC7).withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _getNotificationColor(notification.type).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                _getNotificationIcon(notification.type),
                color: _getNotificationColor(notification.type),
                size: 24,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1C768C),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (!notification.isRead)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFF21BBC7),
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    notification.message,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    timeAgo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getNotificationColor(NotificationType type) {
    switch (type) {
      case NotificationType.booking:
        return const Color(0xFF2196F3);
      case NotificationType.promotion:
        return const Color(0xFF4CAF50);
      case NotificationType.reminder:
        return const Color(0xFFFF9800);
      case NotificationType.rating:
        return const Color(0xFFFFC107);
      case NotificationType.system:
        return const Color(0xFF9C27B0);
      default:
        return const Color(0xFF21BBC7);
    }
  }

  IconData _getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.booking:
        return Icons.calendar_today;
      case NotificationType.promotion:
        return Icons.local_offer;
      case NotificationType.reminder:
        return Icons.notifications_active;
      case NotificationType.rating:
        return Icons.star;
      case NotificationType.system:
        return Icons.settings;
      default:
        return Icons.notifications;
    }
  }

  String _getTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'À l\'instant';
    } else if (difference.inMinutes < 60) {
      return 'Il y a ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'Il y a ${difference.inHours} h';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays} j';
    } else if (difference.inDays < 30) {
      return 'Il y a ${(difference.inDays / 7).floor()} sem';
    } else if (difference.inDays < 365) {
      return 'Il y a ${(difference.inDays / 30).floor()} mois';
    } else {
      return 'Il y a ${(difference.inDays / 365).floor()} ans';
    }
  }

  void _showNotificationDetails(NotificationItem notification) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _getNotificationColor(notification.type).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getNotificationIcon(notification.type),
                      color: _getNotificationColor(notification.type),
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C768C),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _getTimeAgo(notification.time),
                          style: const TextStyle(
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                notification.message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF666666),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              if (notification.type == NotificationType.booking)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigate to booking details
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF21BBC7),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Voir les détails de la réservation'),
                  ),
                ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _markAllAsRead() {
    for (var notification in _notificationHistory) {
      notification.isRead = true;
    }
  }

  void _clearAllNotifications() {
    setState(() {
      _notificationHistory.clear();
    });
  }

  void _saveSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Paramètres de notification enregistrés'),
        backgroundColor: Color(0xFF21BBC7),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(

        ),
      ),
    );
  }
}

enum NotificationType {
  booking,
  promotion,
  reminder,
  rating,
  system,
}

class NotificationItem {
  final String title;
  final String message;
  final DateTime time;
  final NotificationType type;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    this.isRead = false,
  });
}