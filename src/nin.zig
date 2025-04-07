const std = @import("std");
const Command = @import("command.zig");
const Context = @import("context.zig");

const usage = "Usage: nin <command> [options] [args]";

pub fn main() anyerror!void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    var context = Context.init(allocator) catch |err| {
        // 处理错误
        std.log.err("Failed to create context: {}", .{err});
        return err;
    };
    defer context.destroy();

    if (context.args.len < 2) {
        // print usage message to stdout
        try context.write("{s}\n", .{usage});
        return;
    }
    context.debug();
    return;
}
