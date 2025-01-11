public struct Payload: Codable {
    public let uuid: String

    public init(uuid: String) {
        self.uuid = uuid
    }
}
