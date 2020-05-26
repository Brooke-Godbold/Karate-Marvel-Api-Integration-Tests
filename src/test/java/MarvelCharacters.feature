Feature: Marvel Characters Endpoint

  Background:
    * def getCharactersUrl = 'http://gateway.marvel.com/v1/public/characters'
    * def timestamp = '1'
    * def public = '613c765803573ff01ea6ba18f88a013d'
    * def private = 'd21062d8458f43a5c50baa552f22178a3c4589d7'
    * def HashGenerator = Java.type('HashGenerator')
    * def hashParam = HashGenerator.generateHash('1', private, public)

#    * def common = call read('Common.feature') { 'timestamp': timestamp, 'publicKey': public, 'privateKey': private }
#    * def hashParam = common.getHash
#    * print hashParam

  Scenario: Get Characters returns 200 with correct Parameters
    Given url getCharactersUrl
    And param ts = timestamp
    And param apikey = public
    And param hash = hashParam
    When method GET
    Then status 200

  Scenario: Get Characters returns 409 with no Hash
    Given url getCharactersUrl
    And param ts = timestamp
    And param apikey = public
    When method GET
    Then status 409

  Scenario: Get Characters returns 409 with no Public API Key
    Given url getCharactersUrl
    And param ts = timestamp
    And param hash = hashParam
    When method GET
    Then status 409

  Scenario: Get Characters returns 409 with no Timestamp
    Given url getCharactersUrl
    And param apikey = public
    And param hash = hashParam
    When method GET
    Then status 409

  Scenario: Get Characters returns 401 with invalid Hash
    Given url getCharactersUrl
    And param ts = timestamp
    And param apikey = public
    And param hash = 'invalidHash'
    When method GET
    Then status 401