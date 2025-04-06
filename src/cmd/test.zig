const std = @import("std");
const Context = @import("../context.zig");

/// Execute the 'test' command.
///
/// @param allocator The allocator used for memory allocation.
/// @param args The command line arguments passed to the 'test' command.
/// @return This function does not return a value, but may return an error.
pub fn execute(context: Context) anyerror!void {
    _ = context;
    std.log.info("Run the tests for the current project.", .{});
}

pub fn alias() []const u8 {
    return "test";
}

pub fn usage() []const u8 {
    return "test";
}
