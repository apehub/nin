/// `Command` is a structure used to represent a command.
/// Each `Command` must implement the following properties:
/// - `execute`: A function to execute the command, taking a memory allocator and command-line arguments, and may return an error.
/// - `alias`: A function that returns the alias of the command, defaulting to `command module name`.
/// - `usage`: A function that returns the usage information of the command, defaulting to `""`.
const std = @import("std");
const Context = @import("Context.zig");
const Build = @import("cmd/build.zig");
const Clean = @import("cmd/clean.zig");
const Help = @import("cmd/help.zig");
const Init = @import("cmd/init.zig");
const New = @import("cmd/new.zig");
const Release = @import("cmd/release.zig");
const Test = @import("cmd/test.zig");
const Update = @import("cmd/update.zig");
const Upload = @import("cmd/upload.zig");

fn defaultAlias() []const u8 {
    return @typeName(Command);
}

fn defaultUsage() []const u8 {
    return "";
}

pub const Command = struct {
    /// Executes the command.
    ///
    /// @param allocator: A memory allocator used to allocate memory during command execution.
    /// @param args: Command-line arguments passed to the command.
    ///
    /// @return: This function does not return a value (void).
    ///
    /// @throws: Any error that may occur during command execution. The specific type of error is not specified and can be any Zig error.
    execute: fn (context: *Context) anyerror!void,
    /// Returns the alias of the command, defaulting to `command module name`.
    ///
    /// @return: The alias of the command.
    alias: fn () []const u8 = defaultAlias,
    /// Returns the usage information of the command, defaulting to `""`.
    ///
    /// @return: The usage information of the command.
    usage: fn () []const u8 = defaultUsage,
};

// List all available commands in "cmd" directory.
pub fn listCommands(allocator: std.mem.Allocator) !std.ArrayList(Command) {
    const commands = std.ArrayList(Command).init(allocator);

    return commands;
}
