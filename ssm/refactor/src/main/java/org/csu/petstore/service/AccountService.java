package org.csu.petstore.service;

import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Profile;
import org.csu.petstore.entity.SignOn;
import org.csu.petstore.vo.AccountVO;

import java.util.Map;

public interface AccountService {

    int signonForm(String username, String password);

    public SignOn getSign(String username);

    AccountVO getAccount(String username);

    void insertAccountInformation(AccountVO accountVO);

    void updateAccountInformation(AccountVO accountVO);

    Account setAccount(AccountVO accountVO);

    SignOn setSign(AccountVO accountVO);

    Profile setProfile(AccountVO accountVO);

}
