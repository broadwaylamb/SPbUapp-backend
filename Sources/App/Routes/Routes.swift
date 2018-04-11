import Vapor

extension Droplet {
    func setupRoutes() throws {

        get("divisions") { request -> ResponseRepresentable in
            let ttResponse = try self.client.get("https://timetable.spbu.ru/api/v1/study/divisions")
            return ttResponse
        }

        get("tt") { request -> ResponseRepresentable in
            return try self.client.get("https://timetable.spbu.ru\(request.uri.path)")
        }
        
        try resource("posts", PostController.self)
    }
}
