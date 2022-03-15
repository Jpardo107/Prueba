

const horas = () => {
  let semana = [[],[],[],[],[],[],[]]
  let lunes = []
  var datos = new Request("./horas.json")
  fetch(datos).then((resp) =>{
    return resp.json()
  }).then((data) =>{
    for(x in data){
     switch(x){
      case 'monday':
        for(i in data.monday){
          for (j in data.monday[i]){
            lunes.push(data.monday[i][j])
          }
        }
        break
      case 'tuesday':
        for(i in data.tuesday){
          for (j in data.tuesday[i]){
            semana[1].push(data.tuesday[i][j])
          }
        }
        break
      case 'wednesday':
        for(i in data.wednesday){
          for (j in data.wednesday[i]){
            semana[2].push(data.wednesday[i][j])
          }
        }
        break
      case 'thursday':
        for(i in data.thursday){
          for (j in data.thursday[i]){
            semana[3].push(data.thursday[i][j])
          }
        }
        break
      case 'friday':
        for(i in data.friday){
          for (j in data.friday[i]){
            semana[4].push(data.friday[i][j])
          }
        }
        break
      case 'saturday':
        for(i in data.saturday){
          for (j in data.saturday[i]){
            semana[5].push(data.saturday[i][j])
          }
        }
        break
      case 'sunday':
        for(i in data.sunday){
          for (j in data.sunday[i]){
            semana[6].push(data.sunday[i][j])
          }
        }
        break
     }
    }
  })
}