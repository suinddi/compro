package com.webproject.compro.web.containers;

import com.webproject.compro.web.enums.UserResetResult;

public class UserResetResultContainer {
    private final UserResetResult userResetResult;
    private final String codeKey;

    public UserResetResultContainer(UserResetResult userResetResult) {
        this(userResetResult, null);
    }

    public UserResetResultContainer(UserResetResult userResetResult, String codeKey) {
        this.userResetResult = userResetResult;
        this.codeKey = codeKey;
    }

    public UserResetResult getUserResetResult() {
        return userResetResult;
    }

    public String getCodeKey() {
        return codeKey;
    }
}