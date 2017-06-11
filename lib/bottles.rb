class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = bottle_number_for(number)
    next_bottle_number = bottle_number_for(bottle_number.successor)

    "#{bottle_number.quantity.capitalize} #{bottle_number.container} of beer on the wall, " +
    "#{bottle_number.quantity} #{bottle_number.container} of beer.\n" +
    "#{bottle_number.action}" +
    "#{next_bottle_number.quantity} #{next_bottle_number.container} of beer on the wall.\n"
  end

  def bottle_number_for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(number)
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def action
    "Take #{pronoun} down and pass it around, "
  end

  def successor
    number - 1
  end

  def quantity
    number.to_s
  end

  def pronoun
    "one"
  end

  def container
    "bottles"
  end
end

class BottleNumber0 < BottleNumber
  def action
   "Go to the store and buy some more, "
  end

  def successor
   99
  end

  def quantity
    "no more"
  end
end

class BottleNumber1 < BottleNumber
  def pronoun
    "it"
  end

  def container
    "bottle"
  end
end

