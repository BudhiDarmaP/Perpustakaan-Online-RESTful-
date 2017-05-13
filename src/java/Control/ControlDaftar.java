/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Anggota;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author budhidarmap
 */
@WebServlet(name = "ControlDaftar", urlPatterns = {"/ControlDaftar"})
public class ControlDaftar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        //CEK ID
        String timeStamp = new SimpleDateFormat("yyMMdd").format(Calendar.getInstance().getTime());
        Anggota a = new Anggota();
        String number = "000";
        int count = a.panggilID(timeStamp) + 1;
        if (count < 10) {
            number = "00" + String.valueOf(count);
        } else if (count < 100) {
            number = "0" + String.valueOf(count);
        } else {
            number = String.valueOf(count);
        }
        //membuat id | generate id
        a.setID_Angota(timeStamp + number);
        //cek nama
        if (request.getParameter("nama").matches("[0-9]*")==true) {
            RequestDispatcher dispatcher;
            request.setAttribute("error", "Nama mengandung angka!");
            dispatcher = request.getRequestDispatcher("Daftar.jsp");
            dispatcher.forward(request, response);
        }
        //cek no_tlp
        if (request.getParameter("no_tlp").matches("[0-9]*")==false) {
            RequestDispatcher dispatcher;
            request.setAttribute("error", "Format no telepon salah!");
            dispatcher = request.getRequestDispatcher("Daftar.jsp");
            dispatcher.forward(request, response);
        }
        //set parameter ke kelas model
        a.setNama(request.getParameter("nama"));
        a.setNo_tlp(request.getParameter("no_tlp"));
        a.setAlamat(request.getParameter("alamat"));
        a.setPassword(request.getParameter("password"));
        //tambah anggota
        a.tambahAnggota(a);
        //tampilkan hasil
        this.tampil(request, response, a.getNama()+"<br> Sudah Terdaftar Sebagai Anggota Perpustakaan");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void tampil(HttpServletRequest request, HttpServletResponse response, String information) throws ServletException, IOException {
        RequestDispatcher dispatcher;
        request.setAttribute("info", information);
        dispatcher = request.getRequestDispatcher("info.jsp");
        dispatcher.forward(request, response);
    }
}
