//
//  Celda.swift
//  VentaEntradas
//
//  Created by alumnos on 5/12/18.
//  Copyright © 2018 alumnos. All rights reserved.
//

import UIKit

// Aquí establecemos la información a mostrar en la tabla
class Celda: UITableViewCell {

    @IBOutlet weak var eventosCelda: UILabel!
    @IBOutlet weak var imagenCelda: UIImageView!
   
    var codigoValidacionCelda = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


