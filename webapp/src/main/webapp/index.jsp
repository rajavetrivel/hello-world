
<!DOCTYPE html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>LA Cinemas - Tamil, English Movie Ticket Booking Online in Trichy</title>
    <meta name="description" content="Online Movie tickets booking at LA Cinemas in Trichy. Look out for latest movie Showtimes, Tickets Rates, release dates and book tickets at LA Cinemas." />
    <meta name="Keywords" content="LA Cinemas, LA Cinemas, LA Cinemas movie ticket booking, LA Cinemas in Chennai, tamil movie ticket booking, english movie ticket booking" />

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,500,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/popupcallout.css?1"/>
    <link rel="stylesheet" type="text/css" href="css/seatlayout.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.5.0/slick.css"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- <link rel="stylesheet" type="text/css" href="/MERY.css?197"/>	  -->
<script type="text/javascript" src="http://in.bookmyshow.com/js/ibv.js?v=6"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
//   if(typeof jQuery == 'undefined'){document.write(unescape("%3Cscript src='https://in.bmscdn.com/js/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));}

  var jq = jQuery.noConflict();
</script>
<!-- <link rel="stylesheet" type="text/css" href="MIRC.css"/> -->
<link rel="stylesheet" type="text/css" href="http://in.bookmyshow.com/css/fonts.css"/>	 
<script src="http://in.bookmyshow.com/js/banner.js" type="text/javascript"></script>
<script src="https://in.bmscdn.com/web/js/misc.js" type="text/javascript"></script>
<script src="/buytickets.js" type="text/javascript"></script>
<script src="/ib.js" type="text/javascript"></script>
<script src="/map.js" type="text/javascript"></script>
<script src="/newseatlayout.js" type="text/javascript"></script>
<script src="/seatlayout.js" type="text/javascript"></script>
<!-- <script type="text/javascript" src='https://in.bmscdn.com/web/js/byt.js'></script> -->
<script type="text/javascript">pcc='MERY';ppr='';pref=''</script>

