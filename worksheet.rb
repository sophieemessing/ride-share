#########################################################
# Step 1: Establish the layers
#
# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?
#
# Layer 1: drivers (hash). each driver ID is a key. their values are arrays containing all ride data for each driver.
#   Layer 2: rides (an array of hashes for each driver)
#     Layer 3: ride (individual ride hashes storing {:date, :cost, :rider_id, :rating} for each ride event)
#
#########################################################
# Step 2: Assign a data structure to each layer
#
# Copy your list from above, and in this section
# determine what data structure each layer should have
#
# rides = {
#         DR0001: [array of ride hashes],
#         DR0002: [array of ride hashes],
#         DR0003: [array of ride hashes],
#         DR0004: [array of ride hashes]
#         }


########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

drivers = {
    DR0001: [
            {date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3},
            {date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4},
            {date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2}
            ],
    DR0002:
            [
            {date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5},
            {date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1},
            {date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3}
            ],
    DR0003:
            [
            {date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5},
            {date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2}
            ],
    DR0004:
            [
            {date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5},
            {date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4},
            {date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5}
            ]
}


########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?


def calculate_driver_stats(drivers)

  earnings = {}
  avg_ratings = {}

  drivers.each do |driver, rides|

    total_earnings = rides.reduce(0) { |sum, ride| sum + ride[:cost] }

    rating_total = rides.reduce(0) { |sum, ride| sum.to_f + ride[:rating] }
    avg_rating = rating_total.to_f / rides.length

    puts "#{driver} has given #{rides.length} rides and earned a total of $#{total_earnings}. Their average rating is #{avg_rating}."

    earnings[driver] = total_earnings
    avg_ratings[driver] = avg_rating

  end
  return [earnings, avg_ratings]
end

earnings, avg_ratings = calculate_driver_stats(drivers)

def calculate_highest(hash)
  sorted_hash = hash.sort_by { |driver, stat| stat }
  sorted_hash.reverse!
  return sorted_hash[0][0]
end

max_earnings_driver = calculate_highest(earnings)
highest_avg_driver = calculate_highest(avg_ratings)

puts "#{max_earnings_driver} earned the most, earning $#{earnings[max_earnings_driver]}"
puts "#{highest_avg_driver} had the highest average rating of #{avg_ratings[highest_avg_driver]}"
