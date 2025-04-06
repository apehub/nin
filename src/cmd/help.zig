const std = @import("std");
const Context = @import("../context.zig");

/// Execute the 'help' command.
///
/// @param context The context passed to the 'help' command.
/// @param args The command line arguments passed to the 'help' command.
/// @return This function does not return a value, but may return an error.
pub fn execute(context: Context) anyerror!void {
    _ = context;
    std.log.info("Display help information.", .{});
}

pub fn alias() []const u8 {
    return "help";
}

pub fn usage() []const u8 {
    return "help";
}
