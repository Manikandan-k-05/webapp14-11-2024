package bean;

public class LoginBean {
	 private String email;  
	    private String loginPassword; 
	    private int loginId;
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getLoginPassword() {
			return loginPassword;
		}
		public void setLoginPassword(String loginPassword) {
			this.loginPassword = loginPassword;
		}
		public int getLoginId() {
			return loginId;
		}
		public void setLoginId(int loginId) {
			this.loginId = loginId;
		}
		public LoginBean() {
			super();
		}
		public LoginBean(String email, String loginPassword, int loginId) {
			super();
			this.email = email;
			this.loginPassword = loginPassword;
			this.loginId = loginId;
		} 

}
