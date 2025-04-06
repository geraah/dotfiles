precision mediump float;

uniform float time;
varying vec2 v_texcoord;

void main() {
    vec2 mixed = mix(v_texcoord.rg * 5., gl_FragCoord.rg / (1920. * 1080.), v_texcoord.x);
    gl_FragColor = vec4(abs(sin(time)), 0., v_texcoord.y, 1.);
}