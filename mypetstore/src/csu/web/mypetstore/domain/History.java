package csu.web.mypetstore.domain;

import java.io.Serializable;

public class History implements Serializable {
    private String username;
    private String category;
    private int visittimes;
    private int addtocarttimes;

    public History() {}

    public void setUsername(String username) {
        this.username = username;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setVisittimes(int visittimes) {
        this.visittimes = visittimes;
    }

    public void setAddtocarttimes(int addtocarttimes) {
        this.addtocarttimes = addtocarttimes;
    }

    public int getVisittimes() {
        return visittimes;
    }

    public String getUsername() {
        return username;
    }

    public String getCategory() {
        return category;
    }

    public int getAddtocarttimes() {
        return addtocarttimes;
    }
}