<!-- <script type="text/javascript" src="SSCT.js"></script> -->
<link rel="stylesheet" type="text/css" href="/SSCT.css"/>    <script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.5.0/slick.min.js"></script>
    <script type="text/javascript">
      $( document ).ready(function() {
        $(".mobile_nav").click(function(){
            $(".nov_con").animate({"left":"0px"}, "500");
            $(".close").fadeIn(500);
            $('body').addClass('no-scroll');
        });
        $(".close").click(function(){
            $(".nov_con").animate({"left":"-100%"}, "500");
            $(".close").fadeOut(500);
            $('body').removeClass('no-scroll');
        });
    });
    </script>
  </head>
  <script type='text/javascript'>
   var objCk = new clsCookie();
   var aVN=[],aEV=[],aST=[],aAV=[];
    jq(document).ready(function(){
        jq(".divNs").click(function(){
            jq(".movieinfo").find(".dates, .movies, .schedule").show();
        });
        jq(".divCs").click(function(){
            jq(".movieinfo").find(".dates, .movies, .schedule").hide();
        });
        jq('.date-select').on('change',function(e){
        e.preventDefault()
        jq("#movies-cinema-popup, .overlay").show();
      })

      // $(".card_btn a").on('click', function(e) {
      //  e.preventDefault();
      //  var EVCode =  $(this).attr('id');
      //  if(EVCode != ""){
      //    objCk.set({ name: "EVCode", value:EVCode, storage: "C"});
      //    var href = "http://ariesplexslcinemas.local/booktickets";
      //    window.location.href = href ;
      //    //var win = window.open(href, '_blank');
      //      //win.focus();
      //  }
      // });
      jq(".cross.fright").on('click',function(){
        fnCanTr();
        location.reload();
        jq('.dimCloak').hide();
        jq('.dCover').hide();
        jq('.banner.slick-slider').css('z-index','+1')
        jq(".mainr.callor").hide()
      })
    });

    jq(document).ready(function($scope){
      jq("#movies-cinema-popup, .dimCloak").hide();
      var movies = null
      var cinema = null
      var dateSelect = null
      var $timeselect = jq('.time-select');
      var formatted_date = function (date) {
        var year = date.getFullYear().toString()
        var month = (date.getMonth() + 1 > 9 ? (date.getMonth() + 1).toString() : "0" + (date.getMonth() + 1).toString())
        var day = date.getDate().toString().length == 1 ? "0" + date.getDate().toString() : date.getDate().toString()
        return [year,month,day]
      }
      strEvtName = "";
      strVNName = "";

      var region = null;
      jq.get('/ibvcom/getJSData.bms?cmd=GETSUBREGIONS&cid=MRCA&pid=&ety=&s=' + new Date().getTime(),function(data){
        region = eval(data)
        jq(region).each(function(i,v){
          jq('.region-select').append("<option data-srid='" + v[0] + "'>" + v[4] +"</option>")
        })
      })
      
      jq('.region-select').on('change',function(e){
       vid = jq(this).val();
       jq(".cinema-select option:first").text("loading...")
       jq(".cinema-select ").html("")
       srid= jq(this).children('option:selected').attr('data-srid');
       jq('.cinema-select').append("<option> Select Cinema</option>")

      jq.get('/ibvcom/getJSData.bms?cmd=GETVENUESBYSUBREGION&srid='+srid+'&cid=MRCA&pid=&ety=&s=' + new Date().getTime(),function(data){
        region = eval(data)
        jq(region).each(function(i,v){ 
          debugger
          jq('.cinema-select').append("<option data-srid='" + v[0] + "'>" + v[1].split(': ')[0] +"</option>")
        })
        
      })

      //  $(".cinema-select").html(("<option value =''>Select Cinema</option><option value='" + vid + "' data-srid='"+srid+"'>LA Cinema</option>"));
       jq('.cinema-select').focus()
     })


      jq('.cinema-select').on('change',function(e){
        
        vid = jq(this).val();
        srid= jq('.region-select').children('option:selected').attr('data-srid');
        jq(".movie-select option:first").text("loading...")
        jq.get('/ibvcom/getJSData.bms?cmd=GetEventsBySubRegion&srid='+srid+'&cid=MRCA&pid=&ety=&s=' + new Date().getTime(),function(data){
          jq(".movie-select option:first").text("Select Movies")
          cinema = eval(data)
          jq('.movie-select option').not("option:first").remove()
          //jq('.time-select option').not("option:first").remove()
          jq(cinema).each(function(i,v){
            if($timeselect.find('.'+v[3]).length == 0){
                jq('.movie-select').append("<option value='" + v[0] + "'>" + v[1] +"</option>");
            }
          })
          jq('.movie-select').focus()
        })
      })


      // jq.get('/ibvcom/getJSData.bms?cmd=GetEventsBySubRegion&srid=ktym&cid=MRCA&pid=&ety=&s=' + new Date().getTime(),function(data){
      //   movies = eval(data)
      //   jq(movies).each(function(i,v){
      //     jq('.movie-select').append("<option value='" + v[0] + "'>" + v[1] +"</option>")
      //   })

      // })
      // var arrSrid=['CNSY','KOLM','KTYM',];
      // jq.get('/ibvcom/getJSData.bms?cmd=GETVENUESBYSUBREGION&srid=ktym&cid=MRCA&pid=&ety=&s=' + new Date().getTime(),function(data){
      //  cinema = eval(data)
      //  jq(cinema).each(function(i,v){
      //    jq('.cinema-select').append("<option value='" + v[0] + "'>" + v[1] +"</option>")
      //  })
      // })

// $http.get("/ibvcom/getJSData.bms?cmd=GETSHOWTIMESBYEVENT&eid=" + window.event_id +"&did=" + date_number_format + "&srid=ktym&pid=&cid=MRCA&ety=&s=" + new Date().getTime()).success(function(response){

      var blnHasDate = false;
      var blnHasTime = false;
      jq('.movie-select').on('change',function(e){
        // jq(".date-select").html("");
       
        eid = jq(this).val()
        vid= jq('.cinema-select').children('option:selected').attr('data-srid');
        jq(".date-select option:first").text("loading...")
        jq.get('/ibvcom/getJSData.bms?cmd=GETSHOWDATESBYVENUE&vid=' + vid +'&srid=' + srid + '&cid=MRCA&pid=&ety=&s=' + new Date().getTime(),function(data){
          jq(".date-select option:first").text("Select Date")
          dates = eval(data); 
          jq('.date-select option').not("option:first").remove()
          jq('.time-select option').not("option:first").remove()
          jq(dates).each(function(i,v){
            if($timeselect.find('.'+v[3]).length == 0){
              
              if(eid == v[2]){
                blnHasDate = true;
                jq(".date-select option:first").text("Select Date")
                jq('.date-select').append("<option class='" + v[3] + "' value='" + v[3] + "'>" + v[4] + "</option>")
              }
              if(!blnHasDate){
                jq(".date-select").html("<option value=''>No Dates available</option>");
                // break;
              }
            }
          })
          jq('.date-select').focus()
        })
      })

      jq('.date-select').on('change',function(e){
        e.preventDefault()
        jq(".time-select option:first").text("loading...")
        eventId = eid
        date_number_format = jq(this).val()
        jq('.time-select option').not("option:first").remove()
        jq.get("/ibvcom/getJSData.bms?cmd=GETSHOWTIMESBYEVENT&eid=" + eventId +"&did=" + date_number_format + "&srid="+srid+"&pid=&cid=MRCA&ety=&s=" + new Date().getTime(),function(response){
          jq(".time-select option:first").text("Select Time")
          show_time_index = 13;
          venue_index = response.indexOf("arrVenues");
          events_index = response.indexOf("arrEvents");
          window.show_time_list = eval(response.substring(show_time_index,venue_index));
          jq(show_time_list).each(function(i,v){
            if(vid == v[0]){
              blnHasTime = true;
            jq(".time-select").append("<option value='" + v[0] + "," + v[1] + "," + v[2] + "," + v[3] +"'>" + v[3] +"</option>")
            }if(!blnHasTime){
                jq(".date-select").html("<option value=''>No Dates available</option>");
                // break;
              }
          })

          strEvtName =  arrEvents[0][1];
          strVNName =  arrVenues[0][1];
        })
      })

      jq('.time-select').on('change',function(e){
        //var moviesControllerScope = angular.element(jq('.slect_section')).scope()
        showtimedata = jq(this).val().split(",")
        fnSelSh(e,showtimedata[0],showtimedata[1],showtimedata[2],showtimedata[3])
      })
    })

    function fnPopupSelSh(i, d, g, b, h) {
        try {
            blnfuncin = false;
            fnPush_to_wiz(d, b);
            f = { msgText: "1.Tickets once purchased cannot be cancelled, exchanged or refunded.<br />" +
                            "2.To counter unforeseen delays, please collect your tickets half an hour before show time.<br />" +
                            "3.Outside food and beverages are not allowed inside the cinema premises.<br />" +
                            "4.Smoking is strictly prohibited inside the theatre premises.<br />" +
                            "5. If a Customer consumes alcohol will not be allowed inside the premises and tickets are not refundable.<br />" +
                            "6. 3D Glass charge will be levied in the counter for the 3D movies screened in the cinema.<br />" +
                            "7.Please purchase ticket for children above the age of 3.",
                  msgType: "", msgTitle: 'Please read this important Terms and Conditions for the Internet Booking.' }
            jq("#dPopupMsgTitle, #dPopupMsgText, #dPopupButtonGroup").hide();
            jq(".dimCloak").show();
            jq("#btnPopupOK, #btnPopupAccept, #btnPopupCancel").hide();
            if (f.msgTitle != "") {
                jq("#dPopupMsgTitle").html(f.msgTitle).show();
            }
            if (f.msgText != "") {
                jq("#dPopupMsgText").css({textAlign: "left"});
                if (f.msgText.indexOf("<br/>") == -1 && !blnfuncin) {
                    jq("#dPopupMsgText").css({textAlign: "left"});
                }
                jq("#dPopupMsgText").html(f.msgText).show();
            }
            jq("#dPopupButtonGroup").show();
            if (f.msgType == "AC") {
                jq("#btnPopupAccept, #btnPopupCancel").show();
            } else {
                if (f.msgType == "I") {
                    jq("#btnPopupOK").show();
                } else {
                    jq("#btnPopupOK, #btnPopupCancel").show();
                }
            }
            jq("#btnPopupOK, #btnPopupAccept").unbind("click");
            jq("#btnPopupCrossCancel, #btnPopupCancel").unbind("click");
            jq("#btnPopupOK, #btnPopupAccept").bind("click", function() {
                jq("#dPopupMsgCallout").fadeOut();
                fnSelSh(i, d, g, b, h);
            });
            jq("#btnPopupCrossCancel, #btnPopupCancel").bind("click", function() {
              location.reload();
                fnGATracker({location: "Cl1catqty",action: "Close"});
                fnCover(false);jq(".dimCloak").hide()
                jq("#dPopupMsgCallout").fadeOut();

            });
            fnCover(true);
            fnDoFloat("#dPopupMsgCallout").fadeIn();
        } catch (i) {
            fnErr({fnName: "fnPopupSelSh",fnParams: i + ", " + d + ", " + g + ", " + b + ", " + h,err: i});
            jq(".dimCloak").hide();

        }
    }
    function fnSelSh(e, strVenueCode, strEventCode, lngSessionId, strShowTime){
      try {
        
        // WIZROCKET DATA PUSH
        fnPush_to_wiz(strVenueCode, strEventCode);

        // _gaq.push(['_setCustomVar', 1, 'Cinema-ID', strVenueCode,2]);
        if (typeof(ga) !== "undefined") {
          ga('send', 'pageview', {
            'dimension3':  strVenueCode
          });
        }
        //RESET DONATION CHECHBOX AND FLAG
        jq("#FLDonation").attr("checked",false);
        isDonation = false;

        //RESET ETICKET
        jq("#rEticketHO").attr("checked",false);
        jq("#rEticketBO").attr("checked",false);

        var objCk = new clsCookie();
        //CHECKING IF ANOTHER TRANSACTION IS ALREADY INITIATED IN ANOTHER TAB
        if((objCk.get({ name: "lngTransId", defVal: "" }) != "" && objCk.get({ name: "lngTransId", defVal: "" }) != "0") || (objCk.get({ name: "BOOKINGID", defVal: "" }) != "")) {
          fnGlobalErr({eCode:"unFinTrans"});
          var proceed = confirm("Your previous transaction has not been completed yet. Do you want to cancel it and proceed?")
          if(proceed) {
            fnCanTr()
          } else {
            jq(".dimCloak").hide();
            return;
            
          }
        }

        /** VENUE APPLICATION TYPE FOR NEW SEATLAYOUT **/
        for(var i=0; i<aVN.length; i++){
          if(aVN[i][0] == strVenueCode){
            // By Cinema Flow
            // if(aVN[i][11] == undefined){
            if(fnGQS("cid", "") != "") {
              glBT.VenAppType = aVN[i][6];
            }else{
              glBT.VenAppType = aVN[i][11];
            }
          }
        }

        fnBusy(true);
        jq('.dimCloak').show();
        //  SET GLOBAL BT VARIABLES
        glBT.SVC  = strVenueCode;
        glBT.SSID = lngSessionId;
        glBT.SEC  = strEventCode;
        glBT.SST  =   strShowTime;
        //  UPDATE userCine COOKIE TO REFLECT Most Recently Surfed
        var mrs = ""  ;
        var start = 0;

        var arrMrs  = objCk.get({ name: "userCine", key: "mrs", defVal: "" }).split(";");
        if(jq.inArray(glBT.SVC, arrMrs) == -1) {
          var frst  = (arrMrs.length > 3) ? 1 : 0 ;
          for(var i = frst; i < arrMrs.length; i++) {
            if(arrMrs[i] != "") {
              mrs +=  arrMrs[i] + ";";
            }
          }
          mrs +=  glBT.SVC + ";";
          objCk.set({ name: "userCine", key: "mrs", value: mrs, sess: false });
        }
        extract_selected_date = function() {
          var container = jq("bytclick");
          if (!jq(".date-select option:first-child").is(':selected')) {
              var n = jq(".date-select")[0].selectedIndex
            n += 1
            return (jq(".date-select option:nth-child(" + n + ")").text().split(",")[1])
            }
            else {
              var d = jq('.tickets .date.active').text();
              return(d);
            }
        }
        extract_selected_name = function() {
        var container = jq("bytclick");
         if (!container.is(e.target) // if the target of the click isn't the container...
                && container.has(e.target).length === 0) // ... nor a descendant of the container
            {
                var n = jq(".movie-select")[0].selectedIndex
            n += 1
            return (jq(".movie-select option:nth-child(" + n + ")").text().trim())
            }
            else {
              var n = jq(".movie-select")[0].selectedIndex
            n += 1
            return (jq(".movie-select option:nth-child(" + n + ")").text().trim())

            }
        }

        extract_selected_venue = function() {
          var container = jq("bytclick");
           if (!container.is(e.target) // if the target of the click isn't the container...
                  && container.has(e.target).length === 0) // ... nor a descendant of the container
              {
                  var currentVenue = arrVenues.filter(function(venue){
                return venue[0] == glBT.SVC;
              });
              var v = currentVenue[0][1];
              return(v)
              }
              else {
                var n = jq(".cinema-select")[0].selectedIndex
              n += 1
              return (jq(".cinema-select option:nth-child(" + n + ")").text().trim())
              }
          }
        //  CALLOUT DETAILS
        var strEventName  = extract_selected_name
        var strVenueName  = extract_selected_venue
        glBT.dispDate   = extract_selected_date();
        var strShowDate   = glBT.dispDate;

        if (typeof(aiEV) !== 'undefined') {
          for (var i = 0; i < aiEV.length; i++) {
            if (aiEV[i][1] == strEventCode) {
              strEventName  = aiEV[i][4];
              break;
            }
          }
        }

        for(var i = 0; i < aVN.length; i++) {
          if(aVN[i][0] == strVenueCode) {
            strVenueName  = aVN[i][1];
            break;
          }
        }


        /** FOR NEW SEATLAYOUT **/
        // if(blnVistaCine){
          //  FOR DISPLAY ON SEAT-LAYOUT
          
          jq("#EDtl").children().eq(0).html(strShowDate + ", " + strShowTime);
          jq("#EName, #EName_MC").html(strEventName);
        
          jq("#SLEName_New").html(strEventName);
          jq("#ShowTym_New").html(strShowDate + ", " + strShowTime);
          jq("#VenAdd_New").html(strVenueName);
        // }else{
          //  FOR THE INITIAL CALLOUT
          
          
          jq("#EDtl_MC").children().eq(0).html(strShowDate + ", " + strShowTime);
          jq("#EDtl").children().eq(1).html(strVenueName);
          jq("#EDtl_MC").children().eq(1).html(strVenueName);

          //  FOR DISPLAY ON SEAT-LAYOUT
          jq("#SLEName").html(strEventName);
          jq("#SLEDtl").children().eq(0).html(strShowDate + ", " + strShowTime);
          jq("#SLEDtl").children().eq(1).html(strVenueName);
        // }

        if(typeof(fnPush_to_Kis_Wiz) !== "undefined")
          fnPush_to_Kis_Wiz('Selected showtime', 'Buytickets page on clicking showtime');
      	var aurl = "https://data-in.bookmyshow.com/index.bms"+"?cmd=DEGETSHOWINFO&f=jsa&vc=" + glBT.SVC + "&sc=" + glBT.SSID + "&t=" + "1F201EC3D23C41E8B2E3";
        jq.getScript(aurl,function(data){
          fnCallout(data);
        })

      } catch(e){
      }
    }



    var CntObj = {};
    function movieList(){
      try{

        
        var MLdata ="";
        
        if(arrEvents.length > 0){

          for(var i=0; i<arrEvents.length; i++){
            
          }
        }
      }catch(e){
        fnErr({ fnName: "movieList", err: e });
      }
    }
  </script>
  <style type="text/css">
    .slick-dots { display: none !important;}
    .slider_con .container { width: 100% !important; max-width: 1440px !important;}
    .slick-slide { height: auto !important; }
    .slick-slide .name { display: none;}
    .nav-arrow {
        display: block;
        position: absolute;
        color: #000;
        top: 44%;
        height: 47px;
        z-index: +3;
        width: 47px;
    }
    .right.nav-arrow {
        right: 0;
        background-color: #020202;
    }
    .left.nav-arrow {
        left: 0;
        background-color: #020202;
    }
    .main-container .quick_booking
    {
      margin: 0 auto;
    }
    @media (max-width: 768px) { 
      .bkcl {
        height: 85%;
        overflow-y: scroll;
      }
    }
    @media (max-width: 1240px){
  .main-container .top_con header .logo_con {
      margin: 10px auto !important;
  }
  .main-container .top_con header .logo_con img {
      width: 100%;
  }
  .main-container .top_con header .nov_con ul>li {
    padding: 0 15px;
  }
}
  </style>
  <body>
  	<div class="main-container">
  	 <link href='https://fonts.googleapis.com/css?family=Roboto:400,500,700' rel='stylesheet' type='text/css'>
