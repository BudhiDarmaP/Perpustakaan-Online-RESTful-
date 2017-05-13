/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Control.DatabaseManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author budhidarmap
 */
public class Pinjam {

    private String ID_Peminjam;
    private String ISBN_Buku;
    private String tanggal_pinjam;
    private String tanggal_kembali;
    private String ket;
    private String status;

    public String getID_Peminjam() {
        return ID_Peminjam;
    }

    public void setID_Peminjam(String ID_Peminjam) {
        this.ID_Peminjam = ID_Peminjam;
    }

    public String getISBN_Buku() {
        return ISBN_Buku;
    }

    public void setISBN_Buku(String ISBN_Buku) {
        this.ISBN_Buku = ISBN_Buku;
    }

    public String getTanggal_pinjam() {
        return tanggal_pinjam;
    }

    public void setTanggal_pinjam(String tanggal_pinjam) {
        this.tanggal_pinjam = tanggal_pinjam;
    }

    public String getTanggal_kembali() {
        return tanggal_kembali;
    }

    public void setTanggal_kembali(String tanggal_kembali) {
        this.tanggal_kembali = tanggal_kembali;
    }

    public String getKet() {
        return ket;
    }

    public void setKet(String ket) {
        this.ket = ket;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
     public static void hapusPinjamBuku(String isbn) {
        String text = null;
        Connection conn = null;
        PreparedStatement ps = null;
        conn = DatabaseManager.getDBConnection();
        try {
            ps = conn.prepareCall("DELETE FROM PEMINJAMAN "
                    + "WHERE ISBN='" + isbn + "'");
            ps.executeUpdate();
            conn.commit();
            text = "Data sudah dihapus";

        } catch (SQLException ex) {
        } finally {
            try {
                ps.close();
                conn.close();
            } catch (SQLException ex) {
            }
        }
    }
     public static void hapusPinjamAnggota(String id) {
        String text = null;
        Connection conn = null;
        PreparedStatement ps = null;
        conn = DatabaseManager.getDBConnection();
        try {
            ps = conn.prepareCall("DELETE FROM PEMINJAMAN "
                    + "WHERE ID='" + id + "'");
            ps.executeUpdate();
            conn.commit();
            text = "Data sudah dihapus";

        } catch (SQLException ex) {
        } finally {
            try {
                ps.close();
                conn.close();
            } catch (SQLException ex) {
            }
        }
    }
    public static Pinjam[] getListPinjaman(String id) {
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        conn = DatabaseManager.getDBConnection();
        Pinjam []p = null;
        try {
            st = conn.createStatement();
            rs = st.executeQuery("SELECT COUNT (*) TOTAL FROM PEMINJAMAN "
                    + "WHERE (ID='"+id+"' AND STATUS='N')");
            rs.next();
            p = new Pinjam[rs.getInt(1)];
            rs = st.executeQuery("SELECT * FROM PEMINJAMAN "
                    + "WHERE (ID='"+id+"' AND STATUS='N')");
            int index = 0;
            while (rs.next()) {
                p[index] = new Pinjam();
                p[index].setTanggal_pinjam(rs.getString(1));
                p[index].setTanggal_kembali(rs.getString(2));
                p[index].setID_Peminjam(rs.getString(3));
                p[index].setISBN_Buku(rs.getString(4));
                p[index].setKet(rs.getString(5));
                p[index].setStatus(rs.getString(6));
                index++;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                rs.close();
                st.close();
                conn.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return p;
    }
    public static Pinjam[] getHistory(String id) {
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        conn = DatabaseManager.getDBConnection();
        Pinjam []p = null;
        try {
            st = conn.createStatement();
            rs = st.executeQuery("SELECT COUNT (*) TOTAL FROM PEMINJAMAN "
                    + "WHERE (ID='"+id+"')");
            rs.next();
            p = new Pinjam[rs.getInt(1)];
            rs = st.executeQuery("SELECT * FROM PEMINJAMAN "
                    + "WHERE (ID='"+id+"')");
            int index = 0;
            while (rs.next()) {
                p[index] = new Pinjam();
                p[index].setTanggal_pinjam(rs.getString(1));
                p[index].setTanggal_kembali(rs.getString(2));
                p[index].setID_Peminjam(rs.getString(3));
                p[index].setISBN_Buku(rs.getString(4));
                p[index].setKet(rs.getString(5));
                p[index].setStatus(rs.getString(6));
                index++;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                rs.close();
                st.close();
                conn.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return p;
    }
    public static boolean getPeminjaman(String id, String isbn) {
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        boolean hasil=false;
        Pinjam p = new Pinjam();
        conn = DatabaseManager.getDBConnection();
        try {
            st = conn.createStatement();
            rs = st.executeQuery("SELECT * FROM PEMINJAMAN WHERE"
                    + "(ID='" + id + "' AND STATUS='N' "
                    + "AND ISBN='"+isbn+"')");
            rs.next();
            p.setTanggal_pinjam(rs.getString(1));
            p.setTanggal_kembali(rs.getString(2));
            p.setID_Peminjam(rs.getString(3));
            p.setISBN_Buku(rs.getString(4));
            p.setKet(rs.getString(5));
            p.setStatus(rs.getString(6));
            hasil=true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                rs.close();
                st.close();
                conn.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return hasil;
    }

    public static boolean Pengembalian(String kembali, String IDanggota, String IDbuku) {
        boolean hasil=false;
        Connection conn = null;
        PreparedStatement ps = null;
        Statement st = null;
        ResultSet rs = null;
        conn = DatabaseManager.getDBConnection();
        try {
            ps = conn.prepareCall("UPDATE PEMINJAMAN SET "
                    + "TANGGAL_KEMBALI=TO_DATE(?, 'DD-MM-YYYY HH24:MI:SS'), "
                    + "STATUS='Y' WHERE ID=? AND ISBN=?");
            ps.setString(1, kembali);
            ps.setString(2, IDanggota);
            ps.setString(3, IDbuku);
            ps.executeUpdate();
            conn.commit();
            hasil=true;
        } catch (SQLException ex) {

        } finally {
            try {
                ps.close();
                conn.close();
            } catch (SQLException ex) {

            }
        }
        return hasil;
    }
}
