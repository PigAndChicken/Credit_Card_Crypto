require 'rbnacl/libsodium'
require 'base64'

module ModernSymmetricCipher
  def self.generate_new_key
    key = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
    Base64.strict_encode64(key)
    # TODO: Return a new key as a Base64 string
  end

  def self.encrypt(document, generate_new_key)
    key = Base64.strict_decode64(generate_new_key)
    simple_box = RbNaCl::SimpleBox.from_secret_key(key)
    data = simple_box.encrypt(document.to_s)
    Base64.strict_encode64(data)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
  end

  def self.decrypt(encrypted_cc, generate_new_key)
    key = Base64.strict_decode64(generate_new_key)
    cipher = Base64.strict_decode64(encrypted_cc)
    simple_box = RbNaCl::SimpleBox.from_secret_key(key)
    simple_box.decrypt(cipher)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
  end
end
