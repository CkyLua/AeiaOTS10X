
              <h4>News 1</h4>
              <hr>
              <p>XXXXXXXXXXXXXXXXXXX</p>
              <hr class="bighr">
              <h4>News 2</h4>
              <hr>
              <p>XXXXXXXXXXXXXXXXXXX</p>
              <hr class="bighr">
            </div>
            <div class="fluid"></div>
          </div>

          <!-- Right menu -->
          <div class="span3">
            <ul class="nav nav-pills nav-stacked"></ul>
            <ul class="nav nav-pills nav-stacked">
              <table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>First Name</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Amiroslo</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>Znote</td>
                  </tr>
                </tbody>
              </table>
              <li class="active "></li>
            </ul>
            <div class="well">
              <p>
                <b>IDK IDK IDK</b> 
              </p>
              <p>XXXXXXXXXXXXXX
                <br> XXXXXXXXXXXXX
                <br> XXXXXXXXXXXXX
                <br> XXXXXXXXXXXXXXXX</p>
              <p></p>
            </div>
            <div class="well">
              <p>
                <b>Server information:</b> 
              </p>
              <p>XXXXXXXXXXXXXX
                <br> XXXXXXXXXXXXX
                <br> XXXXXXXXXXXXX
                <br> XXXXXXXXXXXXXXXX</p>
              <p></p>
            </div>
          </div>
          <!-- end of middle stuff -->

        </div>
      </div>

      <!-- Footer <div class="well well-small"> -->
      <div class="footer">
        <p></p>
        <div style="text-align: center; ">
          <font color="#666666 " face="Tahoma, Calibri, Verdana, Geneva, sans-serif ">
            <span style="font-size: 11px; line-height: normal; "></span> 
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
      var page = pathArr[2];
      var current;
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