import Foundation

struct Token {
    static var accessToken: String? {
        get {
            return UserDefaults.standard.string(forKey: "accessToken")
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: "accessToken")
            UserDefaults.standard.synchronize()
        }
    }
    static func removeToken() {
        accessToken = nil
    }
}

enum Header {
    case accessToken, tokenIsEmpty

    func header() -> [String: String]? {
        guard let accesstoken = Token.accessToken else {
            return ["Contect-Type": "application/json"]
        }

        switch self {
        case .accessToken:
            return ["Authorization": "Bearer " + accesstoken, "Contect-Type": "application/json"]

        case .tokenIsEmpty:
            return ["Contect-Type": "application/json"]
        }
    }
}
