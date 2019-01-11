
import UIKit
import Foundation

let persistencia = UserDefaults.standard


var entradasGuardadas = [String]()

var codigoValidacionGuardados = [String]()



var imagenesEvento = [#imageLiteral(resourceName: "PARTIDO DE FUTBOL"),#imageLiteral(resourceName: "PARTIDO DE BALONCESTO"),#imageLiteral(resourceName: "TENIS")]


// Con esta función guardamos los datos del evento que queremos almacenar.
func guardarDatos(){
    entradasGuardadas.removeAll()
    codigoValidacionGuardados.removeAll()
    
    for i in entradas
    {
        
        entradasGuardadas.append(i.nombre)
    }
    
    persistencia.set(entradasGuardadas, forKey: "idEntradas" )
    
    for i in entradas
    {
        
        codigoValidacionGuardados.append(i.codigoValidacionEntradas)
        
    }
    

    
    persistencia.set(codigoValidacionGuardados, forKey: "idCodigoValidacion")
}


    // Con esta función cargamos los datos del evento que hemos almacenado en la función guardardatos().
    func cargarDatos(){
        
        
    if let datos = persistencia.array(forKey:"idEntradas") as? [String]
    {
            entradasGuardadas = datos
    }
        
    entradas.removeAll()
    
    
    if let codigo = persistencia.array(forKey: "idCodigoValidacion") as? [String]
    
    {
        codigoValidacionGuardados = codigo
    }
    
    entradas.removeAll()
    
    if entradasGuardadas.count == 0
    {
        return
    }
    
    for i in 0...entradasGuardadas.count - 1 {
        
        let entrada = Eventos(nombre: entradasGuardadas[i], imagen: #imageLiteral(resourceName: "PARTIDO DE BALONCESTO"), numeroEntradas: " ", codigoValidacion: codigoValidacionGuardados[i])
        entradas.append(entrada)
    }
    asociarImagenes()
    }

// Con esta función asociamos las imágenes del array imagenesEvento con las imagenes del array entradasGuardados mediante el nombre de los eventos.

func asociarImagenes(){
    
    for i in entradas {
        
        switch i.nombre {
            
        case "Futbol" :
            i.imagen = imagenesEvento[0]
            break
        case "Baloncesto" :
            i.imagen = imagenesEvento[1]
            break
        case "Tenis" :
            i.imagen = imagenesEvento[2]
            break
            
        default:
            break
            }
        }
}