<div class="top_con">
  <header>
    <div class="logo_con">
      <a href="/"><img src="https://in.bmscdn.com/bmsin/cinemas/lacinemas/logo.png" alt="LA cienma"></a>
    </div>
    <div class="nov_con">
      <ul>
        <li class='home active' ><a href="/">HOME</a></li>
        <li class='bkt ' ><a href="/movies/">MOVIES</a></li>
        <div class="clear"></div>
      </ul>
    </div>
    <div class="close"></div>
    <div class="clear"></div>
    <div class="mobile_nav">
      Menu
    </div>
  </header>
</div>    

<div id="tblClass" class="bkcl callor" style="display:none;">
	<div class="bkclbod callwhite">
		<a href="javascript:;" onclick="fnCnCl();"><div class="cross fright"></div></a>
		<div class="padbuy">
			<div class="hdname">
				<div id="EName" class="etname" style="width:auto;"></div>
				<div id="EDtl" class="ciname">
					<span></span>
					<span class="cinema"></span>
				</div>
				<span id="CenMsg" class="adultmov">Adult Movie</span>
			</div>
			<div class="buyselbox">
				<select id="tikCat" class="wt230" onchange="fnSetQtyCmb();"><option>Ticket Type</option></select>
				<select id="cmbQty" class="wt80" onchange="fnPreInitBook();"><option>Qty</option></select>
								<!--div class="ntrgt" id="dPrsdNote" style="display: none; width:490px;"><strong>Note: </strong>An amount of ₹ 20/- per head shall be charged towards the hiring of 3D glasses for 3D movies and the same has to be paid at box office while you collect your tickets<br/></div-->
				<div class="ntrgt" id="dFunNote" style="display: none; width:490px;"><strong>Note: </strong>For 3D Glasses a USAGE CHARGE (non-refundable) between Rs.20 to Rs.30 &amp; DEPOSIT (refundable) between Rs.50 to 100 will have to be paid per ticket at the Cinema. The exact amount will be intimated at the cinema.<br/></div>
				<div class="ntrgt" id="d3DNote" style="display: none; width:490px;"><strong>Note: </strong>For 3D Glasses a refundable/non-refundable amount may have to be paid per ticket at the cinema. The exact amount will be intimated at the cinema.<br/></div>
				<div class="ntrgt" id="dChildNote" style="display: none; width:490px;">Children aged 3 years and above will require a separate ticket.</div>
				<div class="ntrgt" id="dChildNote2Yrs" style="display: none; width:490px;">Children aged 2 years and above will require a separate ticket.</div>
				<div class="ntrgt" id="dINZSNote" style="display: none; width:490px;">Children aged above 5 years will require a separate ticket.</div>
				
				<!--<div class="ntrgt" id="dCmaxNote" style="width:490px; display: none;"><strong>Note: </strong> The 3D glasses will be available at the Auditorium entrance..<br/>
				  No one is allowed to carry 3D glasses outside the Cinema..<br/>
				  Please leave 3D glass with nearest usher as and when they would like to exit the premises..<br/>
				  Please don’t leave the glasses on the seats when going out from the Auditorium..<br/>
				  3D Glasses are useful only for viewing 3D movies on CINEMAX theatre Screens..<br/>
				  In no event shall CINEMAX be liable for any damages arising out of the mishandling of the glass..<br/>
				  Handle 3D glasses with care; any damage will cost you ₹ 2000/-.
				</div>-->
				
			</div>
			<div class="fl_100" id="spTckNotediv" style="border-top: 1px solid #808080; padding-top: 5px;font-weight:bold; display: none;">
				<div style="background-color: #9D9D9B;border-radius: 50%;color: #FFF!important;float: left;font: bold 10px/8px Arial;height: 10px;margin: 0px 5px 0px 0px;padding: 4px 5px 3px;text-align: center;width: 7px;cursor: pointer;"><i>i</i></div>
				<div class="" id="spTckNote"></div>	
			</div>
			<div class="fl_100" id="dRearCircleNotes" style="border-top: 1px solid #808080; padding-top: 5px; display: none;">
				<strong>Important Notes: </strong>
				<ol style="margin: 5px 0 0 20px; list-style-type: decimal;">
					<li id="printComp">Print out compulsory while exchanging your tickets.</li>
					<li>Booked tickets will not have allocated seats.</li>
					<li>Seats are alloted on the basis of first come first serve.</li>
					<li>Collect the tickets 30 mins prior to the show.</li>
				</ol>
			</div>
			<div class="fl_100" id="dVarshaFamilyNotes" style="border-top: 1px solid #808080; padding-top: 5px; display: none;">
				<strong>Important Notice:- </strong>
				<ol style="margin: 5px 0 0 20px; list-style-type: decimal;">
					<li>Entry only for people accompanied by their family members.</li>
					<li>Purchasing a minimum of 2 tickets are compulsory for online transactions.</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--FIRST-->
<style type="text/css">
	.pkg:hover{
		cursor: pointer;
		border:2px solid #D81B22;
	}
	.pkg{
		border:2px solid #BBB;
		float: left;
		margin-right: 3%;
	}
