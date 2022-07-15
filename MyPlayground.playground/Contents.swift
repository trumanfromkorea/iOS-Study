import Foundation

enum Method {
    case get
    case post
}

protocol API {
    var method: Method { get }
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func request(api: API) {
        switch api.method {
        case .get:
            getRequest()
        case .post:
            postRequest()
        }
    }

    private func getRequest() {
        print("GET REQUEST")
    }

    private func postRequest() {
        print("POST REQUEST")
    }
}

struct getAPI: API {
    var method: Method = Method.get
}

NetworkManager.shared.request(api: getAPI())

