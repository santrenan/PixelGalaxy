PImage pic;

void setup() {
  size(1100, 1000); // tamanho da janela
  pic = loadImage("galaxy.jpg");
  pic.resize(300, 300); // redimensiona a imagem 
  noLoop(); // executa a função draw() apenas uma vez   
}

void draw() {
  background(0); 
  
   
  float w = (float) width / pic.width;
  float h = (float) height / pic.height;

/* Percorrem cada pixel da imagem nas direções horizontal (i) 
   e vertical (j)*/ 
  for (int i = 0; i < pic.width; i++) {
    for (int j = 0; j < pic.height; j++) {
      color c = pic.get(i, j); // obetem a cor do pixel i, j
      float bri = brightness(c);

      if (bri > 10) { // ignora pixels muito escuros
        float coef = map(bri, 0, 255, 0.1, 3.4);
        fill(255); // preenche o pixel com branco
        strokeWeight(0.3); // largura do contorno dos pixels
        ellipse(i * w, j * h, coef, coef); // Desenha o círculo com contorno
      }
    }
  }
  
  checkImageStatus();
}

void checkImageStatus() {
  // Verificar se a imagem foi carregada e manipulada corretamente após o draw
  if (pic == null || pic.width == 0 || pic.height == 0) {
    println("Erro ao carregar imagem.");
  } else {
    println("Imagem carregada com sucesso: " + pic.width + "x" + pic.height);
  }
}
