import 'dart:io';

class TokoPupuk {
  Map<int, Map<String, dynamic>> pupuk = {};

  void tambahPupuk(String name, double price) {
    int number = pupuk.length + 1;
    pupuk[number] = {'name' : name, 'price' : price};
    print('Pupuk Berhasil Ditambahkan');
  }

  void lihatPupuk() {
    if (pupuk.isEmpty) {
      print('Pupuk Tidak Tersedia');
    } else {
      print('Daftar Pupuk:');
      print('-------------------------');
      print('| No | Nama Pupuk | Harga    |');
      print('-------------------------');
      pupuk.forEach((number, pupuk) {
        print('| ${number.toString().padRight(3)}| ${pupuk['name'].toString().padRight(11)}| ${pupuk['price'].toString().padRight(8)} |');
      });
      print('-------------------------');
    }
  }

  void updatePupuk(int number, String name, double price) {
    if (pupuk.containsKey(number)) {
      pupuk[number] = {'name' : name, 'price' : price};
      print('Pupuk Berhasil Diupdate');
    } else {
      print('Tidak Ditemukan Pupuk Yang Sesuai');
    }
  }

  void hapusPupuk(int number) {
    if (pupuk.containsKey(number)) {
      pupuk.remove(number);
      var tempMap = <int, Map<String, dynamic>>{};
      var newNumber = 1;
      pupuk.forEach((oldNumber, pupuk) {
        tempMap[newNumber++] = pupuk;
      });
      pupuk = tempMap;
      print('Pupuk Berhasil Dihapus');
    } else {
      print('Tidak Ditemukan Pupuk Yang Sesuai');
    }
  }
}

void main() {
  var store = TokoPupuk();
  while (true) {
    print('\nMenu:');
    print('1. Tambah Pupuk');
    print('2. Lihat Daftar Pupuk');
    print('3. Update Pupuk');
    print('4. Hapus Pupuk');
    print('5. Exit');
    stdout.write('Masukkan Pilihan: ');
    var choice = int.tryParse(stdin.readLineSync() ?? '');
    switch (choice) {
      case 1:
        stdout.write('Masukkan Nama Pupuk: ');
        var name = stdin.readLineSync() ?? '';
        stdout.write('Masukkan Harga Pupuk: ');
        var price = double.tryParse(stdin.readLineSync() ?? '');
        if (price != null) {
          store.tambahPupuk(name, price);
        } else {
          print('Invalid price.');
        }
        break;
      case 2:
        store.lihatPupuk();
        break;
      case 3:
        stdout.write('Masukkan Nomor Pupuk yang akan diupdate: ');
        var number = int.tryParse(stdin.readLineSync() ?? '');
        if (number != null) {
        stdout.write('Masukkan Nama Pupuk Terbaru: ');
        var name = stdin.readLineSync() ?? '';
        stdout.write('Masukkan Harga Pupuk Terbaru: ');
        var price = double.tryParse(stdin.readLineSync() ?? '');
        if (price != null) {
          store.updatePupuk(number, name, price);
        } else {
          print('Invalid price.');
        }
        }
        break;
      case 4:
        stdout.write('Masukkan Nomor Pupuk Yang Akan Dihapus: ');
        var number = int.tryParse(stdin.readLineSync() ?? '');
        if (number != null) {
          store.hapusPupuk(number);
        } else {
          print('Invalid Number');
        }
        break;
      case 5:
        exit(0);
      default:
        print('Pilihan angka tidak sesuai!Masukkan angka antara 1 - 5');
    }
  }
}