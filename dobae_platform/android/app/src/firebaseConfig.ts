import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";

const firebaseConfig = {
  apiKey: "AIzaSyBNuW_NTKkQUdGkglsFV9CyARlgJ9WibXE",
  authDomain: "dobae-platform.firebaseapp.com",
  projectId: "dobae-platform",
  storageBucket: "dobae-platform.firebasestorage.app",
  messagingSenderId: "994293928667",
  appId: "1:994293928667:web:724f1dbc56b85fad5ff2fe"
};

const app = initializeApp(firebaseConfig)
export const db = getFirestore(app)