</style>
<!-- NEW BOOKING FLOW -->
<div id="tblClassNew" style="position: fixed; z-index: 2147483647; top: 100px; left: 507.5px; display:none;" class="bkcl callor">
	<div class="bkclbod callwhite">
		<a onclick="fnClCallout();" href="javascript:;"><div class="cross fright"></div></a>
		<div class="padbuy">
			<div class="hdname">
				<div style="width:auto; padding-right:20px;" class="etname" id="SLEName_New"></div>
				<span id="SLNew_CenMsg" class="adultmov" style="width:auto; padding-top:12px;">Adult Movie</span>
				<div class="etname" style="width:940px;">
					<span id="ShowTym_New" style="font-size:12px;">Tomorrow, 4 Jun, 11:15 PM </span><span style="padding:0 5px;">|</span><span style="font-size:12px;" id="VenAdd_New">CineMAX: Total Mall, Soul Space Arena, Outer Ring</span>&nbsp;&nbsp; <a style="font-size: 12px; font-weight:normal;" onclick="fnClCallout();" href="/">( <span style="text-decoration:underline;">Choose another Show</span> )</a>
				</div>
			</div>
			<div class="callact" style="padding-top:0px;">
				<div class="celaqt" style="width:auto;">
					<span style="float:left; padding:5px 13px;">Quantity :</span>
					<select id="SLcmbQty" class="qtselect" onchange="fnSQty();">
						<option value=""> Qty </option>
						<option value="1"> 1 </option>
						<option value="2"> 2 </option>
						<option value="3"> 3 </option>
						<option value="4"> 4 </option>
						<option value="5"> 5 </option>
						<option value="6"> 6 </option>
						<option value="7"> 7 </option>
						<option value="8"> 8 </option>
						<option value="9"> 9 </option>
						<option value="10"> 10 </option>
					</select>
					<span class="qtyBox">
						<span class="qytVal">Qty</span>
						<span class="insarr">
							<span class="seldrpdown"></span>
						</span>
						<span id="QtyDisable" style="display: none; position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; z-index: 2; background-color: rgba(0, 0, 0, 0.498039); background-position: initial initial; background-repeat: initial initial;"></span>
					</span>
				</div>
				<!-- SELECT SEAT QUANTITY TOOLTIP -->
				<div id="QtyToolTip" style="margin-left:125px; position:absolute; left:30px;"><div class="arrow"></div><div style="float:left; padding:4px 6px; width:150px;">Select Seat Quantity</div></div>
				<!-- SELECT SEATS FROM BELLOW SEATLAYOUT TOOLTIP -->
				<div id="SLHere" style="text-align: center;">
					<div style=" padding:0 13px;">Select Your Seats</div>
					<div class="big-arrow-down"></div>
				</div>
				<div id="MulCatErr" style="width:334px; left:200px; top:93px; position:absolute; display:none; overflow:hidden;">
					<div id="Err_in" style="width:700px; height:49px; float:left;">
						<div style="float:left; width:320px; padding:6px; background:#FAEBD7; border: 1px solid #FAD350;">
							<div>
								<span style="color:red; font-weight:bold; font-size:11px">Cannot select from multiple catagory.</span><br/>
								<a href="javascript:;" onclick="fnClearSel();" style="text-decoration:underline;">Clear</a> previous selection to select from another catagory.
							</div>
						</div>
						<div style="float:left; padding-left:10px; width:300px; height:47px; background:#FFAEB9; border:1px solid #F08080;"></div>
					</div>
				</div>
				<div id="SLError" class="error mypagerr" style="display:none;">This is a test Error!!</div>
				<div style="float:right">
					<div style="float:left; font-size:14px; font-weight:bold; padding:5px; margin-right: 20px;">Total: <span id="STotal" style="font-size: 14px; font-weight: normal;">Rs 0</span></div>
					<div style="float:left;"><a class="button yellow mproceed" onclick="fnPkgCl();fnCover(true);" href="javascript:;">Proceed to checkout</a></div>
				</div>
			</div>
			<div style="border-top:0px; padding-top:0px; left:0px;" class="seatlayout">
				<!-- SCROLL TO SEE MORE SEATS -->
				<!-- <div id="ShwMorSeats">
					<p>Scroll <br/><span style="padding:0 8px;">for</span><br/> more</p>
					<div class="small-arrow-down"></div>
				</div> -->
				<div style="overflow:auto;" class="actseata" style="overflow-x:scroll;width: 90%;">
					<div id="layout" style="width:100%; margin: 0 auto;">								
					</div>
					<div id="sdCover" class="dcollbg" style="height:100%; left:0; top:0; width:100%;"></div>
				</div>
			</div>
			<div class="callact">
				<div class="celaqt" style="width:673px;">
					<div class="screenarro "><span class="ic-ardn" style="font-size:16px; color:#fff;"></span></div>
					<div class="scrtw" style="width:100px">SCREEN THIS WAY </div>
                         				</div>
				<div style="float:right; "><a class="button yellow" onclick="fnPkgCl();fnCover(true);" href="javascript:;">Proceed to checkout</a></div>
			</div>	
		</div>
	</div>
</div>
<!-- NEW BOOKING FLOW -->


<!-- DIV for multiple category booking - BEGIN -->
<style type="text/css">
	.dc		{ padding: 10px 5px !important; margin-right: 15px; width: 230px; } /* category */
	.dq		{ float: left; } /* quantity */
	.dp		{ float: left; } /* price */
	.dt		{ float: left; width: 150px; padding: 10px 0px; } /* total */
	.dtot	{ width: 200px; padding: 5px 0px 0px 10px; font-size: 20pt; font-weight: bold; } /* grand total */
	.ticktGrnbtn .fl_100{ padding-top:10px;text-align:center;}
	.ticktGrnbtn ul{ float:left; margin-left:15px; padding-left:10px; list-style:decimal;}
</style>
<div id="tblClassMultiCat" class="bkcl callor" style="display:none;">
	<div class="bkclbod callwhite">
		<a href="javascript:;" onclick="fnCnCl();"><div class="cross fright"></div></a>
		<div class="padbuy">
			<div class="hdname">
				<div id="EName_MC" class="etname" style="width:auto;"></div>
				<div id="EDtl_MC" class="ciname">
					<span></span>
					<span class="cinema"></span>
				</div>
				<span id="CenMsg_MC" class="adultmov">Adult Movie</span>
			</div>
			<div class="fl_100">				
				<div style="float: left; width: 488px;">					
					<div id="category_MC"></div>	
					<div style="float: left; width: 200px;">
						<a id="btnProceed_MC" href="javascript:;" onclick="fnInitMultiCatBook();" class="button yellow">Proceed</a>
					</div>
					<div id="divTotal_MC" class="fleft dtot">Rs. 0.00</div>
					<div class="fl_100">						
						<div class="clear">&nbsp;</div>
						<div id="errMC" class="error mypagerr" style="display: none;"></div>
						<div class="clear">&nbsp;</div>
					</div>
				</div>					
				<div style="float: left; width: 350px;">
											<b style="font-size:13px;">Disclaimer:</b>
						<p>Purchase of a Couple ticket is mandatory for buying the tickets for Singles, Teenagers and Kids in a single transaction.</p>
									</div>			
			</div>
		</div>
	</div>
</div>
<!-- DIV for multiple category booking - END -->
<!--SECOND-->
<div id="tblSeatLayout" class="bkcl callor" style="display:none;">
	<div class="bkclbod callwhite">
		<a href="javascript:;" onclick="fnCanTr();"><div class="cross fright"></div></a>
		<div class="padbuy">
			<div class="hdname">
				<div id="SLEName" class="etname">Spiderman 3D (U/A)</div>
				<div id="SLEDtl" class="ciname">
					<span>23rd July, 2012, 07:00 PM	</span>
					<span class="cinema"></span>
				</div>
			</div>
			<!--div class="buyselbox">
			<select class="wt230"><option>Ticket Type</option></select>
			<select class="wt80"><option>Qty</option></select>
			<div class="ntrgt"><strong>Note :</strong> The colors shown on the category drop down represent each category in the seat layout below.</div>	
			</div-->
			<div class="seatlayout" style="border-top:0px; padding-top:0px;">
				<div class="actseat" style="overflow:auto;">
					<div id="tblSeatInfo"></div>
					<!--<div class="fleft" style="margin:0 auto;"><img src="https://in.bmscdn.com/bmsin/buytickets/stw.jpg" height="61" width="540px"/></div>-->
				</div>
				<div class="seatleg">
					<div class="leghead">Key to Seat Layout :</div>
					<div class="legendseat">
						<div class="chair"><img src="https://in.bmscdn.com/bmsin/SLIMG/1_1.png" alt=""></div>
						<div class="seatxt">Available</div>
					</div>
					<div class="legendseat">
						<div class="chair"><img src="https://in.bmscdn.com/bmsin/SLIMG/1_2.png" alt=""></div>
						<div class="seatxt">Unavailable</div>
					</div>
					<div class="legendseat">
						<div class="chair"><img src="https://in.bmscdn.com/bmsin/SLIMG/1_4.png" alt=""></div>
						<div class="seatxt">Your Selection</div>
					</div>
					<div class="friendseat">
						<div class="frstab" id="fbPicsHead" style="display: none;">
							<div class="chair"><img src="//in.bmscdn.com/bmsin/seats/fb_chair.gif" alt=""></div>
							<div class="seatxt">Friends</div>
						</div>
						<div class="frcont" id="fbPics" style="display: none; width: 160px;">
							<span>Know where your friends are seated?</span>
							<div class="fbfriends">
								<a class="back fbbackmar"></a>
								<img src="https://in.bmscdn.com/in/synopsis-new/attending.png" width="50" height="50" alt="">
								<img src="https://in.bmscdn.com/in/synopsis-new/attending.png" width="50" height="50" alt="">
								<img src="https://in.bmscdn.com/in/synopsis-new/attending.png" width="50" height="50" alt="">
								<a class="forward fbformar"></a>
							</div>
						</div>
					</div>
					<a href="javascript:;" onclick="fnsubSetSeats();" class="button yellow btnspacest">Proceed</a>
					<div id="seatErr" class="error mypagerr" style="display: none;"></div>
				</div>
			</div>
			<div class="callact">
				<div class="celaqt" style="width:673px;">
					<div class="screenarro "><span class="ic-ardn" style="font-size:16px; color:#fff;"></span></div>
					<div class="scrtw" style="width:100px;">SCREEN THIS WAY </div>                         
                         				</div>
			</div>
		</div>
	</div>
</div>
<!--SECOND-->
<div id="pkgseat" class="bkcl callor" style="position: fixed; z-index: 2147483647; top: 167.5px; left: 201px; display: none;">
    <div class="bkclbod callwhite">
        <a href="javascript:;" onclick="fnCanTr();jq('#pkgseat').hide();">
            <div class="cross fright"></div>
        </a>
        <div class="padbuy">
            <div class="hdname">

            </div>

            <!-- PACKAGE DETAIL STARTS -->
            <div>
                <h6>Please select your preferred option <br><strong>(Price is inclusive of tickets and add-ons)</strong></h6>
                <div id="pkgContainer" style="margin: 0px auto; width: 868px;padding:2%">
                </div>
            </div>
            <!-- PACKAGE DETAIL ENDS -->
        </div>
    </div>
