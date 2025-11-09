$(document).ready(function(){
  $("#serv-inp").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#serv-table tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
}); 

$(document).ready(function() {
		$('.box').hide();
		$('.Paparaa').show(); 
});

$('select#banks').change(function() { 
		$('.box').hide(); 
		$('.' + $(this).val()).show(); 
});


$(window).scroll(function() {
	$(".panel-menu").removeClass("mobile-left-open");
});

function homeMenuToggle() {
    console.log('sa');
    $(".head-menu").toggleClass('active');
    $('body').toggleClass('body-pause');
    $('.home-menu-btn > .fas').toggleClass('fa-bars')
    $('.home-menu-btn > .fas').toggleClass('fa-times')
}

if ($(document).width() <= 767) {
    $(function(){
    bodyHeight =$(document).height();
    divHeight = bodyHeight - 124;
    $('.panel-menu').css({'height': divHeight +'px'});
    $(window).resize(function(){
        $('.panel-menu').css({'height': divHeight +'px'});
    });
    });
  }else if ($(document).width() >= 768 && $(document).width() <= 1024){
    $(function(){
    bodyHeight =$(document).height();
    divHeight = bodyHeight - 119;
    $('.panel-menu').css({'height': divHeight +'px'});
    $(window).resize(function(){
        $('.panel-menu').css({'height': divHeight +'px'});
    });
    });
  }else if ($(document).width() >= 1025 && $(document).width() <= 1366){
    $(function(){
    bodyHeight =$(document).height();
    divHeight = bodyHeight - 119;
    $('.panel-menu').css({'height': divHeight +'px'});
    $(window).resize(function(){
        $('.panel-menu').css({'height': divHeight +'px'});
    });
    });
  }else{
    $(function(){
    bodyHeight =$(document).height();
    divHeight = bodyHeight - 119;
    $('.panel-menu').css({'height': divHeight +'px'});
    $(window).resize(function(){
        $('.panel-menu').css({'height': divHeight +'px'});
    });
    });
  }

$(document).ready( function(){
  $('.panel-menu').addClass( "mobile-left-close");
    $('.mobile-navbar-toggler').click( function(){
      if ($('.panel-menu').hasClass('mobile-left-close')){
          $('.panel-menu').removeClass( "mobile-left-close" );
          $('.panel-menu').addClass( "mobile-left-open" );
      }else{
        $('.panel-menu').removeClass( "mobile-left-open" );
        $('.panel-menu').addClass( "mobile-left-close" );
      }
    });

return false;
});

$(document).ready(function () {
    setList(0);
    setList(1);    
});

