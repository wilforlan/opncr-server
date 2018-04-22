module Encryptor
    class << self

        @@iv = ENV["AES_128_CBC_PASSWORD_IV"]
        @@key = ENV["AES_128_CBC_PASSWORD_KEY"]

        def encrypt_password(password)
            cipher = OpenSSL::Cipher::AES.new(128, :CBC)
            cipher.encrypt
            cipher.key = @@key
            cipher.iv = @@iv
            raw = cipher.update(password) + cipher.final
            p raw
            return Base64.encode64(raw)
        end

        def decrypt_password(word)
            de_raw = Base64.decode64(word)
            p de_raw
            decipher = OpenSSL::Cipher::AES.new(128, :CBC)
            decipher.decrypt
            decipher.key = @@key
            decipher.iv = @@iv
            return decipher.update(de_raw) + decipher.final
        end

        def actor_key_gen(address)
          sha256 = OpenSSL::Digest::SHA256.new
          sha256 << address
          digest = sha256.digest
          return Base64.encode64(digest)
        end
    end
end
