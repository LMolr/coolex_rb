require 'coolex'
require 'test/unit'



module Coolex::Test::Unit



    class CoolexTest < Test::Unit::TestCase


        private
        def check_in_out(input, expected_output)
            perm = Coolex.multiset_permutations(input)
            output = perm.to_a
            assert_equal(expected_output, output, "Input #{input.inspect} handled incorrectly.")
        end


    end



end