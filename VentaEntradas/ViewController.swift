//
//  ViewController.swift
//  VentaEntradas
//
//  Created by alumnos on 23/11/18.
//  Copyright © 2018 alumnos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var eventos = ["Futbol", " Baloncesto", "Tenis"]
    var imagenes = [#imageLiteral(resourceName: "PARTIDO DE FUTBOL"),#imageLiteral(resourceName: "PARTIDO DE BALONCESTO"), #imageLiteral(resourceName: "TENIS")]
    var numeroPrecioEntradas = 1
    var precioMontanteTotalEntradas = [50,200,30]
    var precioEntradas = 50
    var codigoValidacion = " "
    
  
    
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var restarEntradas: UIButton!
    @IBOutlet weak var sumarEntradas: UIButton!
    @IBOutlet weak var numeroEntradas: UILabel!
    @IBOutlet weak var numero: UILabel!
    @IBOutlet weak var precioTotalEntradas: UILabel!
    @IBOutlet weak var verImagen: UIImageView!
    @IBOutlet weak var comprarBoton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.dataSource = self;
        self.picker.delegate = self;
        
       cargarDatos()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Con esta función calculamos el precio total de los eventos. Multiplicamos el precio de las entradas por el número de entradas
    
    func calcularPrecioEntradas(){
        
        precioTotalEntradas.text = "\(precioEntradas * Int(numeroEntradas.text!)!)€"
        
    }
    
    // numero de columnas
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // Eventos del picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return eventos.count
    }
    
    
    // Asociar eventos para los picker
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return eventos [row]
    }
    
    //  Asociar las imagenes con los eventos, cuando selecciono el evento
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        verImagen.image = imagenes[row]
        
        precioEntradas = precioMontanteTotalEntradas[row]
        calcularPrecioEntradas()
        
    }
    
   
    
    // Con esta función añadimos una entrada cuando pulsemos en el boton +. Pasamos también la función calcularPrecioEntradas() para que nos calcule el precio de las entradas
    
    @IBAction func aumentarEntradas(_ sender: UIButton) {
        
        var sumarEntradas = Int(numeroEntradas.text!)!
        
        sumarEntradas += 1
        
        numeroEntradas.text = "\(sumarEntradas)"
        
        print ("suma una entrada")
        calcularPrecioEntradas()
    }
    
    
    // Con esta función quitamos una entrada al boton cuando pulsemos el boton. También le pasamos la función calcularPrecioEntradas para que calcule el precio de las entradas.
   
    @IBAction func disminuirEntradas(_ sender: UIButton) {
        
        // Con el condicional nos aseguramos que cuando la entrada sea igual o mayor a 2 se reste una entrada y que cuando sea menor que 1 no se resten
        
        if (Int(numeroEntradas.text!)! >= 2) {
        
        var restarEntradas = Int(numeroEntradas.text!)!
        
        restarEntradas -= 1
        
        numeroEntradas.text = "\(restarEntradas)"
            
        print ("resta una entrada")}
        
        calcularPrecioEntradas()
        
    }
    
    // Con esta función guardamos los datos de la entrada que queremos comprar y los guardamos en un array entradas y lo pasamos a la siguiente pantalla lista de Entradas compradas.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
       let celda = picker.selectedRow(inComponent: 0)
        
        let comprarEntradasEventos = Eventos(nombre: eventos[celda], imagen: verImagen.image!, numeroEntradas: numeroEntradas.text!, codigoValidacion: randomString(size: 7))
        
        entradas.append(comprarEntradasEventos)
        guardarDatos()
        
        
        }
    
    // Con esta función generamos un código aleatorio para cada entrada
    
    func randomString(size: UInt) -> String {
        let stringSet = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
        codigoValidacion = " "
        
        
       
        for _ in 0..<size {
            
            let randomIndex = arc4random_uniform(UInt32(stringSet.count))
            let charIndex = stringSet.index(stringSet.startIndex, offsetBy: Int(randomIndex))
            codigoValidacion.append(String(stringSet[charIndex]))
        }
        return codigoValidacion
    }
    
    // Dandole al botón comprar pasamos a la siguiente pantalla
    @IBAction func comprarEntradas(_ sender: UIButton) {
    print(codigoValidacion)
    }
    
}
    


