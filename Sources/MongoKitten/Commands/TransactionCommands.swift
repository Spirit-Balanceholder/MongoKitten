import BSON
import NIO

/// Requests a session identifier from MongoDB
///
/// This is not used since the identfiers can and should be generated locally
//struct StartSessionCommand: MongoDBCommand {
//    private enum CodingKeys: String, CodingKey {
//        case startSession
//        case clusterTime = "$clusterTime"
//    }
//
//    var namespace: Namespace
//
//    typealias Reply = StartSessionReply
//
//    let startSession = 1
//    let clusterTime: Document?
//}
//
//struct StartSessionReply: ServerReplyDecodable {
//    let ok: Int
//    let id: Document
//
//    var isSuccessful: Bool { return ok == 1 }
//
//    func makeResult(on collection: Collection) throws -> StartSessionReply {
//        return self
//    }
//}

struct EndSessionsCommand: MongoDBCommand {
    typealias Reply = OK
    typealias ErrorReply = GenericErrorReply
    
    private enum CodingKeys: String, CodingKey {
        case endSessions
    }
    
    let namespace: Namespace
    var endSessions: [SessionIdentifier]
    
    init(_ sessions: [SessionIdentifier], inNamespace namespace: Namespace) {
        self.namespace = namespace
        self.endSessions = sessions
    }
}
