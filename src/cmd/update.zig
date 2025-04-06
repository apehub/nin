const std = @import("std");
const Context = @import("../context.zig");

/// Execute the 'update' command.
///
/// @param context The context passed to the 'update' command.
/// @param args The command line arguments passed to the 'update' command.
/// @return This function does not return a value, but may return an error.
pub fn execute(context: Context) anyerror!void {
    _ = context;
    std.log.info("Update the dependencies of the current project.", .{});
}

pub fn alias() []const u8 {
    return "update";
}

pub fn usage() []const u8 {
    return "update";
}
