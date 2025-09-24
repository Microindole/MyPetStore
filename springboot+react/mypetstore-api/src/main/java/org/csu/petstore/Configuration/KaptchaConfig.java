package org.csu.petstore.Configuration;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import java.util.Properties;

@Configuration
public class KaptchaConfig {

    @Bean
    public DefaultKaptcha producer() {
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        Properties properties = new Properties();
        properties.put("kaptcha.border", "no");
        properties.put("kaptcha.textproducer.font.color", "black");
        properties.put("kaptcha.image.width", "100");
        properties.put("kaptcha.image.height", "50");
        properties.put("kaptcha.textproducer.char.length", "4");
        properties.put("kaptcha.textproducer.font.size", "45");
        Config config = new Config(properties);
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }
}