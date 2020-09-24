import System.IO

-- Prints a year long calendar to the console. [Call this one]
-- Limitation: cannot accept negative years
-- @param yyyy: Year
yCal:: Int -> IO ()
yCal yyyy = partCal 1 yyyy

-- Iterates from starting month to december
-- Limitation: Only works for a valid number of months
-- @param mm: Month
-- @param yyyy: Year
partCal:: Int -> Int -> IO ()
partCal 13 _    = return ()
partCal mm yyyy = mCal mm yyyy >> partCal (mm + 1) yyyy

--  Creates a single month calendar. [Call this one]
-- Limitation: None
-- @param mm: Month
-- @param yyyy: Year
mCal:: Int -> Int -> IO ()
mCal mm yyyy 
    | (mm >= 1) && (mm <= 12) && (yyyy > 0) = putStrLn str 
    |otherwise = putStrLn "Bad Input"
    where 
        m   = monthFromInt mm
        str = "\n   " ++ m ++ " " ++ show (yyyy) ++ "\n M Tu  W Th  F Sa Su\n" ++ (assembleCal (detWeekDay 1 mm yyyy) 0 (detEndday mm yyyy) ++ "\n")

--  Assembles a single calendar
-- Limitation: Only assembles a single months calendar
-- @param wd: Starting weekday
-- @param dd: First number of the week
-- @param sd: Stop day
assembleCal:: Int -> Int -> Int -> String
assembleCal wd dd sd 
    | wd /= 0           = calLine [(1 - wd) .. (7 - wd)] sd ++ "\n" ++ assembleCal 0 (7 - wd) sd
    | (dd + 7) <= sd    = calLine [(1 + dd) .. (7 + dd)] sd ++ "\n" ++ assembleCal 0 (dd + 7) sd
    | otherwise         = calLine [(1 + dd) .. (7 + dd)] sd

-- Turns an array into a string with formatting
-- Limitation: Excepts that x will be less than y to function correctly.
-- @param (x:xs): The array of ints
-- @param y: End value of the month
-- @returns {String}: A single line of the calendar
calLine:: [Int] -> Int -> String
calLine [] _ = []
calLine (x:xs) y
    | x > 0 && x < 10   = " " ++ show x ++ " " ++ calLine xs y
    | x > 0 && x <= y   = show x ++ " " ++ calLine xs y
    | otherwise         = "   " ++ calLine xs y

-- Determines the day of the week
-- Limitation: Does not validate month (must be between 1 and 12) or year (must be postive)
-- @param dd: Day
-- @param mm: Month 
-- @param yyyy: Year
-- @return {Int}: representing the first day of the month. (0=Monday, ... , 6=Sunday)
detWeekDay:: Int -> Int -> Int -> Int 
detWeekDay dd mm yyyy 
    | w < 0     = w + 7
    | otherwise = w
    where
        y = (specialMonth mm yyyy) `mod` 100
        c = (specialMonth mm yyyy - y) `div` 100
        m = shiftMonth mm
        w = (dd + floor (2.6 * toRational m - 0.2) + y + floor (toRational (y) * 0.25) + floor (toRational (c) * 0.25) - (2 * c)) `mod` 7 - 1

--  Determines if the month is a special month for detWeekDay
-- Limitation: None
-- @param : Month
-- @param yyyy: Year
specialMonth:: Int -> Int -> Int
specialMonth 1 yyyy = yyyy - 1
specialMonth 2 yyyy = yyyy - 1
specialMonth _ yyyy = yyyy

--  Determines the last day of the month
-- Limitation: Does not validate bad months or years but will return a value
-- @param mm: Month
-- @param yyyy:  Year
detEndday:: Int -> Int -> Int
detEndday mm yyyy
    | mm == 2 && isLeap yyyy = 29
    | otherwise              = 28 + ((mm + floor (toRational mm * 0.125)) `mod` 2) + 2 `mod` mm

-- Determines if a year is a leap year
-- Limitation: Does not validate for negative years
-- @param yyyy: the year
isLeap:: Int ->  Bool
isLeap yyyy
    | (yyyy `mod` 4)   /= 0 = False
    | (yyyy `mod` 100) /= 0 = True
    | (yyyy `mod` 400) /= 0 = False
    | otherwise             = True
 
--  Shifts months for detWeekDay
-- Limitation: None
-- @param x: Initial Month
shiftMonth:: Int -> Int
shiftMonth 1 = 11
shiftMonth 2 = 12
shiftMonth x = x - 2

-- Returns a centered month name based on an int
-- Limitation: None
-- @param x: month
monthFromInt:: Int -> String
monthFromInt 1  = " January "
monthFromInt 2  = "February "
monthFromInt 3  = "  March  "
monthFromInt 4  = "  April  "
monthFromInt 5  = "   May   "
monthFromInt 6  = "  June   "
monthFromInt 7  = "  July   "
monthFromInt 8  = " August  "
monthFromInt 9  = "September"
monthFromInt 10 = " October "
monthFromInt 11 = "November "
monthFromInt 12 = "December "
monthFromInt _  = "" 