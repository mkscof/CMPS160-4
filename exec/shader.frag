// this is the fragment shader: it is called for each fragment (i.e. a pixel)

#ifdef GL_ES
precision mediump float;
precision highp int;
#endif


varying vec4 v_Color;
uniform int u_shade_toggle;

void main() {
  	int shading_type = u_shade_toggle;
  	if(shading_type == 1){	//Phong

  	}
  	gl_FragColor = v_Color;
}
