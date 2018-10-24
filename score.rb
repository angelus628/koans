# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.


def score(dice)
  # You need to write this method
  sum = 0
  equals = Hash.new(0)
  return sum if dice.size == 0
  return sum if dice.select { |roll| roll > 6 || roll < 0 }.size > 0

  dice.each { |roll| equals[roll] += 1 }

  (1..6).each do |number|
      if number == 1
          sum += 1200 if equals[number] == 5
          sum += 1100 if equals[number] == 4
          sum += 1000 if equals[number] == 3
          sum += equals[number] * 100 if equals[number] < 3
      elsif number == 5
          sum += 600 if equals[number] == 5
          sum += 550 if equals[number] == 4
          sum += number * 100 if equals[number] == 3
          sum += equals[number] * 50 if equals[number] < 3
      elsif equals[number] == 3
        sum += number * 100
      end
  end
  sum
end


print score([1,1,1,5,1]), " = 1150"
puts
print score([2,3,4,6,2]), " = 0"
puts
print score([3,4,5,3,3]), " = 350"
puts
print score([1,5,1,2,4]), " = 250"
puts
print "200 = ", score([2,2,2])
puts
print "300 = ", score([3,3,3])
puts
print "400 = ", score([4,4,4])
puts
print "500 = ", score([5,5,5])
puts
print "600 = ", score([6,6,6])
puts
print score([1,5,1,2,1]), " = 1050"
puts
print "250 = ", score([2,5,2,2,3])
puts
print "550 = ", score([5,5,5,5])
puts
print "1100 = ", score([1,1,1,1])
puts
print "1200 = ", score([1,1,1,1,1])
puts
print "1150 = ", score([1,1,1,5,1])
puts
