module SubstitutionCipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      document.to_s.chars.inject('') do |result, char|
        ascii = char.ord + key
        result << ascii.chr
      end
      # TODO: encrypt string using caesar cipher
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      document.to_s.chars.inject('') do |result, char|
        ascii = char.ord - key
        result << ascii.chr
      end
      # TODO: decrypt string using caesar cipher
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      document.to_s.chars.each_slice(key).to_a.inject([]) do |result, array|
        result = result + array.shuffle(random: Random.new(key))
        result
      end.join('')
      # TODO: encrypt string using a permutation cipher
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      document.to_s.chars.each_slice(key).to_a.inject([]) do |result, array|
        result = result + array.shuffle(random: Random.new(key))
        result
      end.join('')
      # TODO: decrypt string using a permutation cipher
    end
  end
end
