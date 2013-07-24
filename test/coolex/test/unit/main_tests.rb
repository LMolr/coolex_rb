require 'coolex'
require 'coolex/test/unit/helpers'
require 'test/unit'



module Coolex::Test::Unit



        class MainTests < CoolexTest


            # Dataset for testing the normal operation (no boundary cases).
            # TODO: move to external file
            TEST_DATA_NORMAL = [ # Warning: long wall of data, fold me!
                [ # test 0
                    # input
                    [1, 1, 1],
                    [ # expected output
                        [2, 1, 0],
                        [0, 2, 1],
                        [2, 0, 1],
                        [1, 2, 0],
                        [0, 1, 2],
                        [1, 0, 2]
                    ]
                ],
                [ # test 1
                    # input
                    [2, 2, 2],
                    [ #expected output
                        [2, 2, 1, 1, 0, 0],
                        [0, 2, 2, 1, 1, 0],
                        [2, 0, 2, 1, 1, 0],
                        [2, 2, 0, 1, 1, 0],
                        [1, 2, 2, 0, 1, 0],
                        [2, 1, 2, 0, 1, 0],
                        [0, 2, 1, 2, 1, 0],
                        [2, 0, 1, 2, 1, 0],
                        [1, 2, 0, 2, 1, 0],
                        [0, 1, 2, 2, 1, 0],
                        [1, 0, 2, 2, 1, 0],
                        [2, 1, 0, 2, 1, 0],
                        [2, 2, 1, 0, 1, 0],
                        [0, 2, 2, 1, 0, 1],
                        [2, 0, 2, 1, 0, 1],
                        [2, 2, 0, 1, 0, 1],
                        [0, 2, 2, 0, 1, 1],
                        [2, 0, 2, 0, 1, 1],
                        [0, 2, 0, 2, 1, 1],
                        [0, 0, 2, 2, 1, 1],
                        [2, 0, 0, 2, 1, 1],
                        [2, 2, 0, 0, 1, 1],
                        [1, 2, 2, 0, 0, 1],
                        [2, 1, 2, 0, 0, 1],
                        [0, 2, 1, 2, 0, 1],
                        [2, 0, 1, 2, 0, 1],
                        [1, 2, 0, 2, 0, 1],
                        [0, 1, 2, 2, 0, 1],
                        [1, 0, 2, 2, 0, 1],
                        [2, 1, 0, 2, 0, 1],
                        [0, 2, 1, 0, 2, 1],
                        [2, 0, 1, 0, 2, 1],
                        [0, 2, 0, 1, 2, 1],
                        [0, 0, 2, 1, 2, 1],
                        [2, 0, 0, 1, 2, 1],
                        [1, 2, 0, 0, 2, 1],
                        [0, 1, 2, 0, 2, 1],
                        [1, 0, 2, 0, 2, 1],
                        [0, 1, 0, 2, 2, 1],
                        [0, 0, 1, 2, 2, 1],
                        [1, 0, 0, 2, 2, 1],
                        [2, 1, 0, 0, 2, 1],
                        [2, 2, 1, 0, 0, 1],
                        [1, 2, 2, 1, 0, 0],
                        [2, 1, 2, 1, 0, 0],
                        [1, 2, 1, 2, 0, 0],
                        [1, 1, 2, 2, 0, 0],
                        [2, 1, 1, 2, 0, 0],
                        [0, 2, 1, 1, 2, 0],
                        [2, 0, 1, 1, 2, 0],
                        [1, 2, 0, 1, 2, 0],
                        [0, 1, 2, 1, 2, 0],
                        [1, 0, 2, 1, 2, 0],
                        [2, 1, 0, 1, 2, 0],
                        [1, 2, 1, 0, 2, 0],
                        [1, 1, 2, 0, 2, 0],
                        [0, 1, 1, 2, 2, 0],
                        [1, 0, 1, 2, 2, 0],
                        [1, 1, 0, 2, 2, 0],
                        [2, 1, 1, 0, 2, 0],
                        [0, 2, 1, 1, 0, 2],
                        [2, 0, 1, 1, 0, 2],
                        [1, 2, 0, 1, 0, 2],
                        [0, 1, 2, 1, 0, 2],
                        [1, 0, 2, 1, 0, 2],
                        [2, 1, 0, 1, 0, 2],
                        [0, 2, 1, 0, 1, 2],
                        [2, 0, 1, 0, 1, 2],
                        [0, 2, 0, 1, 1, 2],
                        [0, 0, 2, 1, 1, 2],
                        [2, 0, 0, 1, 1, 2],
                        [1, 2, 0, 0, 1, 2],
                        [0, 1, 2, 0, 1, 2],
                        [1, 0, 2, 0, 1, 2],
                        [0, 1, 0, 2, 1, 2],
                        [0, 0, 1, 2, 1, 2],
                        [1, 0, 0, 2, 1, 2],
                        [2, 1, 0, 0, 1, 2],
                        [1, 2, 1, 0, 0, 2],
                        [1, 1, 2, 0, 0, 2],
                        [0, 1, 1, 2, 0, 2],
                        [1, 0, 1, 2, 0, 2],
                        [1, 1, 0, 2, 0, 2],
                        [0, 1, 1, 0, 2, 2],
                        [1, 0, 1, 0, 2, 2],
                        [0, 1, 0, 1, 2, 2],
                        [0, 0, 1, 1, 2, 2],
                        [1, 0, 0, 1, 2, 2],
                        [1, 1, 0, 0, 2, 2],
                        [2, 1, 1, 0, 0, 2]
                    ]
                ]
            ]

            # Define a test method for each test example
            TEST_DATA_NORMAL.each_with_index do |test, idx|
                define_method(:"test_in_out_#{idx}") do
                    check_in_out(test[0], test[1])
                end
            end


            # Dataset for testing when the multiset specified by the input
            # cardinalities degenerates to an empty multiset.
            TEST_DATA_EMPTY = (1..100).collect do |n|
                input = n.times.collect { 0 }
                expected_output = [ [] ]
                [input, expected_output]
            end

            TEST_DATA_EMPTY.each_with_index do |test, idx|
                define_method(:"test_empty_#{idx}") do
                    check_in_out(test[0], test[1])
                end
            end


        end



end