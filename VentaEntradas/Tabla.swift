//
//  Tabla.swift
//  VentaEntradas
//
//  Created by alumnos on 4/12/18.
//  Copyright © 2018 alumnos. All rights reserved.
//

import UIKit
import Foundation

class Tabla: UITableViewController {

    
    var nombreEventos = " "
    var codigoValidacion = " "
    var precioEventos = 0
    var imagenEventos = #imageLiteral(resourceName: "PARTIDO DE FUTBOL")
    
    

    
    // Cuando carga la vista se establece una altura de la celda de 200.
    override func viewDidLoad() {
    super.viewDidLoad()
        tableView.rowHeight = 200;
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // Con esta función indicamos el número de celdas que hay
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Con esta función se van sumando los eventos que vayamos comprando
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entradas.count
    }
    
   // Con esta función pasasmos los datos que queremos que se muestren en la celda que provienen del ViewController
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Celda
        
        cell.eventosCelda.text = entradas[indexPath.row].nombre
        cell.imagenCelda.image = entradas[indexPath.row].imagen
        cell.codigoValidacionCelda = entradas[indexPath.row].codigoValidacionEntradas
    
        return cell
        
  
    }
    
    // Con esta función pasamos los datos que hemos guardados en la clase Celda que queremos que se muestre en la última pantalla de la aplicación Detalle Entrada de 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       let entradaDetallada = segue.destination as! DetalleEntradasCompradasViewController
       let cellPulsada = sender as! Celda
        
        entradaDetallada.entradaComprada = cellPulsada.eventosCelda.text!
        entradaDetallada.imagenEntradacomprada = cellPulsada.imagenCelda.image!
        entradaDetallada.codigoValidacionEntrada = cellPulsada.codigoValidacionCelda
        }
    
   }



    

    

    

   