</div>    
<!--THIRD-->
<div id="oddsm" class="bkcl callor" style="display:none;">
	<div class="bkclbod callwhite">
		<a href="javascript:;" onclick="fnCanTr();">
		  <div class="cross fright"></div>
		</a>
		<div class="padbuy">
			<div class="hdname">
				<div id="OSEName" class="etname">Spiderman 3D (U/A)</div>
				<div id="OSEDtl" class="ciname">
					<span>23rd July, 2012, 07:00 PM	</span>
					<span class="cinema"></span>
				</div>
			</div>
			
			<!-- LHS OF ORDER SUMMERY STARTS -->
			<div class="odsumlft">
				
                    				<!-- OFFERS SECTION STARTS -->
				<div id="ErnPt" class="callrgtbl" style="border-bottom:0px; margin-bottom:0;">
					<!--<img src="https://in.bmscdn.com/in/buytickets/visablockbuster.jpg" width="568" alt="" />-->
					<div style="background: url(https://in.bmscdn.com/bmsin/callouts/Donation.jpg) no-repeat; width:580px;height: 139px;border: 1px #ccc solid;">
						<div style="width: 245px; float:right;padding-top: 5px;">
							<div class="fl_100" style="padding-bottom:3px;">
								<p style="color:#c82528; padding-top:5px; float:left; font-size:14px; font-weight:bold;">A Day At The Movie..</p><br>
								<p style="padding-top:5px; line-height:16px; float: left;">might be your favourite timepass but for some it is a far-fetched dream. We along with an NGO strive to make their dream a reality. <a target="_blank" href="/donation/">Read More</a></p>
							</div>
							<div class="fl_100" style="border-top:1px solid #ccc; padding-top:3px;">
								<p style="width: 50px; float: left;"><span style="font-size: 12px;">Re. 1</span><input id="FLDonation" type="checkbox" value="Rs" name="rsCheck" style="margin-top:5px;"></p>
								<p>will be added to your transaction as a donation</p>
							</div>
						</div>
					</div>
          			<div id="divAdlabs" style="float:left;width:560px;"></div>
				  <!--div class="offerscal">
					
					<div class="offersmain">
					  <p>Visa Blockbuster Weekend offer 1</p>
					  <div class="tico">
						<div style="margin-right:10px;" class="fleft">
						  <img width="70" src="https://in.bmscdn.com/bmsin/offers/VISA.png" alt=""/>
						</div>
						<div class="fleft wt80">Buy 1 Get 1 free</div>
					  </div>
					</div>
					<div class="tickstb">&nbsp;</div>
					<div class="offersmain">
					  <p>ICICI Bank Experience Ent offer</p>
					  <div class="tico">
						<div style="margin-right:10px;" class="fleft">
						  <img width="70" src="https://in.bmscdn.com/bmsin/offers/ICICIbank.png" alt=""/>
						</div>
						<div class="fleft wt80">Rs 100 off</div>
					  </div>
					</div>
					<div class="tickstb">&nbsp;</div>
					<div class="offersmain">
					  <p>Citibank Second is Free Debit Offer</p>
					  <div class="tico">
						<div style="margin-right:10px;" class="fleft">
						  <img width="70" src="https://in.bmscdn.com/bmsin/offers/Citibank.png" alt=""/>
						</div>
						<div class="fleft wt80">Buy 1 Get 1 Free</div>
					  </div>
					</div>
				  </div-->
				</div>
                    				<!-- OFFERS SECTION ENDS -->
				<div id="DT_Chandigarh" style="display:none;">
					<img src="https://in.bmscdn.com/bmsin/callouts/dtcimenachandigarh04.jpg" alt="DT Cinema Chandigarh"/><br/>
					<a href="http://in.bookmyshow.com/static/offertc-dtcinemas-chandigarh" target="_blank">Click here</a> to read offer terms and conditions.<br/><br/>
				</div>
                                        

				<!-- ETICKET STARTS -->
				<div id="OSETickets" class="callrgtbl" style="display:none;">
					<h6>Ticket Type :</h6>
					<div class="fl_100">
						
					<!-- <div id="e_mticketWrapper"> -->
						
						<div class="ticket" id="show_eticket">
							<div class="icotickssel">
								<span class="eticket"></span>
							</div>
							<div class="icotext">
								<div class="selection">
									<input id="rEticketHO" name="ETicket" type="radio"> E-Ticket
								</div>
								<div class="fl_100">
					                <strong>Print the e-ticket and bring it<br>  with you.</strong>
					                <br>
					                <span style="color:#d81b22">
					                	<strong>Carrying e-Ticket printout is compulsory for entry.</strong>
					                </span>
					                <br>
				                  	(No Need to wait in line at the <br> box office)               
				              	</div>
							</div>
						</div>

						<div class="ticket" id="show_mticket" style="display:none;">
							<div class="icotickssel">
								<span class="mticket"></span>
							</div>
							<div class="icotext">
								<div class="selection">
									<input id="rMticketHO" name="ETicket" type="radio"> M-Ticket
								</div>
								<div class="fl_100">
					                <strong>
					                  Download the m-Ticket on your mobile, no printout needed. <br> Show the QR code at the cinema entrance.</strong>
					                <br>
				                  	(No Need to wait in line at the <br> box office)               
				              	</div>
							</div>
						</div>

					<!-- </div> -->


						<div class="ticket">
							<div class="icoticks">
								<span class="boxoffice"></span>
							</div>
							<div class="icotext">
								<div class="selection">
									<input id="rEticketBO" name="ETicket" type="radio"> Box Office Pickup
								</div>
								<div class="fl_100">
									Select this option to pick your<br> tickets from Box Office
								</div>
							</div>
						</div>
						<!-- ERROR DIV FOR ETICKETS -->
						<div id="ETickErr" class="error mypagerr" style="display: none;"></div>
					</div>
				</div>
				<!-- ETICKET ENDS -->
			
				<!-- FOOD COMBO STARTS -->
				<div id="OSFodCmb" class="callrgtbl" style="display:none;">
					<h6>ADD-ONS</h6>
					<div id="OSFCInBox" class="foodcombo">
						<!-- <a id="FCPrev" href="javascript:;" class="ic-arlt fdbackmar" onclick="fnFrdDC('PREV');"></a> -->
						<div id="outerBox" style="padding:0; margin:0; overflow:hidden; width:auto; float:left;">
							<div></div>
						</div>
						<!-- <a id="FCNxt" href="javascript:;" class="ic-arrt fdformar" style="float:left;" onclick="fnFrdDC('NEXT');"></a> -->
					</div>
					<div id="ColMod" class="fl_100 bold" style="display:none;">
						Please collect your add-ons from the counter. 
						<select id="selDelMode" class="fcselect" style="display:none;">
							<option value="NA">-- Collect at Counter --</option>
							<option value="Before Start of Movie">Counter : Before Start of Movie</option>
							<option value="During Interval">Counter: During Interval</option>
						</select>
					</div>
					<!-- FOR DT CINEMAS -->
					<div id="DelModeDT"></div>
					<!-- ERROR DIV FOR FOOD COMBO -->
					<div id="FCErr" class="error mypagerr" style="display: none;"></div>
				</div>
				<!-- FOOD COMBO ENDS -->
			
								
				<!-- NOTES STARTS -->
				<div class="callrgtbl">
					<span class="bold fl_100">Note</span>
					<div class="fl_100">
						<div class="dqnote" id="dGopalanChildNode" style="display: none; background:#FFFFFF; width:100%; text-align:justify;">
							Tickets mandatory for guests above 3 years of age.
						</div>
						<div id="dDynNotes" class="fleft" style="background:#FFFFFF; width:100%; display:none; text-align:justify;">
							<div id="CPGR-3D" style="display: none;">3D Movies : Customer need to pay additional charges at the box office for 3D glasses.</div>
							<div id="FNSD-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs. 30 and DEPOSIT (refundable) of Rs. 20 will have to be paid per ticket at the Cinema.</div>
							<div id="FNAM-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs. 30 and DEPOSIT (refundable) of Rs. 20 will have to be paid per ticket at the Cinema.</div>
							<div id="FNAS-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs. 20 and DEPOSIT (refundable) of Rs. 100 will have to be paid per ticket at the Cinema.</div>
							<div id="FNBH-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs. 20 and DEPOSIT (refundable) of Rs. 30 will have to be paid per ticket at the Cinema.</div>
							<div id="FNBP-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs.30 and DEPOSIT (refundable) of Rs. 100 will have to be paid per ticket at the Cinema.</div>
							<div id="FNCH-3D" style="display: none;">For 3D Glasses an Usage DEPOSIT (refundable) of Rs. 20 will have to be paid per ticket at the Cinema.</div>
							<div id="FNGW-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs. 20 and DEPOSIT (refundable) of Rs. 30 will have to be paid per ticket at the Cinema.</div>
							<div id="FNKT-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs. 20 and DEPOSIT (refundable) of Rs. 30 will have to be paid per ticket at the Cinema.</div>
							<div id="FNLK-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs. 20 and DEPOSIT (refundable) of Rs. 30 will have to be paid per ticket at the Cinema.</div>
							<div id="FNPN-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs. 20 and DEPOSIT (refundable) of Rs. 30 will have to be paid per ticket at the Cinema.</div>
							<div id="FNAN-3D" style="display: none;">For 3D Glasses an USAGE CHARGE DEPOSIT (refundable) of Rs. 50 will have to be paid per ticket at the Cinema.</div>
							<div id="FNCM-3D" style="display: none;">For 3D Glasses an USAGE CHARGE DEPOSIT (refundable) of Rs. 100 will have to be paid per ticket at the Cinema.</div>
							<div id="FNCO-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs.30 and DEPOSIT (refundable) of Rs.50 will have to be paid per ticket at the Cinema.</div>
							<div id="FNBG-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs.30 and DEPOSIT (refundable) of Rs. 50 will have to be paid per ticket at the Cinema.</div>
							<div id="FNJJ-3D" style="display: none;">For 3D Glasses an USAGE CHARGE (non-refundable) of Rs.30 and DEPOSIT (refundable) of Rs. 20 will have to be paid per ticket at the Cinema.</div>
							<div id="PRHY" style="display: none; font-weight:bold; color:red;">Please note that the movies being played on PRASADS LARGE SCREEN are not an IMAX presentation.</div>
							<div id="RJHM" style="display: none; font-weight:bold; color:red;">In case if show has cancelled, refund would be given from Cinema Box office only.</div>
							<div id="PRHY-3D" style="display: none; font-weight:bold; color:red;">Please note that the movies being played on PRASADS LARGE SCREEN are not an IMAX presentation.</div>
							<div id="DTLP" style="display: none;">
								<ol>
									<li><strong>1.</strong> Children above 2 years will require full ticket. They will not be allowed inside without tickets, and NO refund for tickets either.</li>
									<li><strong>2.</strong> Water, Eatables, Cigarette, Paan, Tobacco, Lighter, Matchbox, Drinks, Alcohol, etc. shall <strong><i><u>STRICTLY NOT</u></i></strong> be permitted inside the premises.</li>
									<li><strong>3.</strong> Patrons under influence of alcohol shall <strong><i><u>STRICTLY NOT</u></i></strong> be permitted inside the premises.</li>
								</ol>
							</div>
						</div>
						<div id="dChildNote3Yrs" class="fleft" style="background:#FFFFFF; width:100%; display:none; text-align:justify;">
							Children aged 3 years and above will require a separate ticket.
						</div>
						<div id="dFNote" class="fleft" style="background:#FFFFFF; width:100%; display:none; text-align:justify;">
							<strong>Please Note: For 3D glasses: </strong>
							<br/>
							Bangalore: Rs.30 (non-refundable usage charge) collected online as 'additional charges' & Rs.50 refundable deposit payable at the cinema<br/>
							Bhopal: Rs.20 (non-refundable usage charge) collected online as 'additional charges' & Rs.100 refundable deposit payable at the cinema<br/>
							Other centers: Rs.20 OR 30 (non-refundable usage charge) & Rs.50 OR 100 (refundable deposit) payable at the cinema.<br/>
						</div>
						<div class="dqnote" id="fdNote" style="display:none; background:#FFFFFF; width:100%; text-align:justify;">
							Bring along your confimation printout to collect the food combo.
						</div>
						<div class="dqnote" id="dABICNote" style="display: none; background:#FFFFFF; width:100%; text-align:justify;">
							Ticket Categories with Massage/Recliner feature and/or 3D movies may incur an extra charge. Please check the exact amount on the payment page before proceeding
						</div>
						<div class="dqnote" id="dPrintSMSCompulsoryNote" style="display: none; background:#FFFFFF; width:100%; text-align:justify;">
							Customers have to carry the printout and SMS of the booking confirmation in order to collect the tickets at the Booking Counter without which the cinema will not issue tickets.
						</div>
						<div class="dqnote" id="dPrintOutComp" style="display: none; background:#FFFFFF; width:100%; text-align:justify;">
							Printout is Mandatory in order to collect the tickets at the Booking Counter.
						</div>
						<div class="dqnote" id="dPrsdNote" style="display: none; background:#FFFFFF; width:100%; text-align:justify;">An amount of ₹ 20/- per head shall be charged towards the hiring of 3D glasses for 3D movies and the same has to be paid at box office while you collect your tickets.</div>
						<div id="spNote" class="dqnote" style="background:#FFFFFF; width:100%; text-align:justify;">
																												An Internet handling fee (per ticket) will be levied. Check the same before completing the transaction.
						</div>
						<div id="dFunChandigarhFreePepsi" class="dqnote" style="display: none; background:#FFFFFF; width:100%; text-align:justify;">
							<!--Free 300ml Pepsi with every ticket purchased. To be collected from the Box Office. Offer valid till stocks last. T&amp;C apply.-->
						</div>
						<!--div class="dqnote" id="dPrasadsLargeNotImax" style="display: none; background:#FFFFFF; width:100%; color:red; font-weight:bold; text-align:justify;">
							Please note that the movies being played on PRASADS LARGE SCREEN are not an IMAX presentation.
						</div-->
						<div id="spAjantaTheaterNotes" class="dqnote" style="background:#FFFFFF; width:100%; text-align:justify; display:none;">
							Print out compulsory while exchanging your tickets.<br/>
							Booked tickets will not have allocated seats.<br/>
							Seats are alloted on the basis of first come first serve.<br/>
							Collect the tickets 30 mins prior to the show.<br/>
						</div>
						<div class="fl_100" id="dPrithviNotes" style="border-top: 1px solid #808080; padding-top: 5px; margin-top: 5px; display: none;">
							<strong>Important Notes: </strong>
							<ol style="margin: 5px 0 0 20px; list-style-type: decimal;">
								<li>The No Late Admittance rule will be strictly enforced. Kindly arrive early.</li>
								<li>The Right of Admission is reserved.</li>
								<li>After purchase, no tickets will be refunded or exchanged.</li>
								<li>Children below the age of 6 years will not be allowed to enter.</li>
								<li>In case of a children's show, children below the age of 3 years will not be allowed to enter.</li>
								<li>Vehicles cannot be parked inside Janki Kutir.</li>
								<li>The Pay &amp; Park, located opposite Mahesh Lunch Home, can be used for parking.</li>
							</ol>
						</div>
						<div class="dqnote" id="d3DNoteOS" style="background:#FFFFFF; width:100%; text-align:justify; display: none;">For 3D Glasses a refundable/non-refundable amount may have to be paid per ticket at the cinema. The exact amount will be intimated at the cinema.<br/></div>
					</div>
				</div>
				<!-- NOTES ENDS -->
			</div>
			<!-- LHS OF ODER SUMMERY ENDS -->
		  
			<!-- RHS OF ORDER SUMMARY STARTS-->
			<div class="odsumrgt">
				<div class="odcont">
					<h2 class="odhead">Order Summary</h2>
					<div id="dOrderSummary" class="odsum">
						<div class="rptr">
							<div id="OSTikAmt" class="hdr">
								<span class="wt90 bold">Ticket(s):</span>
								<span class="wt130">Rs. 510.00</span>
							</div>
						</div>
						<div id="dTickets" class="rptr">
							<div id="OSSTInfo" class="hdr">
								<span class="wt90 bold">Seat Info:</span>
								<span class="wt130">Gold : B6, B7, B8</span>
							</div>
						</div>
						<div class="rptr">
							<div id="OSBKFee" class="hdr">
								<span class="wt90 bold">+ Internet handling fees:</span>
								<span class="wt130">Rs. 50.00</span>
							</div>
							<div id="dOtherCharges" class="hdr" style="display: none;">
								
							</div>
						</div>
						<div id="OSFC" class="rptr" style="display:none;">
							<div class="hdr">
								<span class="wt90 bold">+ ADD-ONS :</span>
								<span class="wt75">Rs. 450.00</span>
								<!--a href="#" class="showmore">show more</a-->
							</div>
						</div>
						<div id="FCDtl" class="rptr" style="display:none;">
							<span class="fleft" style="width:190px;">Jumbo Combo - Spice Gold</span>
							<span class="fright bold" style="padding-right:13px;">Qty 3</span>
						</div>
						<div id="dOSNoPrice" class="rptr" style="display:none;">
							<div class="hdr">
								Total &amp; Other Charges (incl. Service Tax)
							</div>
						</div>
						<div id="OSTotal" class="Gtotal" style="background: #FFF9D9;">
							<span>Rs. 1120.00</span>
						</div>
						<div style="color: #000;width: 100%;float: left;padding: 10px;text-align: left;font-size: 14px;">
							Your current state is <span id="StateName" style="color: rgb(108,155,244);cursor: pointer;font-weight: 700;"  onClick="jq('.gst-state-list').show();jq('#txtState').val('').trigger('onkeyup');">MH</span>
						</div>
						<!--<div id="OSDonation" class="donation" style="display: none;">
							<div class="donatecall"></div>
							<div class="donrs">
								<span class="bold">A Day At The Movies</span> might be our favorite timepass but for some it is a far-fetched dream...<br>
								<a href="/donation" target="_blank">read more</a>
							</div>
							<div class="bookasmile">
								<span class="dntext">DONATE</span>
								<span class="retext">
									Re.<span class="rstext">1</span>
								</span>
							</div>
							<div class="fl_100">
								<input id="FLDonation" type="checkbox"/> I agree to Donate Re. 1
							</div>
						</div>-->
					</div>
				</div>
				<a href="javascript:;" onclick="fnPrePay();fnCover(true);" class="button yellow btnspace" style="margin-left: 55px;">Proceed to Payment</a>
			</div>
			<!-- RHS OF ORDER SUMMARY ENDS-->
		</div>
	</div>
