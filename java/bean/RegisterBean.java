package bean;

public class RegisterBean {
	 private String registerEmail;  
	    private String registerPhone;  
	    private String registerPassword; 
	    private int userRegID;
		public String getRegisterEmail() {
			return registerEmail;
		}
		public void setRegisterEmail(String registerEmail) {
			this.registerEmail = registerEmail;
		}
		public String getRegisterPhone() {
			return registerPhone;
		}
		public void setRegisterPhone(String registerPhone) {
			this.registerPhone = registerPhone;
		}
		public String getRegisterPassword() {
			return registerPassword;
		}
		public void setRegisterPassword(String registerPassword) {
			this.registerPassword = registerPassword;
		}
		
		public int getUserRegID() {
			return userRegID;
		}
		public void setUserRegID(int userRegID) {
			this.userRegID = userRegID;
		}
		public RegisterBean() {
			super();
		}
		public RegisterBean(String registerEmail, String registerPhone, String registerPassword,
				int userRegID) {
			super();
			this.registerEmail = registerEmail;
			this.registerPhone = registerPhone;
			this.registerPassword = registerPassword;
			this.userRegID = userRegID;
		}  
	    
}
