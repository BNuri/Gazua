package A.algorithm;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class AES {
   private static SecretKeySpec secretKey;
   private static byte[] key;
   
   private static String decryptedString;
   private static String encryptedString;
   private final static String strPassword = "World Taekwondo Federation";
   
   public static void setKey(String myKey) {
      MessageDigest sha = null;
      try {
         key = myKey.getBytes("UTF-8");
         System.out.println("key.length(1) : " + key.length);
         sha = MessageDigest.getInstance("SHA-1");
         key = sha.digest(key);
         key = Arrays.copyOf(key, 16);
         System.out.println("key.length(2) : " + key.length);
         System.out.println("key.length(UTF-8) : " + new String(key, "UTF-8"));
         secretKey = new SecretKeySpec(key, "AES");
      } catch (UnsupportedEncodingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (NoSuchAlgorithmException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
   }
   
   public static String getDecryptedString() {
      return decryptedString;
   }
   
   public static void setDecryptedString(String decryptedString) {
      AES.decryptedString = decryptedString;
   }
   
   public static String getEncryptedString() {
      return encryptedString;
   }
   
   public static void setEncryptedString(String encryptedString) {
      AES.encryptedString = encryptedString;
   }
   
   public static String encrypt(String strToEncrypt) {
      try {
         Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
         cipher.init(Cipher.ENCRYPT_MODE, secretKey);
         setEncryptedString(Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes("UTF-8"))));
      } catch (Exception e) {
         System.out.println("Error while encrypting : " + e.toString());
      }
      
      return null;
   }
   
   public static String decrpyt(String strToDecrypt) {
      try {
         Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
         cipher.init(Cipher.DECRYPT_MODE, secretKey);
         setDecryptedString(new String(cipher.doFinal(Base64.decodeBase64(strToDecrypt))));
      } catch (Exception e) {
         System.out.println("Error while decrypting : " + e.toString());
      }
      return null;
   }
   
   public static String setCrypting(String strToEncrypt) {
      AES.setKey(strPassword);
      AES.encrypt(strToEncrypt.trim());
      return encryptedString;
   }
   
   public static String setDecrypting(String strToDecrypt) {
      AES.setKey(strPassword);
      AES.decrpyt(strToDecrypt.trim());    
      return decryptedString;
   }
}