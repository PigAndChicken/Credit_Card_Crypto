module SubstitutionCipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      char_ords = document.to_s.chars.map(&:ord)
      shifted_char_ords = char_ords.map { |ord| (ord + key) % 127 }
      caesar_encrypt_string = shifted_char_ords.map(&:chr).join('')
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      caesar_encrypt_ords = document.to_s.chars.map(&:ord)
      decrypt_ords = caesar_encrypt_ords.map { |num| (num - key) % 127 }
      origin_string = decrypt_ords.map(&:chr).join('')
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      ascii_arr = (0..127).to_a
      permutation = ascii_arr.shuffle(random: Random.new(0))

      char_ords = document.to_s.chars.map(&:ord)
      encrypt_ords = char_ords.map { |char_ord| permutation[char_ord] }
      permut_encrypt_string = encrypt_ords.map(&:chr).join('')
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      ascii_arr = (0..127).to_a
      permutation = ascii_arr.shuffle(random: Random.new(0))

      permut_encrypt_ords = document.to_s.chars.map(&:ord)
      decrypt_ords = permut_encrypt_ords.map { |permut_ord| permutation.find_index(permut_ord) }
      origin_string = decrypt_ords.map(&:chr).join('')
    end
  end
end
