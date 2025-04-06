const std = @import("std");
const Context = @import("../context.zig");

/// Execute the 'init' command.
///
/// @param context The context passed to the 'init' command.
/// @return This function does not return a value, but may return an error.
pub fn execute(context: Context) anyerror!void {
    _ = context;
    std.log.info("Initialize a new project.", .{});
}

pub fn alias() []const u8 {
    return "init";
}

pub fn usage() []const u8 {
    return "init";
}
