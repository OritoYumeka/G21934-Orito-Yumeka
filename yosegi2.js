const unit = 150
const gon = 6
let theta = 0;
let Rotating = false;

function setup(){
    createCanvas(800,500);
    background("white");
    yosegi(1.5*unit, 1.5*unit,0);
}

function yosegi(x,y,theta){
    translate(x,y);
    scale(1,-1);
    fill(color(200,150,100));
    scale(1, cos(theta));
    // 六角形を描く
    beginShape();
    for (let i = 0; i < gon; i++){
	vertex(unit*cos(2*PI/gon*i+PI/6), unit*sin(2*PI/gon*i+PI/6))
    }
    endShape(CLOSE);

    // 三角形を６０度ずつ回転させながら描く
    for (let i = 0; i < gon; i++){
	fundTriangle();
	rotate(2*PI/gon);
    }
    rotate(theta)
    scale(1,-1);
    translate(-x,-y);
}

function fundTriangle(){
    fill(color(150,100,80));
    beginShape();
    vertex(0,0);
    vertex(unit*cos(PI/gon)/3, unit*(sin(PI/gon))/3);
    vertex(2*unit*cos(PI/gon)/3, 0);
    vertex(unit*cos(PI/gon)/3, -unit*(sin(PI/gon))/3);
    endShape(CLOSE);
    
    translate(unit*cos(PI/gon)/3, unit*(sin(PI/gon))/3);
    fundPattern(0,1,0);
    translate(-unit*cos(PI/gon)/3, -unit*(sin(PI/gon))/3);
    scale(1,-1);
    translate(unit*cos(PI/gon)/3, unit*(sin(PI/gon))/3);
    fundPattern(0,1,0);
    translate(-unit*cos(PI/gon)/3, -unit*(sin(PI/gon))/3);
    scale(1,-1);
}

function fundPattern(l,c,r){
    const pal = [color(100,70,50),color(150,100,80),color(200,150,100)]
    fill(pal[l]);
    beginShape();
    vertex(0,0);
    vertex(unit*cos(PI/gon)/9, unit*(sin(PI/gon))/9);
    vertex(unit*cos(PI/gon)/9 + unit*cos(PI/gon)/3,
	   unit*(sin(PI/gon))/9 - unit*sin(PI/gon)/3,
	  );
    vertex(unit*cos(PI/gon)/3, -unit*(sin(PI/gon))/3);
    endShape(CLOSE);

    fill(pal[c]);
    translate(unit*cos(PI/gon)/9, unit*(sin(PI/gon))/9);
    vertex(0,0);
    vertex(unit*cos(PI/gon)/9, unit*(sin(PI/gon))/9);
    vertex(unit*cos(PI/gon)/9 + unit*cos(PI/gon)/3,
	   unit*(sin(PI/gon))/9 - unit*sin(PI/gon)/3,
	  );
    vertex(unit*cos(PI/gon)/3, -unit*(sin(PI/gon))/3);
    endShape(CLOSE);
    translate(-unit*cos(PI/gon)/9, -unit*(sin(PI/gon))/9);

    fill(pal[r]);
    translate(unit*cos(PI/gon)*2/9, unit*(sin(PI/gon))*2/9);
    vertex(0,0);
    vertex(unit*cos(PI/gon)/9, unit*(sin(PI/gon))/9);
    vertex(unit*cos(PI/gon)/9 + unit*cos(PI/gon)/3,
	   unit*(sin(PI/gon))/9 - unit*sin(PI/gon)/3,
	  );
    vertex(unit*cos(PI/gon)/3, -unit*(sin(PI/gon))/3);
    endShape(CLOSE);
    translate(-unit*cos(PI/gon)*2/9, -unit*(sin(PI/gon))*2/9);
}

function draw(){
    background("white");
    yosegi(1.5*unit, 1.5*unit,0);
    line(2.5*unit,1.5*unit,
	 8*unit, 1.5*unit);
    yosegi(4*unit, 1.5*unit,theta);
    if (theta < PI && Rotating ){
	theta += PI/90;
    }
    else if (theta >= PI){
	Rotating = false;
	theta = 0;
    }
}

function keyPressed(){
    Rotating = !Rotating
}

