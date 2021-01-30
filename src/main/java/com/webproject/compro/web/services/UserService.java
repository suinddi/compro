package com.webproject.compro.web.services;

import com.webproject.compro.utility.Sha512;
import com.webproject.compro.web.containers.UserResetResultContainer;
import com.webproject.compro.web.daos.UserDao;
import com.webproject.compro.web.enums.*;
import com.webproject.compro.web.vos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@Service
public class UserService {
    private final DataSource dataSource;
    private final UserDao userDao;

    @Autowired
    public UserService(DataSource dataSource, UserDao userDao) {
        this.dataSource = dataSource;
        this.userDao = userDao;
    }

    public UserLoginResult login(LoginVo loginVo, HttpSession session) throws SQLException {
        try(Connection connection = this.dataSource.getConnection()) {
            UserVo userVo = this.userDao.selectUser(connection, loginVo);
            if (userVo == null) {
                return UserLoginResult.FAILURE;
            } else {
                session.setAttribute("UserVo", userVo);
                return UserLoginResult.SUCCESS;
            }
        }
    }

    public UserRegisterResult register(RegisterVo registerVo) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            if (this.userDao.isUserEmailDefined(connection, registerVo.getEmail())) {
                return UserRegisterResult.EMAIL_DUPLICATE;
            } else if (this.userDao.isUserNicknameDefined(connection, registerVo.getNickname())) {
                return UserRegisterResult.NICKNAME_DUPLICATE;
            } else {
                boolean success = this.userDao.insertUser(connection, registerVo);
                return success ?
                        UserRegisterResult.SUCCESS :
                        UserRegisterResult.FAILURE;
            }
        }
    }

    public UserResetResultContainer reset(ResetVo resetVo) throws SQLException {

        try (Connection connection = this.dataSource.getConnection()) {
            UserVo userVo = this.userDao.selectUser(connection, resetVo);
            if (userVo == null) {
                return new UserResetResultContainer(UserResetResult.NO_MATCHING_USER);
            } else {
                Random random = new Random();
                String code = String.format("%06d", random.nextInt(999999));
                String codeKey = Sha512.hash(String.format("%s%s%f",
                    code,
                    new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()),
                    Math.random()
                ));
                this.userDao.insertResetCode(connection, codeKey, userVo.getIndex(), code);
                return new UserResetResultContainer(UserResetResult.CODE_SENT, codeKey);
            }
        }
    }

    // 코드번호, 코드키 생성
    public UserResetResult reset(String code, String codeKey) throws SQLException, NumberFormatException {
        UserResetResult userResetResult;
        try (Connection connection = this.dataSource.getConnection()) {
            int count = this.userDao.selectResetCodeCount(connection, code, codeKey);
            if (count == 1 ) {
                userResetResult = UserResetResult.CODE_GOOD;
            } else {
                userResetResult = UserResetResult.CODE_NONE;
            }
        }
        return userResetResult;
    }

    // 비밀번호 변경
    public UserModifyResult changePassword(ChangePasswordVo changePasswordVo) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {

            int userIndex = this.userDao.selectUserIndex(connection, changePasswordVo);
            if (userIndex == -1) {
                return UserModifyResult.FAILURE;
            } else {
                this.userDao.changePassword(connection, changePasswordVo, userIndex);
                return UserModifyResult.SUCCESS;
            }
        }
    }

    public UserModifyResult modifyUser(ModifyUserVo modifyUserVo) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
                boolean success = this.userDao.modifyUser(connection, modifyUserVo);
                return success ? UserModifyResult.SUCCESS : UserModifyResult.FAILURE;
        }
    }

    public QnaRegisterResult qnaRegister(UserVo userVo, QnaRegisterVo qnaRegisterVo) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            boolean success = this.userDao.insertQna(connection, userVo, qnaRegisterVo);
            return success ? QnaRegisterResult.SUCCESS : QnaRegisterResult.FAILURE;
        }
    }

    public GetQnaVo getQna(int pageNumber, UserVo userVo) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            return this.userDao.selectQnas(connection, pageNumber, userVo);
        }
    }
}
