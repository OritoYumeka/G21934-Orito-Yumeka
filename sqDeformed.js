let num = 6;
let lattice = [];
let tile;
let base = [];
let scalar
let theta = 0;
let button;

function setup(){
    createCanvas(500,500);
    scalar = height * 1.0/ num;
    strokeWeight(5);
    button = createButton('+');
    button.position("20%", "100%");
    button.mousePressed(increaseTheta);
    makeSqVector();
    lattice = makeSqLattice();
    drawTiling();
}

function makeSqVector(){
    base = [];
    base.push({x:0, y:1})
    base.push({x:1, y:0})
}

function makeSqLattice(){
    let mat = []
    for (let i = 0; i < 2*num + 1; i++){
	let row = [];
	for (let j = 0; j < 2*num + 1; j++){
	    let v = {x: (i*scalar)*base[0].x + (j*scalar)*base[1].x,
		     y: (i*scalar)*base[0].y + (j*scalar)*base[1].y
		    }
	    row.push(v);
	}
	mat.push(row);
    }
    return(mat);
}

function drawTiling(){
    background(color("white"));
    for (let vecArr of lattice){
	for (let vec of vecArr){
	    fill(color("lightgray"));
	    deformedSquare(vec.x,vec.y);
	}
    }
}

function rotateAround(p, theta, center){
    x = (p.x-center.x)*cos(theta) - (p.y-center.y)*sin(theta) + center.x
    y = (p.x-center.x)*sin(theta) - (p.y-center.y)*cos(theta) + center.y
    return({x:x,y:y})
}

function midPoint(p,q){
    return({x:(p.x+q.x)/2, y:(p.y+q.y)/2})
}
function deformedSquare(x,y){
    fill("lightgray");
    let v = [];
    let cp = [];

    let yIdx = round(y/scalar);
    if (yIdx%2 == 0){
	ySgn = +1
    }
    else{
	ySgn = -1
    }
    let xIdx = round(x/scalar);
    if (xIdx%2 == 0){
	xSgn = +1
    }
    else{
	xSgn = -1
    }
    v[0] = {x:x-0.5*scalar,y:y-0.5*scalar}
    v[1] = {x:x+0.5*scalar,y:y-0.5*scalar}
    v[2] = {x:x+0.5*scalar,y:y+0.5*scalar}    
    v[3] = {x:x-0.5*scalar,y:y+0.5*scalar}
    //a
    cp[0] = rotateAround(v[0],ySgn*theta,midPoint(v[0],v[1]));
    cp[1] = rotateAround(v[1],ySgn*theta,midPoint(v[0],v[1]));
    //b
    cp[2] = rotateAround(v[1],xSgn*theta,midPoint(v[1],v[2]));
    cp[3] = rotateAround(v[2],xSgn*theta,midPoint(v[1],v[2]));
    //c
    cp[4] = rotateAround(v[2],-ySgn*theta,midPoint(v[2],v[3]));
    cp[5] = rotateAround(v[3],-ySgn*theta,midPoint(v[2],v[3]));
    //d
    cp[6] = rotateAround(v[3],-xSgn*theta,midPoint(v[3],v[0]));
    cp[7] = rotateAround(v[0],-xSgn*theta,midPoint(v[3],v[0]));

    beginShape();
    vertex(v[0].x,v[0].y);
    bezierVertex(cp[0].x, cp[0].y, cp[1].x, cp[1].y, v[1].x, v[1].y);
    vertex(v[1].x,v[1].y);
    bezierVertex(cp[2].x, cp[2].y, cp[3].x, cp[3].y, v[2].x, v[2].y);
    vertex(v[2].x,v[2].y);
    bezierVertex(cp[4].x, cp[4].y, cp[5].x, cp[5].y, v[3].x, v[3].y);
    vertex(v[3].x,v[3].y);
    bezierVertex(cp[6].x, cp[6].y, cp[7].x, cp[7].y, v[0].x, v[0].y);
    vertex(v[0].x,v[0].y);
    endShape();
}

function draw(){
    makeSqVector();
    lattice = makeSqLattice();
    theta = theta + PI/180;
    drawTiling();
}

function increaseTheta(){
    theta = theta + PI/20;
    drawTiling();
}