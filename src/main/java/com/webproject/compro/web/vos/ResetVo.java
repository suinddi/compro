package com.webproject.compro.web.vos;

public class ResetVo {
    private final String email;
    private final String name;
    private final String contact;

    public ResetVo(String email, String name, String contact) {
        this.email = email;
        this.name = name;
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getContact() {
        return contact;
    }
}
