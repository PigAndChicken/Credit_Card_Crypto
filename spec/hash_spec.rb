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
      # TODO: Check that each card produces the same hash if hashed repeatedly
      it 'should produce the same hash if hashed repeatedly' do
        cards.each do |card|
          card.hash.must_equal card.hash
        end
      end
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      it 'should produce different hashes with different card infos' do
        cards[0].hash.wont_equal cards[1].hash
        cards[0].hash.wont_equal cards[2].hash
        cards[1].hash.wont_equal cards[2].hash
        cards[2].hash.wont_equal cards[0].hash
      end
    end
  end

  describe 'Test cryptographic hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
      it 'should produce the same hash if hashed repeatedly' do
        cards.map(&:hash_secure).to_s.must_equal cards.map(&:hash_secure).to_s
        cards[0].hash_secure.must_equal cards[0].hash_secure
        cards[1].hash_secure.must_equal cards[1].hash_secure
        cards[2].hash_secure.must_equal cards[2].hash_secure
      end
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      it 'should produce different hashes with different cards' do
        cards[0].hash_secure.wont_equal cards[1].hash_secure
        cards[0].hash_secure.wont_equal cards[2].hash_secure
        cards[1].hash_secure.wont_equal cards[2].hash_secure
        cards[2].hash_secure.wont_equal cards[0].hash_secure
      end
    end

    describe 'Check regular hash not same as cryptographic hash' do
      # TODO: Check that each card's hash is different from its hash_secure
      it 'should provide different hashes between cryptographic and regular' do
        cards.map(&:hash).to_s.wont_equal cards.map(&:hash_secure).to_s
      end
    end
  end
end
