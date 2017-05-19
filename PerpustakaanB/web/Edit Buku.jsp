<%@page import="Model.Buku"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%
        String key;
        if (request.getAttribute("demo-isbn")!=null) {
            key = String.valueOf(request.getAttribute("info"));
            }else{
            key = request.getParameter("isbn");
        }
        
        Buku b = Buku.getBuku(key);
    %>
    <head>
        <title>Editorial by HTML5 UP</title>
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
                        <a href="Admin.jsp" class="logo"><strong>Perpustakaan Mbah</strong></a>
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
                            <header>
                                <!-- Search -->
                                <article>
                                    <div class="features">
                                        <form method="post" action="ControlEditBuku">
                                            <!-- Break -->
                                            <div class="row uniform">
                                                <div class="13u 12u$">
                                                    <input type="text" id="demo-copy" name="demo-isbn" value="<%=b.getISBN()%>" />
                                                </div>
                                            </div>
                                            <!-- Break -->
                                            <div class="row uniform">
                                                <div class="20u 12u$">
                                                    <input type="text" id="demo-copy" name="demo-judul" value="<%=b.getJudul()%>" />
                                                </div>
                                            </div>
                                            <!-- Break -->
                                            <div class="row uniform">
                                                <div class="20u 12u$">
                                                    <input type="text" id="demo-copy" name="demo-author" value="<%=b.getPenulis()%>" />
                                                </div>
                                            </div>
                                            <!-- Break -->
                                            <div class="row uniform">
                                                <div class="20u 12u$(small)">
                                                    <input type="text" id="demo-copy" name="demo-penerbit" value="<%=b.getPenerbit()%>" />
                                                </div>
                                            </div>
                                            <!-- Break -->
                                            <div class="row uniform">
                                                <div class="6u 12u$(small)">
                                                    <input type="text" id="demo-copy" name="demo-tahun" value="<%=b.getTahun_Terbit()%>" />
                                                </div>
                                                <!-- Break -->
                                                <div class="4u 12u$(small)">
                                                    <input type="number" id="demo-copy" name="demo-copy" value="<%=b.getCopy()%>" />
                                                </div>
                                                <!-- Break -->
                                                <div class="12u$">
                                                    <ul class="actions">
                                                        <li><input type="submit" value="Edit" class="special" /></li>
                                                        <li><input type="reset" value="Reset" /></li>
                                                    </ul>
                                                </div>
                                                <%if (request.getAttribute("error") != null) {
                                                %>
                                                <p> <%= request.getAttribute("error")%></p>
                                                <%}%>
                                                <%if (request.getAttribute("info") != null) {
                                                %>
                                                <p>Informasi Buku Berhasil Diubah!</p>
                                                <%}%>
                                            </div>
                                        </form>
                                    </div>
                                </article>
                            </header>
                        </div>
                        <span class="image object">
                            <%if (request.getParameter("error") != null) {%>
                            <h3>Informasi Buku</h3>
                            <%} else {%>
                            <!--Jika Buku Masuk-->
                            <h3>Informasi Buku</h3>
                            </h3>
                            <p><%=b.getISBN()%></p>
                            <p><%=b.getJudul()%></p>
                            <p><%=b.getPenulis()%></p>
                            <p><%=b.getPenerbit()%></p>
                            <p><%=b.getTahun_Terbit()%></p>
                            <p><%=b.getCopy()%></p>
                            <%}%>
                        </span>
                    </section>

                    <!-- Section -->
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
                                    <li><a href="Cari Edit Buku.jsp">Edit Buku</a></li>
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