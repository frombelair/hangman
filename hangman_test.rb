require "minitest/autorun"
require_relative "hangman.rb"

class TestHangman < Minitest::Test

    def test_create_new_game
        game = Hangman.new("beer")
        assert_equal("beer", game.word)
    end

    def test_number_of_blanks
        game = Hangman.new("beer")
        assert_equal("____", game.blanks)
    end

    def test_if_guessed_letter_is_in_word
        game = Hangman.new("beer")
        assert_equal(true, game.word_include?("b"))
        assert_equal(false, game.word_include?("z"))
    end

    def test_at_beginning_of_game_guessed_letters_array_is_empty
        game = Hangman.new("beer")
        assert_equal([], game.guessed_letters)
    end

    def test_used_guessed_letter_gets_put_into_array
        game = Hangman.new("beer")
        game.make_guess("a")
        game.make_guess("z")
        assert_equal(["a", "z"], game.guessed_letters)
    end

    def test_update_blanks
        game = Hangman.new("beer")
        game.update_blanks("b")
        assert_equal("b___", game.blanks)
    end

end