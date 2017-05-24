/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebService;

import Model.Buku;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author budhidarmap
 */
@Path("Cari")
public class CariResource {    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public JsonObject getJson(@QueryParam("query")String query) {
        //ubah query dengan tanda + ke spasi
        String cari = query.replace("+", " ");
        // Ambil list buku dari database sesuai query
        Buku[] buku = Buku.getListPencarian(cari);
        
        // Buat object JsonObject builder untuk dikirim
        JsonObjectBuilder JsonBuku = Json.createObjectBuilder();
        
        // Buat JsonArray untuk menanpung object buku
        JsonArrayBuilder arrayBuku = Json.createArrayBuilder();
        
        // Buat array object buku builder
        JsonObjectBuilder[] objectBuku = new JsonObjectBuilder[buku.length];
        
        // Masukan buku dari database ke object buku builder
        for (int i = 0; i < objectBuku.length; i++) {
            objectBuku[i] = Json.createObjectBuilder();
            objectBuku[i].add("isbn", buku[i].getISBN());
            objectBuku[i].add("judul", buku[i].getJudul());
            objectBuku[i].add("ketersediaan", buku[i].getCopy());
            objectBuku[i].add("penerbit", buku[i].getPenerbit());
            objectBuku[i].add("penulis", buku[i].getPenulis());
            objectBuku[i].add("tahun", buku[i].getTahun_Terbit());
            arrayBuku.add(objectBuku[i]);
        }
        
        // Masukan array buku builder ke object json
        JsonBuku.add("buku", arrayBuku);
        
        // Build json object yang akan dikirim
        JsonObject bukuJsonObject = JsonBuku.build();
        
        return bukuJsonObject;
    }
}
