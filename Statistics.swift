//
//  Statistics.swift
//
//  Created by Tamer Zreg
//  Created on 2024-03-28
//  Version 1.0
//
// This program reads numbers from text files, calculates various statistics such as mean, median, and mode,
// and displays the results to the user.
//
// It reads each of the text files below containing a list of integers, uses an ArrayList to read the integers
// since the file size is unknown, copies the integers to an array of integers, displays the integers to the user,
// sorts the array, creates functions to calculate mean and median manually using loops, and calculates mode.
//
// Although built-in functions could be used for mean, median, and mode calculations, this program avoids them
// and manually implements these calculations using loops.
//
// The program is designed to be crash-proof, handling scenarios where input files are empty or not found.
//

import Foundation

// Define the Statistics class
class Statistics {
    
    // Define the main method
    static func main() {
        // Declare the file names for input
        let fileNames = ["./set1.txt", "./set2.txt", "./set3.txt"]
        
        // Error Checking
        do {
            for fileName in fileNames {
                // Calls function to read Integers from the specific file
                let numbers = try readIntegersFromFile(fileName: fileName)
                
                // If there is nothing in the file
                if numbers.isEmpty {
                    print("No numbers found in \(fileName)")
                    continue
                }
                
                // Calls a function that converts the Array List to an Array
                let numberArray = listToArray(list: numbers)
                
                print(fileName)
                
                // Calls function to calculate the mean
                let mean = calculateMean(numbers: numberArray)
                
                // Displays the calculated mean
                print("Mean: \(mean)")
                
                // Calls the function to calculate median
                let median = calculateMedian(numbers: numberArray)
                
                // If the Array is not Empty
                if !median.isNaN {
                    print("Median: \(median)")
                } else {
                    // If the Array is Empty
                    print("Median: Cannot be calculated from empty data")
                }
                
                // Calls the function to calculate the Mode
                let mode = calculateMode(numbers: numberArray)
                
                // Displays the Mode
                print("Mode: \(mode)")
                
                // Prints Empty Line
                print()
            }
        } catch {
            print("An error occurred: \(error.localizedDescription)")
        }
    }
    
    // Creates an integer Array List function that gets an input of a file name
    static func readIntegersFromFile(fileName: String) throws -> [Int] {
        // Creates a scanner specific for the file name
        let fileContent = try String(contentsOfFile: fileName)
        // Split the content by newline and map to integers
        let integers = fileContent.components(separatedBy: "\n").compactMap { Int($0) }
        // Return Array of Integers to main function
        return integers
    }
    
    // Function that converts the Array list to an Array
    static func listToArray(list: [Int]) -> [Int] {
        return list
    }
    
    static func calculateMean(numbers: [Int]) -> Double {
        // If the Array has no numbers
        if numbers.isEmpty {
            return Double.nan // Return NaN
        }
        
        // Initialize Sum to 0
        var sum = 0
        
        // For Each number in the list
        for num in numbers {
            // Adds the number to the sum
            sum += num
        }
        
        // Return Mean using Formula (sum / number of items)
        return Double(sum) / Double(numbers.count)
    }
    
    static func calculateMedian(numbers: [Int]) -> Double {
        if numbers.isEmpty {
            return Double.nan
        }
        
        // Sort the array
        let sortedNumbers = numbers.sorted()
        
        let length = sortedNumbers.count
        
        if length % 2 == 0 {
            return Double(sortedNumbers[length / 2 - 1] + sortedNumbers[length / 2]) / 2.0
        } else {
            return Double(sortedNumbers[length / 2])
        }
    }
    
    static func calculateMode(numbers: [Int]) -> Int {
        // Check if the array is empty
        if numbers.isEmpty {
            return 0 // No mode for empty data
        }
        
        // Initialize mode and maxCount
        var mode = numbers[0] // Assume first element as the mode
        var maxCount = 0 // Initialize the maximum count of any number
        
        // Loop through each element of the array
        for i in 0..<numbers.count {
            var count = 0 // Initialize count for each number
            
            // Loop through the array to count occurrences of the current number
            for j in 0..<numbers.count {
                if numbers[j] == numbers[i] { // If current element equals the checked element
                    count += 1 // Increment the count
                }
            }
            
            // Check if the count for the current number is greater than the maxCount
            if count > maxCount {
                maxCount = count // Update maxCount with the new maximum count
                mode = numbers[i] // Update the mode to the current number
            }
        }
        
        // Return the mode with the highest frequency
        return mode
    }
}

// Call the main method
Statistics.main()
