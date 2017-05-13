<%@page import="Model.Buku"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String key = "";

    if (request.getParameter("query") != null) {
        key = request.getParameter("query");
    }

    Buku b = new Buku();
    Buku[] bk = Buku.getListPencarian(key);
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
                        <a href="index.jsp" class="logo"><strong>Perpustakaan Mbah</strong></a>
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
                                <h1>Hi, Welcome to Perpustakaan Mbah</h1>
                                <p>Perpustakaan Uji Coba</p>
                            </header>
                        </div>
                    </section>

                    <!-- Section -->
                    <selection id="major">
                        <span class="image object">
                            <section id="search" class="alt">
                                <form method="post" action="Cari Edit Buku.jsp">
                                    <input type="text" name="query" id="query" placeholder="Cari Buku" />
                                </form>
                            </section>
                        </span>
                    </selection>
                    <selection id="major">
                        <h3>Hasil Pencarian Buku</h3>
                        <div class="table-wrapper">
                            <form method="post" action="Edit Buku.jsp">
                                <table>
                                    <thead>
                                        <tr>
                                            <td>
                                                ISBN
                                            </td>
                                            <td>
                                                Judul
                                            </td>
                                            <td>
                                                Penulis
                                            </td>
                                            <td>
                                                Tahun Terbit
                                            </td>
                                            <td>
                                                Penerbit
                                            </td>
                                            <td>
                                                Ketersediaan
                                            </td>
                                        </tr>
                                    </thead>
                                    <%for (int i = 0; i < bk.length; i++) {%>
                                    <tr>
                                        <td><input type="submit" name="isbn"
                                                   value="<%= bk[i].getISBN()%>"/>
                                        </td>
                                        <td>
                                            <%= bk[i].getJudul()%>
                                        </td>
                                        <td>
                                            <%= bk[i].getPenulis()%>
                                        </td>
                                        <td>
                                            <%= bk[i].getTahun_Terbit()%>
                                        </td>
                                        <td>
                                            <%= bk[i].getPenerbit()%>
                                        </td>
                                        <td>
                                            <%= bk[i].getCopy()%>
                                        </td>
                                    </tr>
                                    <%}%>
                                </table>
                            </form>
                        </div>
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
                             <li><a href="Admin.jsp">Home</a></li>
                            <li>
                                <span class="opener">Admin</span>
                                <ul>
                                    <li><a href="Tambah Buku.jsp">Tambah Buku</a></li>
                                    <li><a href="Cari Hapus Buku.jsp">Hapus Buku</a></li>
                                    <li><a href="Cari Hapus Anggota.jsp">Hapus Anggota</a></li>
                                    <li><a href="LogoutAdmin.jsp">Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- Section -->
                        <section>
                            <header class="major">
                                <h2>Get in touch</h2>
                            </header>
                            <ul class="contact">
                                <li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
                                <li class="fa-phone">(000) 000-0000</li>
                                <li class="fa-home">Sanata Dharma University #8254<br />
                                    Yogyakarta 00000-0000</li>
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