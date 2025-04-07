const std = @import("std");
const Runtime = @import("../runtime.zig");

/// Execute the 'help' command.
///
/// @param runtime The context passed to the 'help' command.
/// @param args The command line arguments passed to the 'help' command.
/// @return This function does not return a value, but may return an error.
pub fn execute(runtime: Runtime) anyerror!void {
    _ = runtime;
    std.log.info("Display help information.", .{});
}

pub fn alias() []const u8 {
    return "help";
}

pub fn usage() []const u8 {
    return "help";
}
