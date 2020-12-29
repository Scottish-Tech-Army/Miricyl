import Firebase from "firebase/app";
import "firebase/remote-config";

const firebaseConfig = {
  apiKey: "AIzaSyCGShjuCUbZ3xLM7-OLo6RkgWkai5k-rYk",
  projectId: "miricyl",
  appId: "1:459650622933:web:6496bf18d90926bd8a895c",
};

export const firebase = Firebase.initializeApp(firebaseConfig);
