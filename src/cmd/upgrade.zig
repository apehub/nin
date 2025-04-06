const std = @import("std");
const Context = @import("../context.zig");

/// Execute the 'upgrade' command.
///
/// @param context The context passed to the 'upgrade' command.
/// @return This function does not return a value, but may return an error.
pub fn execute(context: Context) anyerror!void {
    _ = context;
    std.log.info("Upgrade the project.", .{});
}

pub fn alias() []const u8 {
    return "upgrade";
}

pub fn usage() []const u8 {
    return "upgrade";
}
