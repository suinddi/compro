package com.webproject.compro.web.controllers;

import com.webproject.compro.utility.Converter;
import com.webproject.compro.web.enums.*;
import com.webproject.compro.web.services.UserService;
import com.webproject.compro.web.vos.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.awt.*;
import java.io.IOException;
import java.sql.SQLException;

@RestController
@RequestMapping(value ="/user", method = RequestMethod.POST)
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService, DataSource dataSource) {
        this.userService = userService;
    }

    @RequestMapping(value = "login",  produces = MediaType.TEXT_PLAIN_VALUE)
    public void login(HttpServletRequest request, HttpServletResponse response,
                      @RequestParam(name = "email", defaultValue = "") String email,
                      @RequestParam(name = "password", defaultValue = "") String password) throws IOException, SQLException {
        LoginVo loginVo = new LoginVo(email,password);
        if (!loginVo.isNormalized()) {
            response.getWriter().print("NORMALIZATION_FAILURE");
        } else {
            UserLoginResult userLoginResult = this.userService.login(loginVo, request.getSession());
            if (userLoginResult == UserLoginResult.SUCCESS) {
                response.getWriter().print("LOGIN_SUCCESS");
            } else {
                response.getWriter().print("LOGIN_FAILURE");
            }
        }
    }

    @RequestMapping(value = "/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        Converter.setUserVo(request);
    }

    @RequestMapping(value = "/register", produces = MediaType.TEXT_PLAIN_VALUE)
    public void register(HttpServletRequest request, HttpServletResponse response,
                         @RequestParam(name = "email", defaultValue = "") String email,
                         @RequestParam(name = "password", defaultValue = "") String password,
                         @RequestParam(name = "name", defaultValue = "") String name,
                         @RequestParam(name = "nickname", defaultValue = "") String nickname,
                         @RequestParam(name = "contact", defaultValue = "") String contact,
                         @RequestParam(name = "address", defaultValue = "") String address,
                         @RequestParam(name = "birth", defaultValue = "") String birth) throws IOException, SQLException {
        RegisterVo registerVo = new RegisterVo(email,password,name,nickname,contact,address,birth);
        if (!registerVo.isNormalized()) {
            response.getWriter().print("NORMALIZATION_FAILURE");
        } else {
            UserRegisterResult userRegisterResult = this.userService.register(registerVo);
            response.getWriter().print(userRegisterResult.name());
        }
    }

    @RequestMapping(value = "/modify-user", produces = MediaType.TEXT_PLAIN_VALUE)
    public void modify(HttpServletRequest request, HttpServletResponse response,
                       @RequestParam(name = "email", defaultValue = "") String email,
                       @RequestParam(name = "oldPassword", defaultValue = "") String oldPassword,
                       @RequestParam(name = "newPassword", defaultValue = "") String password,
                       @RequestParam(name = "name", defaultValue = "") String name,
                       @RequestParam(name = "nickname", defaultValue = "") String nickname,
                       @RequestParam(name = "contact", defaultValue = "") String contact,
                       @RequestParam(name = "address", defaultValue = "") String address,
                       @RequestParam(name = "birth", defaultValue = "") String birth) throws IOException, SQLException {
        UserVo userVo = Converter.getUserVo(request);
        ModifyUserVo modifyUserVo = new ModifyUserVo(userVo.getIndex(), email, oldPassword, password, name, nickname, contact, address, birth);
        UserModifyResult userModifyResult = this.userService.modifyUser(modifyUserVo);
        response.getWriter().print(userModifyResult.name());

    }

    @RequestMapping(value = "/qna-register", produces = MediaType.TEXT_PLAIN_VALUE)
    public void qnaRegister(HttpServletRequest request, HttpServletResponse response,
                            @RequestParam(name = "qna_index", defaultValue = "") String qnaIndex,
                            @RequestParam(name = "qna_kind" ,defaultValue = "") String qnaKind,
                            @RequestParam(name = "qna_title", defaultValue = "") String qnaTitle,
                            @RequestParam(name = "qna_content", defaultValue = "") String qnaContent,
                            @RequestParam(name = "qna_PurIndex", defaultValue = "") String purchaseIndex) throws IOException, SQLException {

        UserVo userVo = Converter.getUserVo(request);
        if (userVo != null) {
            QnaRegisterVo qnaRegisterVo = new QnaRegisterVo(qnaIndex, qnaKind, qnaTitle, qnaContent, purchaseIndex);
            QnaRegisterResult qnaRegisterResult = this.userService.qnaRegister(userVo, qnaRegisterVo);
            response.getWriter().print(qnaRegisterResult.name());
        } else {
            response.getWriter().print("denied");
        }
    }

    @ResponseBody
    @RequestMapping(value = "/get-qna", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getQna(HttpServletRequest request, HttpServletResponse response,
                       @RequestParam(name = "page", defaultValue = "") String pageString) throws SQLException, IOException {
        UserVo userVo = Converter.getUserVo(request);
        int page = Converter.stringToInt(pageString, -1);

        GetQnaVo getQnaVo = this.userService.getQna(page, userVo);
        JSONArray jsonQnas = new JSONArray();
        for (QnaRegisterVo qnaRegisterVo : getQnaVo.getQnaRegisterVos()) {
            JSONObject jsonQna = new JSONObject();
            jsonQna.put("qnaIndex", qnaRegisterVo.getQnaIndex());
            jsonQna.put("qnaKinds", qnaRegisterVo.getQnaKind());
            jsonQna.put("qnaTitle", qnaRegisterVo.getQnaTitle());
            jsonQna.put("qnaContent", qnaRegisterVo.getQnaContent());
            jsonQnas.put(jsonQna);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("startPage", getQnaVo.getStartPage());
        jsonObject.put("endPage", getQnaVo.getEndPage());
        jsonObject.put("requestPage", getQnaVo.getRequestPage());
        jsonObject.put("qnas", jsonQnas);

        response.setCharacterEncoding("UTF-8");
        return jsonObject.toString(4);
    }
}