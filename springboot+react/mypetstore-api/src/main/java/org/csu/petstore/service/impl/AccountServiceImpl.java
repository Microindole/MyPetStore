package org.csu.petstore.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Profile;
import org.csu.petstore.entity.SignOn;
import org.csu.petstore.persistence.AccountMapper;
import org.csu.petstore.persistence.ProfileMapper;
import org.csu.petstore.persistence.SignOnMapper;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Autowired
    private SignOnMapper signOnMapper;

    @Autowired
    private ProfileMapper profileMapper;

    @Override
    public CommonResponse<SignOn> getSinOnByOtherPlatform(String username) {
        QueryWrapper<SignOn> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        SignOn signOn = signOnMapper.selectOne(wrapper);
        if (signOn == null) {
            return CommonResponse.createForError("无法找到该用户，正在跳转到注册页面");
        }
        return CommonResponse.createForSuccess(signOn);
    }

    @Override
    public CommonResponse<AccountVO> getAccount(String username, String password) {
        QueryWrapper<SignOn> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        wrapper.eq("password", password);
        SignOn signOn = signOnMapper.selectOne(wrapper);
        if (signOn == null) {
            return CommonResponse.createForError("用户名或密码错误");
        }
        return CommonResponse.createForSuccess(getAccount(username).getData());
    }

    @Override
    public CommonResponse<AccountVO> getAccount(String username) {
        Account account = accountMapper.selectById(username);
        if (account == null) {
            return CommonResponse.createForError("用户信息获取失败");
        }
        AccountVO accountVO = new AccountVO();
        Profile profile = profileMapper.selectById(username);
        accountVO.setUsername(account.getUsername());
        accountVO.setEmail(account.getEmail());
        accountVO.setPhone(account.getPhone());
        accountVO.setFirstName(account.getFirstName());
        accountVO.setLastName(account.getLastName());
        accountVO.setStatus(account.getStatus());
        accountVO.setAddress1(account.getAddress1());
        accountVO.setAddress2(account.getAddress2());
        accountVO.setCity(account.getCity());
        accountVO.setState(account.getState());
        accountVO.setZip(account.getZip());
        accountVO.setCountry(account.getCountry());
        accountVO.setPassword("Not Found");
        accountVO.setLangPref(profile.getLangPref());
        accountVO.setFavoriteGory(profile.getFavoriteGory());
        accountVO.setMyListOpt(profile.getMyListOpt());
        accountVO.setBannerOpt(profile.getBannerOpt());
        return CommonResponse.createForSuccess(accountVO);


    }

    @Override
    public CommonResponse<AccountVO> insertAccountInformation(AccountVO accountVO) {
        if((accountMapper.selectById(accountVO.getUsername()) != null) ||
                accountVO.getUsername().isEmpty() || accountVO.getPassword().isEmpty()){
            return CommonResponse.createForError("注册失败");
        }
        Account account = setAccount(accountVO);
        SignOn signOn = setSign(accountVO);
        Profile profile = setProfile(accountVO);
        profileMapper.insert(profile);
        accountMapper.insert(account);
        signOnMapper.insert(signOn);
        return CommonResponse.createForSuccessMessage("用户注册成功");
    }

    @Override
    public CommonResponse<AccountVO> updateAccountInformation(AccountVO accountVO) {
        if(accountVO.getPassword().isEmpty()){
            accountVO.setPassword(signOnMapper.selectById(accountVO.getUsername()).getPassword());
        }
        Account account = setAccount(accountVO);
        SignOn signOn = setSign(accountVO);
        Profile profile = setProfile(accountVO);
        profileMapper.updateById(profile);
        accountMapper.updateById(account);
        signOnMapper.updateById(signOn);
        return CommonResponse.createForSuccessMessage("用户信息更改成功");
    }

    @Override
    public Account setAccount(AccountVO accountVO) {
        Account account = new Account();
        account.setUsername(accountVO.getUsername());
        account.setEmail(accountVO.getEmail());
        account.setFirstName(accountVO.getFirstName());
        account.setLastName(accountVO.getLastName());
        account.setPhone(accountVO.getPhone());
        account.setStatus(accountVO.getStatus());
        account.setAddress1(accountVO.getAddress1());
        account.setAddress2(accountVO.getAddress2());
        account.setCity(accountVO.getCity());
        account.setState(accountVO.getState());
        account.setZip(accountVO.getZip());
        account.setCountry(accountVO.getCountry());
        return account;
    }

    @Override
    public SignOn setSign(AccountVO accountVO) {
        SignOn signOn = new SignOn();
        signOn.setUsername(accountVO.getUsername());
        signOn.setPassword(accountVO.getPassword());
        return signOn;
    }

    @Override
    public Profile setProfile(AccountVO accountVO) {
        Profile profile = new Profile();
        profile.setUserid(accountVO.getUsername());
        profile.setLangPref(accountVO.getLangPref());
        profile.setFavoriteGory(accountVO.getFavoriteGory());
        profile.setMyListOpt(accountVO.getMyListOpt());
        profile.setBannerOpt(accountVO.getBannerOpt());
        return profile;
    }

    @Override
    public CommonResponse<Account> getAccountById(String id) {
        return CommonResponse.createForSuccess(accountMapper.selectById(id));
    }

    @Override
    public CommonResponse<Account> updateAccount(Account account) {
        accountMapper.updateById(account);
        return CommonResponse.createForSuccessMessage("管理端用户信息更改成功");
    }

    @Override
    public CommonResponse<SignOn> resetPasswordToDefault(String username) {
        LambdaQueryWrapper<SignOn> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SignOn::getUsername, username);
        SignOn signOn = signOnMapper.selectOne(wrapper);
        signOn.setPassword("123456");
        signOnMapper.updateById(signOn);
        return CommonResponse.createForSuccessMessage("密码重置成功，新密码为123456");

    }

    @Override
    public CommonResponse<List<Account>> getAllAccounts(LambdaQueryWrapper<Account> wrapper) {
        return CommonResponse.createForSuccess(accountMapper.selectList(wrapper));
    }
}
