package org.csu.petstore.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Profile;
import org.csu.petstore.entity.SignOn;
import org.csu.petstore.vo.AccountVO;

import java.util.List;
import java.util.Map;

public interface AccountService {

    int signonForm(String username, String password);

    AccountVO getAccount(String username);

    void insertAccountInformation(AccountVO accountVO);

    void updateAccountInformation(AccountVO accountVO);

    // 根据ID获取用户
    Account getAccountById(String id);

    // 更新用户信息
    void updateAccount(Account account);

    // 管理端重置用户密码
    void resetPasswordToDefault(String username);

    // 管理端获取所有用户
    List<Account> getAllAccounts(LambdaQueryWrapper<Account> wrapper);

    // 在AccountVO类中提取Account
    Account setAccount(AccountVO accountVO);

    // 在AccountVO类中提取SignOn
    SignOn setSign(AccountVO accountVO);

    // 在AccountVO类中提取Profile
    Profile setProfile(AccountVO accountVO);
}
