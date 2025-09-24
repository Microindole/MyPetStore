package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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
import java.util.Map;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Autowired
    private SignOnMapper signOnMapper;

    @Autowired
    private ProfileMapper profileMapper;

    @Override
    public int signonForm(String username, String password) {
        try{
            SignOn signOn = signOnMapper.selectById(username);
            if(signOn.getPassword().equals(password)){
                return 0;
            }else{
                return 2;
            }
        }
        catch(Exception e){
            return 1;
        }

    }

    @Override
    public AccountVO getAccount(String username) {
        Account account = accountMapper.selectById(username);
        String password = signOnMapper.selectById(username).getPassword();
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
        accountVO.setPassword(password);
        accountVO.setLangPref(profile.getLangPref());
        accountVO.setFavoriteGory(profile.getFavoriteGory());
        accountVO.setMyListOpt(profile.getMyListOpt());
        accountVO.setBannerOpt(profile.getBannerOpt());
        return accountVO;


    }

    @Override
    public void insertAccountInformation(AccountVO accountVO) {
        Account account = setAccount(accountVO);
        SignOn signOn = setSign(accountVO);
        Profile profile = setProfile(accountVO);
        profileMapper.insert(profile);
        accountMapper.insert(account);
        signOnMapper.insert(signOn);
    }

    @Override
    public void updateAccountInformation(AccountVO accountVO) {
        Account account = setAccount(accountVO);
        SignOn signOn = setSign(accountVO);
        Profile profile = setProfile(accountVO);
        profileMapper.updateById(profile);
        accountMapper.updateById(account);
        signOnMapper.updateById(signOn);
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
    public Account getAccountById(String id) {
        return accountMapper.selectById(id);
    }

    @Override
    public void updateAccount(Account account) {
        accountMapper.updateById(account);
    }

    @Override
    public void resetPasswordToDefault(String username) {
        LambdaQueryWrapper<SignOn> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SignOn::getUsername, username);
        SignOn signOn = signOnMapper.selectOne(wrapper);
        signOn.setPassword("123456");
        signOnMapper.updateById(signOn);

    }

    @Override
    public List<Account> getAllAccounts(LambdaQueryWrapper<Account> wrapper) {
        return accountMapper.selectList(wrapper);
    }



}
