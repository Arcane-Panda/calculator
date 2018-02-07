class Button
{
  //Member Variables
  int x, y, w, h, value;
  char o;
  boolean hov, num;

  //Constructor
  Button(int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    hov = false;
  }

  Button asNumber(int value)
  {
    num = true;
    this.value = value;
    return this;
  }

  Button asOperator(char o)
  {
    num = false;
    this.o = o;
    return this;
  }

  //Display Method
  void display()
  {
    fill(0);
    if (hov == true)
    {
      fill(#FF404C);
    } else 
    {
      fill(#012C40);
    }
    noStroke();
    rect(x, y, w, h, 20);
    if (num)
    {
      fill(255);
      textSize(30);
      text(value, x+60, y+60);
    } else
    { 
      fill(255);
      if (o == '+')
      {
        text("+", x+60, y+60);
      } else if (o == '-')
      {
        text("-", x+60, y+60);
      } else if (o == '*')
      {
        text("x", x+60, y+60);
      } else if (o == '/')
      {
        text("÷", x+60, y+60);
      } else if (o == '.')
      {
        text(".", x+55, y+55);
      } else if (o == '=')
      {
        text("=", x+60, y+60);
      } else if (o =='c')
      {
        text("C", x+60, y+60);
      } else if (o == 'n')
      {
        text("+/-", x+75, y+60);
      } else if (o == '^')
      {
        text("x^y", x+77, y+60);
      } else if (o == 'p')
      {
        text("π", x+60, y+60);
      } else if (o == 's')
      {
        text("√x", x+60, y+60);
      } else if (o == 'o')
      {
        text("Off", x+70, y+60);
      }
    }
  }
  void hover()
  {
    hov = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}