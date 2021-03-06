/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Anggota;
import Model.Buku;
import Model.Pinjam;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author budhidarmap
 */
@WebServlet(name = "ControlPeminjaman", urlPatterns = {"/ControlPeminjaman"})
public class ControlPeminjaman extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try (PrintWriter out = response.getWriter()) {
            //menambahkan kalender
            GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
            cal.add(Calendar.WEEK_OF_YEAR, 1);
            //deklarasi kelas dan timeStamp
            String timeStamp = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(Calendar.getInstance().getTime());
            Date nextWeek = cal.getTime();
            String df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(nextWeek);
            //deklarasi
            Pinjam p = new Pinjam();
            Anggota a = new Anggota();
            String id = null;
            //cookies
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    Cookie c = cookies[i];
                    //cek nilai
                    if (c.getName().equals("id")) {
                        id = c.getValue();
                    }
                }
            }
            //get parameter
            String pinjam = request.getParameter("isbn");
            if (Buku.cekCopy(pinjam) < 1) {
                RequestDispatcher dispatcher;
                request.setAttribute("error", "Maaf Buku Tidak Tersedia");
                dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
            }
            //simpan dan update ketersediaan
            p.setID_Peminjam(id);
            p.setISBN_Buku(pinjam);
            p.setTanggal_pinjam(timeStamp);
            p.setTanggal_kembali(df);
            p.setKet("-");
            a.simpanPeminjaman(p);
            int sedia = Buku.cekCopy(p.getISBN_Buku());
            Buku.UpdateCopy(p.getISBN_Buku(), (sedia - 1));
            this.tampil(request, response, "Peminjaman Tersimpan");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void tampil(HttpServletRequest request, HttpServletResponse response, String information) throws ServletException, IOException {
        RequestDispatcher dispatcher;
        request.setAttribute("info", information);
        dispatcher = request.getRequestDispatcher("infoUser.jsp");
        dispatcher.forward(request, response);
    }
}
