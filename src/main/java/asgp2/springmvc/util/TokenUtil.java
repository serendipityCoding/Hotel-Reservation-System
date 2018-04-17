package asgp2.springmvc.util;

import java.security.SecureRandom;

import org.apache.log4j.Logger;

public class TokenUtil {
	private static final Logger logger = Logger.getLogger(TokenUtil.class);
	
	public static String generateToken(){
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[80];
		random.nextBytes(bytes);
		String token = bytes.toString();
		logger.debug("tokennnnnnn"+token);
		return token;
	}
}
