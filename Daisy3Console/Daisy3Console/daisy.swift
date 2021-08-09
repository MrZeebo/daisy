//
//  daisy.swift
//  Daisy3Console
//
//  Created by Gregory Leedberg on 3/22/15.
//  Copyright (c) 2015 Gregory Leedberg. All rights reserved.
//

import Foundation

// TODO Make methods self-contained so that they can more easily be unit tested!!
class Sentence {
    private var words = [String]();
    private var notGreat  = false;
  
    
    func getWords() -> [String] {
        return words;
    }
    
    func setNotGreat(val :Bool) {
        notGreat = val;
    }
    
    func isNotGreat() -> Bool {
        return notGreat;
    }

    
    func addWord(word : String) {
        words.append(word);
    }
    
    func addSentence(s : Sentence) {
        for w in s.getWords() {
            addWord(word: w);
        }
    }
    
    func getString() -> String {
        var myString = "";
        
        for s in words {
            myString += (s + " ");
        }
        
        return myString;
    }
    
    func getLengthOfString() -> Int {
        let s = getString();
        
        return s.count;
    }
    
    func clear() {
        words = [String]();
    }
    
    func length() -> Int {
        return words.count;
    }
    
    func getThreeWords(start : Int) -> Sentence {
        // Return three words starting at the given position
        // (or until the end of the sentence)
        let retVal = Sentence();
        var i = 0;
       while (i < 3 && i+start < words.count) {
          retVal.addWord(word: words[i+start]);
        
          i += 1;
        } ;
        
        // If less than 3, add 3 empty words, just so that we are actually
        // returning 3 words
        while (retVal.length() < 3) {
            retVal.addWord(word: "");
        }
        
        return retVal;
    }
    
    func lastTwoWordsMatch(s: Sentence) -> Bool {
        if (words.count < 2 || s.words.count < 2) {
            return false;
        } else {
            let s1 = words[words.count - 2];
            let s2 = words[words.count - 1];
            let t1 = s.words[s.words.count - 2];
            let t2 = s.words[s.words.count - 1];
            
            return s1 == t1 && s2 == t2;
        }
    }
    
    // Return a given string without punctuation
    func clean(w : String) -> String {
        var retVal  = "";
        
        for char in w {
            if (!isPunc(c: char)) {
                retVal.append(char);
            }
        }
        
        return retVal;
    }
    
    // Return true if a given character is punctuation
    func isPunc(c : Character) -> Bool {
        return c == "!" ||
            c == "," ||
            c == "." ||
            c == "?";
    }
    
    // Count the number of words that match between this and the supplied sentence, comparing words cleanly
    func numMatches(s: Sentence) -> Int {
        var matches = 0;
        
        // Loop over all words in this sentence...
        for w in words {
            // Loop over all words in the given sentence, looking for a match...
            for w2 in s.getWords() {
                // If find a match, increment count and move onto next
                if (clean(w: w) == clean(w: w2)) {
                    matches += 1;
                    break;
                }
               
            
            
               
            }
        }
    return matches;

    }
    
    
}

class Daisy {
    // learned data
    private var memory = [Sentence]();
    
    // pre-generated cache of sentences
    private var buffer = [Sentence]();
    
    // List of keywords from last sentence
    private var lastSubs = Sentence();
    
    // Time we started trying to generate the current response
    // (used to determine when too much time has passed)
    private var startTime = NSDate();
    
    // TODO make this configurable?
    private var daisyName = "Daisy";
    
    // TODO Need to get this from the user
    private var userName = "Greg";
    
    func createBuffer() {
        // TODO: Create the buffer of pre-generated sentences, not needed at first
    }
    
    // Compares the current time against the "start time" to see if > 5 seconds have passed
    func tooLong() -> Bool {
        // Get the current time
        let now = NSDate();
        
        // Get the difference, in seconds
        let secondsElapsed = now.timeIntervalSince(startTime as Date);
        
        var retVal = false;
        
        if (secondsElapsed >= 5) {
            retVal = true;
        }
        
        return retVal;
    }
    
    private func parse(input :String) -> Sentence {
        // Parse the user input into a sentence
        let retVal = Sentence();
        
        // trim off newlines
        let newString = input.trimmingCharacters(in: NSCharacterSet.newlines);
        
        // split by spaces
        let split = newString.components(separatedBy: " ");
        
        
        for  s in split {
            retVal.addWord(word: s);
        }
        
        return retVal;
    }
    
    func learn(sentence :Sentence) {
        // Add to memory based on sentence
        memory.append(sentence);
    }
    