</div>

<!-- Generic Popup Message Callout -->
<div id="dPopupMsgCallout" class="bkcl callor" style="width: 740px; display: none;">
	<div class="bkclbod callwhite" style="width: 740px;">
		<a href="javascript:;" id="btnPopupCrossCancel"><div class="cross fright"></div></a>
		<div class="padbuy ticktGrnbtn" style="width: 700px;">
			<h3 id="dPopupMsgTitle"></h3>
			<div id="dPopupMsgText" class="fl_100" style="text-align: left;">
				
			</div>
			<div id="dPopupButtonGroup" class="fl_100">
				<a href="javascript:;" id="btnPopupOK" class="button yellow" style="display: none;">OK</a>
				<a href="javascript:;" id="btnPopupAccept" class="button yellow" style="display: none;">Accept</a>
				<a href="javascript:;" id="btnPopupCancel" class="button blackbtn" style="display: none;">Cancel</a>
			</div>
		</div>
	</div>
</div>


<!-- code for GST start callout for STATELIST -->
<div id="modal" class="gst-state-list" style="display: none;">
	<div class="modalconent">
		<div class="pick-header">
			<a onClick="jq('#modal').hide()">X</a>
			<input id="txtState" type="text" name="state" placeholder="pick a region" onkeyup='fnFilterState()'>
		</div>
		<div class="region-list">
		</div>
		<div id="noStFnd" style="width: 100%;text-align: center; display: none; color: #999; font-style: italic;">No States Found</div>
	</div>