function ikon(opt) {
    var ikon = "";
    if (opt.indexOf("Instagram") >= 0) {
        ikon = '<span class="fs-ig"><i class="fab fa-instagram" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("IGTV") >= 0) {
        ikon = '<span class="fs-ig"><i class="fab fa-instagram" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("En Ucuz Servisler") >= 0) {
        ikon = '<span class="fs-protomotion"><i class="fa fa-bookmark-o" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Promotion") >= 0) {
        ikon = '<span class="fs-protomotion"><i class="fa fa-bookmark-o" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Facebook") >= 0) {
        ikon = '<span class="fs-fb"><i class="fab fa-facebook-square" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Youtube") >= 0) {
        ikon = '<span class="fs-yt"><i class="fab fa-youtube" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Twitter") >= 0) {
        ikon = '<span class="fs-tw"><i class="fab fa-twitter" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Google") >= 0) {
        ikon = '<span class="fs-gp"><i class="fab fa-google-plus" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Swarm") >= 0) {
        ikon = '<span class="fs-fsq"><i class="fa fa-forumbee" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Dailymotion") >= 0) {
        ikon = '<span class="fs-dm"><i class="fa fa-hospital-o" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Periscope") >= 0) {
        ikon = '<span class="fs-pc"><i class="fa fa-map-marker" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("SoundCloud") >= 0) {
        ikon = '<span class="fs-sc"><i class="fab fa-soundcloud" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Vine") >= 0) {
        ikon = '<span class="fs-vn"><i class="fab fa-vine" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Spotify") >= 0) {
        ikon = '<span class="fs-sp"><i class="fab fa-spotify" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Snapchat") >= 0) {
        ikon = '<span class="fs-snap"><i class="fab fa-snapchat-square" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Twitch") >= 0) {
        ikon = '<span class="fs-twitch"><i class="fab fa-twitch" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Global") >= 0) {
        ikon = '<span class="fs-globe"><i class="fas fa-globe" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Tumblr") >= 0) {
        ikon = '<span class="fs-tumblr"><i class="fab fa-tumblr" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Web Site Trafik") >= 0) {
        ikon = '<span class="fs-globe"><i class="fas fa-globe" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("IMDB") >= 0) {
        ikon = '<span class="fs-imdb"><i class="fa fa-imdb" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Tiktok") >= 0) {
        ikon = '<span class="fs-msc"><i class="fa fa-music" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("S1") >= 0) {
        ikon = '<span class="fs-hizli"><i class="fa fa-arrow-up" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("S2") >= 0) {
        ikon = '<span class="fs-hizli"><i class="fa fa-arrow-up" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("S3") >= 0) {
        ikon = '<span class="fs-hizli"><i class="fa fa-arrow-up" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("S4") >= 0) {
        ikon = '<span class="fs-orta"><i class="fa fa-compress" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("S5") >= 0) {
        ikon = '<span class="fs-hizli"><i class="fa fa-arrow-up" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("S6") >= 0) {
        ikon = '<span class="fs-hizli"><i class="fa fa-arrow-up" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("S7") >= 0) {
        ikon = '<span class="fs-hizli"><i class="fa fa-arrow-up" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("S8") >= 0) {
        ikon = '<span class="fs-hizli"><i class="fa fa-arrow-up" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("S0") >= 0) {
        ikon = '<span class="fs-hizli"><i class="fa fa-arrow-up" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("S9") >= 0) {
        ikon = '<span class="fs-orta"><i class="fa fa-compress" aria-hidden="true"></i> </span>';
    } else if (opt.indexOf("Turk") >= 0) {
        ikon = '<span class="fs-yavas"><i class="fa fa-arrow-down" aria-hidden="true"></i> </span>';
    } else {
        ikon = '<span class=""><i class="fa fa-star" aria-hidden="true"></i> </span>  ';
    }
    return ikon;
}

function setList(val) {
    /* orders */
    if (val == 0) {
        $("#orders-drop").empty();
        $("#neworder_services option").each(function () {
            var ico = ikon($(this).text());
            $("#orders-drop").append('<button id="serviceItem" class="dropdown-item" type="button" onclick="selectOrder(' + $(this).val() + ')">' + ico + $(this).text() + "</button>");
        });
        /*if(this.selected) {*/
        var e = document.getElementById("neworder_services");
        var selected = $( "#neworder_services option:selected" ).text();
        var ico = ikon(selected);
        $("#serviceTitle").html(ico + selected);
        /*}else {
       var ico = ikon($("#neworder_services option:nth-child(1)").text());              
    	$("#serviceTitle").html(ico + $("#neworder_services option:nth-child(1)").text());         
                  }            */
    } else if (val == 1) {
        /* SERVICES */

        $("#category-drop").empty();
        $("#neworder_category option").each(function () {
            var ico = ikon($(this).text());
            $("#category-drop").append('<button id="categoryItem" class="dropdown-item" type="button" onclick="selectCategory(' + $(this).val() + ')">' + ico + $(this).text() + "</button>");
        });

        /* if(this.selected) {*/
        var e = document.getElementById("neworder_category");
        var selected = e.options[e.selectedIndex].text;
        var ico = ikon(selected);
        $("#categoryTitle").html(ico + selected);
        /*}else {      
        var ico = ikon($("#neworder_category option:nth-child(1)").text());              
        $("#categoryTitle").html(ico + $("#neworder_category option:nth-child(1)").text());
                 } */
    }
}
$(function (ready) {
    $("#neworder_services").change(function () {
        setList(0);
    });
    $("#neworder_category").change(function () {
        setList(1);
    });
});

function selectOrder(val) {
    $("#neworder_services").val(val);
    $("#neworder_services").trigger("change");
    var ico = ikon($("#neworder_services option[value='" + val + "']").text());
    $("#serviceTitle").html(ico + $("#neworder_services option[value='" + val + "']").text());
}
$("#serviceItem").click(function () {
    $("#serviceTitle").html($(this).html());
});

function selectCategory(val) {
    $("#neworder_category").val(val);
    $("#neworder_category").trigger("change");
    var ico = ikon($("#neworder_category option[value='" + val + "']").text());
    $("#categoryTitle").html(ico + $("#neworder_category option[value='" + val + "']").text());
}