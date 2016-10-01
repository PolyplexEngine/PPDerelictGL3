/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.opengl.extensions.arb_s;

import derelict.opengl.types : usingContexts;
import derelict.opengl.extensions.internal;

// ARB_sample_shading <-- Core in GL 4.0
enum ARB_sample_shading = "GL_ARB_sample_shading";
enum arbSampleShadingDecls =
q{
enum : uint
{
    GL_SAMPLE_SHADING_ARB             = 0x8C36,
    GL_MIN_SAMPLE_SHADING_VALUE_ARB   = 0x8C37,
}
extern(System) @nogc nothrow alias da_glMinSampleShadingARB = void function(GLclampf);
};

enum arbSampleShadingFuncs = `da_glMinSampleShadingARB glMinSampleShadingARB;`;
enum arbSampleShadingLoaderImpl = `bindGLFunc(cast(void**)&glMinSampleShadingARB, "glMinSampleShadingARB");`;
enum arbSampleShadingLoader = makeLoader(ARB_sample_shading, arbSampleShadingLoaderImpl, "gl40");
static if(!usingContexts) enum arbSampleShading = arbSampleShadingDecls ~ arbSampleShadingFuncs ~ arbSampleShadingLoader;

// ARB_sampler_objects <-- Core in GL 3.3
enum ARB_sampler_objects = "GL_ARB_sampler_objects";
enum arbSamplerObjectsDecls =
q{
enum uint GL_SAMPLER_BINDING = 0x8919;
extern(System) @nogc nothrow
{
    alias da_glGenSamplers = void function(GLsizei, GLuint*);
    alias da_glDeleteSamplers = void function(GLsizei, const(GLuint)*);
    alias da_glIsSampler = GLboolean function(GLuint);
    alias da_glBindSampler = void function(GLuint, GLuint);
    alias da_glSamplerParameteri = void function(GLuint, GLenum, GLint);
    alias da_glSamplerParameteriv = void function(GLuint, GLenum, const(GLint)*);
    alias da_glSamplerParameterf = void function(GLuint, GLenum, GLfloat);
    alias da_glSamplerParameterfv = void function(GLuint, GLenum, const(GLfloat)*);
    alias da_glSamplerParameterIiv = void function(GLuint, GLenum, const(GLint)*);
    alias da_glSamplerParameterIuiv = void function(GLuint, GLenum, const(GLuint)*);
    alias da_glGetSamplerParameteriv = void function(GLuint, GLenum, GLint*);
    alias da_glGetSamplerParameterIiv = void function(GLuint, GLenum, GLint*);
    alias da_glGetSamplerParameterfv = void function(GLuint, GLenum, GLfloat*);
    alias da_glGetSamplerParameterIuiv = void function(GLuint, GLenum, GLuint*);
}};

enum arbSamplerObjectsFuncs =
q{
    da_glGenSamplers glGenSamplers;
    da_glDeleteSamplers glDeleteSamplers;
    da_glIsSampler glIsSampler;
    da_glBindSampler glBindSampler;
    da_glSamplerParameteri glSamplerParameteri;
    da_glSamplerParameteriv glSamplerParameteriv;
    da_glSamplerParameterf glSamplerParameterf;
    da_glSamplerParameterfv glSamplerParameterfv;
    da_glSamplerParameterIiv glSamplerParameterIiv;
    da_glSamplerParameterIuiv glSamplerParameterIuiv;
    da_glGetSamplerParameteriv glGetSamplerParameteriv;
    da_glGetSamplerParameterIiv glGetSamplerParameterIiv;
    da_glGetSamplerParameterfv glGetSamplerParameterfv;
    da_glGetSamplerParameterIuiv glGetSamplerParameterIuiv;
};

enum arbSamplerObjectsLoaderImpl =
q{
    bindGLFunc(cast(void**)&glGenSamplers, "glGenSamplers");
    bindGLFunc(cast(void**)&glDeleteSamplers, "glDeleteSamplers");
    bindGLFunc(cast(void**)&glIsSampler, "glIsSampler");
    bindGLFunc(cast(void**)&glBindSampler, "glBindSampler");
    bindGLFunc(cast(void**)&glSamplerParameteri, "glSamplerParameteri");
    bindGLFunc(cast(void**)&glSamplerParameteriv, "glSamplerParameteriv");
    bindGLFunc(cast(void**)&glSamplerParameterf, "glSamplerParameterf");
    bindGLFunc(cast(void**)&glSamplerParameterfv, "glSamplerParameterfv");
    bindGLFunc(cast(void**)&glSamplerParameterIiv, "glSamplerParameterIiv");
    bindGLFunc(cast(void**)&glSamplerParameterIuiv, "glSamplerParameterIuiv");
    bindGLFunc(cast(void**)&glGetSamplerParameteriv, "glGetSamplerParameteriv");
    bindGLFunc(cast(void**)&glGetSamplerParameterIiv, "glGetSamplerParameterIiv");
    bindGLFunc(cast(void**)&glGetSamplerParameterfv, "glGetSamplerParameterfv");
    bindGLFunc(cast(void**)&glGetSamplerParameterIuiv, "glGetSamplerParameterIuiv");
};

enum arbSamplerObjectsLoader = makeLoader(ARB_sampler_objects, arbSamplerObjectsLoaderImpl, "gl33");
static if(!usingContexts) enum arbSamplerObjects = arbSamplerObjectsDecls ~ arbSamplerObjectsFuncs.makeGShared() ~ arbSamplerObjectsLoader;

// ARB_seamless_cube_map <-- Core in Gl 3.1
enum ARB_seamless_cube_map = "GL_ARB_seamless_cube_map";
enum arbSeamlessCubeMapDecls = `enum uint GL_TEXTURE_CUBE_MAP_SEAMLESS = 0x884F;`;
enum arbSeamlessCubeMapLoader = makeLoader(ARB_seamless_cube_map, "", "gl32");
static if(!usingContexts) enum arbSeamlessCubeMap = arbSeamlessCubeMapDecls ~ arbSeamlessCubeMapLoader;

