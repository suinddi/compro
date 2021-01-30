package com.webproject.compro.web.vos;

import com.webproject.compro.utility.Sha512;

public class ChangePasswordVo {
    private static final String PASSWORD_REGEX = "^([0-9a-zA-Z~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:'\",<.>/?]{4,100})$";

    private final String code;
    private final String codeKey;
    private final String newPassword;
    private final String hashedNewPassword;

    private boolean isNormalized = false;

    public ChangePasswordVo(String code, String codeKey, String newPassword) {
        this.code = code;
        this.codeKey = codeKey;
        if(newPassword.matches(ChangePasswordVo.PASSWORD_REGEX)) {
            this.isNormalized = true;
            this.newPassword = newPassword;
            this.hashedNewPassword = Sha512.hash(this.newPassword);
        } else {
            this.newPassword = null;
            this.hashedNewPassword = null;
        }
    }

    public String getCode() {
        return code;
    }

    public String getCodeKey() {
        return codeKey;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public String getHashedNewPassword() {
        return hashedNewPassword;
    }

    public boolean isNormalized() {
        return isNormalized;
    }
}
