const std = @import("std");
const Context = @import("../context.zig");

/// Execute the 'release' command.
///
/// @param context The context passed to the 'release' command.
/// @return This function does not return a value, but may return an error.
pub fn execute(context: Context) anyerror!void {
    _ = context;
    std.log.info("Compile the current project and generate an executable file.", .{});
}

pub fn alias() []const u8 {
    return "release";
}

pub fn usage() []const u8 {
    return "release";
}
