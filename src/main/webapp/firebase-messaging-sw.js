importScripts('https://www.gstatic.com/firebasejs/8.2.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.2.1/firebase-messaging.js');

var firebaseConfig = {
    apiKey: "AIzaSyDCZqUiY79xX8jZhyIIjVv5JYDN-LJkE4c",
    authDomain: "forcat-ef482.firebaseapp.com",
    databaseURL: "https://forcat-ef482-default-rtdb.firebaseio.com",
    projectId: "forcat-ef482",
    storageBucket: "forcat-ef482.appspot.com",
    messagingSenderId: "308850704093",
    appId: "1:308850704093:web:ce8e36c34d44f73f5aa534",
    measurementId: "G-54JZ68Q6MP"
  };
  firebase.initializeApp(firebaseConfig);

  const messaging =firebase.messaging();

  messaging.onBackgroundMessage(function(payload) {
    console.log('[firebase-messaging-sw.js] Received background message ', payload);
    // Customize notification here
    const notificationTitle = payload.data.title;
    const notificationOptions = {
      body: payload.data.text,
      icon: 'https://firebasestorage.googleapis.com/v0/b/forcat-ef482.appspot.com/o/photos_%2Fusers%2Fcatlogo.png?alt=media&token=f3f3969b-187a-46e4-8e40-3e473c5f069a'
    };
    
    self.registration.showNotification(notificationTitle,
      notificationOptions);
  });