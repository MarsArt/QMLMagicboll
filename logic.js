function getRandomInt(min, max)
{
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function animationPrepear(anim,rott){
    anim.duar=getRandomInt(1000,3500);
    anim.drot=getRandomInt(-60,60);
    anim.typAnim=getRandomInt(0,40);
    rott.axis.x=getRandomInt(0,1);
    rott.axis.y=getRandomInt(0,1);
    rott.axis.z=getRandomInt(0,1);
    rott.origin.x = getRandomInt(-20,20);
    rott.origin.y = getRandomInt(-20,20);
}



function DataSource() {
  this.getRandomItem=function(){}
}


function GetSourcePredication(start,end){
    this.start=start;
    this.end=end;
    this.getRandomItem=function(){
        return "qrc:/Image/prediction/"+getRandomInt(this.start,this.end)+".png"
    }
}

function GetSourceErotic(start,end){
    this.start=start;
    this.end=end;
    this.getRandomItem=function(){
        return "qrc:/Image/erotic/"+getRandomInt(this.start,this.end)+".png"
    }
}

/*типа стратегия*/
function Generator(dataSource){
    this.dataSource=dataSource;
    this.getAnswer=function(){return dataSource.getRandomItem();}

}
/*Фабричный метод*/
function getGenerator(type){
    switch(type){
    case 0:
     var generator = new Generator(new GetSourcePredication(1,20));
        break;
    case 1:
         generator = new Generator(new GetSourceErotic(1,20));
        break;
    default:
         generator = new Generator(new GetSourcePredication(1,20));
    }
    return generator;
}


