package WebService;

import Model.Anggota;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.json.JsonObject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

/**
 * REST Web Service
 *
 * @author budhidarmap
 */
@Path("DaftarAnggota")
public class DaftarAnggotaResource {

    @POST
    @Consumes("application/json")
    public Response daftarAnggota(JsonObject anggota) {

        Anggota a = new Anggota();
        String result;
        String timeStamp = new SimpleDateFormat("yyMMdd").format(Calendar.getInstance().getTime());
        String number = "000";
        int count = Anggota.panggilID(timeStamp) + 1;
        if (count < 10) {
            number = "00" + String.valueOf(count);
        } else if (count < 100) {
            number = "0" + String.valueOf(count);
        } else {
            number = String.valueOf(count);
        }
        //cek nama
        if (anggota.getString("nama").matches("[0-9]*") == true) {
            //hasil
            result = "Nama mengandung angka";
            //kembalikan status error
            return Response.status(403).entity(result).build();
        }
        //cek no_tlp
        if (anggota.getString("no").matches("[0-9]*") == false) {
            //hasil
            result = "No telepon mengandung huruf";
            //kembalikan status error
            return Response.status(403).entity(result).build();
        }
        if (anggota.getString("nama").length() >= 50) {
            //hasil
            result = "Nama terlalu panjang";
            //kembalikan status error
            return Response.status(403).entity(result).build();
        } else {
            //membuat id | generate id
            a.setID_Angota(timeStamp + number);
            //Bongkar json menjadi obyek anggota
            a.setNama(anggota.getString("nama"));
            a.setNo_tlp(anggota.getString("no"));
            a.setAlamat(anggota.getString("alamat"));
            a.setPassword(anggota.getString("password"));
            //Simpan anggota ke database
            a.tambahAnggota(a);
            result = a.getID_Angota();
            //kembalikan status OK
            return Response.status(201).entity(result).build();
        }
    }
}
