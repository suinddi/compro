package com.webproject.compro.web.vos;

import com.webproject.compro.utility.Sha512;

public class LoginVo {
    private static final String EMAIL_REGEX = "^(?=.{8,100}$)(?!.*[\\-]{2,}.*$)(?!.*[_]{2,}.*$)(?!.*[.]{2,}.*$)([0-9a-zA-Z][0-9a-zA-Z\\-_.]*[0-9a-zA-Z])@([a-z][a-z\\-]*[a-z])\\.([a-z]{2,15})(\\.[a-z]{2})?$";
    private static final String PASSWORD_REGEX = "^([0-9a-zA-Z~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:'\",<.>/?]{4,100})$";

    private final String email;
    private final String password;
    private final String hashedPassword;

    private boolean isNormalized = false;

    public LoginVo(String email, String password) {

        if(email.matches(LoginVo.EMAIL_REGEX) && password.matches(LoginVo.PASSWORD_REGEX)) {
            this.isNormalized = true;
            this.email = email;
            this.password = password;
            this.hashedPassword = Sha512.hash(this.password);
        } else {
            this.email = null;
            this.password = null;
            this.hashedPassword = null;
        }
    }

    public String getEmail() {
        return this.email;
    }

    public String getPassword() {
        return this.password;
    }

    public boolean isNormalized() {
        return isNormalized;
    }

    public String getHashedPassword() {
        return hashedPassword;
    }
}
