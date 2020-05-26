import org.apache.commons.codec.digest.DigestUtils;

public class HashGenerator {

    public static String generateHash(String timestamp, String privateKey, String publicKey) {
        return DigestUtils.md5Hex(timestamp + privateKey + publicKey);
    }

}
