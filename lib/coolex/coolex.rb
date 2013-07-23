require 'coolex/utils/linked_list'



module Coolex



  def self.multiset_permutations(cards)
    CoolexPermutation.new(cards)
  end



  def self.expand_cardinalities(cards)
    cards.each_with_index.collect do |how_many, i|
      [i] * how_many
    end.flatten
  end



  class CoolexInner
    attr_reader :cards, :kinds, :total, :perm, :state, :first, :h, :i, :t


    def initialize(cards)
      @cards = cards
      @kinds = cards.length
      @total = cards.inject(:+)
      @perm = Coolex.expand_cardinalities(cards)
      @first = true

      @h = nil
      @i = nil

      @perm.each_with_index do |item, idx|
        @t = Coolex::Utils::LinkedList.new(item)
        @t.next = @h
        @h = @t

        if (!@h.next.nil? && @h.next > @h)
          raise 'decreasing values in input array'
        end

        if (idx + 1 == 2)
          @i = @h
        end
      end
    end


    def next
      if @first
        set_state
        @first = false
        return @perm
      end

      # INF: j, s, t are local
      j = @i.next

      if (!j.next.nil? || j < @h)

        # { do iteration
        s = (!j.next.nil? && @i >= j.next) ? j : @i

        t = s.next
        s.next = t.next
        t.next = @h

        if (t < @h)
          @i = t
        end

        j = @i.next
        @h = t
        set_state
        # }
        return @perm
      end

      return nil
    end


    private


    def set_state
      @perm = @h.to_a
    end


  end



  class CoolexPermutation
    include Enumerable


    def initialize(cards)
      @cards = cards
    end


    def each
      mp = CoolexInner.new(@cards)

      return to_enum unless block_given?

      loop do
        n = mp.next
        break if n.nil?
        yield n
      end
    end


  end



end