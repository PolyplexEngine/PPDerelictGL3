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
module derelict.opengl.extensions.core_42;

import derelict.opengl.extensions.arb_b : arbBaseInstanceDecls, arbBaseInstanceFuncs, arbBaseInstanceLoaderImpl;
import derelict.opengl.extensions.arb_c : arbCompressedTexturePixelStorageDecls;
import derelict.opengl.extensions.arb_i : arbInternalFormatQueryDecls, arbInternalFormatQueryFuncs, arbInternalFormatQueryLoaderImpl;
import derelict.opengl.extensions.arb_m : arbMapBufferAlignmentDecls;
import derelict.opengl.extensions.arb_s : arbShaderAtomicCountersDecls, arbShaderAtomicCountersFuncs, arbShaderAtomicCountersLoaderImpl,
                                          arbShaderImageLoadStoreDecls, arbShaderImageLoadStoreFuncs, arbShaderImageLoadStoreLoaderImpl;
import derelict.opengl.extensions.arb_t : arbTextureCompressionBPTCDecls,
                                          arbTextureStorageDecls, arbTextureStorageFuncs, arbTextureStorageLoaderImpl,
                                          arbTransformFeedbackInstancedDecls, arbTransformFeedbackInstancedFuncs, arbTransformFeedbackInstancedLoaderImpl;

enum corearb42Decls = arbBaseInstanceDecls
                    ~ arbCompressedTexturePixelStorageDecls
                    ~ arbMapBufferAlignmentDecls
                    ~ arbInternalFormatQueryDecls
                    ~ arbShaderAtomicCountersDecls
                    ~ arbShaderImageLoadStoreDecls
                    ~ arbTextureCompressionBPTCDecls
                    ~ arbTextureStorageDecls
                    ~ arbTransformFeedbackInstancedDecls ;
enum corearb42Funcs = arbBaseInstanceFuncs
                    ~ arbInternalFormatQueryFuncs
                    ~ arbShaderAtomicCountersFuncs
                    ~ arbShaderImageLoadStoreFuncs
                    ~ arbTextureStorageFuncs
                    ~ arbTransformFeedbackInstancedFuncs;
enum corearb42Loader = arbBaseInstanceLoaderImpl
                     ~ arbInternalFormatQueryLoaderImpl
                     ~ arbShaderAtomicCountersLoaderImpl
                     ~ arbShaderImageLoadStoreLoaderImpl
                     ~ arbTextureStorageLoaderImpl
                     ~ arbTransformFeedbackInstancedLoaderImpl;
