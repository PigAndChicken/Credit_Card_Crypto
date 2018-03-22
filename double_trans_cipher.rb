module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    doc_str = document.to_s
    cols_num = Math.sqrt(doc_str.length).round
    chars_matrix = doc_str.chars.each_slice(cols_num).to_a

    rows_shuffled_matrix = chars_matrix.shuffle(random: Random.new(key))
    double_shuffled_matrix = rows_shuffled_matrix.map { |row| row.shuffle(random: Random.new(key)) }
    ciphertext = double_shuffled_matrix.join('')
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    cipher_str = ciphertext.to_s
    cols_num = Math.sqrt(cipher_str.length).round
    chars_matrix = cipher_str.chars.each_slice(cols_num).to_a

    rows_restored_matrix = chars_matrix.shuffle(random: Random.new(key))
    double_shuffled_matrix = rows_restored_matrix.map { |row| row.shuffle(random: Random.new(key)) }
    plaintext = double_shuffled_matrix.join('')
  end
end
