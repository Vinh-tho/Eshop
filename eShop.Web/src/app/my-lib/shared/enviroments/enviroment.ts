import { IEnvironment } from "../../src/lib/shared/interfaces/environment.interface";

export const environment: IEnvironment = {
    production: false,
    api: 'http://localhost:5178',
    baseUrlCore: 'http://localhost:5178',
    clientId: 'client-web',
    clientSecret: 'c8a2e7c1-8d5f-4a3b-9e2a-7f6d5c4b3a21', // Sửa dòng này
    scopes: 'offline_access',
    firebase: {
        apiKey: "AIzaSyAKoAu5qPLcI7ir8Jk0-wKxamHERQGNYrA",
        authDomain: "eshop-c06ad.firebaseapp.com",
        projectId: "eshop-c06ad",
        storageBucket: "eshop-c06ad.firebasestorage.app",
        messagingSenderId: "602858569079",
        appId: "1:602858569079:web:44eca50b8874b3c89cf572",
        measurementId: "G-3V5M2VFY1W"
    }
}