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

  this.install = function()
  {
    this.element = document.createElement("tile");
    this.element.style.backgroundColor = 'white';
    this.element.style.width = '10px';
    this.element.style.height = '10px';
    this.element.style.display = 'block';
    this.element.style.borderRadius = '10px';
    this.element.style.position = 'absolute';
    this.element.style.left = (this.pos.x * this.tile_size)+'px';
    this.element.style.top = (this.pos.y * this.tile_size)+'px';
    logo_target.appendChild(this.element);
  };
}

// Create tiles

var tiles = [];
for (x = 0; x < 10; x++) { 
  for (y = 0; y < 10; y++) { 
    var pos = new Pos(x,y);
    tiles.push(new Tile(pos));  
  }
}

// Install
for (t = 0; t < 100; t++) { 
  tiles[t].install();
}

console.log(tiles);