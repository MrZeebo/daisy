//
//  main.swift
//  Daisy3Console
//
//  Created by Gregory Leedberg on 3/18/15.
//  Copyright (c) 2015 Gregory Leedberg. All rights reserved.
///Users/Greg/Library/Developer/Xcode/DerivedData/Daisy3Console-dgoipgcfqxicyafjrbxxlwtklllx/Build/Products/Debug

import Foundation
func boolToString(b : Bool) -> String {
    if (b) {
        return "true";
    }
    
    return "false";
}

func printTest(name : String, result : Bool) {
    print(name + ": " + boolToString(b: result));
}

func performTests() {
    // perform a bunch of tests to verify things are working OK
    
    print("Performing tests");
    
    // First just test the Sentence methods
    let testSentence = Sentence();
    
    printTest(name: "Empty sentence length", result: testSentence.length() == 0);
    
    printTest(name: "Empty sentence array", result: testSentence.getWords().count == 0);
    
    printTest(name: "Emtpy sentence getThreeWords length", result: testSentence.getThreeWords(start: 0).length() == 3);
    
    printTest(name: "Empty sentnce getThreeWords contents", result: testSentence.getThreeWords(start: 0).getWords()[2] == "");
    
    testSentence.addWord(word: "test");
    
    printTest(name: "1 word sentence length", result: testSentence.length() == 1);
    
    printTest(name: "1 word sentence array", result: testSentence.getWords()[0] == "test");
    
    printTest(name: "1 word sentence getThreeWords length", result: testSentence.getThreeWords(start: 0).length() == 3);
    
    printTest(name: "1 word snetence getThreeWords contents", result: testSentence.getThreeWords(start: 0).getWords()[0] == "test");
    
    testSentence.addWord(word: "second");
    
    printTest(name: "2 word sentence length", result: testSentence.length() == 2);
    
    printTest(name: "2 word sentence array[0]", result: testSentence.getWords()[0] == "test");
    
    printTest(name: "2 word sentence array[1]", result: testSentence.getWords()[1] == "second");
    
    printTest(name: "2 word sentence getThreeWords length", result: testSentence.getThreeWords(start: 0).length() == 3);
    
    printTest(name: "2 word snetence getThreeWords contents[0]", result: testSentence.getThreeWords(start: 0).getWords()[0] == "test");
    
    printTest(name: "2 word snetence getThreeWords contents[1]", result: testSentence.getThreeWords(start: 0).getWords()[1] == "second");
    
    printTest(name: "2 word snetence getThreeWords contents[2]", result: testSentence.getThreeWords(start: 0).getWords()[2] == "");
    
    testSentence.addWord(word: "third");
    
    printTest(name: "3 word sentence length", result: testSentence.length() == 3);
    
    printTest(name: "3 word sentence array[0]", result: testSentence.getWords()[0] == "test");
    
    printTest(name: "3 word sentence array[1]", result: testSentence.getWords()[1] == "second");
    
    printTest(name: "3 word sentence array[2]", result: testSentence.getWords()[2] == "third");
    
    printTest(name: "3 word sentence getThreeWords length", result: testSentence.getThreeWords(start: 0).length() == 3);
    
    printTest(name: "3 word snetence getThreeWords contents[0]", result: testSentence.getThreeWords(start: 0).getWords()[0] == "test");
    
    printTest(name: "3 word snetence getThreeWords contents[1]", result: testSentence.getThreeWords(start: 0).getWords()[1] == "second");
    
    printTest(name: "3 word snetence getThreeWords contents[2]", result: testSentence.getThreeWords(start: 0).getWords()[2] == "third");
    
    testSentence.addWord(word: "fourth");
    
    printTest(name: "4 word sentence length", result: testSentence.length() == 4);
    
    printTest(name: "4 word sentence array[0]", result: testSentence.getWords()[0] == "test");
    
    printTest(name: "4 word sentence array[1]", result: testSentence.getWords()[1] == "second");
    
    printTest(name: "4 word sentence array[2]", result: testSentence.getWords()[2] == "third");
    
    printTest(name: "4 word sentence array[3]", result: testSentence.getWords()[3] == "fourth");
    
    printTest(name: "4 word sentence getThreeWords(0) length", result: testSentence.getThreeWords(start: 0).length() == 3);
    
    printTest(name: "4 word snetence getThreeWords(0) contents[0]", result: testSentence.getThreeWords(start: 0).getWords()[0] == "test");
    
    printTest(name: "4 word snetence getThreeWords(0) contents[1]", result: testSentence.getThreeWords(start: 0).getWords()[1] == "second");
    
    printTest(name: "4 word snetence getThreeWords(0) contents[2]", result: testSentence.getThreeWords(start: 0).getWords()[2] == "third");
    
    printTest(name: "4 word sentence getThreeWords(1) length", result: testSentence.getThreeWords(start: 1).length() == 3);
    
    printTest(name: "4 word snetence getThreeWords(1) contents[0]", result: testSentence.getThreeWords(start: 1).getWords()[0] == "second");
    
    printTest(name: "4 word snetence getThreeWords(1) contents[1]", result: testSentence.getThreeWords(start: 1).getWords()[1] == "third");
    
    printTest(name: "4 word snetence getThreeWords(1) contents[2]", result: testSentence.getThreeWords(start: 1).getWords()[2] == "fourth");
    
    printTest(name: "4 word sentence getThreeWords(2) length", result: testSentence.getThreeWords(start: 2).length() == 3);
    
    printTest(name: "4 word snetence getThreeWords(2) contents[0]", result: testSentence.getThreeWords(start: 2).getWords()[0] == "third");
    
    printTest(name: "4 word snetence getThreeWords(2) contents[1]", result: testSentence.getThreeWords(start: 2).getWords()[1] == "fourth");
    
    printTest(name: "4 word snetence getThreeWords(2) contents[2]", result: testSentence.getThreeWords(start: 2).getWords()[2] == "");
    
    let secondSentence = Sentence();
    
    secondSentence.addWord(word: "new");
    secondSentence.addWord(word: "another");
    
    testSentence.addSentence(s: secondSentence);
    
    printTest(name: "addSentence length", result: testSentence.length() == 6);
    
    printTest(name: "addSentence last index", result: testSentence.getWords()[5] == "another");
    
    printTest(name: "length of string", result: secondSentence.getLengthOfString() == 12);
    
    testSentence.clear();
    
    printTest(name: "clear length", result: testSentence.length() == 0);
    
    printTest(name: "lastTwoWordsMatch empty sentence", result: secondSentence.lastTwoWordsMatch(s: testSentence) == false);
    
    testSentence.addWord(word: "nothing");
    testSentence.addWord(word: "new");
    
    printTest(name: "lastTwoWordsMatch mismatch", result: secondSentence.lastTwoWordsMatch(s: testSentence) == false);
    
    testSentence.addWord(word: "another");
    
    printTest(name: "lastTwoWordsMatch match", result: secondSentence.lastTwoWordsMatch(s: testSentence) == true);
    
    printTest(name: "clean no punc", result: secondSentence.clean(w: "test") == "test");
    
    printTest(name: "clean with punc", result: secondSentence.clean(w: "test!") == "test");
    
    testSentence.clear();
    secondSentence.clear();
    
    testSentence.addWord(word: "alpha"); // alpha
    secondSentence.addWord(word: "bravo"); // bravo
    
    printTest(name: "numMatches no matches", result: testSentence.numMatches(s: secondSentence) == 0);
    
    secondSentence.addWord(word: "alpha"); // bravo alpha
    
    printTest(name: "numMatches 1 match", result: testSentence.numMatches(s: secondSentence) == 1);
    
    testSentence.addWord(word: "delta");  // alpha delta
    secondSentence.addWord(word: "charlie") // bravo alha charlie
    secondSentence.addWord(word: "delta"); // bravo alpha charlie delta
    
    printTest(name: "numMathces 2 matches", result: testSentence.numMatches(s: secondSentence) == 2);
    
    testSentence.addWord(word: "echo");
    
    secondSentence.addWord(word: "echo?");
    
    printTest(name: "numMatches 3 matches with punc", result: testSentence.numMatches(s: secondSentence) == 3);
    
    //test blah
}


func input() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    return NSString(data: inputData, encoding:String.Encoding.utf8.rawValue)! as String

    
}

performTests();

var daisy = Daisy()

daisy.loadMemory();

var timeToQuit = false;


print("DAISY>" + daisy.response().getString());
while (!timeToQuit) {
fputs("YOU> ", __stderrp)

    let userInput = input()
    if (userInput != "bye\n") {
        print("DAISY> " + daisy.getResponse(input: userInput))
    } else {
        // user entered "bye"
        daisy.saveMemory();
        print("DAISY> Good bye!");
        timeToQuit = true
    }
}
