package org.csu.petstore.utils;

import java.util.*;

public class JwtBlacklist {
    private static final Map<String, Long> blacklist = new HashMap<>();
    private static final long EXPIRATION_TIME = 3600000; // 1小时

    public static void addTokenToBlacklist(String token) {
        blacklist.put(token, System.currentTimeMillis());
    }

    public static boolean isTokenBlacklisted(String token) {
        return blacklist.containsKey(token);
    }

    public static void cleanExpiredTokens() {
        long now = System.currentTimeMillis();
        blacklist.entrySet().removeIf(entry -> now - entry.getValue() > EXPIRATION_TIME);
    }

}
