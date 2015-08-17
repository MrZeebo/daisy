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
    println(name + ": " + boolToString(result));
}

func performTests() {
    // perform a bunch of tests to verify things are working OK
    
    println("Performing tests");
    
    // First just test the Sentence methods
    var testSentence = Sentence();
    
    printTest("Empty sentence length", testSentence.length() == 0);
    
    printTest("Empty sentence array", testSentence.getWords().count == 0);
    
    printTest("Emtpy sentence getThreeWords length", testSentence.getThreeWords(0).length() == 3);
    
    printTest("Empty sentnce getThreeWords contents", testSentence.getThreeWords(0).getWords()[2] == "");
    
    testSentence.addWord("test");
    
    printTest("1 word sentence length", testSentence.length() == 1);
    
    printTest("1 word sentence array", testSentence.getWords()[0] == "test");
    
    printTest("1 word sentence getThreeWords length", testSentence.getThreeWords(0).length() == 3);
    
    printTest("1 word snetence getThreeWords contents", testSentence.getThreeWords(0).getWords()[0] == "test");
    
    testSentence.addWord("second");
    
    printTest("2 word sentence length", testSentence.length() == 2);
    
    printTest("2 word sentence array[0]", testSentence.getWords()[0] == "test");
    
    printTest("2 word sentence array[1]", testSentence.getWords()[1] == "second");
    
    printTest("2 word sentence getThreeWords length", testSentence.getThreeWords(0).length() == 3);
    
    printTest("2 word snetence getThreeWords contents[0]", testSentence.getThreeWords(0).getWords()[0] == "test");
    
    printTest("2 word snetence getThreeWords contents[1]", testSentence.getThreeWords(0).getWords()[1] == "second");
    
    printTest("2 word snetence getThreeWords contents[2]", testSentence.getThreeWords(0).getWords()[2] == "");
    
    testSentence.addWord("third");
    
    printTest("3 word sentence length", testSentence.length() == 3);
    
    printTest("3 word sentence array[0]", testSentence.getWords()[0] == "test");
    
    printTest("3 word sentence array[1]", testSentence.getWords()[1] == "second");
    
    printTest("3 word sentence array[2]", testSentence.getWords()[2] == "third");
    
    printTest("3 word sentence getThreeWords length", testSentence.getThreeWords(0).length() == 3);
    
    printTest("3 word snetence getThreeWords contents[0]", testSentence.getThreeWords(0).getWords()[0] == "test");
    
    printTest("3 word snetence getThreeWords contents[1]", testSentence.getThreeWords(0).getWords()[1] == "second");
    
    printTest("3 word snetence getThreeWords contents[2]", testSentence.getThreeWords(0).getWords()[2] == "third");
    
    testSentence.addWord("fourth");
    
    printTest("4 word sentence length", testSentence.length() == 4);
    
    printTest("4 word sentence array[0]", testSentence.getWords()[0] == "test");
    
    printTest("4 word sentence array[1]", testSentence.getWords()[1] == "second");
    
    printTest("4 word sentence array[2]", testSentence.getWords()[2] == "third");
    
    printTest("4 word sentence array[3]", testSentence.getWords()[3] == "fourth");
    
    printTest("4 word sentence getThreeWords(0) length", testSentence.getThreeWords(0).length() == 3);
    
    printTest("4 word snetence getThreeWords(0) contents[0]", testSentence.getThreeWords(0).getWords()[0] == "test");
    
    printTest("4 word snetence getThreeWords(0) contents[1]", testSentence.getThreeWords(0).getWords()[1] == "second");
    
    printTest("4 word snetence getThreeWords(0) contents[2]", testSentence.getThreeWords(0).getWords()[2] == "third");
    
    printTest("4 word sentence getThreeWords(1) length", testSentence.getThreeWords(1).length() == 3);
    
    printTest("4 word snetence getThreeWords(1) contents[0]", testSentence.getThreeWords(1).getWords()[0] == "second");
    
    printTest("4 word snetence getThreeWords(1) contents[1]", testSentence.getThreeWords(1).getWords()[1] == "third");
    
    printTest("4 word snetence getThreeWords(1) contents[2]", testSentence.getThreeWords(1).getWords()[2] == "fourth");
    
    printTest("4 word sentence getThreeWords(2) length", testSentence.getThreeWords(2).length() == 3);
    
    printTest("4 word snetence getThreeWords(2) contents[0]", testSentence.getThreeWords(2).getWords()[0] == "third");
    
    printTest("4 word snetence getThreeWords(2) contents[1]", testSentence.getThreeWords(2).getWords()[1] == "fourth");
    
    printTest("4 word snetence getThreeWords(2) contents[2]", testSentence.getThreeWords(2).getWords()[2] == "");
    
    var secondSentence = Sentence();
    
    secondSentence.addWord("new");
    secondSentence.addWord("another");
    
    testSentence.addSentence(secondSentence);
    
    printTest("addSentence length", testSentence.length() == 6);
    
    printTest("addSentence last index", testSentence.getWords()[5] == "another");
    
    printTest("length of string", secondSentence.getLengthOfString() == 12);
    
    testSentence.clear();
    
    printTest("clear length", testSentence.length() == 0);
    
    printTest("lastTwoWordsMatch empty sentence", secondSentence.lastTwoWordsMatch(testSentence) == false);
    
    testSentence.addWord("nothing");
    testSentence.addWord("new");
    
    printTest("lastTwoWordsMatch mismatch", secondSentence.lastTwoWordsMatch(testSentence) == false);
    
    testSentence.addWord("another");
    
    printTest("lastTwoWordsMatch match", secondSentence.lastTwoWordsMatch(testSentence) == true);
    
    printTest("clean no punc", secondSentence.clean("test") == "test");
    
    printTest("clean with punc", secondSentence.clean("test!") == "test");
    
    testSentence.clear();
    secondSentence.clear();
    
    testSentence.addWord("alpha"); // alpha
    secondSentence.addWord("bravo"); // bravo
    
    printTest("numMatches no matches", testSentence.numMatches(secondSentence) == 0);
    
    secondSentence.addWord("alpha"); // bravo alpha
    
    printTest("numMatches 1 match", testSentence.numMatches(secondSentence) == 1);
    
    testSentence.addWord("delta");  // alpha delta
    secondSentence.addWord("charlie") // bravo alha charlie
    secondSentence.addWord("delta"); // bravo alpha charlie delta
    
    printTest("numMathces 2 matches", testSentence.numMatches(secondSentence) == 2);
    
    testSentence.addWord("echo");
    
    secondSentence.addWord("echo?");
    
    printTest("numMatches 3 matches with punc", testSentence.numMatches(secondSentence) == 3);
    
    //test blah
}


func input() -> String {
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    return NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String

    
}

performTests();

var daisy = Daisy()

daisy.loadMemory();

var timeToQuit = false;


println("DAISY>" + daisy.response().getString());
while (!timeToQuit) {
fputs("YOU> ", __stderrp)

var userInput = input()
    if (userInput != "bye\n") {
        println("DAISY> " + daisy.getResponse(userInput))
    } else {
        // user entered "bye"
        daisy.saveMemory();
        println("DAISY> Good bye!");
        timeToQuit = true
    }
}
