set root_dir=%cd%

md onnx-mlir\build
cd onnx-mlir\build
call cmake %root_dir%\onnx-mlir -G "Visual Studio 16 2019" -A x64 -T host=x64 ^
   -DCMAKE_BUILD_TYPE=Release ^
   -DCMAKE_PREFIX_PATH=%root_dir%\protobuf_install ^
   -DLLVM_LIT_ARGS=-v ^
   -DLLVM_PROJ_BUILD=%root_dir%\llvm-project\build ^
   -DLLVM_PROJ_SRC=%root_dir%\llvm-project

call cmake --build . --config Release --target onnx-mlir -- /m