    func percent(searchWord :String) -> Int {
        // Calculate the percentage occurrence of the given word
        var totalWords = 0;
        var occurrencesOfWord = 0;
        
        for sentence in memory {
            for word in sentence.getWords() {
                totalWords += 1;
                
                if searchWord.uppercased() == word.uppercased() {
                    occurrencesOfWord += 1;
                }
                
            }
        }
        return Int(round(100.0 * Double(occurrencesOfWord) / Double(totalWords)));
        
    }
    
    func bestResponse(sentence :Sentence) -> Sentence {
        // Set the start time, in order to keep track of how long we've been trying
        // to generate a response
        startTime = NSDate();
        
        var retVal = Sentence();
        
        // Iterate over the words in the sentence and determine what the 
        // percent occurrence is for each word, and what the lowest overall is
        var lowestPercent = 101;
        for word in sentence.getWords() {
            let pct = percent(searchWord: word);
            
            if (pct < lowestPercent) {
                lowestPercent = pct;
            }
        }
        
        // Start creating a keyword sentence by starting it with the last subjects
        let keywords = Sentence();
        
        for sub in lastSubs.getWords() {
            keywords.addWord(word: sub);
        }
        
        // Clear the last subjects list
        lastSubs.clear();
        
        // Iterate again over the sentence and for each word whose percent
        // occurrence is equal the lowest value (i.e., it's a unique word),
        // add it to the keyword list AND to the last subjects list (for the
        // benefit of the next sentence)
        for word in sentence.getWords() {
            let pct = percent(searchWord: word);
            
            if (pct == lowestPercent) {
                keywords.addWord(word: word);
                lastSubs.addWord(word: word);
            }
        }
        
        // If no keywords and no input sentence, then just generate a random one
        if (keywords.length() == 0) {
            retVal =  response();
        } else {
        
            // Otherwise, loop....
            // sentence # from buffer
            var totalSent = 0;
            
            // # of matching words
            var count = 0;
            
    
            
            // # we're on in the above list
            var created = 1;
            

            
            // maximum number of possible sentences to consider
            let possibleMax = 10;
            
            // list of all possible sentences (those with > 0 matches)
            var possible = [Sentence](repeating: Sentence(), count: possibleMax )
            
            // for each sentence in possible[], the # of matching words
            var matches = [Int]( repeating: 0, count: possibleMax);
            
            repeat {
                repeat {
                    if (totalSent >= buffer.count) {
                        // If we've already used all of our pre-generated buffer sentences, then generate a new random one using Response
                        possible[0] = response();
                    } else {
                        // Otherwise, use the next pre-generated one.
                        possible[0] = buffer[totalSent];
                    }
                
                    totalSent += 1;
                
            
                    // Either way, compare this sentence to our keywords list, count the overlap (cleanly, ignoring punctuation)
                    count = possible[0].numMatches(s: keywords);
                    
                    // Loop if no match, until we either get > 0 matches or too much time has passed (TooLong)

                } while (count == 0 && !tooLong())
                // if too much time has passed, we'll just go with possible[0]....
            
                // Once we've broken out of that loop, save that sentence as our next possible one
                possible[created] = possible[0];
            
                // If longer than 70 characters, flag as possibly too long
                if (possible[created].getLengthOfString() > 70) {
                    possible[created].setNotGreat(val: true);
                }
            
                // Also, remember what the # of matching words was for this sentence
                matches[created] = count;
                
                created += 1;
            
            // Rpeat until we've generate the desired number of matches (PossibleMax) or too much time has passed (TooLong)
            } while (created < possibleMax && !tooLong());
            // If it gets too be too much time, we'll just go with what we have...
            // When done, find the sentence with the highest # of matching words
            var highestMatchIndex = 1;
            var i = 1;
            while (i < matches.count) {
                if matches[i] > matches[highestMatchIndex] {
                    highestMatchIndex = i;
                }
                
                i += 1;
            } ;
            
            if possible[highestMatchIndex].isNotGreat() {
                // If this was flagged as too long, then see if there exists a second-best sentence that isn't flagged, use that instead
                
                // loop from 1 until the 2nd highest number of matches
                var l = 1;
                
                while (l < matches[highestMatchIndex]) {
                    // loop over each created sentence
                    var l2 = 1;
                    while (l2 < created) {
                        // If this sentence has that number of matches and is
                        // not flagged as too long...
                        if (matches[l2] == l && !possible[l2].isNotGreat()) {
                            // remember it!
                            count = l2;
                            
                            // (we'll keep looping, so we'll end up remember whatever
                            // the highest-matching one is)
                        }
                        
                        l2 += 1;
                    } ;
                    
                    l += 1;
                } ;

            }
        
            // Return the selected sentence
            retVal = possible[count];
        
        }
        // shouldn't get here
        return retVal;
    }
    
