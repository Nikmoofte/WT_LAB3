package by.bsuir.barilko.entity.password;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Password {
    private static Password instance;

    /**
     * Private constructor to enforce singleton pattern.
     */
    private Password() {}

    /**
     * Returns the singleton instance of the Password class.
     *
     * @return The singleton instance of the Password class.
     */
    public static Password getInstance() {
        if(instance == null) {
            instance = new Password();
        }
        return instance;
    }

    /**
     * Hashes the provided password using the SHA-256 algorithm.
     *
     * @param password The password to be hashed.
     * @return The hashed password as a hexadecimal string.
     */
    public String hashPassword(String password) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        byte[] hashedBytes = md.digest(password.getBytes());

        StringBuilder hexString = new StringBuilder();
        for (byte b : hashedBytes) {
            hexString.append(String.format("%02x", b));
        }

        return hexString.toString();
    }
}
