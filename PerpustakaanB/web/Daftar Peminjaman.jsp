<%@page import="Model.Anggota"%>
<%@page import="Control.CookieUtilities"%>
<%@page import="Model.Pinjam"%>
<%@page import="Model.Buku"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie cookie = CookieUtilities.getCookie(request, "id");
    String id = cookie.getValue();

    Anggota a = new Anggota();
    Pinjam[] p = Pinjam.getHistory(id);
%>
<html>
    <head>
        <title>PERPUSTAKAAN MBAH</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Main -->
            <div id="main">
                <div class="inner">

                    <!-- Header -->
                    <header id="header">
                        <a href="Home.jsp" class="logo"><strong>Perpustakaan Mbah</strong></a>
                        <ul class="icons">
                            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="#" class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
                            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        </ul>
                    </header>

                    <!-- Banner -->
                    <section id="banner">
                        <div class="content">
                            <!-- Search -->
                            <header>
                                <h1>Perpustakaan Mbah</h1>
                                <p>Perpustakaan Uji Coba</p>
                            </header>
                        </div>
                    </section>

                    <!-- Section -->
                    <selection id="major">
                        <% if (p.length > 0) {%>
                        <h3>Daftar Pinjaman</h3>
                        <div class="table-wrapper">
                            <form method="post" action="ControlPengembalian">
                                <table>
                                    <thead>
                                        <tr>
                                            <td>
                                                Tanggal Pinjam
                                            </td>
                                            <td>
                                                Tanggal Pengembalian
                                            </td>
                                            <td>
                                                ISBN
                                            </td>
                                            <td>
                                                Keterangan
                                            </td>
                                            <td>
                                                Status
                                            </td>
                                        </tr>
                                    </thead>
                                    <%for (int i = 0; i < p.length; i++) {%>
                                    <tr>
                                        <td>
                                            <%= p[i].getTanggal_pinjam()%>
                                        </td>
                                        <td>
                                            <%= p[i].getTanggal_kembali()%>
                                        </td>
                                        <%  if (p[i].getStatus().equals("N")) {
                                        %>
                                        <td>
                                            <input type="submit" name="isbn" value="<%= p[i].getISBN_Buku()%>"/>
                                        </td>
                                        <td>
                                            <%= p[i].getKet()%>
                                        </td>
                                        <td>
                                            <div id="StatusMerah">
                                                Belum Dikembalikan
                                            </div>
                                        </td>   
                                        <%} else {%>
                                        <td>
                                            <%= p[i].getISBN_Buku()%>
                                        </td>
                                        <td>
                                            <%= p[i].getKet()%>
                                        </td>
                                        <td>
                                            <div id="StatusBiru">
                                                Sudah Dikembalikan
                                            </div>
                                        </td>   
                                    </tr>
                                    <%}
                                    }%>
                                </table>
                            </form>
                        </div>
                        <%} else {%>
                        <h3>Tidak Ada Riwayat</h3>
                        <%}%>
                    </selection>
                </div>
            </div>

            <!-- Sidebar -->
            <div id="sidebar">
                <div class="inner"> 

                    <!-- Menu -->
                    <nav id="menu">
                        <header class="major">
                            <h2>Menu</h2>
                        </header>
                        <ul>
                            <li><a href="Home.jsp">Home</a></li>
                            <li>
                                <span class="opener">Account</span>
                                <ul>
                                    <li><a href="Edit Account.jsp">Edit Account</a></li>
                                    <li><a href="Edit Password.jsp">Edit Password</a></li>
                                    <li><a href="Logout.jsp">Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- Section -->
                        <section>
                            <header class="major">
                                <h2>Get in touch</h2>
                            </header>
                            <ul class="contact">
                                <li class="fa-envelope-o"><a href="#">humas@usd.ac.id</a></li>
                                <li class="fa-phone">(000) 000-0000</li>
                                <li class="fa-home">Sanata Dharma University<br />
                                    Yogyakarta</li>
                            </ul>
                        </section>

                        <!-- Footer -->
                        <footer id="footer">
                            <p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
                        </footer>

                </div>
            </div>

        </div>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>

    </body>
</html>