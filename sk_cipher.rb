require 'rbnacl/libsodium'
require 'base64'

module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string
    key = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
    key_str = Base64.strict_encode64(key)
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
    origin_key = Base64.strict_decode64(key)
    simple_box = RbNaCl::SimpleBox.from_secret_key(origin_key)
    ciphertext = simple_box.encrypt(document)
    encrypted_cc = Base64.strict_encode64(ciphertext)
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    origin_key = Base64.strict_decode64(key)
    ciphertext = Base64.strict_decode64(encrypted_cc)
    simple_box = RbNaCl::SimpleBox.from_secret_key(origin_key)
    plaintext = simple_box.decrypt(ciphertext)
  end
end
