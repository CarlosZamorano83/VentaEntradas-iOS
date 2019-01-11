//
//  DetalleEntradasCompradasViewController.swift
//  VentaEntradas
//
//  Created by alumnos on 11/12/18.
//  Copyright © 2018 alumnos. All rights reserved.
//

import UIKit

class DetalleEntradasCompradasViewController: UIViewController {

    @IBOutlet weak var eventoDetalleEntradaCompradaLabel: UILabel!
    @IBOutlet weak var codigoValidacionLabel: UILabel!
    @IBOutlet weak var imagenDetalleEntradaComprada: UIImageView!
    
    var entradaComprada = " "
    var codigoValidacionEntrada = " "
    var imagenEntradacomprada = #imageLiteral(resourceName: "PARTIDO DE FUTBOL")
    
    
    // Con esta función cargamos la información que obtenemos de la función prepare de la clase Tabla
    override func viewDidLoad() {
        super.viewDidLoad()
        
      eventoDetalleEntradaCompradaLabel.text = entradaComprada
      codigoValidacionLabel.text = codigoValidacionEntrada
      imagenDetalleEntradaComprada.image = imagenEntradacomprada
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
