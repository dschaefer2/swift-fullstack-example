import JavaScriptKit
import JavaScriptEventLoop
import Shared

let alert = JSObject.global.alert.function!
let document = JSObject.global.document

var divElement = document.createElement("div")
divElement.innerText = "Hello, world!"
_ = document.body.appendChild(divElement)

var buttonElement = document.createElement("button")
buttonElement.innerText = "Alert Demo"
buttonElement.onclick = .object(JSClosure { _ in
    alert("Swift is running in the browser")
    return .undefined
})
_ = document.body.appendChild(buttonElement)

func fetch(_ url: String) -> JSPromise {
    let jsFetch = JSObject.global.fetch.function!
    return JSPromise(jsFetch(url).object!)!
}

JavaScriptEventLoop.installGlobalExecutor()

var asyncButtonElement = document.createElement("button")
asyncButtonElement.innerText = "Fetch UUID Demo"
asyncButtonElement.onclick = .object(JSClosure { _ in
    Task {
        do {
            let response = try await fetch("./uuid").value
            let json = try await JSPromise(response.json().object!)!.value
            let parsedResponse = try JSValueDecoder().decode(Payload.self, from: json)
            alert(parsedResponse.uuid)
        } catch {
            print(error.localizedDescription)
        }
    }
    return .undefined
})
_ = document.body.appendChild(asyncButtonElement)

extension JSPromise: @unchecked @retroactive Sendable {
}