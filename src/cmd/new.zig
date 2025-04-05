/// `new` module is used to create a new nin project.
/// Usage: `nin new <name>`, where `<name>` is the name of the new project.
const std = @import("std");

/// Execute the 'new' command.
///
/// @param allocator The allocator used for memory allocation.
/// @param args The command line arguments passed to the 'new' command.
/// @return This function does not return a value, but may return an error.
pub fn execute(allocator: std.mem.Allocator, args: []const []const u8) anyerror!void {
    _ = allocator;
    _ = args;
    std.log.info("Create a new nin project.", .{});
}

pub fn alias() []const u8 {
    return "new";
}

pub fn usage() []const u8 {
    return "new <name>";
}
