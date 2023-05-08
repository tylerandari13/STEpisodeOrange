local slopeAt = [];
for (local i = 0; i < 10; i++) {
  slopeAt[i] = (Math.random()*2)-1;
}

function samplePerlin(x) {
  local lo = Math.floor(x);
  local hi = lo+1;
  local dist = x-lo;
  local loSlope = slopeAt[lo];
  local hiSlope = slopeAt[hi];
  local loPos = loSlope * dist;
  local hiPos = -hiSlope * (1-dist);
  local u = dist * dist * (3.0 - 2.0 * dist);  // cubic curve
  return (loPos*(1-u)) + (hiPos*u);  // interpolate
}