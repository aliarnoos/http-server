const std = @import("std");
const Connection = std.net.Server.Connection;

pub fn send_200(conn: Connection) !void {
    const message = ("HTTP/1.1 200 OK\nContent-Length: 200" ++ "\nContent-Type: text/html\n" ++ "Connection: Closed\n\n<html><body>" ++ "<h1>This is a the dumpest HTTP Server written in Zig</h1></body></html>");
    _ = try conn.stream.write(message);
}

pub fn send_404(conn: Connection) !void {
    const message = ("HTTP/1.1 404 Not Found\nContent-Length: 200" ++ "\nContent-Type: text/html\n" ++ "Connection: Closed\n\n<html><body>" ++ "<h1>Nothing is here, except for big brother, he is watching you!</h1></body></html>");
    _ = try conn.stream.write(message);
}
