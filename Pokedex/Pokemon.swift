//
//  Pokemon.swift
//  Pokedex
//
//  Created by Hashim Ikram on 10/10/2016.
//  Copyright © 2016 Hashim Ikram. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _pokemonURL: String!
    
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var pokemonURL: String {
        return _pokemonURL
    }
    
    
    
    
    init (name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
        
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexID!)/"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        let url = URL(string: _pokemonURL)!
        Alamofire.request(url).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String, Any> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    if types.count > 1 {
                        for type in 1..<types.count {
                            if let name = types[type]["name"] {
                                self._type! += " / \(name.capitalized)"
                            }
                        }
                    }
                }
                else {
                    self._type = ""
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>], descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        
                        let descURL = URL_BASE + url
                        
                        Alamofire.request(descURL).responseJSON(completionHandler: { (response) in
                            if let descDict = response.result.value as? Dictionary<String, Any> {
                                if let desc = descDict["description"] as? String {
                                    self._description = desc
                                    
                                }
                            }
                            
                            completed()

                        })
                    }
                } else {
                    self._description = ""
                }

            }
            
            completed()
        
        }

    }
    
}
