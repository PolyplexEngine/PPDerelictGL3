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
module derelict.opengl.extensions.arb_p;

import derelict.opengl.types : usingContexts;
import derelict.opengl.extensions.internal;

// ARB_program_interface_query <-- Core in GL 4.3
enum ARB_program_interface_query = "GL_ARB_program_interface_query";
enum arbProgramInterfaceQueryDecls =
q{
enum : uint
{
    GL_UNIFORM                        = 0x92E1,
    GL_UNIFORM_BLOCK                  = 0x92E2,
    GL_PROGRAM_INPUT                  = 0x92E3,
    GL_PROGRAM_OUTPUT                 = 0x92E4,
    GL_BUFFER_VARIABLE                = 0x92E5,
    GL_SHADER_STORAGE_BLOCK           = 0x92E6,
    GL_VERTEX_SUBROUTINE              = 0x92E8,
    GL_TESS_CONTROL_SUBROUTINE        = 0x92E9,
    GL_TESS_EVALUATION_SUBROUTINE     = 0x92EA,
    GL_GEOMETRY_SUBROUTINE            = 0x92EB,
    GL_FRAGMENT_SUBROUTINE            = 0x92EC,
    GL_COMPUTE_SUBROUTINE             = 0x92ED,
    GL_VERTEX_SUBROUTINE_UNIFORM      = 0x92EE,
    GL_TESS_CONTROL_SUBROUTINE_UNIFORM = 0x92EF,
    GL_TESS_EVALUATION_SUBROUTINE_UNIFORM = 0x92F0,
    GL_GEOMETRY_SUBROUTINE_UNIFORM    = 0x92F1,
    GL_FRAGMENT_SUBROUTINE_UNIFORM    = 0x92F2,
    GL_COMPUTE_SUBROUTINE_UNIFORM     = 0x92F3,
    GL_TRANSFORM_FEEDBACK_VARYING     = 0x92F4,
    GL_ACTIVE_RESOURCES               = 0x92F5,
    GL_MAX_NAME_LENGTH                = 0x92F6,
    GL_MAX_NUM_ACTIVE_VARIABLES       = 0x92F7,
    GL_MAX_NUM_COMPATIBLE_SUBROUTINES = 0x92F8,
    GL_NAME_LENGTH                    = 0x92F9,
    GL_TYPE                           = 0x92FA,
    GL_ARRAY_SIZE                     = 0x92FB,
    GL_OFFSET                         = 0x92FC,
    GL_BLOCK_INDEX                    = 0x92FD,
    GL_ARRAY_STRIDE                   = 0x92FE,
    GL_MATRIX_STRIDE                  = 0x92FF,
    GL_IS_ROW_MAJOR                   = 0x9300,
    GL_ATOMIC_COUNTER_BUFFER_INDEX    = 0x9301,
    GL_BUFFER_BINDING                 = 0x9302,
    GL_BUFFER_DATA_SIZE               = 0x9303,
    GL_NUM_ACTIVE_VARIABLES           = 0x9304,
    GL_ACTIVE_VARIABLES               = 0x9305,
    GL_REFERENCED_BY_VERTEX_SHADER    = 0x9306,
    GL_REFERENCED_BY_TESS_CONTROL_SHADER = 0x9307,
    GL_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x9308,
    GL_REFERENCED_BY_GEOMETRY_SHADER  = 0x9309,
    GL_REFERENCED_BY_FRAGMENT_SHADER  = 0x930A,
    GL_REFERENCED_BY_COMPUTE_SHADER   = 0x930B,
    GL_TOP_LEVEL_ARRAY_SIZE           = 0x930C,
    GL_TOP_LEVEL_ARRAY_STRIDE         = 0x930D,
    GL_LOCATION                       = 0x930E,
    GL_LOCATION_INDEX                 = 0x930F,
    GL_IS_PER_PATCH                   = 0x92E7,
}
extern(System) @nogc nothrow
{
    alias da_glGetProgramInterfaceiv = void function(GLuint,GLenum,GLenum,GLint*);
    alias da_glGetProgramResourceIndex = GLuint function(GLuint,GLenum,const(GLchar)*);
    alias da_glGetProgramResourceName = void function(GLuint,GLenum,GLuint,GLsizei,GLsizei*,GLchar*);
    alias da_glGetProgramResourceiv = void function(GLuint,GLenum,GLuint,GLsizei,const(GLenum)*,GLsizei,GLsizei*,GLint*);
    alias da_glGetProgramResourceLocation = GLint function(GLuint,GLenum,const(GLchar)*);
    alias da_glGetProgramResourceLocationIndex = GLint function(GLuint,GLenum,const(GLchar)*);
}};

enum arbProgramInterfaceQueryFuncs =
q{
    da_glGetProgramInterfaceiv glGetProgramInterfaceiv;
    da_glGetProgramResourceIndex glGetProgramResourceIndex;
    da_glGetProgramResourceName glGetProgramResourceName;
    da_glGetProgramResourceiv glGetProgramResourceiv;
    da_glGetProgramResourceLocation glGetProgramResourceLocation;
    da_glGetProgramResourceLocationIndex glGetProgramResourceLocationIndex;
};

enum arbProgramInterfaceQueryLoaderImpl =
q{
    bindGLFunc(cast(void**)&glGetProgramInterfaceiv, "glGetProgramInterfaceiv");
    bindGLFunc(cast(void**)&glGetProgramResourceIndex, "glGetProgramResourceIndex");
    bindGLFunc(cast(void**)&glGetProgramResourceName, "glGetProgramResourceName");
    bindGLFunc(cast(void**)&glGetProgramResourceiv, "glGetProgramResourceiv");
    bindGLFunc(cast(void**)&glGetProgramResourceLocation, "glGetProgramResourceLocation");
    bindGLFunc(cast(void**)&glGetProgramResourceLocationIndex, "glGetProgramResourceLocationIndex");
};

enum arbProgramInterfaceQueryLoader = makeLoader(ARB_program_interface_query, arbProgramInterfaceQueryLoaderImpl, "gl43");
static if(!usingContexts) enum arbProgramInterfaceQuery = arbProgramInterfaceQueryDecls ~ arbProgramInterfaceQueryFuncs.makeGShared() ~ arbProgramInterfaceQueryLoader;