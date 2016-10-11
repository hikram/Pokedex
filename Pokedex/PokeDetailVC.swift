//
//  PokeDetailVC.swift
//  Pokedex
//
//  Created by Hashim Ikram on 11/10/2016.
//  Copyright © 2016 Hashim Ikram. All rights reserved.
//

import UIKit

class PokeDetailVC: UIViewController {

    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokeIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseLbl: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
        mainImg.image = UIImage(named: "\(pokemon.pokedexID)")
        pokeIDLbl.text = "\(pokemon.pokedexID)"
        
        pokemon.downloadPokemonDetails {
            
            self.updateUI()
            
        }
    }
    
    func updateUI() {
        
        baseLbl.text = pokemon.attack
        defLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descLbl.text = pokemon.description
        
    }

    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
