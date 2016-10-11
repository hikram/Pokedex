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

        nameLbl.text = pokemon.name
        mainImg.image = UIImage(named: "\(pokemon.pokedexID)")
        pokemon.downloadPokemonDetails {
            
            
            //called after download is done
        }
    }

    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
