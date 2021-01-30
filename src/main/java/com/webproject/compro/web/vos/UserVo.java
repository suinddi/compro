package com.webproject.compro.web.vos;

public class UserVo {
    private final int index;
    private final String email;
    private final String password;
    private final String name;
    private final String nickName;
    private final String contact;
    private final String address;
    private final String birth;
    private final boolean isAdmin;

//    public UserVo(int index, String email, String password, String name, String nickName, String contact, String address, String birth, int isAdmin) {
//        this.index = index;
//        this.email = email;
//        this.password = password;
//        this.name = name;
//        this.nickName = nickName;
//        this.contact = contact;
//        this.address = address;
//        this.birth = birth;
//        this.isAdmin = isAdmin;
//    }

    public UserVo(int index, String email, String password, String name, String nickName, String contact, String address, String birth, boolean isAdmin) {
        this.index = index;
        this.email = email;
        this.password = password;
        this.name = name;
        this.nickName = nickName;
        this.contact = contact;
        this.address = address;
        this.birth = birth;
        this.isAdmin = isAdmin;
    }

    public int getIndex() {
        return index;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
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

    public boolean isAdmin() {
        return isAdmin;
    }
}
