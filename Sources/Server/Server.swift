import Foundation
import Vapor
import Shared

let app = try await Application.make(.detect())

app.get() { req in
    req.redirect(to: "/index.html")
}

app.get("uuid") { req in
    let resp = Payload(uuid: UUID().uuidString)
    return try String(data: JSONEncoder().encode(resp), encoding: .utf8)!
}

let staticFiles = FileMiddleware(publicDirectory: app.directory.publicDirectory)
app.middleware.use(staticFiles)

let buildFiles = FileMiddleware(publicDirectory: ".build/wasm32-unknown-wasi/release")
app.middleware.use(buildFiles)

try await app.execute()
