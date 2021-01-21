package com.myproject.firebase;

import java.io.FileInputStream;
import java.io.IOException;

import javax.annotation.PostConstruct;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.myproject.dao.MemberDao;


@Component
public class FirebaseInitializer {
	
	
	
	public static FirebaseApp firebaseApp;
	
	public FirebaseInitializer() throws IOException {
		FileInputStream serviceAccount =
				  new FileInputStream("C:\\Users\\kosmo_02\\Desktop\\project\\Project\\poccatSpring\\forcat-ef482-firebase-adminsdk-6th64-0186a5d482.json");	
		FirebaseOptions options =  FirebaseOptions.builder()
				  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
				  .setDatabaseUrl("https://forcat-ef482-default-rtdb.firebaseio.com")
				  .build();
		if(FirebaseApp.getApps().isEmpty()) {
				firebaseApp =FirebaseApp.initializeApp(options);
		} 
		
	}
	
	
//	public static FirebaseApp initFirebase() {
//		FileInputStream serviceAccount =
//				  new FileInputStream("C:\\Users\\kosmo_02\\Desktop\\project\\Project\\poccatSpring\\forcat-ef482-firebase-adminsdk-6th64-0186a5d482.json");	
//		FirebaseOptions options =  FirebaseOptions.builder()
//				  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
//				  .setDatabaseUrl("https://forcat-ef482-default-rtdb.firebaseio.com")
//				  .build();
//		if(FirebaseApp.getApps().isEmpty()) {
//				firebaseApp =FirebaseApp.initializeApp(options);
//		}
//		return firebaseApp;
//	
//	}
	
	

	


}
