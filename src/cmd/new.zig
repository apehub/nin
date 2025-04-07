/// `new` module is used to create a new nin project.
/// Usage: `nin new <name>`, where `<name>` is the name of the new project.
const std = @import("std");
const Runtime = @import("../runtime.zig");

/// Execute the 'new' command.
///
/// @param runtime The runtime context.
/// @return This function does not return a value, but may return an error.
pub fn execute(runtime: Runtime) anyerror!void {
    _ = runtime;
    std.log.info("Create a new nin project.", .{});
}

pub fn alias() []const u8 {
    return "new";
}

pub fn usage() []const u8 {
    return "new <name>";
}