    func returnPattern(lastWord : String) -> Sentence {
        // return a sequence of 3 words that could come after lastWord
        var retVal = Sentence();
        
        // Count number of instances of lastword in memory
        var count = 0;
        for s in memory {
            for w in s.getWords() {
                if w.uppercased() == lastWord.uppercased() {
                    count += 1;
                }
            }
        }
        
        // Pick a random one of those occurrences
        let target = Int(arc4random_uniform(UInt32(count)));
    
        
        // Now loop back to that instance
        var i = 0;
        outer_loop: for s in memory {
            var j = 0;
            
            while (j < s.getWords().count) {
                let w = s.getWords()[j];
            
                if w.uppercased() == lastWord.uppercased() {
                    if (i == target) {
                        // found it!
                        retVal = s.getThreeWords(start: j+1);
                        
                        break outer_loop;
                    } else {
                        i += 1;
                    }
                }
                
                j += 1;
            } ;

        }
        return retVal;
    }
    
    /* Iterate over the sentence, looking for the A B A pattern.  That's not a good
     * pattern, so mark this sentence as not good if it appears */

    func checkNotGreat(s :Sentence) {
        var i = 0;
        
        while (i+2 < s.getWords().count) {
            let w1 = s.getWords()[i];
            let w2 = s.getWords()[i+2];
            
            if (w1 == w2) {
                s.setNotGreat(val: true);
            }
            
            i += 1;
        } ;

    }
    
    func terminator(s : Sentence) -> Bool {
        // takes a sequence of three words, returns true if this sequence seems like
        // it could terminate a sentence, based on these criteria:
        // 1) Contains less than three words
        // 2) The last two words come at the end of some sentence in the memory
        
        if (s.getWords().count < 3) {
            // less than three
            return true;
        } else {
            // Iterate over each sentence....
            for m in memory {
                if m.lastTwoWordsMatch(s: s) {
                    return true;
                }
            }
        }
        
        return false;
    }
    
    func response() -> Sentence {
       
        
        var tempResponse = Sentence();
        if (memory.count > 0) {
          
            
            let sentCount = memory.count;
            
            // Pick a random sentence
            let loop = Int(arc4random_uniform(UInt32(sentCount)));
            
            let firstSentence = memory[loop];
           
            
            var threeWords = firstSentence.getThreeWords(start: 0);
            
            
            tempResponse = threeWords;
         
            // flag to indicate the we've encountered a valid end-of-sentence
            var terminate = false;
            
            repeat {
                let lastWord = threeWords.getWords()[2];
              
                
                // get new pattern based on last word
                threeWords = returnPattern(lastWord: lastWord);
                
                // create sentence, then use checkNotGreat
                tempResponse.addSentence(s: threeWords);
                
                // check if this sentence seems not great
                checkNotGreat(s: tempResponse);
                terminate = terminator(s: threeWords);
            } while (!terminate);
            
            return tempResponse;
        }
        
        
        return Sentence();
    }
    
    
    func okay(sentence: Sentence) -> Sentence {
        // Tidy up the supplied sentence:
        // -All lower case
        // -If Daisy's name appears, replace it with user's name
        // -Get rid of spaces at start
        let retVal = Sentence();
        
        for word in sentence.getWords() {
            // convert to lower case
            var newWord = word.lowercased();
            
            // check for daisy's name
            if newWord == daisyName.lowercased() {
                newWord = userName;
            }
            
            retVal.addWord(word: newWord);
            
        }
        
        return retVal;
    }
    
    func saveMemory() {
        // Save current memory to file
        let file = "daisy.bfb"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            var text = ""
            
            let fileURL = dir.appendingPathComponent(file)

            //writing
            do {
                for sentence in memory {
                    for word in sentence.getWords() {
                        text = text + word + "\n";
                    }
                    text = text + "***\n";
                }
                
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
    
    func loadMemory() {
        // Load memory from file
        let file = "daisy.bfb";
        
        // For reading inside the bundle: Bundle.main.path(forResource: file, ofType: "bfb")
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(file);

            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                
                let myStrings = text2.components(separatedBy: .newlines)
                var s = Sentence();
                for line in myStrings {
                    if (line == "***") {
                        // found end of one sentence
                        memory.append(s);
                        s = Sentence();
                    } else {
                        // keep building
                        s.addWord(word: line);
                    }
                }
            }
            catch {/* error handling here */}
        }

    }
    
    // Handles the work of generating a response, given a user input
    func getResponse(input :String) -> String {
        let sentence = parse(input: input);
        

        
        learn(sentence: sentence);
        
        let myResponse = okay(sentence: bestResponse(sentence: sentence));
        
        return myResponse.getString();
    }
}