// ARB_separate_shader_objects <-- Core in GL 4.1
enum ARB_separate_shader_objects = "GL_ARB_separate_shader_objects";
enum arbSeparateShaderObjectsDecls =
q{
enum : uint
{
    GL_VERTEX_SHADER_BIT              = 0x00000001,
    GL_FRAGMENT_SHADER_BIT            = 0x00000002,
    GL_GEOMETRY_SHADER_BIT            = 0x00000004,
    GL_TESS_CONTROL_SHADER_BIT        = 0x00000008,
    GL_TESS_EVALUATION_SHADER_BIT     = 0x00000010,
    GL_ALL_SHADER_BITS                = 0xFFFFFFFF,
    GL_PROGRAM_SEPARABLE              = 0x8258,
    GL_ACTIVE_PROGRAM                 = 0x8259,
    GL_PROGRAM_PIPELINE_BINDING       = 0x825A,
}
extern(System) @nogc nothrow {
    alias da_glUseProgramStages = void function(GLuint, GLbitfield, GLuint);
    alias da_glActiveShaderProgram = void function(GLuint, GLuint);
    alias da_glCreateShaderProgramv = GLuint function(GLenum, GLsizei, const(GLchar*)*);
    alias da_glBindProgramPipeline = void function(GLuint);
    alias da_glDeleteProgramPipelines = void function(GLsizei, const(GLuint)*);
    alias da_glGenProgramPipelines = void function(GLsizei, GLuint*);
    alias da_glIsProgramPipeline = GLboolean function(GLuint);
    alias da_glGetProgramPipelineiv = void function(GLuint, GLenum, GLint*);
    alias da_glProgramUniform1i = void function(GLuint, GLint, GLint);
    alias da_glProgramUniform1iv = void function(GLuint, GLint, GLsizei, const(GLint)*);
    alias da_glProgramUniform1f = void function(GLuint, GLint, GLfloat);
    alias da_glProgramUniform1fv = void function(GLuint, GLint, GLsizei, const(GLfloat)*);
    alias da_glProgramUniform1d = void function(GLuint, GLint, GLdouble);
    alias da_glProgramUniform1dv = void function(GLuint, GLint, GLsizei, const(GLdouble)*);
    alias da_glProgramUniform1ui = void function(GLuint, GLint, GLuint);
    alias da_glProgramUniform1uiv = void function(GLuint, GLint, GLsizei, const(GLuint)*);
    alias da_glProgramUniform2i = void function(GLuint, GLint, GLint, GLint);
    alias da_glProgramUniform2iv = void function(GLuint, GLint, GLsizei, const(GLint)*);
    alias da_glProgramUniform2f = void function(GLuint, GLint, GLfloat, GLfloat);
    alias da_glProgramUniform2fv = void function(GLuint, GLint, GLsizei, const(GLfloat)*);
    alias da_glProgramUniform2d = void function(GLuint, GLint, GLdouble, GLdouble);
    alias da_glProgramUniform2dv = void function(GLuint, GLint, GLsizei, const(GLdouble)*);
    alias da_glProgramUniform2ui = void function(GLuint, GLint, GLuint, GLuint);
    alias da_glProgramUniform2uiv = void function(GLuint, GLint, GLsizei, const(GLuint)*);
    alias da_glProgramUniform3i = void function(GLuint, GLint, GLint, GLint, GLint);
    alias da_glProgramUniform3iv = void function(GLuint, GLint, GLsizei, const(GLint)*);
    alias da_glProgramUniform3f = void function(GLuint, GLint, GLfloat, GLfloat, GLfloat);
    alias da_glProgramUniform3fv = void function(GLuint, GLint, GLsizei, const(GLfloat)*);
    alias da_glProgramUniform3d = void function(GLuint, GLint, GLdouble, GLdouble, GLdouble);
    alias da_glProgramUniform3dv = void function(GLuint, GLint, GLsizei, const(GLdouble)*);
    alias da_glProgramUniform3ui = void function(GLuint, GLint, GLuint, GLuint, GLuint);
    alias da_glProgramUniform3uiv = void function(GLuint, GLint, GLsizei, const(GLuint)*);
    alias da_glProgramUniform4i = void function(GLuint, GLint, GLint, GLint, GLint, GLint);
    alias da_glProgramUniform4iv = void function(GLuint, GLint, GLsizei, const(GLint)*);
    alias da_glProgramUniform4f = void function(GLuint, GLint, GLfloat, GLfloat, GLfloat, GLfloat);
    alias da_glProgramUniform4fv = void function(GLuint, GLint, GLsizei, const(GLfloat)*);
    alias da_glProgramUniform4d = void function(GLuint, GLint, GLdouble, GLdouble, GLdouble, GLdouble);
    alias da_glProgramUniform4dv = void function(GLuint, GLint, GLsizei, const(GLdouble)*);
    alias da_glProgramUniform4ui = void function(GLuint, GLint, GLuint, GLuint, GLuint, GLuint);
    alias da_glProgramUniform4uiv = void function(GLuint, GLint, GLsizei, const(GLuint)*);
    alias da_glProgramUniformMatrix2fv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLfloat)*);
    alias da_glProgramUniformMatrix3fv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLfloat)*);
    alias da_glProgramUniformMatrix4fv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLfloat)*);
    alias da_glProgramUniformMatrix2dv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLdouble)*);
    alias da_glProgramUniformMatrix3dv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLdouble)*);
    alias da_glProgramUniformMatrix4dv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLdouble)*);
    alias da_glProgramUniformMatrix2x3fv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLfloat)*);
    alias da_glProgramUniformMatrix3x2fv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLfloat)*);
    alias da_glProgramUniformMatrix2x4fv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLfloat)*);
    alias da_glProgramUniformMatrix4x2fv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLfloat)*);
    alias da_glProgramUniformMatrix3x4fv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLfloat)*);
    alias da_glProgramUniformMatrix4x3fv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLfloat)*);
    alias da_glProgramUniformMatrix2x3dv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLdouble)*);
    alias da_glProgramUniformMatrix3x2dv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLdouble)*);
    alias da_glProgramUniformMatrix2x4dv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLdouble)*);
    alias da_glProgramUniformMatrix4x2dv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLdouble)*);
    alias da_glProgramUniformMatrix3x4dv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLdouble)*);
    alias da_glProgramUniformMatrix4x3dv = void function(GLuint, GLint, GLsizei, GLboolean, const(GLdouble)*);
    alias da_glValidateProgramPipeline = void function(GLuint);
    alias da_glGetProgramPipelineInfoLog = void function(GLuint, GLsizei, GLsizei*, GLchar*);
}};

