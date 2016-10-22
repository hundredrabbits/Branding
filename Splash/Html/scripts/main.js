// Init

var logo = document.getElementById("logo");
logo.width = parseInt(logo.style.width, 10);
logo.height = parseInt(logo.style.height, 10);
logo.style.backgroundColor = "black";
logo.style.padding = (logo.width/2)+"px";
var logo_target = document.createElement("div");
logo_target.style.width = logo.width+"px";
logo_target.style.height = logo.height+"px";
logo_target.style.position = "relative";
logo.appendChild(logo_target)

var tiles = [];

// Generate

function Pos(x,y)
{
  this.x = x;
  this.y = y;
}

function Tile(pos)
{
  this.pos = pos;
  this.element = null;
  this.tile_size = logo.width/10;
  this.history = [];
  this.history.push(new Pos(this.pos.x,this.pos.y));   

  this.install = function()
  {
    this.element = document.createElement("tile");
    this.element.style.backgroundColor = 'white';
    this.element.style.width = (logo.width * 0.08)+'px';
    this.element.style.height = (logo.width * 0.08)+'px';
    this.element.style.display = 'block';
    this.element.style.borderRadius = '10px';
    this.element.style.position = 'absolute';
    this.element.style.left = (this.pos.x * this.tile_size)+'px';
    this.element.style.top = (this.pos.y * this.tile_size)+'px';
    logo_target.appendChild(this.element);
  };

  function tile_at(target_pos,neighboors)
  {
    for (t2 = 0; t2 < neighboors.length; t2++) { 
      if(neighboors[t2].pos.x == target_pos.x && neighboors[t2].pos.y == target_pos.y){
        return neighboors[t2];
      }
    }
    return null;
  }

  this.move_to = function(target_pos)
  {
    this.pos.x = target_pos.x;
    this.pos.y = target_pos.y;
  }
  this.translate_with = function(x,y)
  {
    this.element.style.left = (parseInt(this.element.style.left, 10)+x)+'px';
    this.element.style.top = (parseInt(this.element.style.top, 10)+y)+'px';
  }

  this.update = function()
  {
    this.element.style.left = (pos.x * this.tile_size)+'px';
    this.element.style.top = (pos.y * this.tile_size)+'px';
  }

  this.neighboor_left = function()
  {
    return tile_at(new Pos(pos.x-1,pos.y),tiles);
  }
  this.neighboor_right = function()
  {
    return tile_at(new Pos(pos.x+1,pos.y),tiles);
  }
  this.neighboor_top = function()
  {
    return tile_at(new Pos(pos.x,pos.y+1),tiles);
  }
  this.neighboor_down = function()
  {
    return tile_at(new Pos(pos.x,pos.y-1),tiles);
  }

  this.flee = function()
  {
    var random = Math.random();

    this.history.push(new Pos(this.pos.x,this.pos.y));  

    if(random < 0.25 && !this.neighboor_top()){
      this.pos.y += 1; 
    }
    else if(random < 0.5 && !this.neighboor_down()){
      this.pos.y -= 1; 
    }
    else if(random < 0.75 && !this.neighboor_right()){
      this.pos.x += 1; 
    }
    else if(!this.neighboor_left()){
      this.pos.x -= 1; 
    }      
  }
}

// Create tiles

for (x = 0; x < 10; x++) { 
  for (y = 0; y < 10; y++) { 
    var rand_x = 15 - Math.floor((Math.random() * 20) + 1);
    var rand_y = 15 - Math.floor((Math.random() * 20) + 1);
    var pos = new Pos(x,y);
    tiles.push(new Tile(pos));  
  }
}

// Install

for (t = 0; t < tiles.length; t++) { 
  tiles[t].install();
}

// 

function flee()
{
  for (t = 0; t < tiles.length; t++) { 
    tiles[t].flee();
  }
}

flee();
flee();
flee();
flee();
flee();
flee();

function return_to(target)
{
  for (i = 0; i < tiles.length; i++) { 
    tiles[i].move_to(tiles[i].history[target]);
    tiles[i].update();
  }
}

function animate_return_to(target,id)
{
  if(id == -1){
    return;
  }
  animate_test(tiles[id]);
  tiles[id].move_to(tiles[id].history[target]);
  setTimeout(function(){ animate_return_to(target,id-1); }, 20);
}

function animate_test(tile)
{
  if(parseInt(tile.element.style.left,10) < (tile.pos.x * tile.tile_size)){ tile.translate_with(1,0); }
  if(parseInt(tile.element.style.left,10) > (tile.pos.x * tile.tile_size)){ tile.translate_with(-1,0); }

  if(parseInt(tile.element.style.top,10) < (tile.pos.y * tile.tile_size)){ tile.translate_with(0,1); }
  if(parseInt(tile.element.style.top,10) > (tile.pos.y * tile.tile_size)){ tile.translate_with(0,-1); }

  setTimeout(function(){ animate_test(tile); }, 1);
}

return_to(5);
// animate_return_to(4,99);


setTimeout(function(){ animate_return_to(4,99); }, 1500);
setTimeout(function(){ animate_return_to(3,99); }, 2000);
setTimeout(function(){ animate_return_to(2,99); }, 2500);
setTimeout(function(){ animate_return_to(1,99); }, 3000);
// setTimeout(function(){ animate_return_to(2,99); }, 4000);
// setTimeout(function(){ animate_return_to(1,99); }, 6000);
// setTimeout(function(){ animate_return_to(0,99); }, 8000);

