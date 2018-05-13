// this is the fragment shader: it is called for each fragment (i.e. a pixel)

#ifdef GL_ES
precision mediump float;
precision highp int;
#endif

uniform vec3 u_LightColor;
uniform vec3 u_LightPosition;
uniform vec3 u_AmbientLight;

varying vec4 v_Color;
uniform int u_shade_toggle;

void main() {
  	int shading_type = u_shade_toggle;
  	vec4 phongColor = vec4(0, 1, 0, 1);
  	if(shading_type == 1){	//Phong
  		 phongColor = vec4(1, 1, 1, 1);
  		 gl_FragColor = phongColor;
  	}
  	else{
  		gl_FragColor = v_Color;
  	}
}
