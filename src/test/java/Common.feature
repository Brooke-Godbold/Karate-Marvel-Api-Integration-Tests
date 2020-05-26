Feature: Common Functions

  Background:
    * def timestamp = '#(timestamp)'
    * def privateKey = '#(privateKey)'
    * def publicKey = '#(publicKey)'
    * def HashGenerator = Java.type('HashGenerator')
    * def getHash = HashGenerator.generateHash(timestamp, privateKey, publicKey)