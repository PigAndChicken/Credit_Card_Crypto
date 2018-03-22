require 'matrix'

module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    #document = document.to_s
    col_num = Math.sqrt(document.to_s.chars.length).ceil
    row_num = (document.to_s.chars.length / col_num.to_f).ceil
    array_2d = document.to_s.chars.each_slice(col_num).to_a
    (row_num - array_2d.last.length + 1).times do
      array_2d.last << '$'
    end
    matrix = Matrix[*array_2d]
    col_key = [*(0...col_num)].shuffle(random: Random.new(key))
    row_key = [*(0...row_num)].shuffle(random: Random.new(key))
    matrix = Matrix.columns(rand_matrix(col_key, matrix, :column))
    array_2d = rand_matrix(row_key, matrix, :row)
    array_2d.join
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    col_num = Math.sqrt(ciphertext.chars.length).ceil
    row_num = (ciphertext.chars.length / col_num.to_f).ceil
    array_2d = ciphertext.chars.each_slice(col_num).to_a
    matrix = Matrix[*array_2d]
    col_key = [*(0...col_num)].shuffle(random: Random.new(key))
    row_key = [*(0...row_num)].shuffle(random: Random.new(key))
    matrix = Matrix.rows(de_matrix(row_key, matrix, :row))
    matrix = Matrix.columns(de_matrix(col_key, matrix, :column))
    result = matrix.to_a.join.gsub('$', '')
  end

  def self.rand_matrix(keys, matrix, x)
    array_2d = []
    keys.each do |k| 
      array_2d << matrix.send(x, k).to_a
    end
    array_2d
  end

  def self.de_matrix(keys, matrix, x)
    array_2d = []
    keys.each_with_index do |k, i|
      array_2d[k] = matrix.send(x, i).to_a
    end
    array_2d
  end
end
