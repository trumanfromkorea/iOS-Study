import Foundation

let url = "https://api.plkey.app/"

URLSession.shared.dataTask(with: URL(string: url + "theme/review?themeId6&start=0&count=20")!) { data, response, error in
    guard let error = error else {
        return
    }

    guard let data = data else {
        return
    }

    print(data)
}
.resume()
