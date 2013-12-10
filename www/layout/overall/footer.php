            </div>
            <div class="fluid"></div>
          </div>

          <?php include 'layout/menuRight.php'; ?>
          <!-- end of middle stuff -->

        </div>
      </div>

      <!-- Footer <div class="well well-small"> -->
      <div class="footer">
        <p></p>
        <div style="text-align: center; ">
          <font color="#666666 " face="Tahoma, Calibri, Verdana, Geneva, sans-serif ">
            <span style="font-size: 11px; line-height: normal; ">
              &copy; <?php echo $config['site_title'];?>. <!--Edit: <a href="http://otland.net/members/dominique120.184693/" target="_BLANK">dominique120</a>. Design: <a href="http://otland.net/members/amiroslo.54687/" target="_BLANK">Amiroslo</a>. Engine: <a href="credits.php">Znote AAC</a><br> -->
<?php
$time = microtime();
$time = explode(' ', $time);
$time = $time[1] + $time[0];
$finish = $time;
$total_time = round(($finish - $start), 4);
echo 'Server date and clock is: '. date($config['date'],time()) .' Page generated in '. $total_time .' seconds.';
?>
            </span> 
          </font>
        </div>
        <p></p>
        <p></p>
      </div>
    </div>

    <!-- Footer styling etc -->
    <style type="text/css">
    li.dropdown ul.dropdown-menu {
     display: none;
     top: 38px;
    }
    li.dropdown:hover ul.dropdown-menu,
    ul.dropdown-menu:hover {
     display: block;
    }
    </style>
    <!-- Dropdown box javascript logic -->
    <script type="text/javascript">
      // Function by Christopher
      function getFileName() {
       var url = document.location.href;
       url = url.substring(0, (url.indexOf("#") == -1) ? url.length : url.indexOf("#"));
       url = url.substring(0, (url.indexOf("?") == -1) ? url.length : url.indexOf("?"));
       url = url.substring(url.lastIndexOf("/") + 1, url.length);
       return url;
      }
      $('.nav li a[href*="' + getFileName() + '"]').addClass('active');
      $('.nav li a').on('click', function() {
       $('.nav li a.active').removeClass('active');
       $(this).addClass('active');
      });

      // Znote coded
      var myString = location.pathname.substring(1);  
      var pathArr = myString.split("/");
      var page = pathArr[1];
      var current;
      //console.log(myString, pathArr, page);
      $("ul.nav li").each(function() {
        current = $(this).find("a").attr("href");
        if (typeof current != 'undefined') {
          if (page == current) {
            current = $(this);
            current.attr('class', 'active');
          }
        }
      });
    </script>

  </body>
</html>