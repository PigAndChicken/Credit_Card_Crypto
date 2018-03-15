require 'rbnacl/libsodium'
require 'base64'

module ModernSymmetricCipher
  def self.generate_new_key(data)
    Base64.strict_encode64(data)
    # TODO: Return a new key as a Base64 string
  end

  def self.encrypt(document, generate_new_key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
  end

  def self.decrypt(encrypted_cc, generate_new_key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
  end
end
