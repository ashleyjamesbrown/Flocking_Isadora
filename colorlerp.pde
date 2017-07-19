color fromColor = getRandomColor();
color toColor = getRandomColor();

float currentLerpValue = 0;
float lerpStep = .001;


boolean bkg = true;

color getRandomColor() {
  return color(random(255), random(255), random(255));
}