enum arbSeparateShaderObjectsFuncs =
q{
    da_glUseProgramStages glUseProgramStages;
    da_glActiveShaderProgram glActiveShaderProgram;
    da_glCreateShaderProgramv glCreateShaderProgramv;
    da_glBindProgramPipeline glBindProgramPipeline;
    da_glDeleteProgramPipelines glDeleteProgramPipelines;
    da_glGenProgramPipelines glGenProgramPipelines;
    da_glIsProgramPipeline glIsProgramPipeline;
    da_glGetProgramPipelineiv glGetProgramPipelineiv;
    da_glProgramUniform1i glProgramUniform1i;
    da_glProgramUniform1iv glProgramUniform1iv;
    da_glProgramUniform1f glProgramUniform1f;
    da_glProgramUniform1fv glProgramUniform1fv;
    da_glProgramUniform1d glProgramUniform1d;
    da_glProgramUniform1dv glProgramUniform1dv;
    da_glProgramUniform1ui glProgramUniform1ui;
    da_glProgramUniform1uiv glProgramUniform1uiv;
    da_glProgramUniform2i glProgramUniform2i;
    da_glProgramUniform2iv glProgramUniform2iv;
    da_glProgramUniform2f glProgramUniform2f;
    da_glProgramUniform2fv glProgramUniform2fv;
    da_glProgramUniform2d glProgramUniform2d;
    da_glProgramUniform2dv glProgramUniform2dv;
    da_glProgramUniform2ui glProgramUniform2ui;
    da_glProgramUniform2uiv glProgramUniform2uiv;
    da_glProgramUniform3i glProgramUniform3i;
    da_glProgramUniform3iv glProgramUniform3iv;
    da_glProgramUniform3f glProgramUniform3f;
    da_glProgramUniform3fv glProgramUniform3fv;
    da_glProgramUniform3d glProgramUniform3d;
    da_glProgramUniform3dv glProgramUniform3dv;
    da_glProgramUniform3ui glProgramUniform3ui;
    da_glProgramUniform3uiv glProgramUniform3uiv;
    da_glProgramUniform4i glProgramUniform4i;
    da_glProgramUniform4iv glProgramUniform4iv;
    da_glProgramUniform4f glProgramUniform4f;
    da_glProgramUniform4fv glProgramUniform4fv;
    da_glProgramUniform4d glProgramUniform4d;
    da_glProgramUniform4dv glProgramUniform4dv;
    da_glProgramUniform4ui glProgramUniform4ui;
    da_glProgramUniform4uiv glProgramUniform4uiv;
    da_glProgramUniformMatrix2fv glProgramUniformMatrix2fv;
    da_glProgramUniformMatrix3fv glProgramUniformMatrix3fv;
    da_glProgramUniformMatrix4fv glProgramUniformMatrix4fv;
    da_glProgramUniformMatrix2dv glProgramUniformMatrix2dv;
    da_glProgramUniformMatrix3dv glProgramUniformMatrix3dv;
    da_glProgramUniformMatrix4dv glProgramUniformMatrix4dv;
    da_glProgramUniformMatrix2x3fv glProgramUniformMatrix2x3fv;
    da_glProgramUniformMatrix3x2fv glProgramUniformMatrix3x2fv;
    da_glProgramUniformMatrix2x4fv glProgramUniformMatrix2x4fv;
    da_glProgramUniformMatrix4x2fv glProgramUniformMatrix4x2fv;
    da_glProgramUniformMatrix3x4fv glProgramUniformMatrix3x4fv;
    da_glProgramUniformMatrix4x3fv glProgramUniformMatrix4x3fv;
    da_glProgramUniformMatrix2x3dv glProgramUniformMatrix2x3dv;
    da_glProgramUniformMatrix3x2dv glProgramUniformMatrix3x2dv;
    da_glProgramUniformMatrix2x4dv glProgramUniformMatrix2x4dv;
    da_glProgramUniformMatrix4x2dv glProgramUniformMatrix4x2dv;
    da_glProgramUniformMatrix3x4dv glProgramUniformMatrix3x4dv;
    da_glProgramUniformMatrix4x3dv glProgramUniformMatrix4x3dv;
    da_glValidateProgramPipeline glValidateProgramPipeline;
    da_glGetProgramPipelineInfoLog glGetProgramPipelineInfoLog;
};

