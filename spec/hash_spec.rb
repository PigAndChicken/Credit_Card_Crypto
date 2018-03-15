require_relative '../credit_card'
require 'minitest/autorun'

# Feel free to replace the contents of cards with data from your own yaml file
card_details = [
  { num: '4916603231464963',
    exp: 'Mar-30-2020',
    name: 'Soumya Ray',
    net: 'Visa' },
  { num: '6011580789725897',
    exp: 'Sep-30-2020',
    name: 'Nick Danks',
    net: 'Visa' },
  { num: '5423661657234057',
    exp: 'Feb-30-2020',
    name: 'Lee Chen',
    net: 'Mastercard' }
]

cards = card_details.map do |c|
  CreditCard.new(c[:num], c[:exp], c[:name], c[:net])
end

describe 'Test hashing requirements' do
  describe 'Test regular hashing' do
    describe 'Check hashes are consistently produced' do
      it 'It should return hash object with correct information.' do
        cards.each do |card|
          hash = card.hash
          _(hash).must_be_kind_of Hash
          _(hash['number']).must_equal card.number
        end
      end
      it 'It should produce the same hash value if information the same' do
        cards.each do |card|
          hash = card.hash
          _(hash).must_equal card.hash
        end
      end
      # TODO: Check that each card produces the same hash if hashed repeatedly
    end

    describe 'Check for unique hashes' do
      it 'Its hash must be different than others.' do
        hashs = cards.map {|c| c.hash}
        _(hashs.uniq.length).must_equal cards.length
      end
      # TODO: Check that each card produces a different hash than other cards
    end
  end

  describe 'Test cryptographic hashing' do
    describe 'Check hashes are consistently produced' do
      it 'It should return a string as hash value' do
        cards.each do |card|
          hash_val = card.hash_secure
          _(hash_val).must_be_kind_of String
        end
      end
      it 'It should produce the same hash value if information the same' do
        cards.each do |card|
          hash_val = card.hash_secure
          _(hash_val).must_equal card.hash_secure
        end
      end
      # TODO: Check that each card produces the same hash if hashed repeatedly
    end

    describe 'Check for unique hashes' do
      it 'Its hash value must be different than others' do
        hash_vals = cards.map {|c| c.hash_secure}
        _(hash_vals.uniq.length).must_equal cards.length
      end
      # TODO: Check that each card produces a different hash than other cards
    end

    describe 'Check regular hash not same as cryptographic hash' do
      it 'Hash value must be different than hash info' do 
        cards.each do |card|
          _(card.hash).wont_be_same_as card.hash_secure
        end
      end
      # TODO: Check that each card's hash is different from its hash_secure
    end
  end
end
