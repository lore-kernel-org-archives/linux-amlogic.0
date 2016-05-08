From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun,  8 May 2016 08:30:17 +0200
Subject: [PATCH v7 4/4] arm: meson: implement calls to secure monitor
In-Reply-To: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
Message-ID: <1462689017-3160-5-git-send-email-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Implement calls to secure monitor to read the MAC address from e-fuse.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 arch/arm/include/asm/arch-meson/sm.h   | 12 +++++++
 arch/arm/mach-meson/Makefile           |  2 +-
 arch/arm/mach-meson/board.c            |  1 +
 arch/arm/mach-meson/sm.c               | 57 ++++++++++++++++++++++++++++++++++
 board/hardkernel/odroid-c2/odroid-c2.c | 16 ++++++++++
 5 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/include/asm/arch-meson/sm.h
 create mode 100644 arch/arm/mach-meson/sm.c

diff --git a/arch/arm/include/asm/arch-meson/sm.h b/arch/arm/include/asm/arch-meson/sm.h
new file mode 100644
index 0000000..225438d
--- /dev/null
+++ b/arch/arm/include/asm/arch-meson/sm.h
@@ -0,0 +1,12 @@
+/*
+ * (C) Copyright 2016 - Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef __MESON_SM_H__
+#define __MESON_SM_H__
+
+ssize_t meson_sm_read_efuse(uintptr_t offset, void *buffer, size_t size);
+
+#endif /* __MESON_SM_H__ */
diff --git a/arch/arm/mach-meson/Makefile b/arch/arm/mach-meson/Makefile
index 44e3d63..bf49b8b 100644
--- a/arch/arm/mach-meson/Makefile
+++ b/arch/arm/mach-meson/Makefile
@@ -4,4 +4,4 @@
 # SPDX-License-Identifier:	GPL-2.0+
 #
 
-obj-y += board.o
+obj-y += board.o sm.o
diff --git a/arch/arm/mach-meson/board.c b/arch/arm/mach-meson/board.c
index 782f86c..64fa3c1 100644
--- a/arch/arm/mach-meson/board.c
+++ b/arch/arm/mach-meson/board.c
@@ -8,6 +8,7 @@
 #include <libfdt.h>
 #include <linux/err.h>
 #include <asm/arch/gxbb.h>
+#include <asm/arch/sm.h>
 #include <asm/armv8/mmu.h>
 #include <asm/unaligned.h>
 
diff --git a/arch/arm/mach-meson/sm.c b/arch/arm/mach-meson/sm.c
new file mode 100644
index 0000000..1b35a22
--- /dev/null
+++ b/arch/arm/mach-meson/sm.c
@@ -0,0 +1,57 @@
+/*
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ *
+ * Secure monitor calls.
+ */
+
+#include <common.h>
+#include <asm/arch/gxbb.h>
+#include <linux/kernel.h>
+
+#define FN_GET_SHARE_MEM_INPUT_BASE	0x82000020
+#define FN_GET_SHARE_MEM_OUTPUT_BASE	0x82000021
+#define FN_EFUSE_READ			0x82000030
+#define FN_EFUSE_WRITE			0x82000031
+
+static void *shmem_input;
+static void *shmem_output;
+
+static void meson_init_shmem(void)
+{
+	struct pt_regs regs;
+
+	if (shmem_input && shmem_output)
+		return;
+
+	regs.regs[0] = FN_GET_SHARE_MEM_INPUT_BASE;
+	smc_call(&regs);
+	shmem_input = (void *)regs.regs[0];
+
+	regs.regs[0] = FN_GET_SHARE_MEM_OUTPUT_BASE;
+	smc_call(&regs);
+	shmem_output = (void *)regs.regs[0];
+
+	debug("Secure Monitor shmem: 0x%p 0x%p\n", shmem_input, shmem_output);
+}
+
+ssize_t meson_sm_read_efuse(uintptr_t offset, void *buffer, size_t size)
+{
+	struct pt_regs regs;
+
+	meson_init_shmem();
+
+	regs.regs[0] = FN_EFUSE_READ;
+	regs.regs[1] = offset;
+	regs.regs[2] = size;
+
+	smc_call(&regs);
+
+	if (regs.regs[0] == 0)
+		return -1;
+
+	memcpy(buffer, shmem_output, min(size, regs.regs[0]));
+
+	return regs.regs[0];
+}
diff --git a/board/hardkernel/odroid-c2/odroid-c2.c b/board/hardkernel/odroid-c2/odroid-c2.c
index c258d4f..bd72100 100644
--- a/board/hardkernel/odroid-c2/odroid-c2.c
+++ b/board/hardkernel/odroid-c2/odroid-c2.c
@@ -7,9 +7,15 @@
 #include <common.h>
 #include <asm/io.h>
 #include <asm/arch/gxbb.h>
+#include <asm/arch/sm.h>
 #include <dm/platdata.h>
 #include <phy.h>
 
+#define EFUSE_SN_OFFSET		20
+#define EFUSE_SN_SIZE		16
+#define EFUSE_MAC_OFFSET	52
+#define EFUSE_MAC_SIZE		6
+
 int board_init(void)
 {
 	return 0;
@@ -27,6 +33,9 @@ U_BOOT_DEVICE(meson_eth) = {
 
 int misc_init_r(void)
 {
+	u8 mac_addr[EFUSE_MAC_SIZE];
+	ssize_t len;
+
 	/* Select Ethernet function */
 	setbits_le32(GXBB_PINMUX(6), 0x3fff);
 
@@ -47,5 +56,12 @@ int misc_init_r(void)
 	mdelay(10);
 	setbits_le32(GXBB_GPIO_OUT(3), BIT(14));
 
+	if (!eth_getenv_enetaddr("ethaddr", mac_addr)) {
+		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
+					  mac_addr, EFUSE_MAC_SIZE);
+		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
+			eth_setenv_enetaddr("ethaddr", mac_addr);
+	}
+
 	return 0;
 }
-- 
2.7.3
