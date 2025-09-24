package org.csu.petstore.Configuration;

import org.csu.petstore.utils.JwtBlacklist;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class BlacklistCleanupTask {

    @Scheduled(fixedRate = 3600000) // 每小时执行一次
    public void cleanBlacklist() {
        JwtBlacklist.cleanExpiredTokens();
    }
}
