// runtime context
const std = @import("std");

pub const Context = struct {
    allocator: std.mem.Allocator,
    args: []const [:0]u8,
    reader: std.fs.File.Reader,
    writer: std.fs.File.Writer,

    pub fn destroy(self: *Context) void {
        std.process.argsFree(self.allocator, self.args);
    }

    // print debug messages
    pub fn debug(self: *Context) void {
        var i: usize = 0;
        while (i < self.args.len) : (i += 1) {
            std.log.debug("Arg {}: {s}", .{ i, self.args[i] });
        }
    }

    pub fn write(self: *Context, comptime format: []const u8, args: anytype) !void {
        try self.writer.print(format, args);
    }

    pub fn read(self: *Context, buf: []u8, delim: u8) !usize {
        return try self.reader.readUntilDelimiterOrEof(buf, delim);
    }
};

/// create a new context
/// @param `allocator` - the allocator of this app
/// @return `Context` - the context
pub fn create(allocator: std.mem.Allocator) !Context {
    const args = try std.process.argsAlloc(allocator);
    return Context{
        .allocator = allocator,
        .args = args,
        .reader = std.io.getStdIn().reader(),
        .writer = std.io.getStdOut().writer(),
    };
}