</div>
<!-- code for GTS end  -->      <!-- slider section start -->
      <div class="slider_con">
      	<div class='container banner'>
      	</div>
		<!-- <ul class="bxslider banner1">
        </ul> -->
      </div>
      <!-- slider section end -->
      <!-- quick booking section start -->
      <div class="main-container">
      	<div class="quick_booking-main">
      		<div class="quick_booking" >
	          <h2>Quick booking<br><span></span></h2>
	          <div class="booking_section">
	          	<div class="header_1" style='display:none;'>
                <label><input type="radio" id="rdbVenue" name="rdbSearch" value="Cinema" onclick="ocCriteria('VN');">Cinemas</label>
					     <label><input type="radio" id="rdbEvent" name="rdbSearch" value="Movie" checked="checked" onclick="ocCriteria('ET');">Movies</label>
				      </div>
	            <div class="slect_section fleft">
              <div class="region_select sel_opt fleft">
                  <select class='region-select' id="region">
                    <option value=''>Select Region</option>
                    <!-- <option value="LATG" data-srid="TRIC">Trichy</option>
								    <option value="LASK" data-srid="KARA">Karaikal</option> -->
                  </select>
                </div>
                <div class="cinema_select sel_opt fleft">
                  <select class='cinema-select' id="cine">
                    <option value=''>Select Cinema</option>
                  </select>
                </div>
	              <div class="movie_select sel_opt fleft">
	                <select id="cmbEvent" class='movie-select' >
	                  <option value=''>Select Movie</option>
	                </select>
	              </div>
	              <div class="date_select sel_opt fleft">
	                <select id="cmbDate" class="ddown date-select" >
						<option value=''>Select Date</option>
					</select>
	              </div>
	              <div class="language_select sel_opt fleft">
	                <select id="cmbTime" class="ddown time-select">
	                  <option value=''>Select Time</option>
	                </select>
	              </div>
	              <div class="clear"></div>
	            </div>
	            <!-- <div class="quiclbook_btn fleft">
	              <a href="javascript:void(0)">BOOK NOW</a>
	            </div> -->
	            <div class="clear"></div>
	          </div>
	        </div>
      	</div>
      	<div class="box_750 nscsSection " >
			<a href="javascript:;" class="divNs act">NOW SHOWING</a>
			<a href="javascript:;" class="divCs">COMING SOON</a>
		</div>
      <!-- quick booking section end -->
      <!-- movie cards section start -->
      <div class="movie_cards_section" >
      	<div id="divNs" class="movieDiv act"> 
      		<div class="dNSm" id="dNS"></div>          <div class="clear"></div>
      	</div>

      	<div id="divCs" class="movieDiv" style="display:none;">
      		<div class="dCSm" id="dCS"></div>          <div class="clear"></div>
      	</div>
        <div class="clear"></div>
      </div>
       <div class="clear"></div>
      <!-- movie cards section end -->
      <div class="footer_con">
  <footer>
    <div class="inner-foot">
      <div class="foot_cal about_foot fleft">
        <h2>ABOUT US</h2>
        <p>LA Cinemas is a well known Maris Multicomplex now face lifted.Cinema consists of 4 screens equipped with 4k projection and dolby atmos surrounds system which is first in trichy.Cinema has huge ample two wheeler and 4 wheeler parking. Canteen caters fresh and quality food items.</p>
      </div>
      <div class="foot_cal contact_foot fleft">
        <h2>CONTACT US</h2>
        <p>LA Cinema, Maris Theater Complex,<br> Fort Station Road, Trichy,<br> Tamil Nadu 620002, India.<br>
044- 40435050 / 66545050<br><br>
  Mail
