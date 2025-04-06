const std = @import("std");
const Context = @import("../context.zig");

/// Execute the 'build' command.
///
/// @param context The context passed to the 'build' command.
/// @return This function does not return a value, but may return an error.
pub fn execute(context: Context) anyerror!void {
    _ = context;
    std.log.info("Compile the current project.", .{});
}

pub fn alias() []const u8 {
    return "build";
}

pub fn usage() []const u8 {
    return "build";
}
