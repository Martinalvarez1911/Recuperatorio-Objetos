import magos.*

class Gremio {
    var magos = #{}

    method crearGremio() {
        self.initialize() 
    }

    method poderTotal() {
      return magos.sum{unMago => unMago.poderTotal(unMago) }
    }

     method reservaEnergiaMagica() {
      return magos.sum{unMago => unMago.energiaMagica() }
    }

    method resistenciaMagica() {
      return magos.sum{unMago => unMago.resistenciaMagica() }
    }

    method liderGremio() = magos.max{unMago => unMago.poderTotal(unMago)}

     method desafiarGremio(otroGremio) {
         var liderGremio = self.liderGremio()
        
        if(otroGremio.puedeSerVencido(self)) {
            magos.map{unMago => liderGremio.desafiarMago(unMago)}
        }
        else {
            throw new NoPuedeVencerlo()
        }
    } 

    method puedeSerVencido(otroGremio) {
      return otroGremio.poderTotal() > (self.resistenciaMagica() + self.resisteniaMagicaLider()) 
    }

    method resisteniaMagicaLider() {
        const liderGremio = self.liderGremio()
        return (liderGremio.resistenciaMagica()) 
    }




    

}

// no puede soportar este requrimiento ya que si hacemos g1.liderGremio() nos va a dar error ya que inentara hacer gremio.poderTotal()
 // cosa que no es posible
const g1 = new Gremio (magos = [m1, m2])
const g2 = new Gremio (magos = [m1])