# 📔 MyJournal

MyJournal adalah aplikasi **jurnal pribadi berbasis Flutter** yang memungkinkan pengguna mencatat aktivitas, perasaan, dan pengalaman harian secara sederhana, cepat, dan aman. Aplikasi ini dibuat sebagai **Tugas Akhir Mata Kuliah** dengan fokus pada implementasi CRUD, local storage, dan dark mode.

---

## ✨ Fitur Utama

* 📝 **Create Journal** – Menambahkan jurnal harian (judul, isi, mood)
* 📖 **Read Journal** – Melihat daftar jurnal dan detail jurnal
* ✏️ **Update Journal** – Mengedit jurnal yang sudah dibuat
* 🗑️ **Delete Journal** – Menghapus jurnal dengan konfirmasi
* 🌙 **Dark Mode** – Mode gelap & terang yang dapat diubah dari halaman Settings
* 💾 **Penyimpanan Lokal** – Data disimpan secara permanen menggunakan Hive
* 🎬 **Splash Screen** – Tampilan awal dengan animasi sederhana

---

## 🛠️ Teknologi yang Digunakan

* **Flutter** (SDK ^3.x)
* **Dart**
* **Hive & Hive Flutter** – Local NoSQL Database
* **Material Design**
* **Git & GitHub** – Version Control

---

## 📂 Struktur Folder

```
lib/
├── main.dart
├── models/
│   ├── journal_model.dart
│   └── journal_model.g.dart
├── screens/
│   ├── splash.dart
│   ├── home.dart
│   ├── add_journal.dart
│   ├── detail.dart
│   └── settings.dart
├── theme/
│   └── app_theme.dart
├── utils/
│   └── hive_boxes.dart
```

---

## 🚀 Cara Menjalankan Aplikasi

### 1️⃣ Clone Repository

```bash
git clone https://github.com/username/myjournal.git
cd myjournal
```

### 2️⃣ Install Dependency

```bash
flutter pub get
```

### 3️⃣ Generate Hive Adapter

```bash
flutter pub run build_runner build
```

### 4️⃣ Jalankan Aplikasi

```bash
flutter run
```

---

## 🌙 Dark Mode

Pengaturan dark mode tersedia pada halaman **Settings**. Preferensi tema akan disimpan menggunakan Hive sehingga tetap aktif meskipun aplikasi ditutup.

---

## 📌 Catatan

* Aplikasi ini menggunakan **local storage**, tidak membutuhkan koneksi internet.
* Seluruh data jurnal tersimpan di perangkat pengguna.

---

## 👨‍🎓 Tujuan Akademik

Aplikasi ini dikembangkan untuk memenuhi **Tugas Akhir Mata Kuliah**, dengan tujuan:

* Mengimplementasikan konsep CRUD
* Menggunakan state management sederhana
* Mengelola data lokal menggunakan Hive
* Menerapkan dark mode dan theme management

---

## 📄 Lisensi

Proyek ini dibuat untuk keperluan akademik dan pembelajaran.

---

> Dibuat dengan ❤️ menggunakan Flutter

