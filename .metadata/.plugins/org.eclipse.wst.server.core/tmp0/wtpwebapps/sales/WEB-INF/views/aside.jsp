<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
        <div class="app-brand demo">
          <a href="dashboard" class="app-brand-link">
            <span class="app-brand-logo demo">
              <img src="img/logo.png">
            </span>
          </a>
          <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
            <i class="bx bx-chevron-left bx-sm align-middle"></i>
          </a>
        </div>

        <div class="menu-inner-shadow"></div>

        <ul class="menu-inner">
          <!-- Dashboard -->
          
          
           <sec:authentication var="user" property="principal" /> 
                          <sec:authorize access="hasRole('ADMIN') and isAuthenticated()">
          <li class="menu-item  ">
            <a href="userList" class="menu-link ">
              <i class="menu-icon tf-icons bx bx-user"></i>
              <div data-i18n="Analytics"> Users</div>
            </a>
          </li>
</sec:authorize>
          
         
           <sec:authorize access="!hasRole('ADMIN') ">
          <li class="menu-item">
            <a href="dashboard" class="menu-link  ">
              <i class="menu-icon tf-icons bx bx-home-circle"></i>
              <div data-i18n="Analytics">Dashboard</div>
            </a>
          </li>

          <li class="menu-item  ">
            <a href="dashboard" class="menu-link ">
              <i class="menu-icon tf-icons bx bx-copy"></i>
              <div data-i18n="Analytics"> Leads</div>
            </a>
          </li>
           <li class="menu-item  ">
            <a href="clientList" class="menu-link ">
              <i class="menu-icon tf-icons bx bx-copy"></i>
              <div data-i18n="Analytics"> Client</div>
            </a>
          </li>
           <li class="menu-item">
            <a href="reminder-list" class="menu-link">
              <i class="menu-icon tf-icons bx bx-bell"></i>
              <div data-i18n="Analytics">Reminder</div>
            </a>
          </li> 
          </sec:authorize>
        </ul>
      </aside>