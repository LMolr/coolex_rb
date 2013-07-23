module Coolex



  module Utils


    class LinkedList
      include Comparable
      attr_accessor :value, :next


      def initialize(value = 0)
        @value = value
        @next = nil
      end


      def to_a
        a = []
        cur = self
        until (cur.nil?)
          a << cur.value
          cur = cur.next
        end
        a
      end


      def <=>(other)
        @value <=> other.value
      end


    end


  end



end