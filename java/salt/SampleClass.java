package salt;

import java.util.Base64;

public class SampleClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String sample = "south africa team we will win the world cup in 2025 ";
		System.out.println("sample string:\n" + sample);

		String BasicBase64Format = Base64.getEncoder().encodeToString(sample.getBytes());
		System.out.println("Encoded string:\n "+BasicBase64Format);
		byte[] actualByte = Base64.getDecoder().decode(BasicBase64Format);

		String actualString = new String(actualByte);

		System.out.println("Actual String : \n" + actualString);

	}

}
