//
//  TimetableRedirectMiddleware.swift
//  App
//
//  Created by Sergej Jaskiewicz on 12/04/2018.
//

import Vapor

final class TimetableRedirectMiddleware: Middleware {

    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        let response = try EngineClient.factory.get("https://timetable.spbu.ru/api/v1\(request.uri.path)")
        return Response(version: response.version, status: response.status, headers: response.headers, body: response.body)
    }
}
