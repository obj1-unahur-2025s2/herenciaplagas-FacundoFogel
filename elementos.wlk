import plagas.*


class Hogar{
  var nivelDeMugre
  const confort
  method mugre() = nivelDeMugre
  method esBueno() = nivelDeMugre/2 <= confort
  method recibirAtaque(unaPlaga) {nivelDeMugre = nivelDeMugre + unaPlaga.nivelDeDaño()}
}

class Huerta{
  var capacidadProduccion
  method produccion() = capacidadProduccion
  method esBueno() = capacidadProduccion > nivelMinimoDeProduccion.valor()
  method recibirAtaque(unaPlaga) {
    capacidadProduccion = (capacidadProduccion - unaPlaga.nivelDeDaño() * 0.1 -
    if(unaPlaga.transmiteEnfermedades())10 else 0).max(0)
    }
}

class Mascota {
  var salud
  method esBueno() = salud > 250
  method salud() = salud
  method recibirAtaque(unaPlaga) {
    if(unaPlaga.transmiteEnfermedades())
      salud = (salud-unaPlaga.nivelDeDaño()).max(0)
  }
}

class Barrio {
  const property elementos = []
  method agregar(unElemento) {elementos.add(unElemento)}
  method quitar(unElemento) {elementos.remove(unElemento)}
  method cantElementosBuenos() = elementos.count({elemento => elemento.esBueno()})
  method cantElementosMalos() = elementos.count({elemento => !elemento.esBueno()})
  method esCopado() = self.cantElementosBuenos() > self.cantElementosMalos()
}

object nivelMinimoDeProduccion {
  var property valor = 10
}