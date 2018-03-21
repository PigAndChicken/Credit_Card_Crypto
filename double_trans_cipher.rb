module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    cols_num = Math.sqrt(document.to_s.length).round
    chars_matrix = doc_chars.each_slice(cols_num).to_a

    rows_shuffled_matrix = chars_matrix.shuffle(random: Random.new(key))
    double_shuffled_matrix = rows_shuffled_matrix.map { |row| row.shuffle(random: Random.new(key)) }
    ciphertext = double_shuffled_matrix.join('')
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    cols_num = Math.sqrt(ciphertext.to_s.chars.length).round
    chars_matrix = cipher_chars.each_slice(cols_num).to_a

    rows_restored_matrix = chars_matrix.shuffle(random: Random.new(key))
    double_shuffled_matrix = rows_restored_matrix.map { |row| row.shuffle(random: Random.new(key)) }
    plaintext = double_shuffled_matrix.join('')
  end
end
