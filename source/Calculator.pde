//Calculator
//By Lucas Zagal
// 11/28/17
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];

String ls, rs;
float ans;
char op;
boolean left, equal;
int lDisplayText = 90;
int rDisplayText = 90;
boolean full = false;

void setup()
{
  size(637, 750);

  background(#1CA5B8);
  ls =  "";
  rs = "";
  ans = 0.0;
  op = ' ';
  left = true;
  equal = false;

  numButtons[0] = new Button(20, 600, 97, 97).asNumber(0);
  numButtons[1] = new Button(20, 480, 97, 97).asNumber(1);
  numButtons[2] = new Button(150, 480, 97, 97).asNumber(2);
  numButtons[3] = new Button(270, 480, 97, 97).asNumber(3);
  numButtons[4] = new Button(20, 360, 97, 97).asNumber(4);
  numButtons[5] = new Button(150, 360, 97, 97).asNumber(5);
  numButtons[6] = new Button(270, 360, 97, 97).asNumber(6);
  numButtons[7] = new Button(20, 240, 97, 97).asNumber(7);
  numButtons[8] = new Button(150, 240, 97, 97).asNumber(8);
  numButtons[9] = new Button(270, 240, 97, 97).asNumber(9);

  opButtons[0] = new Button(150, 600, 97, 97).asOperator('.');
  opButtons[1] = new Button(270, 600, 97, 97).asOperator('=');
  opButtons[2] = new Button(390, 200, 97, 97).asOperator('c');
  opButtons[3] = new Button(390, 310, 97, 97).asOperator('/');
  opButtons[4] = new Button(390, 420, 97, 97).asOperator('*');
  opButtons[5] = new Button(390, 530, 97, 97).asOperator('-');
  opButtons[6] = new Button(390, 640, 97, 97).asOperator('+');
  opButtons[7] = new Button(510, 310, 97, 97).asOperator('n'); //negative
  opButtons[8] = new Button(510, 420, 97, 97).asOperator('^'); //exponent
  opButtons[9] = new Button(510, 530, 97, 97).asOperator('p'); //pi
  opButtons[10] = new Button(510, 640, 97, 97).asOperator('s'); //square root
  opButtons[11] = new Button(510, 200, 97, 97).asOperator('o'); //off



  text(ans, 20, 65);
}

void draw()
{
  background(#DAEBF2);
  // println(ls);
  // println(rs);
  for (int i = 0; i < numButtons.length; i++)
  {
    numButtons[i].display();
    numButtons[i].hover();
  }

  for (int i = 0; i < opButtons.length; i++)
  {
    opButtons[i].display();
    opButtons[i].hover();
  } 
  updateDisplay();

  //Key functionality
}




void mouseReleased()
{
  for (int i = 0; i < numButtons.length; i++)
  {
    if (!full)
    {
      if (numButtons[i].hov && left)
      {
        ls += numButtons[i].value;
      } else if (numButtons[i].hov && !left)
      {
        rs += numButtons[i].value;
      }
    }
  }

  for (int i = 0; i < opButtons.length; i++)
  {
    if (opButtons[i].hov && opButtons[i].o == 'c')
    {
      clearCalc();
    } else if (opButtons[i].hov && opButtons[i].o == '/')
    {
      left = false;
      op = opButtons[i].o;
      rs = "";
      full = false;
    } else if (opButtons[i].hov && opButtons[i].o == '*')
    {
      left = false;
      op = opButtons[i].o;
      rs = "";
      full = false;
    } else if (opButtons[i].hov && opButtons[i].o == '-')
    {
      left = false;
      op = opButtons[i].o;
      rs = "";
      full = false;
    } else if (opButtons[i].hov && opButtons[i].o == '+')
    {
      left = false;
      op = opButtons[i].o;
      rs = "";
      full = false;
    } else if (opButtons[i].hov && opButtons[i].o == '=')
    {
      performCalc();
      full = false;
    } else if (opButtons[i].hov && opButtons[i].o == 'n')
    {
      if (left)
      {
        ans = float(ls) * -1;
        ls = str((float)ans);
      } else
      {
        ans = float(rs) * -1;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '^')
    {
      full = false;
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'p')
    {
      if (left)
      {
        ls = "3.141592654";
      } else
      {
        rs = "3.141592654";
      }
    } else if (opButtons[i].hov && opButtons[i].o == 's')
    {
      if (left)
      {
        ans = sqrt(float(ls));
        ls = str((float)ans);
      } else
      {
        ans = sqrt(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '.')
    {
      if (left)
      {
        ls += opButtons[i].o;
      } else
      {
        rs += opButtons[i].o;
      }
    } else if (opButtons[i].hov && opButtons[i].o == 'o')
    {
      System.exit(0);
    }
  }
}

void updateDisplay()
{
  fill(#1CA5B8);
  stroke(1);
  rect(10, 10, width -20, 150, 20);
  fill(255);
  textAlign(RIGHT);
  if (equal)
  {
    textSize(60);
    text((float) ans, width - 20, 130);
  } else
  {
    if (left)
    {
      if (ls.length() >=  10)
      {
        lDisplayText = 60;
      }
      if (ls.length() >= 16)
      {
        lDisplayText = 30;
      }
      if (ls.length() >= 31 )
      {
        full = true;
      }
      textSize(lDisplayText);
      text(ls, width - 20, 130);
    } else
    {
      if (rs.length() >=  10)
      {
        rDisplayText = 60;
      }
      if (rs.length() >= 16)
      {
        rDisplayText = 30;
      }
      if (rs.length() == 31 )
      {
        full = true;
      }
      textSize(rDisplayText);
      text(rs, width -20, 130);
    }
  }
}
void clearCalc()
{
  ls =  "";
  rs = "";
  ans = 0.0;
  op = ' ';
  left = true;
  equal = false;
  full = false;
  lDisplayText = 90;
  rDisplayText = 90;
}

void performCalc()
{
  switch(op)
  {
  case '+':
    ans = float(ls) + float(rs);
    ls = str((float)ans);
    left = true;
    break;

  case '/':
    ans = float(ls) / float(rs);
    ls = str((float)ans);
    left = true;
    break;

  case '*':
    ans = float(ls) * float(rs);
    ls = str((float)ans);
    left = true;
    break;

  case '-':
    ans = float(ls) - float(rs);
    ls = str((float)ans);
    left = true;
    break;

  case '^':
    ans = pow(float(ls), float(rs));
    ls = str((float)ans);
    left = true;

    break;
  }
}

void keyReleased()
{
  if (!full)
  {

    if (key == '0' && left)
    {
      ls += numButtons[0].value;
    } else if (key == '0' && !left)
    {
      rs += numButtons[0].value;
    }

    if (key == '1' && left)
    {
      ls += numButtons[1].value;
    } else if (key == '1' && !left)
    {
      rs += numButtons[1].value;
    }

    if (key == '2' && left)
    {
      ls += numButtons[2].value;
    } else if (key == '2' && !left)
    {
      rs += numButtons[2].value;
    }
    if (key == '3' && left)
    {
      ls += numButtons[3].value;
    } else if (key == '3' && !left)
    {
      rs += numButtons[3].value;
    }

    if (key == '4' && left)
    {
      ls += numButtons[4].value;
    } else if (key == '4' && !left)
    {
      rs += numButtons[4].value;
    }

    if (key == '5' && left)
    {
      ls += numButtons[5].value;
    } else if (key == '5' && !left)
    {
      rs += numButtons[5].value;
    }
    if (key == '6' && left)
    {
      ls += numButtons[6].value;
    } else if (key == '6' && !left)
    {
      rs += numButtons[6].value;
    }

    if (key == '7' && left)
    {
      ls += numButtons[7].value;
    } else if (key == '7' && !left)
    {
      rs += numButtons[7].value;
    }

    if (key == '8' && left)
    {
      ls += numButtons[8].value;
    } else if (key == '8' && !left)
    {
      rs += numButtons[8].value;
    }
    if (key == '9' && left)
    {
      ls += numButtons[9].value;
    } else if (key == '9' && !left)
    {
      rs += numButtons[9].value;
    }
  }

  //Operators
  if (key == '+')
  {
    left = false;
    op = opButtons[6].o;
    rs = "";
    full = false;
  }

  if (key == '-')
  {
    left = false;
    op = opButtons[5].o;
    rs = "";
    full = false;
  }

  if (key == '*')
  {
    left = false;
    op = opButtons[4].o;
    rs = "";
    full = false;
  }

  if (key == '/')
  {
    left = false;
    op = opButtons[3].o;
    rs = "";
    full = false;
  }

  if (key == '=' || key == ENTER || key == RETURN)
  {
    performCalc();
    full = false;
  }

  if (key == '^')
  {
    left = false;
    op = opButtons[8].o;
    rs = "";
    full = false;
  }

  if (key == 'c')
  {
    clearCalc();
  }

  if (key == 'n')
  {
    if (left)
    {
      ans = float(ls) * -1;
      ls = str((float)ans);
    } else
    {
      ans = float(rs) * -1;
      rs = str((float)ans);
    }
  }

  if (key == '.')
  {
    if (left)
    {
      ls += opButtons[0].o;
    } else
    {
      rs += opButtons[0].o;
    }
  }

  if (key == 'p')
  {
    if (left)
    {
      ls = "3.141592654";
    } else
    {
      rs = "3.141592654";
    }
  }
  if (key == ESC || key == 'o')
  {
    System.exit(0);
  }
  if (key == 's')
  {
    if (left)
    {
      ans = sqrt(float(ls));
      ls = str((float)ans);
    } else
    {
      ans = sqrt(float(rs));
      rs = str((float)ans);
    }
  }
  if (key == DELETE || key == BACKSPACE)
  {
    if (left)
    {
      if (ls.length() != 0)
      { 
        String lSub = ls.substring(0, (ls.length() - 1));
        ls = lSub;
      }
    } else
    {
      if (rs.length() != 0)
      { 
        String rSub = rs.substring(0, (rs.length() - 1));
        rs = rSub;
      }
    }
  }
}