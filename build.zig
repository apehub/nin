const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "nin",
        .root_source_file = b.path("src/nin.zig"),
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(exe);
}
