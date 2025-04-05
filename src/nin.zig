const std = @import("std");
const CommandInterface = @import("cmd/command_interface.zig");

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    const args = try std.process.argsAlloc(allocator);
    if (args.len < 2) {
        std.log.err("Please provide a subcommand.", .{});
        return;
    }

    const sub_command = args[1];
    const command = CommandInterface.getCommand(sub_command);
    try command.execute(allocator, args[2..]);
    return;
}
