package Models.DTO;

public class Account {

    private String userID;
    private String password;
    private String fullName;
    private int type;

    public Account() {
    }
        
    public Account(String userID, String password, String fullName, int type) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.type = type;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    
}
