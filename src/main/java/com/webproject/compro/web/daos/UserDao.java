package com.webproject.compro.web.daos;

import com.webproject.compro.web.vos.*;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@Repository
public class UserDao {
    private static final int ROWS_PER_PAGE_QNA = 3;

    public UserVo selectUser(Connection connection, LoginVo loginVo) throws SQLException {
        UserVo userVo = null;

        String query = " " +
                "SELECT `user_index` AS `userIndex`, `user_name`  AS `userName`,\n" +
                "\t\t`user_nickname` AS `userNickname`,\n" +
                "\t\t`user_contact`  AS `userContact`,\n" +
                "\t\t`user_address`  AS `userAddress`,\n" +
                "\t\t`user_birth`    AS `userBirth`,\n" +
                "`user_isAdmin` AS `userIsAdmin` " +
                "FROM `compro`.`users` \n" +
                "WHERE `user_email`=? AND `user_password`=?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, loginVo.getEmail());
            preparedStatement.setString(2, loginVo.getHashedPassword());
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    userVo = new UserVo(
                            resultSet.getInt("userIndex"),
                            loginVo.getEmail(),
                            loginVo.getHashedPassword(),
                            resultSet.getNString("userName"),
                            resultSet.getNString("userNickname"),
                            resultSet.getNString("userContact"),
                            resultSet.getNString("userAddress"),
                            resultSet.getNString("userBirth"),
                            resultSet.getBoolean("userIsAdmin"));
                }
            }
        }
        return userVo;
    }

    public UserVo selectUser(Connection connection, ResetVo resetVo) throws SQLException {
        UserVo userVo = null;

        String query = " " +
                "SELECT `user_index` AS `userIndex`, " +
                "`user_email` AS `userEmail`, " +
                "`user_password` AS `userPassword`, " +
                "`user_name`  AS `userName`,\n" +
                "\t\t`user_nickname`  AS `userNickname`,\n" +
                "\t\t`user_contact`   AS `userContact`,\n" +
                "\t\t`user_address`   AS `userAddress`,\n" +
                "\t\t`user_birth`     AS `userBirth`,\n" +
                "`user_isAdmin` AS `userIsAdmin` " +
                "FROM `compro`.`users` \n" +
                "WHERE `user_email`=? AND `user_name`=? AND `user_contact`=? LIMIT 1";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, resetVo.getEmail());
            preparedStatement.setString(2, resetVo.getName());
            preparedStatement.setString(3, resetVo.getContact());
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    userVo = new UserVo(
                            resultSet.getInt("userIndex"),
                            resultSet.getNString("userEmail"),
                            resultSet.getNString("userPassword"),
                            resultSet.getNString("userName"),
                            resultSet.getNString("userNickname"),
                            resultSet.getNString("userContact"),
                            resultSet.getNString("userAddress"),
                            resultSet.getNString("userBirth"),
                            resultSet.getBoolean("userIsAdmin"));
                }
            }
        }
        return userVo;
    }

    public boolean isUserEmailDefined(Connection connection, String email) throws SQLException {
        boolean exist = false;
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT COUNT(`user_index`) AS `count` FROM `compro`.`users` WHERE `user_email`=?")) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                resultSet.next();
                exist = resultSet.getInt("count") > 0;
            }
            return exist;
        }
    }

    public boolean isUserNicknameDefined(Connection connection, String nickname) throws SQLException {
        boolean exist = false;
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT COUNT(`user_index`) AS `count` FROM `compro`.`users` WHERE `user_nickname`=?")) {
            preparedStatement.setString(1, nickname);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                resultSet.next();
                exist = resultSet.getInt("count") > 0;
            }
            return exist;
        }
    }

    public boolean insertUser(Connection connection, RegisterVo registerVo) throws SQLException {

        String query = " " +
                "INSERT INTO `compro`.`users` (" +
                "`user_email`," +
                "`user_password`," +
                "`user_name`, " +
                "`user_nickname`," +
                "`user_contact`, " +
                "`user_address`, " +
                "`user_birth`) " +
                "VALUES(?,?,?,?,?,?,?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, registerVo.getEmail());
            preparedStatement.setString(2, registerVo.getHashedPassword());
            preparedStatement.setString(3, registerVo.getName());
            preparedStatement.setString(4, registerVo.getNickname());
            preparedStatement.setString(5, registerVo.getContact());
            preparedStatement.setString(6, registerVo.getAddress());
            preparedStatement.setString(7, registerVo.getBirth());
            preparedStatement.execute();
        }
        return this.isUserEmailDefined(connection, registerVo.getEmail());
    }

    public void insertResetCode(Connection connection, String codeKey, int userIndex, String code) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement("" +
                "INSERT INTO `compro`.`user_reset_codes`(code_key, user_index, code, code_expires_at) VALUES (?,?,?, DATE_ADD(NOW(), INTERVAL 3 MINUTE))")) {
            preparedStatement.setString(1, codeKey);
            preparedStatement.setInt(2, userIndex);
            preparedStatement.setString(3, code);
            preparedStatement.execute();
        }
    }

    public int selectResetCodeCount(Connection connection, String code, String codeKey) throws SQLException {
        int count;
        try (PreparedStatement preparedStatement = connection.prepareStatement("" +
                "SELECT COUNT(`code_index`) AS `count` FROM `compro`.`user_reset_codes` WHERE `code` =? AND `code_key`=? AND `code_expires_at` > NOW() AND `used_flag`=FALSE")) {
            preparedStatement.setString(1, code);
            preparedStatement.setString(2, codeKey);
            preparedStatement.executeQuery();
            try (ResultSet resultSet = preparedStatement.getResultSet()) {
                resultSet.next();
                count = resultSet.getInt("count");
            }
        }
        if (count > 0) {
            try (PreparedStatement preparedStatement = connection.prepareStatement("" +
                    "UPDATE `compro`.`user_reset_codes` SET `used_flag`=TRUE WHERE `code` =? AND `code_key`=? AND `code_expires_at` > NOW() AND `used_flag`=FALSE")) {
                preparedStatement.setString(1, code);
                preparedStatement.setString(2, codeKey);
                preparedStatement.execute();
            }
        }
        return count;
    }

    public int selectUserIndex(Connection connection, ChangePasswordVo changePasswordVo) throws SQLException {
        int index = -1;
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT `user_index` AS `userIndex` FROM `compro`.`user_reset_codes` WHERE code =? AND code_key=? AND code_expires_at > NOW() AND used_flag =TRUE"
        )) {
            preparedStatement.setString(1, changePasswordVo.getCode());
            preparedStatement.setString(2, changePasswordVo.getCodeKey());
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    index = resultSet.getInt("userIndex");
                }
            }
        }
        return index;
    }

    // 비밀번호 찾기 : 비밀번호 수정
    public boolean changePassword(Connection connection, ChangePasswordVo changePasswordVo, int userIndex) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE `compro`.`users` SET `user_password` = ? WHERE `user_index` = ?")) {
            preparedStatement.setString(1, changePasswordVo.getHashedNewPassword());
            preparedStatement.setInt(2, userIndex);
            preparedStatement.execute();
        }
        return true;
    }

    // 회원정보 수정
    public boolean modifyUser(Connection connection, ModifyUserVo modifyUserVo) throws SQLException {

        try (PreparedStatement preparedStatement = connection.prepareStatement("" +
                "UPDATE `compro`.`users` SET `user_email`=?, `user_password` =?, `user_name` =?, `user_nickname` =?, `user_address` =?, `user_contact` =?, `user_birth` =? " +
                "WHERE `user_index` = ?")) {
            preparedStatement.setString(1, modifyUserVo.getEmail());
            preparedStatement.setString(2, modifyUserVo.getHashedPassword());
            preparedStatement.setString(3, modifyUserVo.getName());
            preparedStatement.setString(4, modifyUserVo.getNickName());
            preparedStatement.setString(5, modifyUserVo.getAddress());
            preparedStatement.setString(6, modifyUserVo.getContact());
            preparedStatement.setString(7, modifyUserVo.getBirth());
            preparedStatement.setInt(8, modifyUserVo.getIndex());
            preparedStatement.execute();
        }
        return true;
    }

    public boolean insertQna(Connection connection, UserVo userVo, QnaRegisterVo qnaRegisterVo) throws SQLException {

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO `compro`.`qnas`(qna_kinds, qna_title, qna_content, purchase_index, user_index) VALUES(?,?,?,?,?);")) {
            preparedStatement.setString(1, qnaRegisterVo.getQnaKind());
            preparedStatement.setString(2, qnaRegisterVo.getQnaTitle());
            preparedStatement.setString(3, qnaRegisterVo.getQnaContent());
            preparedStatement.setInt(4, qnaRegisterVo.getPurchaseIndex());
            preparedStatement.setInt(5, userVo.getIndex());
            preparedStatement.execute();
        }
        return true;
    }

    public GetQnaVo selectQnas(Connection connection, int pageNumber, UserVo userVo) throws SQLException {
        int startPage = pageNumber < 6 ? 1 : pageNumber - 5;
        int endPage = pageNumber + 5;
        int requestPage = pageNumber;
        ArrayList<QnaRegisterVo> qnas = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT COUNT(`qna_index`) AS `count` FROM `compro`.`qnas` WHERE `user_index` = ?")) {
            preparedStatement.setInt(1, userVo.getIndex());

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int totalQnasCount = resultSet.getInt("count");
                    int maxPageNumber = (int) Math.ceil((double) totalQnasCount / ROWS_PER_PAGE_QNA);
                    if (endPage > maxPageNumber) endPage = maxPageNumber;
                }
            }
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT  `qna`.`qna_index` AS `qnaIndex`,\n" +
                        "`qna`.`qna_kinds` AS `qnaKinds`,\n" +
                        "`qna`.`qna_title` AS `qnaTitle`,\n" +
                        "`qna`.`qna_content` AS `qnaContent`,\n" +
                        "`purchase`.`purchase_index` AS `purchaseIndex`\n" +
                        "FROM `compro`.`qnas` AS `qna`\n" +
                        "INNER JOIN `compro`.`purchases` AS `purchase` ON `qna`.`purchase_index` = `purchase`.`purchase_index` \n" +
                        "WHERE `qna`.`user_index` = ?\n " +
                        "ORDER BY `qna_index` DESC\n" +
                        "LIMIT ?, ?")) {

            preparedStatement.setInt(1, userVo.getIndex());
            preparedStatement.setInt(2, (pageNumber - 1) * ROWS_PER_PAGE_QNA);
            preparedStatement.setInt(3, ROWS_PER_PAGE_QNA);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    QnaRegisterVo qnaRegisterVo = new QnaRegisterVo(
                            resultSet.getString("qnaIndex"),
                            resultSet.getString("qnaKinds"),
                            resultSet.getString("qnaTitle"),
                            resultSet.getString("qnaContent"),
                            resultSet.getString("purchaseIndex"));
                    qnas.add(qnaRegisterVo);
                }
            }
        }
        return new GetQnaVo(startPage, endPage, requestPage, qnas);
    }
}
