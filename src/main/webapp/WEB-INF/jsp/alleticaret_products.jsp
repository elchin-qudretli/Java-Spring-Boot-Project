<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html>
  <head>
    <meta charset=windows-1254"/>
    <title>Limo - HTML5 E-Commerce Template</title>
    <!--SEO Meta Tags-->
    <meta name="description" content="Responsive HTML5 E-Commerce Template" />
		<meta name="keywords" content="responsive html5 template, e-commerce, shop, bootstrap 3.0, css, jquery, flat, modern" />
		<meta name="author" content="8Guild" />
    <!--Mobile Specific Meta Tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!--Favicon-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!--Master Slider Styles-->
       <!--Master Slider Styles-->
    <link href="./resources/masterslider/style/masterslider.css" rel="stylesheet" media="screen" />
    <!--Styles-->
    <link href="./resources/css/styles.css" rel="stylesheet" media="screen" />
    
    <!--Modernizr-->
		<script src="./resources/js/libs/modernizr.custom.js"></script>
    <!--Adding Media Queries Support for IE8-->
    <!--[if lt IE 9]>
      <script src="./resources/js/plugins/respond.js"></script>
    <![endif]-->
  </head>

  <!--Body-->
  <body>

  	<!--Login Modal-->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
            <h2>Giriş Yap veya <a href="register.html">Kayıt Ol</a></h2>
            <p class="large">Sosyal Media Hesapları</p>
            <div class="social-login">
            	<a class="facebook" href="#"><i class="fa fa-facebook-square"></i></a>
            	<a class="google" href="#"><i class="fa fa-google-plus-square"></i></a>
            	<a class="twitter" href="#"><i class="fa fa-twitter-square"></i></a>
            </div>
          </div>
          <div class="modal-body">
          <form class="login-form">
            <div class="form-group group">
            	<label for="log-email">Email</label>
              <input type="email" class="form-control" name="log-email" id="log-email" placeholder="E-mail adresinizi giriniz." required>
              <a class="help-link" href="#">E-mail unuttum?</a>
            </div>
            <div class="form-group group">
            	<label for="log-password">Parola</label>
              <input type="text" class="form-control" name="log-password" id="log-password" placeholder="Parolanızı giriniz." required>
              <a class="help-link" href="#">Parolamı unuttum?</a>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" name="remember"> Beni Hatırla.</label>
            </div>
            <input class="btn btn-black" type="submit" value="Giriş Yap">
          </form>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!--Header-->
    <header data-offset-top="500" data-stuck="600"><!--data-offset-top is when header converts to small variant and data-stuck when it becomes visible. Values in px represent position of scroll from top. Make sure there is at least 100px between those two values for smooth animation-->
    
      <!--Search Form-->
      <form class="search-form closed" method="get" role="form" autocomplete="off">
      	<div class="container">
          <div class="close-search"><i class="icon-delete"></i></div>
            <div class="form-group">
              <label class="sr-only" for="search-hd">Search for product</label>
              <input type="text" class="form-control" name="search-hd" id="search-hd" placeholder="Search for product">
              <button type="submit"><i class="icon-magnifier"></i></button>
          </div>
        </div>
      </form>
    
    	<!--Mobile Menu Toggle-->
      <div class="menu-toggle"><i class="fa fa-list"></i></div>

      <div class="container">
        <a class="logo" href="/alleticaret_products"><img src="./resources/img/logo-scheme4.png" alt="Limo"/></a>
      </div>
      
      <!--Main Menu-->
      <nav class="menu">
        <div class="container">
          
         <jsp:include page="ustlinkler.jsp"></jsp:include>
         
        </div>

        <div class="catalog-block">
          <div class="container">
            <ul class="catalog">
						<c:forEach items="${newlists}" var="category">
							<li class="has-submenu"><a
								href="shop-filters-left-3cols.html">${category.categoryname}<i
									class="fa fa-chevron-down"></i></a>
								<ul class="submenu">
									<c:forEach items="${newlists2}" var="listeler">
										<c:forEach items="${listeler}" var="item">
											<c:if test="${item.parentcategoryid == category.categoryid }">
												<li class="has-submenu"><a href="#">${item.categoryname}</a>
													<ul class="sub-submenu">
														<c:forEach items="${lists}" var="product">
															<c:if test="${item.categoryid == product.categoryid }">
																<li><a href="#">${product.name}</a></li>
															</c:if>															
														</c:forEach>
													</ul></li>
											</c:if>											
										</c:forEach>
									</c:forEach>
								</ul>
						</c:forEach>
					</ul>
          </div>
        </div>
      </nav>
      
      <div class="toolbar-container">
        <div class="container">  
          <!--Toolbar-->
          <div class="toolbar group">
            <a class="login-btn btn-outlined-invert" href="#" data-toggle="modal" data-target="#loginModal"><i class="icon-profile"></i> <span><b>G</b>İRİŞ Yap</span></a>

            <a class="btn-outlined-invert" href="wishlist.html"><i class="icon-heart"></i> <span><b>W</b>ishlist</span></a>   

            <div class="cart-btn">
              <a class="btn btn-outlined-invert" href="shopping-cart.html"><i class="icon-shopping-cart-content"></i><span>3</span><b>36 5654</b></a>
              
              <!--Cart Dropdown-->
              <div class="cart-dropdown">
                <span></span><!--Small rectangle to overlap Cart button-->
                <div class="body">
                  <table>
                    <tr>
                      <th>Ürün</th>
                      <th>Miktar</th>
                      <th>Tutar</th>
                    </tr>
                    <tr class="item">
                      <td><div class="delete"></div><a href="#">Good Joo-Joo Surfb</a></td>
                      <td><input type="text" value="1"></td>
                      <td class="price">89 005 $</td>
                    </tr>
                    <tr class="item">
                      <td><div class="delete"></div><a href="#">Good Joo-Joo Item</a></td>
                      <td><input type="text" value="2"></td>
                      <td class="price">4 300 $</td>
                    </tr>
                    <tr class="item">
                      <td><div class="delete"></div><a href="#">Good Joo-Joo</a></td>
                      <td><input type="text" value="5"></td>
                      <td class="price">84 $</td>
                    </tr>
                  </table>
                </div>
                <div class="footer group">
                  <div class="buttons">
                    <a class="btn btn-outlined-invert" href="checkout.html"><i class="icon-download"></i>Checkout</a>
                    <a class="btn btn-outlined-invert" href="shopping-cart.html"><i class="icon-shopping-cart-content"></i>To cart</a>
                  </div>
                  <div class="total">93 389 $</div>
                </div>
              </div><!--Cart Dropdown Close-->
            </div>

            <button class="search-btn btn-outlined-invert"><i class="icon-magnifier"></i></button>
          </div><!--Toolbar Close-->
        </div>
      </div>
    </header><!--Header Close-->
    
    <!--Page Content-->
    <div class="page-content">
    
    	<!--Hero Slider-->
      <section class="hero-slider">
      	<div class="master-slider" id="hero-slider">
        
        	<!--Slide 1-->
        	<div class="ms-slide" data-delay="7">
          	<div class="overlay"></div>
          	<img src="./resources/masterslider/blank.gif" data-src="./resources/img/hero/slideshow/slide_1.png" alt=""/>
            <h2 style="width: 456px; left: 110px; top: 110px;" class="dark-color ms-layer" data-effect="top(50,true)" data-duration="700" data-delay="250" data-ease="easeOutQuad">Look for all bags at our shop!</h2>
            <p style="width: 456px; left: 110px; top: 210px;" class="dark-color ms-layer" data-effect="back(500)" data-duration="700" data-delay="500" data-ease="easeOutQuad">In this slider (which works both on touch screen and desktop devices) you can change the title, the description and button texts. It's all that you need to demonstrate your top rated products. </p>
            <div style="left: 110px; top: 300px;" class="ms-layer button" data-effect="left(50,true)" data-duration="500" data-delay="750" data-ease="easeOutQuad"><a class="btn btn-black" href="#">Kataloğa Git</a></div>
            <div style="left: 350px; top: 300px;" class="ms-layer button" data-effect="bottom(50,true)" data-duration="700" data-delay="950" data-ease="easeOutQuad"><a class="btn btn-primary" href="#">Katagorilere Gözat</a></div>
          </div>
          
        	<!--Slide 2-->
        	<div class="ms-slide" data-delay="7">
            <span class="overlay"></span>
          	<img src="./resources/masterslider/blank.gif" data-src="./resources/img/hero/slideshow/slide_2.png" alt="Necessaire"/>
            <h2 style="width: 456px; left: 110px; top: 110px;" class="dark-color ms-layer" data-effect="bottom(50,true)" data-duration="700" data-delay="250" data-ease="easeOutQuad">Necessaire</h2>
            <p style="width: 456px; left: 110px; top: 210px;" class="dark-color ms-layer" data-effect="bottom(50,true)" data-duration="700" data-delay="500" data-ease="easeOutQuad">In this slider (which works both on touch screen and desktop devices) you can change the title, the description and button texts. It's all that you need to demonstrate your top rated products. </p>
            <div style="left: 110px; top: 330px;" class="ms-layer button" data-effect="left(50,true)" data-duration="500" data-delay="750" data-ease="easeOutQuad"><a class="btn btn-black" href="#">Kataloğa Git</a></div>
            <div style="left: 350px; top: 330px;" class="ms-layer button" data-effect="bottom(50,true)" data-duration="700" data-delay="950" data-ease="easeOutQuad"><a class="btn btn-primary" href="#">Katagorilere Gözat</a></div>
          </div>
          
        	<!--Slide 3-->
        	<div class="ms-slide" data-delay="7">
          	<div class="overlay"></div>
          	<img src="./resources/masterslider/blank.gif" data-src="./resources/img/hero/slideshow/slide_2.png" alt="Crescent"/>
            <h2 style="width: 456px; left: 110px; top: 110px;" class="dark-color ms-layer" data-effect="left(50,true)" data-duration="700" data-delay="250" data-ease="easeOutQuad">Crescent</h2>
            <p style="width: 456px; left: 110px; top: 210px;" class="dark-color ms-layer" data-effect="left(50,true)" data-duration="700" data-delay="500" data-ease="easeOutQuad">In this slider (which works both on touch screen and desktop devices) you can change the title, the description and button texts. It's all that you need to demonstrate your top rated products. </p>
            <div style="left: 110px; top: 330px;" class="ms-layer button" data-effect="left(50,true)" data-duration="500" data-delay="750" data-ease="easeOutQuad"><a class="btn btn-black" href="#">Kataloğa Git</a></div>
            <div style="left: 350px; top: 330px;" class="ms-layer button" data-effect="bottom(50,true)" data-duration="700" data-delay="950" data-ease="easeOutQuad"><a class="btn btn-primary" href="#">Katagorilere Gözat</a></div>
          </div>
          
        </div>
      </section><!--Hero Slider Close-->
    
    	<!--Categories-->
      <section class="cat-tiles">
      	<div class="container">
        	<h2>Katagorilere Gözat</h2>
        	<div class="row">
          	<!--Category-->
          	<div class="category col-lg-2 col-md-2 col-sm-4 col-xs-6">
            	<a href="#">
                <img src="./resources/img/categories/1.png" alt="1"/>
                <p>Deri Kemer</p>
              </a>
            </div>
          	<!--Category-->
          	<div class="category col-lg-2 col-md-2 col-sm-4 col-xs-6">
            	<a href="#">
                <img src="./resources/img/categories/2.png" alt="1"/>
                <p>Cüzdan</p>
              </a>
            </div>
          	<!--Category-->
          	<div class="category col-lg-2 col-md-2 col-sm-4 col-xs-6">
            	<a href="#">
                <img src="./resources/img/categories/3.png" alt="1"/>
                <p>Eldiven</p>
              </a>
            </div>
          	<!--Category-->
          	<div class="category col-lg-2 col-md-2 col-sm-4 col-xs-6">
            	<a href="#">
                <img src="./resources/img/categories/4.png" alt="1"/>
                <p>Çanta</p>
              </a>
            </div>
          	<!--Category-->
          	<div class="category col-lg-2 col-md-2 col-sm-4 col-xs-6">
            	<a href="#">
                <img src="./resources/img/categories/5.png" alt="1"/>
                <p>Sırt Çantası</p>
              </a>
            </div>
          	<!--Category-->
          	<div class="category col-lg-2 col-md-2 col-sm-4 col-xs-6">
            	<a href="#">
                <img src="./resources/img/categories/6.png" alt="1"/>
                <p>Kemer</p>
              </a>
            </div>
          </div>
        </div>
      </section><!--Categories Close-->
      
      <!--Catalog Grid-->
      <section class="catalog-grid">
      	<div class="container">
        	<h2 class="dark-color">Katalog Seçimleri</h2>
          <div class="row">
       
       
            
            <c:forEach items="${lists}" var="product">
    	   <div class="col-lg-3 col-md-4 col-sm-6">
            	<div class="tile">
              	<div class="price-label"> ${product.price} TL</div>
              	<a href="#">
                  <img src="./resources/img/catalog/${product.image}" alt="1"/>
                  <span class="tile-overlay"></span>
                </a>
                <div class="footer">
                		<a href="urundetay.jsp?id=${product.productID}">${product.name}</a>
                  <span>by Anna Canara</span>
                  <button class="btn btn-primary">Sepete Ekle</button>
                </div>
              </div>
            </div>
           </c:forEach>
          </div>
        </div>
      </section><!--Catalog Grid Close-->
      
      <!--Tabs Widget-->
      <section class="tabs-widget">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
          <li class="active"><a href="#bestsel" data-toggle="tab">Çok Satan Ürünler</a></li>
          <li><a href="#onsale" data-toggle="tab">İndirimdeki Ürünler</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane fade in active" id="bestsel">
          	<div class="container">
            	<div class="row">
              	<div class="col-lg-7 col-md-7 col-sm-7">
                	<a class="media-link" href="#">
                  	<div class="overlay">
                    	<div class="descr"><div>Product Name<span>$14.95</span></div></div>
                    </div>
                    <img src="./resources/img/media/1.png" alt="1"/>
                  </a>
                </div>
              	<div class="col-lg-5 col-md-5 col-sm-5">
                	<a class="media-link" href="#">
                  	<div class="overlay">
                    	<div class="descr"><div>Product Name<span>$19.40</span></div></div>
                    </div>
                    <img src="./resources/img/media/2.png" alt="2"/>
                  </a>
                </div>
              </div>
              <div class="row">
              	<div class="col-lg-4 col-md-4 col-sm-4">
                	<a class="media-link" href="#">
                  	<div class="overlay">
                    	<div class="descr"><div>Product Name<span>$24.15</span></div></div>
                    </div>
                    <img src="./resources/img/media/3.png" alt="3"/>
                  </a>
                </div>
              	<div class="col-lg-5 col-md-5 col-sm-5">
                	<a class="media-link" href="#">
                  	<div class="overlay">
                    	<div class="descr"><div>Product Name<span>$24.15</span></div></div>
                    </div>
                    <img src="./resources/img/media/4.png" alt="4"/>
                  </a>
                </div>
              	<div class="col-lg-3 col-md-3 col-sm-3">
                	<a class="media-link" href="#">
                  	<div class="overlay">
                    	<div class="descr"><div>Product Name<span>$24.15</span></div></div>
                    </div>
                    <img src="./resources/img/media/5.png" alt="5"/>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div class="tab-pane fade" id="onsale">
          	<div class="container">
            	<div class="row">
              	<div class="col-lg-6 col-md-6 col-sm-6">
                	<a class="media-link" href="#">
                  	<div class="overlay">
                    	<div class="descr"><div>Product Name<span>$14.95</span></div></div>
                    </div>
                    <img src="./resources/img/media/6.png" alt="1"/>
                  </a>
                </div>
              	<div class="col-lg-6 col-md-6 col-sm-6">
                	<a class="media-link" href="#">
                  	<div class="overlay">
                    	<div class="descr"><div>Product Name<span>$19.40</span></div></div>
                    </div>
                    <img src="./resources/img/media/7.png" alt="2"/>
                  </a>
                </div>
              </div>
              <div class="row">
              	<div class="col-lg-6 col-md-6 col-sm-6">
                	<a class="media-link" href="#">
                  	<div class="overlay">
                    	<div class="descr"><div>Product Name<span>$24.15</span></div></div>
                    </div>
                    <img src="./resources/img/media/8.png" alt="3"/>
                  </a>
                </div>
              	<div class="col-lg-6 col-md-6 col-sm-6">
                	<a class="media-link" href="#">
                  	<div class="overlay">
                    	<div class="descr"><div>Product Name<span>$24.15</span></div></div>
                    </div>
                    <img src="./resources/img/media/9.png" alt="4"/>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section><!--Tabs Widget Close-->
    
      <!--Posts/Twitter Widget-->
      <section class="posts-widget">
        <div class="tw-bg"></div>
        <div class="container">
          <div class="row">
            <div class="latest-posts col-lg-8 col-md-8">
              <div class="row">
                <div class="col-lg-3">
                  <h2 class="extra-bold">Son Favori</h2>
                  <a class="btn btn-black btn-block" href="favoriler.html">Favoriler</a>
                </div>
                <div class="col-lg-9">
                  <!--Post-->
                  <div class="post row">
                    <div class="col-lg-6 col-sm-6">
                      <a href="#"><img src="./resources/img/posts-widget/1.png" alt="1"/></a>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                      <h3><a href="#">An interesting post</a></h3>
                      <p>Write a blog to share with customers interesting facts about your products. Make them curious and you'll get co-operation. Just try it!</p>
                        <div class="author"><i class="fa fa-user"></i><a href="#">By Resoursa</a></div>
                        <div class="comments"><i class="fa fa-comment"></i><a href="#">Comments (34)</a></div>
                    </div>
                  </div><!--Post End-->
                  <!--Post-->
                  <div class="post row">
                    <div class="col-lg-6 col-sm-6">
                      <a href="#"><img src="./resources/img/posts-widget/2.png" alt="2"/></a>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                      <h3><a href="#">Review post</a></h3>
                      <p>You probably know that giving more details is the best way to provide info about a product. Write reviews, take high-quality pictures, and that will definitely boost the sales.</p>
                        <div class="author"><i class="fa fa-user"></i><a href="#">By Jeddah</a></div>
                        <div class="comments"><i class="fa fa-comment"></i><a href="#">Comments (101)</a></div>
                    </div>
                  </div><!--Post End-->
                </div>
              </div>
            </div>
            <div class="twitter-feed col-lg-4 col-md-4">
              <a class="tw-follow" href="https://twitter.com/8Guild" target="_blank">
                <div class="button">Follow us<i class="fa fa-twitter"></i></div>
                <h2 class="extra-bold">On Twitter <i class="fa fa-twitter"></i></h2>
              </a>
              <!--Tweet-->
              <div class="tweet">
                <a href="#">@Resoursa</a>
                <p class="p-style3">Uberly impressed with the AMAZING support I constantly get from awesome!!!</p>
                <div class="group">
                  <div class="actions">
                    <a href="#">Reply</a>
                    <a href="#">Retweet</a>
                    <a href="#">Favorite</a>
                  </div>
                  <span class="date">5 Mar 2014</span>
                </div>
              </div><!--Tweet Close-->
              <!--Tweet-->
              <div class="tweet">
                <a href="#">@Resoursa</a>
                <p class="p-style3">Uberly impressed with the AMAZING support I constantly get from awesome!!!</p>
                <div class="group">
                  <div class="actions">
                    <a href="#">Reply</a>
                    <a href="#">Retweet</a>
                    <a href="#">Favorite</a>
                  </div>
                  <span class="date">5 Mar 2014</span>
                </div>
              </div><!--Tweet Close-->
            </div>
          </div>
        </div>
      </section>
      
      <!--Gallery Widget-->
      <section class="white-bg gallery-widget">
        <div class="container">
          <h2>Ürün Galerisi</h2>
          <div class="filters">
            <a class="active" href="#" data-group="Tüm Ürünler">All</a>
            <a href="#" data-group="City bags">Çanta</a>
            <a href="#" data-group="Gloves">Eldiven</a>
            <a href="#" data-group="Belts">Kemer</a>
            <a href="#" data-group="video">Fermuar</a>
          </div>
          <div class="gallery-grid">
            <!--Item-->
            <div class="gallery-item" data-groups='["City bags"]' data-src="./resources/img/gallery-widget/1.png">
              <a href="./resources/img/gallery-widget/1.png">
                <div class="overlay"><span><i class="icon-expand"></i></span></div>
                <img src="./resources/img/gallery-widget/1.png" alt="1"/>
              </a>
            </div>
            <!--Item-->
            <div class="gallery-item" data-groups='["City bags"]' data-src="./resources/img/gallery-widget/2.png">
              <a href="./resources/img/gallery-widget/2.png">
                <div class="overlay"><span><i class="icon-expand"></i></span></div>
                <img src="./resources/img/gallery-widget/2.png" alt="2"/>
              </a>
            </div>
            <!--Item-->
            <div class="gallery-item" data-groups='["video"]' data-src="https://www.youtube.com/watch?v=AZ3AVR7VnqA">
              <a href="https://www.youtube.com/watch?v=hdEAWW7tZSA">
                <div class="overlay"><span><i class="icon-music-play"></i></span></div>
                <img src="./resources/img/gallery-widget/3.png" alt="3"/>
              </a>
            </div>
            <!--Item-->
            <div class="gallery-item" data-groups='["Belts"]' data-src="./resources/img/gallery-widget/4.png">
              <a href="./resources/img/gallery-widget/4.png">
                <div class="overlay"><span><i class="icon-expand"></i></span></div>
                <img src="./resources/img/gallery-widget/4.png" alt="4"/>
              </a>
            </div>
            <!--Item-->
            <div class="gallery-item" data-groups='["Gloves"]' data-src="./resources/img/gallery-widget/5.png">
              <a href="./resources/img/gallery-widget/5.png">
                <div class="overlay"><span><i class="icon-expand"></i></span></div>
                <img src="./resources/img/gallery-widget/5.png" alt="5"/>
              </a>
            </div>
            <!--Item-->
            <div class="gallery-item" data-groups='["Gloves"]' data-src="./resources/img/gallery-widget/5.png">
              <a href="./resources/img/gallery-widget/6.png">
                <div class="overlay"><span><i class="icon-expand"></i></span></div>
                <img src="./resources/img/gallery-widget/6.png" alt="6"/>
              </a>
            </div>
          </div>
        </div>
      </section><!--Gallery Widget Close-->
      
      <!--Brands Carousel Widget-->
      <section class="brand-carousel">
      	<div class="container">
        	<h2>Markalar</h2>
          <div class="inner">
          	<a class="item" href="#"><img src="./resources/img/brands/1.png" alt="1"/></a>
            <a class="item" href="#"><img src="./resources/img/brands/1.png" alt="1"/></a>
            <a class="item" href="#"><img src="./resources/img/brands/2.png" alt="1"/></a>
            <a class="item" href="#"><img src="./resources/img/brands/3.png" alt="1"/></a>
            <a class="item" href="#"><img src="./resources/img/brands/4.png" alt="1"/></a>
            <a class="item" href="#"><img src="./resources/img/brands/5.png" alt="1"/></a>
            <a class="item" href="#"><img src="./resources/img/brands/6.png" alt="1"/></a>
          </div>
        </div>
      </section><!--Brands Carousel Close-->
      
    </div><!--Page Content Close-->
    
    <!--Sticky Buttons-->
    <div class="sticky-btns">
    	<form class="quick-contact" method="post" name="quick-contact">
      	<h3>Bizimle iletişime geçiniz</h3>
        <p class="text-muted">Mesajınız için aşağıdaki alanları doldurunuz!</p>
        <div class="form-group">
        	<label for="qc-name">Adınız Soyadınız:</label>
          <input class="form-control input-sm" type="text" name="qc-name" id="qc-name" placeholder="Adınız Soyadınız." required>
        </div>
        <div class="form-group">
        	<label for="qc-email">Email adresiniz:</label>
          <input class="form-control input-sm" type="email" name="qc-email" id="qc-email" placeholder="Email adresiniz." required>
        </div>
        <div class="form-group">
        	<label for="qc-message">Mesajınız:</label>
          <textarea class="form-control input-sm" name="qc-message" id="qc-message" placeholder="Mesajınızı yazınız." required></textarea>
        </div>
        <input class="btn btn-black btn-sm btn-block" type="submit" value="Gönder">
      </form>
    	<span id="qcf-btn"><i class="fa fa-envelope"></i></span>
      <span id="scrollTop-btn"><i class="fa fa-chevron-up"></i></span>
    </div><!--Sticky Buttons Close-->
    
    <!--Subscription Widget-->
    <section class="subscr-widget gray-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-7 col-md-8 col-sm-8">
            <h2>Ürünler hakkında bilgi almak için üye olun.</h2>
            <form class="subscr-form" role="form" autocomplete="off">
              <div class="form-group">
                <label class="sr-only" for="subscr-name">Adınız Soyadınız:</label>
                <input type="text" class="form-control" name="subscr-name" id="subscr-name" placeholder="Adınız Soyadınız." required>
                <button class="subscr-next"><i class="icon-arrow-right"></i></button>
              </div>
              <div class="form-group fff" style="display: none">
                <label class="sr-only" for="subscr-email">Email adresiniz:</label>
                <input type="email" class="form-control" name="subscr-email" id="subscr-email" placeholder="Email adresiniz." required>
                <button type="submit" id="subscr-submit"><i class="icon-check"></i></button>
              </div>
            </form>
            <p class="p-style2">Lütfen devam etmeden önce alanı doldurunuz.</p>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4 col-lg-offset-1">
            <p class="p-style3"> </p>
          </div>
        </div>
      </div>
    </section><!--Subscription Widget Close-->
      
  	<!--Footer-->
    <jsp:include page="altlinkler.jsp"></jsp:include>
    <!--Footer Close-->
    
    <!--Javascript (jQuery) Libraries and Plugins-->
		<script src="./resources/js/libs/jquery-1.11.1.min.js"></script>
		<script src="./resources/js/libs/jquery-ui-1.10.4.custom.min.js"></script>
    <script src="./resources/js/libs/jquery.easing.min.js"></script>
		<script src="./resources/js/plugins/bootstrap.min.js"></script>
		<script src="./resources/js/plugins/smoothscroll.js"></script>
		<script src="./resources/js/plugins/jquery.validate.min.js"></script>
		<script src="./resources/js/plugins/icheck.min.js"></script>
		<script src="./resources/js/plugins/jquery.placeholder.js"></script>
		<script src="./resources/js/plugins/jquery.stellar.min.js"></script>
		<script src="./resources/js/plugins/jquery.touchSwipe.min.js"></script>
		<script src="./resources/js/plugins/jquery.shuffle.min.js"></script>
    <script src="./resources/js/plugins/lightGallery.min.js"></script>
    <script src="./resources/js/plugins/owl.carousel.min.js"></script>
    <script src="./resources/js/plugins/masterslider.min.js"></script>
		<script src="./resources/js/scripts.js"></script>

    
    
  </body><!--Body Close-->
</html>