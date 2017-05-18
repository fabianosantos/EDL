-- Author: Fabiano Santos
-- Arkanoid em Lua

function love.load ()
    blockWidth = 79;
    blockSize = 20;
    blockRows = 4;
    blockCols = 10;

    inGame = false;
    lifes = 3;
    score = 0;

    ball = { x=200, y=200, speedX=5, speedY=5; height=8, width=8 }
    player = { x=50, y=400, speed=15, height=20, width=90 }

    blocks = {};
    for i=0,blockRows-1 do
      blocks[i] = {};
      for j=0,blockCols-1 do
        blocks[i][j] = { x=j*blockWidth+5, y=i*blockSize+5, width=blockWidth-2, height=blockSize-2, killed=false };
      end
    end
end

function love.update (dt)
    if love.keyboard.isDown("left") and player.x > 10 then
      player.x = player.x - player.speed
    elseif love.keyboard.isDown("right") and player.x < 690 then
      player.x = player.x + player.speed
    elseif love.keyboard.isDown("space") and inGame == false and ball.y == player.y-15 then
      inGame = true;
      ball.speedX = 0;
      ball.speedY = -8;
    elseif love.keyboard.isDown("r") then
      love.load();
    end
    updateBallPosition();
    verifyColision();
end

function love.draw ()
    drawBlocks();
    printCurrentGameValues();
    love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)
    love.graphics.circle('fill', ball.x, ball.y, ball.width, ball.height);

    if score == blockRows*blockCols then
      inGame = false;
      love.graphics.print("CONGRATULATIONS!", 250, 300, 0, 2, 2)
      love.graphics.print("aperte r para reiniciar o jogo", 200, 350, 0, 2, 2)
    end
    if lifes == 0 then
      inGame = false;
      love.graphics.print("GAME OVER!", 300, 300, 0, 2, 2)
      love.graphics.print("aperte r para reiniciar o jogo", 200, 350, 0, 2, 2)
    end
end

function drawBlocks ()
  for i=0, blockRows-1 do
    for j=0, blockCols-1 do
      --love.graphics.rectangle('fill', j*blockWidth+5, i*blockSize+5, blockWidth-2, blockSize-2)
      if blocks[i][j].killed == false then
        love.graphics.rectangle('fill', blocks[i][j].x, blocks[i][j].y, blocks[i][j].width, blocks[i][j].height);
      end
    end
  end
end

function updateBallPosition()
  if inGame == false then
     ball.x = player.x+45;
     ball.y = player.y-15;
  else
     ball.x = ball.x + ball.speedX;
     ball.y = ball.y + ball.speedY;
  end
end

function verifyColision ()
  -- Colisao com extremidades da tela
  if ball.x < 5 then
    ball.speedX = ball.speedX * -1;
  end
  if ball.x > 790 then
    ball.speedX = ball.speedX * -1;
  end
  if ball.y < 5 then
    ball.speedY = ball.speedY * -1;
  end
  if ball.y > 500 then
    inGame = false;
    lifes = lifes - 1;
  end

  --Colisao com jogador
  if ball.x >= player.x and ball.x <= player.x+player.width and ball.y > player.y and ball.y < player.y+player.height then
    ball.speedY = ball.speedY * -1;

    if ball.x <= player.x+20 then
      ball.speedX = -5;
    end
    if ball.x >= player.x+player.width-20 then
      ball.speedX = 5;
    end
  end

  --Colisao com blocos
  for i=0, blockRows-1 do
    for j=0, blockCols-1 do
      if blocks[i][j].killed == false and blocks[i][j].x < ball.x+ball.width/2 and ball.x-ball.width/2 < blocks[i][j].x+blocks[i][j].width and blocks[i][j].y < ball.y and ball.y < blocks[i][j].y+blocks[i][j].height then
        score = score + 1;
        blocks[i][j].killed = true;
        ball.speedY = ball.speedY * -1;
      end
    end
  end
end

function printCurrentGameValues()
  love.graphics.setColor(0, 255, 0, 255)
  love.graphics.print("score: ", 650, 500, 0, 2, 2)
  love.graphics.print(score, 750, 500, 0, 2, 2)
  love.graphics.print("lifes: ", 650, 530, 0, 2, 2)
  love.graphics.print(lifes, 750, 530, 0, 2, 2)
end
