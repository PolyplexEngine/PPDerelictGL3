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
module derelict.opengl.extensions.core_43;

import derelict.opengl.extensions.arb_c : arbClearBufferObjectDecls, arbClearBufferObjectFuncs, arbClearBufferObjectLoaderImpl,
                                          arbComputeShaderDecls, arbComputeShaderFuncs, arbComputeShaderLoaderImpl,
                                          arbCopyImageDecls, arbCopyImageFuncs, arbCopyImageLoaderImpl;
import derelict.opengl.extensions.arb_d : arbDebugOutputDecls, arbDebugOutputFuncs, arbDebugOutputLoaderImpl;
import derelict.opengl.extensions.arb_e : arbES3CompatibilityDecls, arbExplicitUniformLocationDecls;
import derelict.opengl.extensions.arb_f : arbFramebufferNoAttachmentsDecls, arbFramebufferNoAttachmentsFuncs, arbFramebufferNoAttachmentsLoaderImpl;
import derelict.opengl.extensions.arb_i : arbInternalFormatQuery2Decls, arbInternalFormatQuery2Funcs, arbInternalFormatQuery2LoaderImpl,
                                          arbInvalidateSubdataDecls, arbInvalidateSubdataFuncs, arbInvalidateSubdataLoaderImpl;
import derelict.opengl.extensions.arb_m : arbMultiDrawIndirectDecls, arbMultiDrawIndirectFuncs, arbMultiDrawIndirectLoaderImpl;
import derelict.opengl.extensions.arb_p : arbProgramInterfaceQueryDecls, arbProgramInterfaceQueryFuncs, arbProgramInterfaceQueryLoaderImpl;
import derelict.opengl.extensions.arb_s : arbShaderStorageBufferObjectDecls, arbShaderStorageBufferObjectFuncs, arbShaderStorageBufferObjectLoaderImpl,
                                          arbStencilTexturingDecls;
import derelict.opengl.extensions.arb_t : arbTextureBufferRangeDecls, arbTextureBufferRangeFuncs, arbTextureBufferRangeLoaderImpl,
                                          arbTextureStorageMultisampleDecls, arbTextureStorageMultisampleFuncs, arbTextureStorageMultisampleLoaderImpl,
                                          arbTextureViewDecls, arbTextureViewFuncs, arbTextureViewLoaderImpl;
import derelict.opengl.extensions.arb_v : arbVertexAttribBindingDecls, arbVertexAttribBindingFuncs, arbVertexAttribBindingLoaderImpl;
import derelict.opengl.extensions.khr : khrDebugDecls, khrDebugFuncs, khrDebugLoaderImpl;

enum corearb43Decls = arbClearBufferObjectDecls
                    ~ arbComputeShaderDecls
                    ~ arbCopyImageDecls
                    ~ arbDebugOutputDecls
                    ~ arbES3CompatibilityDecls
                    ~ arbExplicitUniformLocationDecls
                    ~ arbFramebufferNoAttachmentsDecls
                    ~ arbInternalFormatQuery2Decls
                    ~ arbInvalidateSubdataDecls
                    ~ arbMultiDrawIndirectDecls
                    ~ arbProgramInterfaceQueryDecls
                    ~ arbShaderStorageBufferObjectDecls
                    ~ arbStencilTexturingDecls
                    ~ arbTextureBufferRangeDecls
                    ~ arbTextureStorageMultisampleDecls
                    ~ arbTextureViewDecls
                    ~ arbVertexAttribBindingDecls
                    ~ khrDebugDecls;

enum corearb43Funcs = arbClearBufferObjectFuncs
                    ~ arbComputeShaderFuncs
                    ~ arbCopyImageFuncs
                    ~ arbDebugOutputFuncs
                    ~ arbFramebufferNoAttachmentsFuncs
                    ~ arbInternalFormatQuery2Funcs
                    ~ arbInvalidateSubdataFuncs
                    ~ arbMultiDrawIndirectFuncs
                    ~ arbProgramInterfaceQueryFuncs
                    ~ arbShaderStorageBufferObjectFuncs
                    ~ arbTextureBufferRangeFuncs
                    ~ arbTextureStorageMultisampleFuncs
                    ~ arbTextureViewFuncs
                    ~ arbVertexAttribBindingFuncs
                    ~ khrDebugFuncs;

enum corearb43Loader = arbClearBufferObjectLoaderImpl
                     ~ arbComputeShaderLoaderImpl
                     ~ arbCopyImageLoaderImpl
                     ~ arbDebugOutputLoaderImpl
                     ~ arbFramebufferNoAttachmentsLoaderImpl
                     ~ arbInternalFormatQuery2LoaderImpl
                     ~ arbInvalidateSubdataLoaderImpl
                     ~ arbMultiDrawIndirectLoaderImpl
                     ~ arbProgramInterfaceQueryLoaderImpl
                     ~ arbShaderStorageBufferObjectLoaderImpl
                     ~ arbTextureBufferRangeLoaderImpl
                     ~ arbTextureStorageMultisampleLoaderImpl
                     ~ arbTextureViewLoaderImpl
                     ~ arbVertexAttribBindingLoaderImpl
                     ~ khrDebugLoaderImpl;