enum arbSeparateShaderObjectsLoaderImpl =
q{
    bindGLFunc(cast(void**)&glUseProgramStages, "glUseProgramStages");
    bindGLFunc(cast(void**)&glActiveShaderProgram, "glActiveShaderProgram");
    bindGLFunc(cast(void**)&glCreateShaderProgramv, "glCreateShaderProgramv");
    bindGLFunc(cast(void**)&glBindProgramPipeline, "glBindProgramPipeline");
    bindGLFunc(cast(void**)&glDeleteProgramPipelines, "glDeleteProgramPipelines");
    bindGLFunc(cast(void**)&glGenProgramPipelines, "glGenProgramPipelines");
    bindGLFunc(cast(void**)&glIsProgramPipeline, "glIsProgramPipeline");
    bindGLFunc(cast(void**)&glGetProgramPipelineiv, "glGetProgramPipelineiv");
    bindGLFunc(cast(void**)&glProgramUniform1i, "glProgramUniform1i");
    bindGLFunc(cast(void**)&glProgramUniform1iv, "glProgramUniform1iv");
    bindGLFunc(cast(void**)&glProgramUniform1f, "glProgramUniform1f");
    bindGLFunc(cast(void**)&glProgramUniform1fv, "glProgramUniform1fv");
    bindGLFunc(cast(void**)&glProgramUniform1d, "glProgramUniform1d");
    bindGLFunc(cast(void**)&glProgramUniform1dv, "glProgramUniform1dv");
    bindGLFunc(cast(void**)&glProgramUniform1ui, "glProgramUniform1ui");
    bindGLFunc(cast(void**)&glProgramUniform1uiv, "glProgramUniform1uiv");
    bindGLFunc(cast(void**)&glProgramUniform2i, "glProgramUniform2i");
    bindGLFunc(cast(void**)&glProgramUniform2iv, "glProgramUniform2iv");
    bindGLFunc(cast(void**)&glProgramUniform2f, "glProgramUniform2f");
    bindGLFunc(cast(void**)&glProgramUniform2fv, "glProgramUniform2fv");
    bindGLFunc(cast(void**)&glProgramUniform2d, "glProgramUniform2d");
    bindGLFunc(cast(void**)&glProgramUniform2dv, "glProgramUniform2dv");
    bindGLFunc(cast(void**)&glProgramUniform2ui, "glProgramUniform2ui");
    bindGLFunc(cast(void**)&glProgramUniform2uiv, "glProgramUniform2uiv");
    bindGLFunc(cast(void**)&glProgramUniform3i, "glProgramUniform3i");
    bindGLFunc(cast(void**)&glProgramUniform3iv, "glProgramUniform3iv");
    bindGLFunc(cast(void**)&glProgramUniform3f, "glProgramUniform3f");
    bindGLFunc(cast(void**)&glProgramUniform3fv, "glProgramUniform3fv");
    bindGLFunc(cast(void**)&glProgramUniform3d, "glProgramUniform3d");
    bindGLFunc(cast(void**)&glProgramUniform3dv, "glProgramUniform3dv");
    bindGLFunc(cast(void**)&glProgramUniform3ui, "glProgramUniform3ui");
    bindGLFunc(cast(void**)&glProgramUniform3uiv, "glProgramUniform3uiv");
    bindGLFunc(cast(void**)&glProgramUniform4i, "glProgramUniform4i");
    bindGLFunc(cast(void**)&glProgramUniform4iv, "glProgramUniform4iv");
    bindGLFunc(cast(void**)&glProgramUniform4f, "glProgramUniform4f");
    bindGLFunc(cast(void**)&glProgramUniform4fv, "glProgramUniform4fv");
    bindGLFunc(cast(void**)&glProgramUniform4d, "glProgramUniform4d");
    bindGLFunc(cast(void**)&glProgramUniform4dv, "glProgramUniform4dv");
    bindGLFunc(cast(void**)&glProgramUniform4ui, "glProgramUniform4ui");
    bindGLFunc(cast(void**)&glProgramUniform4uiv, "glProgramUniform4uiv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix2fv, "glProgramUniformMatrix2fv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix3fv, "glProgramUniformMatrix3fv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix4fv, "glProgramUniformMatrix4fv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix2dv, "glProgramUniformMatrix2dv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix3dv, "glProgramUniformMatrix3dv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix4dv, "glProgramUniformMatrix4dv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix2x3fv, "glProgramUniformMatrix2x3fv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix3x2fv, "glProgramUniformMatrix3x2fv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix2x4fv, "glProgramUniformMatrix2x4fv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix4x2fv, "glProgramUniformMatrix4x2fv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix3x4fv, "glProgramUniformMatrix3x4fv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix4x3fv, "glProgramUniformMatrix4x3fv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix2x3dv, "glProgramUniformMatrix2x3dv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix3x2dv, "glProgramUniformMatrix3x2dv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix2x4dv, "glProgramUniformMatrix2x4dv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix4x2dv, "glProgramUniformMatrix4x2dv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix3x4dv, "glProgramUniformMatrix3x4dv");
    bindGLFunc(cast(void**)&glProgramUniformMatrix4x3dv, "glProgramUniformMatrix4x3dv");
    bindGLFunc(cast(void**)&glValidateProgramPipeline, "glValidateProgramPipeline");
    bindGLFunc(cast(void**)&glGetProgramPipelineInfoLog, "glGetProgramPipelineInfoLog");
};

enum arbSeparateShaderObjectsLoader = makeLoader(ARB_separate_shader_objects, arbSeparateShaderObjectsLoaderImpl, "gl41");
static if(!usingContexts) enum arbSeparateShaderObjects = arbSeparateShaderObjectsDecls ~ arbSeparateShaderObjectsFuncs.makeGShared() ~ arbSeparateShaderObjectsLoader;

// ARB_shader_atomic_counters <-- Core in GL 4.2
enum ARB_shader_atomic_counters = "GL_ARB_shader_atomic_counters";
enum arbShaderAtomicCountersDecls =
q{
enum : uint {
    GL_ATOMIC_COUNTER_BUFFER          = 0x92C0,
    GL_ATOMIC_COUNTER_BUFFER_BINDING  = 0x92C1,
    GL_ATOMIC_COUNTER_BUFFER_START    = 0x92C2,
    GL_ATOMIC_COUNTER_BUFFER_SIZE     = 0x92C3,
    GL_ATOMIC_COUNTER_BUFFER_DATA_SIZE = 0x92C4,
    GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTERS = 0x92C5,
    GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTER_INDICES = 0x92C6,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_VERTEX_SHADER = 0x92C7,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_CONTROL_SHADER = 0x92C8,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x92C9,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_GEOMETRY_SHADER = 0x92CA,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_FRAGMENT_SHADER = 0x92CB,
    GL_MAX_VERTEX_ATOMIC_COUNTER_BUFFERS = 0x92CC,
    GL_MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS = 0x92CD,
    GL_MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS = 0x92CE,
    GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS = 0x92CF,
    GL_MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS = 0x92D0,
    GL_MAX_COMBINED_ATOMIC_COUNTER_BUFFERS = 0x92D1,
    GL_MAX_VERTEX_ATOMIC_COUNTERS     = 0x92D2,
    GL_MAX_TESS_CONTROL_ATOMIC_COUNTERS = 0x92D3,
    GL_MAX_TESS_EVALUATION_ATOMIC_COUNTERS = 0x92D4,
    GL_MAX_GEOMETRY_ATOMIC_COUNTERS   = 0x92D5,
    GL_MAX_FRAGMENT_ATOMIC_COUNTERS   = 0x92D6,
    GL_MAX_COMBINED_ATOMIC_COUNTERS   = 0x92D7,
    GL_MAX_ATOMIC_COUNTER_BUFFER_SIZE = 0x92D8,
    GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS = 0x92DC,
    GL_ACTIVE_ATOMIC_COUNTER_BUFFERS  = 0x92D9,
    GL_UNIFORM_ATOMIC_COUNTER_BUFFER_INDEX = 0x92DA,
    GL_UNSIGNED_INT_ATOMIC_COUNTER    = 0x92DB,
}
extern(System) @nogc nothrow alias da_glGetActiveAtomicCounterBufferiv = void function(GLuint, GLuint, GLenum, GLint*);
};

enum arbShaderAtomicCountersFuncs = `da_glGetActiveAtomicCounterBufferiv glGetActiveAtomicCounterBufferiv;`;
enum arbShaderAtomicCountersLoaderImpl = `bindGLFunc(cast(void**)&glGetActiveAtomicCounterBufferiv, "glGetActiveAtomicCounterBufferiv");`;
enum arbShaderAtomicCountersLoader = makeLoader(ARB_shader_atomic_counters, arbShaderAtomicCountersLoaderImpl, "gl42");
static if(!usingContexts) enum arbShaderAtomicCounters = arbShaderAtomicCountersDecls ~ arbShaderAtomicCountersFuncs.makeGShared() ~ arbShaderAtomicCountersLoader;

// ARB_shader_bit_encoding <-- Core in GL 3.3
enum ARB_shader_bit_encoding = "GL_ARB_shader_bit_encoding";
enum arbShaderBitEncodingLoader = makeLoader(ARB_shader_bit_encoding, "", "gl33");
static if(!usingContexts) enum arbShaderBitEncoding = arbShaderBitEncodingLoader;

// ARB_shader_image_load_store <-- Core in GL 4.2
enum ARB_shader_image_load_store = "GL_ARB_shader_image_load_store";
enum arbShaderImageLoadStoreDecls =
q{
enum : uint
{
    GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT = 0x00000001,
    GL_ELEMENT_ARRAY_BARRIER_BIT      = 0x00000002,
    GL_UNIFORM_BARRIER_BIT            = 0x00000004,
    GL_TEXTURE_FETCH_BARRIER_BIT      = 0x00000008,
    GL_SHADER_IMAGE_ACCESS_BARRIER_BIT = 0x00000020,
    GL_COMMAND_BARRIER_BIT            = 0x00000040,
    GL_PIXEL_BUFFER_BARRIER_BIT       = 0x00000080,
    GL_TEXTURE_UPDATE_BARRIER_BIT     = 0x00000100,
    GL_BUFFER_UPDATE_BARRIER_BIT      = 0x00000200,
    GL_FRAMEBUFFER_BARRIER_BIT        = 0x00000400,
    GL_TRANSFORM_FEEDBACK_BARRIER_BIT = 0x00000800,
    GL_ATOMIC_COUNTER_BARRIER_BIT     = 0x00001000,
    GL_ALL_BARRIER_BITS               = 0xFFFFFFFF,
    GL_MAX_IMAGE_UNITS                = 0x8F38,
    GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS = 0x8F39,
    GL_IMAGE_BINDING_NAME             = 0x8F3A,
    GL_IMAGE_BINDING_LEVEL            = 0x8F3B,
    GL_IMAGE_BINDING_LAYERED          = 0x8F3C,
    GL_IMAGE_BINDING_LAYER            = 0x8F3D,
    GL_IMAGE_BINDING_ACCESS           = 0x8F3E,
    GL_IMAGE_1D                       = 0x904C,
    GL_IMAGE_2D                       = 0x904D,
    GL_IMAGE_3D                       = 0x904E,
    GL_IMAGE_2D_RECT                  = 0x904F,
    GL_IMAGE_CUBE                     = 0x9050,
    GL_IMAGE_BUFFER                   = 0x9051,
    GL_IMAGE_1D_ARRAY                 = 0x9052,
    GL_IMAGE_2D_ARRAY                 = 0x9053,
    GL_IMAGE_CUBE_MAP_ARRAY           = 0x9054,
    GL_IMAGE_2D_MULTISAMPLE           = 0x9055,
    GL_IMAGE_2D_MULTISAMPLE_ARRAY     = 0x9056,
    GL_INT_IMAGE_1D                   = 0x9057,
    GL_INT_IMAGE_2D                   = 0x9058,
    GL_INT_IMAGE_3D                   = 0x9059,
    GL_INT_IMAGE_2D_RECT              = 0x905A,
    GL_INT_IMAGE_CUBE                 = 0x905B,
    GL_INT_IMAGE_BUFFER               = 0x905C,
    GL_INT_IMAGE_1D_ARRAY             = 0x905D,
    GL_INT_IMAGE_2D_ARRAY             = 0x905E,
    GL_INT_IMAGE_CUBE_MAP_ARRAY       = 0x905F,
    GL_INT_IMAGE_2D_MULTISAMPLE       = 0x9060,
    GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY = 0x9061,
    GL_UNSIGNED_INT_IMAGE_1D          = 0x9062,
    GL_UNSIGNED_INT_IMAGE_2D          = 0x9063,
    GL_UNSIGNED_INT_IMAGE_3D          = 0x9064,
    GL_UNSIGNED_INT_IMAGE_2D_RECT     = 0x9065,
    GL_UNSIGNED_INT_IMAGE_CUBE        = 0x9066,
    GL_UNSIGNED_INT_IMAGE_BUFFER      = 0x9067,
    GL_UNSIGNED_INT_IMAGE_1D_ARRAY    = 0x9068,
    GL_UNSIGNED_INT_IMAGE_2D_ARRAY    = 0x9069,
    GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY = 0x906A,
    GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE = 0x906B,
    GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY = 0x906C,
    GL_MAX_IMAGE_SAMPLES              = 0x906D,
    GL_IMAGE_BINDING_FORMAT           = 0x906E,
    GL_IMAGE_FORMAT_COMPATIBILITY_TYPE = 0x90C7,
    GL_IMAGE_FORMAT_COMPATIBILITY_BY_SIZE = 0x90C8,
    GL_IMAGE_FORMAT_COMPATIBILITY_BY_CLASS = 0x90C9,
    GL_MAX_VERTEX_IMAGE_UNIFORMS      = 0x90CA,
    GL_MAX_TESS_CONTROL_IMAGE_UNIFORMS = 0x90CB,
    GL_MAX_TESS_EVALUATION_IMAGE_UNIFORMS = 0x90CC,
    GL_MAX_GEOMETRY_IMAGE_UNIFORMS    = 0x90CD,
    GL_MAX_FRAGMENT_IMAGE_UNIFORMS    = 0x90CE,
    GL_MAX_COMBINED_IMAGE_UNIFORMS    = 0x90CF,
}
extern(System) @nogc nothrow {
    alias da_glBindImageTexture = void function(GLuint, GLuint, GLint, GLboolean, GLint, GLenum, GLenum);
    alias da_glMemoryBarrier = void function(GLbitfield);
}};

enum arbShaderImageLoadStoreFuncs =
q{
    da_glBindImageTexture glBindImageTexture;
    da_glMemoryBarrier glMemoryBarrier;
};

enum arbShaderImageLoadStoreLoaderImpl =
q{
    bindGLFunc(cast(void**)&glBindImageTexture, "glBindImageTexture");
    bindGLFunc(cast(void**)&glMemoryBarrier, "glMemoryBarrier");
};

enum arbShaderImageLoadStoreLoader = makeLoader(ARB_shader_image_load_store, arbShaderImageLoadStoreLoaderImpl, "gl42");
static if(!usingContexts) enum arbShaderImageLoadStore = arbShaderImageLoadStoreDecls ~ arbShaderImageLoadStoreFuncs.makeGShared() ~ arbShaderImageLoadStoreLoader;

// ARB_shader_image_size <-- Core in GL 4.3
enum ARB_shader_image_size = "GL_ARB_shader_image_size";
enum arbShaderImageSizeLoader = makeLoader(ARB_shader_image_size, "", "gl43");
static if(!usingContexts) enum arbShaderImageSize = arbShaderImageSizeLoader;

// ARB_shader_precision <-- Core in GL 4.1
enum ARB_shader_precision = "GL_ARB_shader_precision";
enum arbShaderPrecisionLoader = makeLoader(ARB_shader_precision, "", "gl41");
static if(!usingContexts) enum arbShaderPrecision = arbShaderPrecisionLoader;

// ARB_shader_stencil_export
enum ARB_shader_stencil_export = "GL_ARB_shader_stencil_export";
enum arbShaderStencilExportLoader = makeExtLoader(ARB_shader_stencil_export);
static if(!usingContexts) enum arbShaderStencilExport = arbShaderStencilExportLoader;

// ARB_shader_storage_buffer_object <-- Core in GL 4.3
enum ARB_shader_storage_buffer_object = "GL_ARB_shader_storage_buffer_object";
enum arbShaderStorageBufferObjectDecls =
q{
enum : uint
{
    GL_SHADER_STORAGE_BUFFER          = 0x90D2,
    GL_SHADER_STORAGE_BUFFER_BINDING  = 0x90D3,
    GL_SHADER_STORAGE_BUFFER_START    = 0x90D4,
    GL_SHADER_STORAGE_BUFFER_SIZE     = 0x90D5,
    GL_MAX_VERTEX_SHADER_STORAGE_BLOCKS = 0x90D6,
    GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS = 0x90D7,
    GL_MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS = 0x90D8,
    GL_MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS = 0x90D9,
    GL_MAX_FRAGMENT_SHADER_STORAGE_BLOCKS = 0x90DA,
    GL_MAX_COMPUTE_SHADER_STORAGE_BLOCKS = 0x90DB,
    GL_MAX_COMBINED_SHADER_STORAGE_BLOCKS = 0x90DC,
    GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS = 0x90DD,
    GL_MAX_SHADER_STORAGE_BLOCK_SIZE  = 0x90DE,
    GL_SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT = 0x90DF,
    GL_SHADER_STORAGE_BARRIER_BIT     = 0x2000,
    GL_MAX_COMBINED_SHADER_OUTPUT_RESOURCES = 0x8F39,
}
extern(System) @nogc nothrow alias da_glShaderStorageBlockBinding = void function(GLuint,GLuint,GLuint);
};

enum arbShaderStorageBufferObjectFuncs = `da_glShaderStorageBlockBinding glShaderStorageBlockBinding;`;
enum arbShaderStorageBufferObjectLoaderImpl = `bindGLFunc(cast(void**)&glShaderStorageBlockBinding, "glShaderStorageBlockBinding");`;
enum arbShaderStorageBufferObjectLoader = makeLoader(ARB_shader_storage_buffer_object, arbShaderStorageBufferObjectLoaderImpl, "gl43");
static if(!usingContexts) enum arbShaderStorageBufferObject = arbShaderStorageBufferObjectDecls ~ arbShaderStorageBufferObjectFuncs.makeGShared() ~ arbShaderStorageBufferObjectLoader;

// ARB_shader_subroutine <-- Core in GL 4.0
enum ARB_shader_subroutine = "GL_ARB_shader_subroutine";
enum arbShaderSubroutineDecls =
q{
enum : uint
{
    GL_ACTIVE_SUBROUTINES             = 0x8DE5,
    GL_ACTIVE_SUBROUTINE_UNIFORMS     = 0x8DE6,
    GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS = 0x8E47,
    GL_ACTIVE_SUBROUTINE_MAX_LENGTH   = 0x8E48,
    GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH = 0x8E49,
    GL_MAX_SUBROUTINES                = 0x8DE7,
    GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS = 0x8DE8,
    GL_NUM_COMPATIBLE_SUBROUTINES     = 0x8E4A,
    GL_COMPATIBLE_SUBROUTINES         = 0x8E4B,
}
extern(System) @nogc nothrow {
    alias da_glGetSubroutineUniformLocation = GLint function(GLuint, GLenum, const(GLchar)*);
    alias da_glGetSubroutineIndex = GLuint function(GLuint, GLenum, const(GLchar)*);
    alias da_glGetActiveSubroutineUniformiv = void function(GLuint, GLenum, GLuint, GLenum, GLint*);
    alias da_glGetActiveSubroutineUniformName = void function(GLuint, GLenum, GLuint, GLsizei, GLsizei*, GLchar*);
    alias da_glGetActiveSubroutineName = void function(GLuint, GLenum, GLuint, GLsizei, GLsizei*, GLchar*);
    alias da_glUniformSubroutinesuiv = void function(GLenum, GLsizei, const(GLuint)*);
    alias da_glGetUniformSubroutineuiv = void function(GLenum, GLint, GLuint*);
    alias da_glGetProgramStageiv = void function(GLuint, GLenum, GLenum, GLint*);
}};

enum arbShaderSubroutineFuncs =
q{
    da_glGetSubroutineUniformLocation glGetSubroutineUniformLocation;
    da_glGetSubroutineIndex glGetSubroutineIndex;
    da_glGetActiveSubroutineUniformiv glGetActiveSubroutineUniformiv;
    da_glGetActiveSubroutineUniformName glGetActiveSubroutineUniformName;
    da_glGetActiveSubroutineName glGetActiveSubroutineName;
    da_glUniformSubroutinesuiv glUniformSubroutinesuiv;
    da_glGetUniformSubroutineuiv glGetUniformSubroutineuiv;
    da_glGetProgramStageiv glGetProgramStageiv;
};

enum arbShaderSubroutineLoaderImpl =
q{
    bindGLFunc(cast(void**)&glGetSubroutineUniformLocation, "glGetSubroutineUniformLocation");
    bindGLFunc(cast(void**)&glGetSubroutineIndex, "glGetSubroutineIndex");
    bindGLFunc(cast(void**)&glGetActiveSubroutineUniformiv, "glGetActiveSubroutineUniformiv");
    bindGLFunc(cast(void**)&glGetActiveSubroutineUniformName, "glGetActiveSubroutineUniformName");
    bindGLFunc(cast(void**)&glGetActiveSubroutineName, "glGetActiveSubroutineName");
    bindGLFunc(cast(void**)&glUniformSubroutinesuiv, "glUniformSubroutinesuiv");
    bindGLFunc(cast(void**)&glGetUniformSubroutineuiv, "glGetUniformSubroutineuiv");
    bindGLFunc(cast(void**)&glGetProgramStageiv, "glGetProgramStageiv");
};

enum arbShaderSubroutineLoader = makeLoader(ARB_shader_subroutine, arbShaderSubroutineLoaderImpl, "gl40");
static if(!usingContexts) enum arbShaderSubroutine = arbShaderSubroutineDecls ~ arbShaderSubroutineFuncs.makeGShared() ~ arbShaderSubroutineLoader;

// ARB_shader_texture_image_samples <-- Core in GL 4.5
enum ARB_shader_texture_image_samples = "GL_ARB_shader_texture_image_samples";
enum arbShaderTextureImageSamplesLoader = makeLoader(ARB_shader_texture_image_samples, "", "gl45");
static if(!usingContexts) enum arbShaderTextureImageSamples = arbShaderTextureImageSamplesLoader;

// ARB_shading_language_420pack <-- Core in GL 4.2
enum ARB_shading_language_420pack = "GL_ARB_shading_language_420pack";
enum arbShadingLanguage420PackLoader = makeLoader(ARB_shading_language_420pack, "", "gl42");
static if(!usingContexts) enum arbShadingLanguage420Pack = arbShadingLanguage420PackLoader;

// ARB_shading_language_include
enum ARB_shading_language_include = "GL_ARB_shading_language_include";
enum arbShadingLanguageIncludeDecls =
q{
enum : uint
{
    GL_SHADER_INCLUDE_ARB             = 0x8DAE,
    GL_NAMED_STRING_LENGTH_ARB        = 0x8DE9,
    GL_NAMED_STRING_TYPE_ARB          = 0x8DEA,
}
extern(System) @nogc nothrow {
    alias da_glNamedStringARB = void function(GLenum, GLint, const(GLchar)*, GLint, const(GLchar)*);
    alias da_glDeleteNamedStringARB = void function(GLint, const(GLchar)*);
    alias da_glCompileShaderIncludeARB = void function(GLuint, GLsizei, const(GLchar)*, const(GLint)*);
    alias da_glIsNamedStringARB = GLboolean function(GLint, const(GLchar)*);
    alias da_glGetNamedStringARB = void function(GLint, const(GLchar)*, GLsizei, GLint*, GLchar*);
    alias da_glGetNamedStringivARB = void function(GLint, const(GLchar)*, GLenum, GLint*);
}};

enum arbShadingLanguageIncludeFuncs =
q{
    da_glNamedStringARB glNamedStringARB;
    da_glDeleteNamedStringARB glDeleteNamedStringARB;
    da_glCompileShaderIncludeARB glCompileShaderIncludeARB;
    da_glIsNamedStringARB glIsNamedStringARB;
    da_glGetNamedStringARB glGetNamedStringARB;
    da_glGetNamedStringivARB glGetNamedStringivARB;
};

enum arbShadingLanguageIncludeLoaderImpl =
q{
    bindGLFunc(cast(void**)&glNamedStringARB, "glNamedStringARB");
    bindGLFunc(cast(void**)&glDeleteNamedStringARB, "glDeleteNamedStringARB");
    bindGLFunc(cast(void**)&glCompileShaderIncludeARB, "glCompileShaderIncludeARB");
    bindGLFunc(cast(void**)&glIsNamedStringARB, "glIsNamedStringARB");
    bindGLFunc(cast(void**)&glGetNamedStringARB, "glGetNamedStringARB");
    bindGLFunc(cast(void**)&glGetNamedStringivARB, "glGetNamedStringivARB");
};

enum arbShadingLanguageIncludeLoader = makeExtLoader(ARB_shading_language_include, arbShadingLanguageIncludeLoaderImpl);
static if(!usingContexts) enum arbShadingLanguageInclude = arbShadingLanguageIncludeDecls ~ arbShadingLanguageIncludeFuncs.makeGShared() ~ arbShadingLanguageIncludeLoader;

// ARB_shading_language_packing
enum ARB_shading_language_packing = "GL_ARB_shading_language_packing";
enum arbShadingLanguagePackingLoader = makeExtLoader(ARB_shading_language_packing);
static if(!usingContexts) enum arbShadingLanguagePacking = arbShadingLanguagePackingLoader;

// ARB_stencil_texturing <-- Core in GL 4.3
enum ARB_stencil_texturing = "GL_ARB_stencil_texturing";
enum arbStencilTexturingDecls = `enum uint GL_DEPTH_STENCIL_TEXTURE_MODE = 0x90EA;`;
enum arbStencilTexturingLoader = makeLoader(ARB_stencil_texturing, "", "gl43");
static if(!usingContexts) enum arbStencilTexturing = arbStencilTexturingDecls ~ arbStencilTexturingLoader;

// ARB_sync <-- Core in GL 3.2
enum ARB_sync = "GL_ARB_sync";
enum arbSyncDecls =
q{
enum ulong GL_TIMEOUT_IGNORED  = 0xFFFFFFFFFFFFFFFF;
alias GLint64 = long;
alias GLuint64 = ulong;
struct __GLsync;
alias __GLsync* GLsync;
enum : uint
{
    GL_MAX_SERVER_WAIT_TIMEOUT        = 0x9111,
    GL_OBJECT_TYPE                    = 0x9112,
    GL_SYNC_CONDITION                 = 0x9113,
    GL_SYNC_STATUS                    = 0x9114,
    GL_SYNC_FLAGS                     = 0x9115,
    GL_SYNC_FENCE                     = 0x9116,
    GL_SYNC_GPU_COMMANDS_COMPLETE     = 0x9117,
    GL_UNSIGNALED                     = 0x9118,
    GL_SIGNALED                       = 0x9119,
    GL_ALREADY_SIGNALED               = 0x911A,
    GL_TIMEOUT_EXPIRED                = 0x911B,
    GL_CONDITION_SATISFIED            = 0x911C,
    GL_WAIT_FAILED                    = 0x911D,
    GL_SYNC_FLUSH_COMMANDS_BIT        = 0x00000001,
}

extern(System) @nogc nothrow {
    alias da_glFenceSync = GLsync function(GLenum, GLbitfield);
    alias da_glIsSync = GLboolean function(GLsync);
    alias da_glDeleteSync = void function(GLsync);
    alias da_glClientWaitSync = GLenum function(GLsync, GLbitfield, GLuint64);
    alias da_glWaitSync = void function(GLsync, GLbitfield, GLuint64);
    alias da_glGetInteger64v = void function(GLsync, GLint64*);
    alias da_glGetSynciv = void function(GLsync, GLenum, GLsizei, GLsizei*, GLint*);
}};

enum arbSyncFuncs =
q{
    da_glFenceSync glFenceSync;
    da_glIsSync glIsSync;
    da_glDeleteSync glDeleteSync;
    da_glClientWaitSync glClientWaitSync;
    da_glWaitSync glWaitSync;
    da_glGetInteger64v glGetInteger64v;
    da_glGetSynciv glGetSynciv;
};

enum arbSyncLoaderImpl =
q{
    bindGLFunc(cast(void**)&glFenceSync, "glFenceSync");
    bindGLFunc(cast(void**)&glIsSync, "glIsSync");
    bindGLFunc(cast(void**)&glDeleteSync, "glDeleteSync");
    bindGLFunc(cast(void**)&glClientWaitSync, "glClientWaitSync");
    bindGLFunc(cast(void**)&glWaitSync, "glWaitSync");
    bindGLFunc(cast(void**)&glGetInteger64v, "glGetInteger64v");
    bindGLFunc(cast(void**)&glGetSynciv, "glGetSynciv");
};

enum arbSyncLoader = makeLoader(ARB_sync, arbSyncLoaderImpl, "gl32");
static if(!usingContexts) enum arbSync = arbSyncDecls ~ arbSyncFuncs.makeGShared() ~ arbSyncLoader;