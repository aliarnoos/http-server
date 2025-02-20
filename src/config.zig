const std = @import("std");
const builtin = @import("builtin");
const net = std.net;

pub const Socket = struct {
    _address: std.net.Address,
    _stream: std.net.Stream,

    pub fn init() !Socket {
        const localhost = [4]u8{ 127, 0, 0, 1 };
        const port = 3940;
        const address = net.Address.initIp4(localhost, port);
        const socket = try std.posix.socket(address.any.family, std.posix.SOCK.STREAM, std.posix.IPPROTO.TCP);
        const stream = net.Stream{ .handle = socket };
        return Socket{
            ._address = address,
            ._stream = stream,
        };
    }
};
