<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo = social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle", (realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>

        <script>

            window.onload = function (e)
              {
                  const urlParams = new URLSearchParams(window.location.search);
                  const mobile = urlParams.get("mobile");
                  if(mobile)
                  {
                      document.getElementById("phone").value = mobile;
                      sessionStorage.setItem("phone", mobile);
                      sessionStorage.setItem("locationtmp", window.location);
                      document.getElementById("submit-btn").click();
                  }
                  var tmp = document.getElementById("phone").value;
                  if (tmp) {
                      document.getElementById("submit-btn").click();
                  }

                  if(window.location.protocol === "https:")
                  {
                      let formField = document.getElementById("kc-form-login");
                      if (formField)
                      {
                          formField.action = formField.action.replace("http:", "https:");
                      }
                  }

              }
        </script>
    <#elseif section = "form">
        <div class="col-12 mt-2 text-center">
            <h3 style="color:#000000">Enter Mobile Number to Login</h3>
        </div>
        <div class="kc-login-card-wrapper text-center">
            <div class="text-center">
                <#if realm.password>
                    <div class="text-center">
                        <form id="kc-form-login" class="form text-center"
                              onsubmit="login.disabled = true;
                              return true;"
                              action="${url.loginAction}"
                              method="post">
                            <div class="input-wrapper form-group text-center mx-auto">
                                <div class="input-group-lg text-center mx-auto">
                                    <input id="phone" class="form-control border border-dark rounded-lg"
                                           placeholder="Mobile Number"
                                           type="text"
                                           pattern="(6|7|8|9)\d{9}$"
                                           name="phone"
                                           tabindex="1"/>
                                </div>

                            </div>
                            <input type="hidden" id="type-hidden-input" name="form_type" value="login"/>
                            <button id="submit-btn"
                                    class="btn btn-primary mt-2 text-center btn-lg"
                                    style="background-color: #064F8C;"
                                    type="submit" tabindex="3">
                                <span>Get Started</span>
                            </button>
                        </form>
                    </div>
                </#if>

            </div>
        </div>

        <!-- <div class="text-center mt-3">
                        <a href="${url.registrationUrl}" class="">Not registered? Register</a>
                    </div>-->
    </#if>


</@layout.registrationLayout>