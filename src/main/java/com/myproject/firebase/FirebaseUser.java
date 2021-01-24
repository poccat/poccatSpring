package com.myproject.firebase;

import java.io.IOException;
import java.util.Map;



import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import com.google.firebase.auth.UserRecord.CreateRequest;


@Component
public class FirebaseUser {
	Logger logger = LogManager.getLogger(FirebaseUser.class);
	UserRecord userRecord = null;
		@Autowired
		FirebaseInitializer firebaseInitializer;
		

	public UserRecord signUPFirebase(Map<String,Object> pMap)  {
		CreateRequest request = new CreateRequest()
			    .setEmail(pMap.get("join_email").toString())
			    .setEmailVerified(false)
			    .setPassword(pMap.get("join_pw").toString())
			    .setDisplayName("")
			    .setDisabled(false);
			try {
				userRecord =FirebaseAuth.getInstance(firebaseInitializer.firebaseApp).createUser(request);
			}
			catch (FirebaseAuthException e) {				
				e.printStackTrace();
			}
			return userRecord;
	}
	
	public String createToken(String uid) {
		String customToken="";
		try {
			customToken = FirebaseAuth.getInstance(firebaseInitializer.firebaseApp).createCustomToken(uid);
		} catch (FirebaseAuthException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return customToken;
	}
	

}
