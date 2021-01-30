package com.webproject.compro.web.vos;

import com.webproject.compro.utility.Sha512;

public class ModifyUserVo {
    private final int index;
    private final String email;
    private final String oldPassword;
    private final String newPassword;
    private final String hashedPassword;
    private final String name;
    private final String nickName;
    private final String contact;
    private final String address;
    private final String birth;

    public ModifyUserVo(int index, String email, String oldPassword, String newPassword, String name, String nickName, String contact, String address, String birth) {
        this.index = index;
        this.email = email;
        this.oldPassword = oldPassword;
        this.newPassword = newPassword;
        this.hashedPassword = Sha512.hash(this.newPassword);
        this.name = name;
        this.nickName = nickName;
        this.contact = contact;
        this.address = address;
        this.birth = birth;
    }

    public int getIndex() {
        return index;
    }

    public String getEmail() {
        return email;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public String getHashedPassword() {
        return hashedPassword;
    }

    public String getName() {
        return name;
    }

    public String getNickName() {
        return nickName;
    }

    public String getContact() {
        return contact;
    }

    public String getAddress() {
        return address;
    }

    public String getBirth() {
        return birth;
    }
}
