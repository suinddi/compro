package com.webproject.compro.web.controllers;

import com.webproject.compro.utility.Converter;
import com.webproject.compro.web.Constants;
import com.webproject.compro.web.containers.UserResetResultContainer;
import com.webproject.compro.web.enums.UserModifyResult;
import com.webproject.compro.web.enums.UserResetResult;
import com.webproject.compro.web.services.ApiService;
import com.webproject.compro.web.services.UserService;
import com.webproject.compro.web.vos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@Controller
public class RootController {
    private final UserService userService;

    @Autowired
    public RootController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/")
    public String index(HttpServletRequest request, HttpServletResponse response) {
        return "main";
    }

    @RequestMapping(value = "/mypage")
    public String mypage(HttpServletRequest request, HttpServletResponse response)  {
        UserVo userVo = Converter.getUserVo(request);
        if (userVo != null) {
            return "my/mypage";
        } else {
            return "main/login";
        }
    }

    @RequestMapping(value = "/myorder")
    public String order(HttpServletRequest request, HttpServletResponse response) {
        UserVo userVo = Converter.getUserVo(request);
        if (userVo != null) {
            return "my/myorder";
        } else {
            return "main/login";
        }
    }

    @RequestMapping(value = "/mybasket")
    public String mybasket(HttpServletRequest request, HttpServletResponse response) {
        UserVo userVo = Converter.getUserVo(request);
        if (userVo != null) {
            return "my/mybasket";
        } else {
            return "main/login";
        }
    }

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request, HttpServletResponse response) {
        return "main/login";
    }

    @RequestMapping(value = "/register")
    public String register(HttpServletRequest request, HttpServletResponse response) {
        return "main/register";
    }

    @RequestMapping(value = "/reset", method = RequestMethod.GET)
    public String resetGet(HttpServletRequest request, HttpServletResponse response,
                           @RequestParam(name="step", defaultValue = "1") String step) {
        switch (step) {
            case "2" :
                return "main/reset-code";
            case "3" :
                return "main/reset-modify";
            default :
                return "main/reset";
        }
    }

    @RequestMapping(value = "/reset", method = RequestMethod.POST)
    public void resetPost(HttpServletRequest request, HttpServletResponse response,
                          @RequestParam(name = "step", defaultValue = "1") String step,
                          @RequestParam(name = "email", defaultValue = "") String email,
                          @RequestParam(name = "name", defaultValue = "") String name,
                          @RequestParam(name = "contact", defaultValue = "") String contact,
                          @RequestParam(name = "code", defaultValue = "") String code,
                          @RequestParam(name = "code_key", defaultValue = "") String codeKey,
                          @RequestParam(name = "new", defaultValue = "") String newPassword) throws SQLException, IOException {
        switch (step) {
            case "1" :
                ResetVo resetVo = new ResetVo(email,name,contact);
                UserResetResultContainer userResetResultContainer = this.userService.reset(resetVo);
                if (userResetResultContainer.getUserResetResult() == UserResetResult.CODE_SENT) {
                    response.sendRedirect("/reset?step=2&code_key="+userResetResultContainer.getCodeKey());
                } else {
                    response.sendRedirect("/reset?result=no_matching_user");
                }
                break;
            case "2" :
                UserResetResult codeCheckResult = this.userService.reset(code, codeKey);
                if (codeCheckResult == UserResetResult.CODE_GOOD) {
                    response.sendRedirect("/reset?step=3&code="+code+"&code_key="+codeKey);
                } else {
                    response.sendRedirect("/reset?step=2&result=code_nono&code_key="+codeKey);
                }
                break;
            case "3" :
                ChangePasswordVo changePasswordVo = new ChangePasswordVo(code, codeKey, newPassword);
                UserModifyResult passwordModifyResult = this.userService.changePassword(changePasswordVo);
                if (passwordModifyResult == UserModifyResult.SUCCESS) {
                    response.getWriter().print("CHANGE_SUCCESS");
                } else {
                    response.getWriter().print("CHANGE_FAILURE");
                }
                break;
        }
    }

    @RequestMapping(value = "/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Converter.setUserVo(request);
        response.sendRedirect("/");
    }

    @RequestMapping(value = "/concept")
    public String concept(HttpServletRequest request, HttpServletResponse response) {
        return "content/concept";
    }

    @RequestMapping(value = "/board")
    public String board(HttpServletRequest request, HttpServletResponse response) {
        return "content/board";
    }

    @RequestMapping(value = "/product")
    public String product(HttpServletRequest request, HttpServletResponse response) {
        return "content/product";
    }

    @RequestMapping(value = "/contact")
    public String contact(HttpServletRequest request, HttpServletResponse response) {
        return "content/contact";
    }

    @RequestMapping(value = "/myinfo")
    public String myinfo(HttpServletRequest request, HttpServletResponse response) {
        return "my/myinfo";
    }

    @RequestMapping(value = "/qna")
    public String qna(HttpServletRequest request, HttpServletResponse response) {
        UserVo userVo = Converter.getUserVo(request);
        if (userVo != null) {
            return "my/qna";
        } else {
            return "main/login";
        }
    }

    @RequestMapping(value = "/faq")
    public String faq(HttpServletRequest request, HttpServletResponse response) {
        return "content/faq";
    }
}