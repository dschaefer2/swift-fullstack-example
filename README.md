# Swift Full Stack Example

Just trying out the dev environment when using Swift for both the front end and back end of a web app.
Uses SwiftWASM's JavaScriptKit for the front end and Vapor for the back.
There is a shared library between the two for the data passed from the server to the client.

Using two VSCode tasks, one to build the server with my currently installed WASM SDK,
and one to build the server.

## Results

Having two builds is awkward as expected.
If you make a change you need to remember what build to run and if you change the shared library,
you need to remember to build both.

Also the SDK is incredibly awkward.
Since they're not versioned you need to install the same one I'm using
and that usually means you also need to use the same Swift toolchain I'm using.
