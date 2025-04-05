const std = @import("std");

pub fn execute(allocator: std.mem.Allocator, args: []const []const u8) anyerror!void {
    std.log.info("Initialize a new project.", .{});
}