<a href="mailto:helpdesk@bookmyshow.com">helpdesk@bookmyshow.com</a>
</p>
      </div>
      <div class="foot_cal social_foot fleft">
        <h2>DOWNLOAD APP</h2>
        <ul>
          <li><a href="https://play.google.com/store/apps/details?id=com.bt.lac" target="_blank"><img src="https://in.bmscdn.com/webin/static/fnb-app/android.png"></a></li>
          <div class="clear"></div>
        </ul>
      </div>
      <div class="foot_cal social_foot fleft">
        <h2>POWERED BY</h2>
        <p><a href="https://in.bookmyshow.com/" target="_blank"><img src="../images/bms_logo.png"></a></p>
      </div>
      <div class="clear"></div>
    </div>
    <div class="copyright_section">
      <p>Copyrights © LA Cinema.  All Rights Reserved 2017. Design and Developed by BookMyShow.com</p>
    </div>
  </footer>

 </div>    </div>
        <script src="MRCA.js" type="text/javascript"></script>
    <script type="text/javascript">
            jq(document).ready(function(){
        jq(".cross.fright").on('click',function(){
          fnCanTr()
          jq('.dimCloak').hide();
          jq('.banner.slick-slider').css('z-index','+1')
          jq(".mainr.callor").hide()
        })
        jq(".nav-arrow").on('click',function(){
          if(jq(this).hasClass('left')) {
            jq('.banner').slick('slickPrev')
          } else {
            jq('.banner').slick('slickNext')
          }
        })
        checkData = function (c) {
          xmlData2 = c.replace(new RegExp("&", "gi"), "&amp;");
          var e;
          if (window.ActiveXObject) {
              e = new ActiveXObject("Microsoft.XMLDOM");
              e.loadXML(xmlData2);
          } else {
              var d = new DOMParser();
              e = d.parseFromString(xmlData2, "text/xml");
          }
          xmlData2 = e;
          var b = xmlData2.getElementsByTagName("item");
          venuexml(xmlData2);
        }

        function venuexml(b) {
          var i = "";
          var h = "";
          var e = 0;
          var d = b.getElementsByTagName("item");
          for (a = 0; a < d.length; a++) {
            var j = d[a];
            var o = j.getElementsByTagName("name")[0].childNodes[0].nodeValue;
            // var l = j.getElementsByTagName("content")[0].childNodes[0].nodeValue;
            var g = j.getElementsByTagName("image")[0].childNodes[0].nodeValue;
            // var n = j.getElementsByTagName("btntxt")[0].childNodes[0].nodeValue;
            var c = j.getElementsByTagName("url")[0].childNodes[0].nodeValue;
            var m = j.getElementsByTagName("target")[0].childNodes[0].nodeValue;
            jq('.banner').append("<div><img src='" + g +"' /><div class='name'>" + o + "</div></div>")
          }
          jq('.banner').slick({
            dots: true,
            infinite: true,
            speed: 300,
            slidesToShow: 1,
            centerMode: true,
            variableWidth: true,
            autoplay: true,
            prevArrow: "<div class='left nav-arrow'><img src='https://in.bmscdn.com/bmsin/common/arr-left.png' /></div>",
            nextArrow: "<div class='right nav-arrow'><img src='https://in.bmscdn.com/bmsin/common/arr-right.png' /></div>",
            responsive: [
              {
                breakpoint: 1024,
                settings: {
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  infinite: true,
                  dots: true
                }
              },
              {
                breakpoint: 600,
                settings: {
                  slidesToShow: 1,
                  slidesToScroll: 1
                }
              },
              {
                breakpoint: 480,
                settings: {
                  slidesToShow: 1,
                  slidesToScroll: 1
                }
              }
              // You can unslick at a given breakpoint now by adding:
              // settings: "unslick"
              // instead of a settings object
            ]
          });
          jq('.banner').on('afterChange', function(event, slick, currentSlide){
            jq('.banner .slick-slide.blur-effect').removeClass('blur-effect')

            currentSlide += 1
            nextSlide = jq(".banner .slick-slide:nth-child(" + currentSlide + ")").next()
            prevSlide = nextSlide.next().next()
            prevSlide.addClass('blur-effect')
            nextSlide.addClass('blur-effect')
          });
          setTimeout(function(){jq('.banner').slick('reinit')},1000)
        }
         var cmCode = "MRCA";
         var x = '/getXML/?xmlName=' + cmCode.toLowerCase() + '.xml';
         // var x = '/shrishakticinemas/MRCA.xml'
         function initSlider(a) {
            a = a + "?t=" + (new Date).getTime();
            try {
             jq.ajax({
                  url : a,
                  type : "GET",
                  dataType : "text",
                  async : !1,
                  success : function (a) {
                       checkData(a)
                  },
                  error : function (a) {
                       404 === a.status && $.ajax({
                            url : "/flash/clients/MRCA.xml",
                            type : "GET",
                            dataType : "text",
                            async : !1,
                            success : function (a) {
                                 venuexml(a)
                            },
                            error : function () {
                                 return 0
                            }
                       })
                  }
              })
            } catch (b) {
              alert("Error: " + b.message)
            }
         };
         initSlider(x)
      })
      jq(document).ready(function(){
        jq(".divNs,.divCs").on('click',function(){
         setTimeout(function(){ jq("#dNS,#dCS").slick('reinit') }, 300)
        })
        jq("#dNS,#dCS").slick({
         slidesToShow: 5,
         slidesToScroll: 1,
         infinite: false,
         prevArrow: "<div class='left nav-arrow'><img src='https://in.bmscdn.com/bmsin/common/arr-left.png' /></div>",
            nextArrow: "<div class='right nav-arrow'><img src='https://in.bmscdn.com/bmsin/common/arr-right.png' /></div>",
         responsive: [
           {
             breakpoint: 768,
             settings: {
               slidesToShow: 2
             }
           },
           {
             breakpoint: 400,
             settings: {
               slidesToShow: 1
             }
           }
         ]
        })

        jq(document).ready(function(){
          // jq('.slick-track li:first a img').addClass('highlight');
        });

        jq(".movie_link").on('click',function(e){
          e.preventDefault()
        })
        jq(".cross.fright").on('click',function(e){
          jq(".dimCloak").hide()
          fnCanTr()
        })
      })
      last_highlighted = null
      jq(".movie_link img").on('click', function() {
        jq('.slick-track li:first a img').removeClass('highlight');
        jq(this).addClass("highlight")
        if(last_highlighted)
          last_highlighted.removeClass("highlight")
        last_highlighted = jq(this)
      })
      jq(".future-drop").mouseenter(function(){
          jq(".future-drop .dropdown").css("display","block");
        }).mouseleave(function(){
          jq(".future-drop .dropdown").css("display","none");
        });
         //banner.js->initSlider() with added hadnling to default.xml
         var cmCode = "MRCA";
         var x = '/getXML/?xmlName=' + cmCode.toLowerCase() + '.xml';
         function initSlider(a) {
          a = a + "?t=" + (new Date).getTime();
          try {
           jq.ajax({
            url : a,
            type : "GET",
            dataType : "text",
            async : !1,
            success : function (a) {
              // checkData(a)
            },
            error : function (a) {
             404 === a.status && jq.ajax({
                url : "/flash/clients/MRCA.xml",
                type : "GET",
                dataType : "text",
                async : !1,
                success : function (a) {
                     venuexml(a)
                },
                error : function () {
                     return 0
                }
             })
            }
           })
          } catch (b) {
            alert("Error: " + b.message)
          }
         };

      var app = angular.module("srisakthi",[]);
      app.controller("moviesController", function($scope,$http){
    
        $http.get("/ibvcom/getJSData.bms?cmd=GETSHOWDATESBYVENUE&vid=CNSY&srid="+srid+"&cid=MRCA&pid=&ety=&s=" + new Date().getTime()).success(function(response){
          var showTimes = eval(response);
          $scope.dates = []; last_year = last_month = last_day = ""
          showTimes.forEach(function(e,i) {
            var year = e[3].substring(0,4);
            var month = e[3].substring(4,6);
            var day = e[3].substring(6);
            var date = new Date(year,month-1,day);
            var str_day = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"][date.getDay()];
            var date = { 'year' : year, 'day' : day, 'month' : month, 'str' : str_day, 'active' : (i == 0 ? true : false ) }
            if(last_year != year || last_month != month || last_day != day) {
              $scope.dates.push(date);
            }
            last_year = year; last_month = month; last_day = day;
          });
                      $scope.load_movie_data(window.event_id,null)
                  });

        var formatted_date = function (date) {
          var year = date.getFullYear().toString()
          var month = (date.getMonth() + 1 > 9 ? (date.getMonth() + 1).toString() : "0" + (date.getMonth() + 1).toString())
          var day = date.getDate().toString().length == 1 ? "0" + date.getDate().toString() : date.getDate().toString()
          return [year,month,day]
        }
        // Highlights the red date tab
        var activateTab = function(date) {
          $scope.dates.forEach(function(value,index){
            if(value['year'] == date['year'] && value['month'] == date['month'] && value['day'] == date['day'])
            value.active = true
            else
            value.active = false
          })
        }

        $scope.load_movie_data = function(event_id, date) {
          if(event_id) {
            window.event_id = event_id
          }
          if(date) {
            date_number_format = date['year'] + date['month'] + date['day']
            activateTab(date)
          } else {
            date = new Date()
            date = formatted_date(date)
            activateTab({ 'year' : date[0], 'day' : date[2], 'month' : date[1], 'active' : true })
            date_number_format = date.join("")
          }
          $http.get("/ibvcom/getJSData.bms?cmd=GETSHOWTIMESBYEVENT&eid=" + window.event_id +"&did=" + date_number_format + "&srid="+srid+"&pid=&cid=MRCA&ety=&s=" + new Date().getTime()).success(function(response){
            show_time_index = 13;
            venue_index = response.indexOf("arrVenues");
            events_index = response.indexOf("arrEvents");
            show_time_list = eval(response.substring(show_time_index,venue_index));
            venue_list = eval(response.substring(venue_index,events_index));
            events_list = eval(response.substring(events_index));
            _.map(events_list,function(e){
              var lang = _.last(e[1].split("-"))
              e[1] = e[1].replace("-" + lang,"")
              if(e[1].match(/\(U\)/)) {
                e[1] = e[1].replace("(U)","")
                return(e.push(['U',lang,'green']))
              } else if (e[1].match(/\(U\/A\)/)) {
                e[1] = e[1].replace("(U/A)","")
                return(e.push(['U/A',lang,'yellow']))
              } else if (e[1].match(/\(A\)/)) {
                e[1] = e[1].replace("(A)","")
                return(e.push(['A',lang,'red']))
              } else {
                return(e.push(['N/A',lang,'black']))
              }
            });

            _.map(venue_list,function(c){
              var lang = _.last(c[1].split("-"))
              c[1] = c[1].replace("-" + lang,"")
              if(c[1].match(/\(U\)/)) {
                c[1] = c[1].replace("(U)","")
                return(c.push(['U',lang,'green']))
              } else if (c[1].match(/\(U\/A\)/)) {
                c[1] = c[1].replace("(U/A)","")
                return(c.push(['U/A',lang,'yellow']))
              } else if (c[1].match(/\(A\)/)) {
                c[1] = c[1].replace("(A)","")
                return(c.push(['A',lang,'red']))
              } else {
                return(c.push(['N/A',lang,'black']))
              }
            });

            $scope.movies = _.map(events_list, function(el) {
              el.push(_.filter(show_time_list, function(f) {
                return(f[1] == el[0]);
              }))
              return(el)
            });
            

            jq.each($scope.movies,function(i,e){
              $scope.movies[i][8] = _.groupBy($scope.movies[i][8], function(f){
                return(f[10])
              })
            })

            $scope.cinemas = _.map(venue_list,function(cl) {
              cl.push(_.filter(show_time_list, function(cf) {
                return(cf[1] == cl[0]);
              }))
              return(cl)
            });
            

            jq.each($scope.cinemas,function(a,c){
              $scope.cinemas[a][8] = _.groupBy($scope.cinemas[a][8],function(cf){
                return(cf[10])
              })
            })

            
          });
        }


      });
    </script>
    <script type="text/javascript">
      function fnDoFloat(a) {
          try {
              var c = {
                  x: parseInt(jq(a).css("padding-top").replace("px", "")) + parseInt(jq(a).css("margin-top").replace("px", "")) + parseInt(jq(a).css("border-top-width").replace("px", "")),
                  y: parseInt(jq(a).css("padding-left").replace("px", "")) + parseInt(jq(a).css("margin-left").replace("px", "")) + parseInt(jq(a).css("border-left-width").replace("px", ""))
              };
              var b = {
                  top: ((jq('#dPopupMsgCallout').width()) / 2) +  c.y + 10,
                  left: ((jq(window).width() - jq(a).width()) / 2) - c.y
              };
              jq(a).css({
                  position: "fixed",
                  zIndex: "2147483647"
              });
              jq(a).css({
                  top: b.top,
                  left: b.left
              });
              clearTimeout(fnDoFloat.objTimer);
              fnDoFloat.objTimer = setTimeout('fnDoFloat("' + a + '")', 500);
              return jq(a);
          } catch (f) {
              fnErr({
                  fnName: "fnDoFloat",
                  fnParams: arguments,
                  err: f
              });
          }
      }
    </script>
  </body>
</html>
