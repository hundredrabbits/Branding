program Rabbits;

 procedure Draw (row, col, size, pad: INTEGER);
  var
   bounds: Rect;
 begin
  SetRect(bounds, col * size + pad, row * size + pad, (col * size + pad) + 8, (row * size + pad) + 8);
  PaintOval(bounds);
 end;

 var
  row, col: INTEGER;

begin

 repeat
  col := 0;
  repeat
   Draw(row, col, 10, 60);
   col := col + 1;
  until col = 10;
  row := row + 1;
 until row = 10;

 ShowDrawing;

end.
