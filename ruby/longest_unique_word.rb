## This program will accept a file of words, where each line contains a single
## word, and output the longest word that contains all unique letters

class LongestUniqueWordApp
  # read the file into an array
  def read_file(file)
    File.readlines(file, chomp: true)
  end

  # determine if word contains unique letters
  def unique_letters(str)
    # store a key/value pair of each letter in a word where
    # key = letter and value = nil or 0 or 1
    letter_count = {}
    has_unique_letters = true

    # iterate through each letter of a word
    str.chars.each do |letter|
      # check if the count of the letter has already been incremented
      # if no, add 1
      # if yes, return false
      if letter_count[letter].nil? || (letter_count[letter]).zero?
        letter_count[letter] = 1
      else
        has_unique_letters = false
      end
    end

    # return status of a
    has_unique_letters
  end

  # get longest word in an array, where the word contains only unique letters
  def longest_unique_word(arr)
    unique_array = []

    arr.each do |word|
      # pass the word to the unique_letters method
      if unique_letters(word)
        # if the word is unique, add it to the array
        unique_array << word
      end
    end

    # return the element with most length from the sorted array of unique words
    unique_array.sort.max_by(&:length)
  end
end

# instantiate an object of LongestUniqueWordApp
word_object = LongestUniqueWordApp.new

# read a file of words and store them into an array
word_array = word_object.read_file('./words.txt')

# output the result - the first longest word in a list of words, where the word
# contains no duplicate letters
puts "The longest word containing only unique letters is: #{word_object.longest_unique_word(word_array)}"

# Tests
require 'rspec'

describe LongestUniqueWordApp do
  let(:longest_unique_word) { LongestUniqueWordApp.new }

  it 'reads a file and returns an array of strings' do
    expect(longest_unique_word.read_file('./words.txt')).to be_an_instance_of(Array)
    expect(longest_unique_word.read_file('./words.txt')).to all(be_an_instance_of(String))
  end

  it 'determines if string contains only unique letters' do
    expect(longest_unique_word.unique_letters('apple')).to eq(false)
    expect(longest_unique_word.unique_letters('dragons')).to eq(true)
  end

  it 'returns the longest word from an array of words with only unique letters' do
    expect(longest_unique_word.longest_unique_word(%w[apple cats dragons])).to eq('dragons')
  end
end
