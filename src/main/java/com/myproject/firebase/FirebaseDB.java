package com.myproject.firebase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.google.firebase.auth.UserRecord;
import com.google.firebase.database.FirebaseDatabase;

@Repository
public class FirebaseDB {
	
	@Autowired
	FirebaseInitializer firebaseInitializer;
	
//	FirebaseDatabase db=  
	
	public void signUpDB(UserRecord userRecord) {
		UserModel userModel = new UserModel();
		
		userModel.uid=userRecord.getUid();
		userModel.userName=userRecord.getEmail();
		FirebaseDatabase.getInstance(firebaseInitializer.firebaseApp)
		.getReference("users/"+userModel.uid).setValueAsync(userModel);
		
	}
	
	

}
