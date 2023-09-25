<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
        <script>
            window.onload = function (e) {
                    var mobileNumber = sessionStorage.getItem("primary_phone");
                    document.getElementById("primary_phone").value = mobileNumber;
                    document.getElementById("mobile-label").innerText = "Enter the OTP sent to " + mobileNumber;
                    if(window.location.protocol === "https:") {
                        let formField = document.getElementById("kc-form-login");
                        if (formField) {
                            formField.action = formField.action.replace("http:","https:");
                    }
                }
            }
        </script>
    <#elseif section = "form">
    <div class="col-12 mt-2 text-center">
               <h3 style="color:#000000">Verify with OTP</h3>
            </div>
        <div class="kc-login-card-wrapper text-center">

            <div class="text-center">
                <#if realm.password>
                    <div class="text-center">
                        <form id="kc-form-login" class="form" onsubmit="login.disabled = true; return true;"
                              action="${url.loginAction}" method="post">
                            <div class="input-wrapper form-group text-center mx-auto">
                                <div class="input-field mobile d-none">
                                    <label for="primary_phone" class="mobile-prefix">+91</label>
                                    <input id="primary_phone" class="login-field" placeholder="XXXXXXXXXX"
                                           type="text"
                                           name="primary_phone"
                                           tabindex="1"/>
                                </div>

                                <div class="input-group-lg mt-2 text-center mx-auto">
                                    <b id="mobile-label">Enter the OTP sent to ${"abhilash"}</b>
                                    <input id="otp" class="form-control border border-dark rounded-lg" placeholder="XXXX"
                                           type="password"
                                           name="otp" tabindex="2">
                                </div>
                            </div>
                            <div class="mt-2 text-muted">Didn’t receive OTP? <a class="register-link" onclick="window.history.back()">Resend OTP</a></div>
                            <input type="hidden" id="type-hidden-input" name="form_type" value="verify_otp1"/>
                            <button class="btn btn-primary mt-2 text-center btn-lg" style="background-color: #064F8C;" type="submit" tabindex="3">
                                <span>Verify</span>
                            </button>
                        </form>
                    </div>
                </#if>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>