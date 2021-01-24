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
		userModel.profileImageUrl="https://firebasestorage.googleapis.com/v0/b/forcat-ef482.appspot.com/o/userImages%2Fcbd0b1a6345a44b58dda0f6a355eb39ce4e8a56a_2_690x460.png?alt=media&token=1bc67371-ffd3-48c6-b86f-e9f4f6dd1b1b";
		FirebaseDatabase.getInstance(firebaseInitializer.firebaseApp)
		.getReference("users/"+userModel.uid).setValueAsync(userModel);
		
	}
	
	

}
