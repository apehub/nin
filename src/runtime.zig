// runtime context
const std = @import("std");

pub const Runtime = struct {
    allocator: std.mem.Allocator,
    args: []const [:0]u8,
    reader: std.fs.File.Reader,
    writer: std.fs.File.Writer,

    pub fn destroy(self: *Runtime) void {
        std.process.argsFree(self.allocator, self.args);
    }

    // print debug messages
    pub fn debug(self: *Runtime) void {
        var i: usize = 0;
        while (i < self.args.len) : (i += 1) {
            std.log.debug("Arg {}: {s}", .{ i, self.args[i] });
        }
    }

    pub fn write(self: *Runtime, comptime format: []const u8, args: anytype) !void {
        try self.writer.print(format, args);
    }

    pub fn read(self: *Runtime, buf: []u8, delim: u8) !usize {
        return try self.reader.readUntilDelimiterOrEof(buf, delim);
    }
};

/// create a new runtime context
/// @param `allocator` - the allocator of this app
/// @return `Runtime` - the runtime
pub fn init(allocator: std.mem.Allocator) !Runtime {
    const args = try std.process.argsAlloc(allocator);
    return Runtime{
        .allocator = allocator,
        .args = args,
        .reader = std.io.getStdIn().reader(),
        .writer = std.io.getStdOut().writer(),
    };
}
