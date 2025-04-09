import subprocess
import os
import sys

# ==== 用户配置部分（请根据实际路径修改） ====
VCS_CMD = (
    "vcs -full64 "
    "-debug_access+all -kdb "
    "-LDFLAGS -Wl,--no-as-needed "
    "-f flist.f "
    "-o simv "
    "/home/chen/synopsys/verdi/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUX64/pli.a"
)

SIM_EXEC = "./simv"
FSDB_FILE = "wave.fsdb"

# =================================================

def run_cmd(cmd):
    print(f"\n>>> 运行命令: {cmd}")
    result = subprocess.run(cmd, shell=True)
    if result.returncode != 0:
        print("❌ 命令执行失败，退出。")
        sys.exit(1)

def check_fsdb():
    if not os.path.exists(FSDB_FILE):
        print(f"❌ 没有生成 {FSDB_FILE}，请确认 testbench 中包含 $fsdbDumpfile / $fsdbDumpvars")
        sys.exit(1)
    else:
        size = os.path.getsize(FSDB_FILE) / 1024
        print(f"✅ 找到 FSDB 文件: {FSDB_FILE} ({size:.2f} KB)")

def main():
    print("🚀 开始编译 VCS ...")
    run_cmd(VCS_CMD)

    print("🚀 开始仿真运行 ...")
    run_cmd(SIM_EXEC)

    print("🔍 检查 FSDB 波形文件 ...")
    check_fsdb()

    print("🧠 打开 Verdi 查看波形 ...")
    run_cmd(f"verdi -ssf {FSDB_FILE} &")

if __name__ == "__main__":
    main()

