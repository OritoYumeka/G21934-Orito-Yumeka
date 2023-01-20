const unit = 100;

function setup(){
    createCanvas(8*unit, 8*unit);
    background("white");
    translate(4*unit,4*unit);
    generateSeq([], 14);
}

function generateSeq(seq, level){
    if (level <= 0){
	console.log(evaluate(seq,2));
	return;
    }
    for (let d=0; d<2; d++){
	seq.push(d);
	generateSeq(seq, level-1);
	seq.pop();
    }
}

function evaluate(seq, base){
    let sum = math.complex(0,0);
    const b=math.complex(-1,1);
    for (let k in seq){
	sum = math.add(sum  ,math.multiply(seq[k],math.pow(b,k)));
    }
    if(seq[8]==0&&seq[9]==0){
        fill("red");
        stroke("red");
    }else if(seq[10]==0&&seq[11]==0){
        fill("yellow");
        stroke("yellow");
    }else if(seq[12]==0&&seq[13]==0){
        fill("orange");
        stroke("orange");
    }else{
        fill("cyan");
        stroke("cyan");
    }

    circle(3*sum.re, 3*sum.im, 1);
    return(sum);
}