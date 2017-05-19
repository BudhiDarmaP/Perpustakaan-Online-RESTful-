/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestModel;

import Model.Anggota;
import Model.Buku;
import Model.Pinjam;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author budhidarmap
 */
public class NewMain {

    public static void main(String[] args) throws ParseException {
//        Pinjam p = Pinjam.getPeminjaman("145314000", "9781138035454");
//        System.out.println(p.getStatus());
//        String hasil;

//        //menambahkan kalender
//        GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
//        //deklarasi kelas dan timeStamp
//        String timeStamp = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(Calendar.getInstance().getTime());
//        
//        cal.add(Calendar.WEEK_OF_YEAR, 1);
//        Date dtNextWeek = cal.getTime();
//        String df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(dtNextWeek);
//        //deklarasi variable pinjam
//        Buku b = Buku.getBuku("9781480177598");
//        Pinjam p = new Pinjam();
//        p.setTanggal_pinjam(timeStamp);
//        p.setTanggal_kembali(df);
//        p.setID_Peminjam("0");
//        p.setISBN_Buku("9781480177598");
//        p.setKet("Test");

        //simpan peminjaman
//        boolean a = Anggota.simpanPeminjaman(p);
//        int sedia = Buku.cekCopy("9781480177598");

        //cek dan ubah copy
//        if (a && sedia != 0) {
//            Buku.UpdateCopy(p.getISBN_Buku(), (sedia - 1));
            //kembalikan true
//            hasil = "Peminjaman Berhasil";
//        } else {
            //kembalikan false
//            hasil = "Peminjaman Gagal";
//        }
//        System.out.println(df);
//        int b = Buku.cekCopy("9781480177598");
//        System.out.println(b);
//        Anggota []a = Anggota.getListAnggota("");
//        for (int i = 0; i < a.length; i++) {
//            System.out.println(a[i].getNama());
//        }
//        Anggota a = new Anggota();
//        System.out.println(a.LoginAnggota("0", "admin"));
//        String tahun="2014s";
//        System.out.println(tahun.matches("[0-9]*"));
//        String p = Pinjam.Pengembalian("10-05-2017", "145314000", "9781480177598");
//        String timeStamp = new SimpleDateFormat("dd-MM-yyyy").format(Calendar.getInstance().getTime());
//        String time = new SimpleDateFormat("dd-MM-yyyy").format(Calendar.getInstance().getTime());
//        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
//        Calendar c = Calendar.getInstance();
//        c.setTime(sdf.parse(time));
//        c.add(Calendar.DATE, 7);  // number of days to add
//        time = sdf.format(c.getTime());
//        String timeBack = timeStamp.;

//        p.setTanggal_pinjam(timeStamp);
//        p.setTanggal_kembali(time);
//        p.setID_Peminjam("145314000");
//        p.setISBN_Buku("9781480177598");
//        p.setKet("Baik");
//        a.simpanPeminjaman(p);
//        System.out.println(time);
//        System.out.println(a.cekAnggota("145314000"));
//        anggota.setID_Angota("145314000");
//        anggota.setNama("Golek");
//        anggota.setNo_tlp("081000000000");
//        anggota.setAlamat("Gunung Siluen");
//        anggota.setPassword("123");
//        anggota.tambahAnggota(anggota);
//        for (int i = 0; i < buku.length; i++) {
//        System.out.println(buku[i].getISBN());
//        }
//        String x="d";
//        Buku b[] = Buku.getListPencarian(x);
//        for (int i = 0; i < b.length; i++) {
//            System.out.println(b[i].getISBN());
//        }
    }
}
