# crypto-app

## Arquitectura
Intenté implementar el modelo MVVM, el cual consistió en los siguientes archivos:
* ```Coin.swift```: Archivo de modelos. Contiene el modelo de las monedas.
* ```ContentView.swift```: Archivo de vista. Contiene la vista principal de la aplicación.
* ```Network.swift```: Archivo de vista-modelo. Contiene la clase ```Network```, el cual se encarga de hacer llamadas a la API de CoinMarketCap e instanciar objetos monedas en base al JSON recibido.
* ```CryptoMomoApp.swift```: Archivo principal de la aplicación.
* ```Coinmarketcap-Info.plist```: Archivo que guarda la API Key de forma segura.

## API

La API que se utilizó para obtener información de criptomonedas fue la de CoinMarketCap. Se creó una cuenta gratuita para obtener la API Key necesaria para poder utilizarla.
* El endpoint utilizado para obtener la información de las monedas fue ```https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?sort=price&limit=10```. 
* El parámetro ```sort=price``` es para obtener las monedas ordenadas por precio. 
* El parámetro ```limit=10``` es para recibir las 10 primeras monedas solamente.

## Seguridad

Para mantener la API Key secreta, esta se guarda en un archivo llamado ```Coinmarketcap-Info.plist```, el cual no es subido al repositorio puesto que el ```.gitignore``` no se lo permite. Así, en la clase ```Network``` se consulta al archivo ```Coinmarketcap-Info.plist``` por el valor de la API Key.

## Features que se podrían implementar

* Un botón en el fondo de la lista de monedas para mostrar las 10 siguientes monedas con mayor valor.
* Guardar monedas favoritas para acceder de forma rápida al valor de estas.
* Notificación cuando cambia la moneda con mayor valor en el mercado.

## Posibles bugs
* Si falta el archivo ```Coinmarketcap-Info.plist``` o si este no contiene la API Key, no será posible consultar el valor de las monedas.
* Se depende completamente de una sola API. Si esta se cae, la aplicación queda obsoleta.
