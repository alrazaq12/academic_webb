import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AkademikScreen extends StatefulWidget {
  const AkademikScreen({super.key});

  @override
  _AkademikScreenState createState() => _AkademikScreenState();
}

class _AkademikScreenState extends State<AkademikScreen> {
  // Kalender dan event
  late final ValueNotifier<List<Event>> _selectedEvents;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  // Fungsi untuk mendapatkan event berdasarkan tanggal yang dipilih
  List<Event> _getEventsForDay(DateTime day) {
    return _kEvents[day] ?? [];
  }

  // Data dummy event
  static final Map<DateTime, List<Event>> _kEvents = {
    DateTime(2025, 4, 20): [
      Event('Ujian Akhir Semester'),
    ],
    DateTime(2025, 4, 25): [
      Event('Seminar Dosen'),
    ],
    DateTime(2025, 5, 5): [
      Event('Libur Nasional'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Akademik'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu Akademik',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Tambah Pengguna'),
              onTap: () {
                Get.toNamed('/tambah_user');
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Lihat Transkrip Nilai'),
              onTap: () {},
            ),
            ListTile(
  leading: const Icon(Icons.approval),
  title: const Text('Persetujuan Nilai'),
  onTap: () {
    Get.toNamed('/approval');  // Mengarahkan ke halaman Persetujuan Akademik
  },
)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kalender Akademik',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Kalender
            TableCalendar<Event>(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    _selectedEvents.value = _getEventsForDay(selectedDay);
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              eventLoader: _getEventsForDay,
            ),

            const SizedBox(height: 20),

            // Daftar Event untuk tanggal yang dipilih
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, events, _) {
                  return ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return ListTile(
                        title: Text(event.title),
                        onTap: () {
                          // Tampilkan lebih banyak info tentang event
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Kelas untuk Event
class Event {
  final String title;
  Event(this.title);
}
