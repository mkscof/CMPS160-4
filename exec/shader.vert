attribute vec4 a_Position; // Position of vertex
attribute vec4 a_Color; //Diffuse Color
attribute vec4 a_Normal; //Normal

uniform mat4 u_MvpMatrix;
uniform mat4 u_ModelMatrix;
uniform mat4 u_NormalMatrix;

uniform vec3 u_LightColor;
uniform vec3 u_LightPosition;
uniform vec3 u_AmbientLight;

varying vec4 v_Color;

uniform int u_shade_toggle;

void main() {
  gl_Position = u_MvpMatrix * a_Position;
  vec3 normal = normalize(vec3(u_NormalMatrix * a_Normal));
  
  vec4 vertexPosition = u_ModelMatrix * a_Position;
  vec3 lightDirection = normalize(u_LightPosition - vec3(vertexPosition));
  float nDotL = max(dot(lightDirection, normal), 0.0);
  
  vec3 specLight = vec3(0, 1, 0);
  vec3 viewDirection = vec3(0, 0, -1);
  vec3 reflectedVector = lightDirection - (2.0 * lightDirection) * normal;
  float shine = 1.0;
  float dotted = dot(reflectedVector, viewDirection);
  float rDotVp = max(pow(dotted, shine), 0.0);
  
  vec3 diffuse = u_LightColor * a_Color.rgb * nDotL;
  vec3 ambient = u_AmbientLight * a_Color.rgb;
  vec3 specular = specLight * rDotVp;
  
  int shading_type = u_shade_toggle;
  if(shading_type == 0){  //Gouraud
    v_Color = vec4(diffuse + ambient + specular, a_Color.a);
  }
}
