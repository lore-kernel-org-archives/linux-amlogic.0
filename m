From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun,  8 May 2016 08:30:14 +0200
Subject: [PATCH v7 1/4] arm: implement generic PSCI reset call for armv8
In-Reply-To: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
Message-ID: <1462689017-3160-2-git-send-email-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add a psci_system_reset() which calls the SYSTEM_RESET function of
PSCI 0.2 and can be used by boards that support it to implement
reset_cpu().

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 arch/arm/cpu/armv8/fwcall.c   | 16 ++++++++++++++++
 arch/arm/include/asm/psci.h   | 17 ++++++++++++++++-
 arch/arm/include/asm/system.h |  2 ++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm/cpu/armv8/fwcall.c b/arch/arm/cpu/armv8/fwcall.c
index 9efcc5a..079e250 100644
--- a/arch/arm/cpu/armv8/fwcall.c
+++ b/arch/arm/cpu/armv8/fwcall.c
@@ -8,6 +8,7 @@
 #include <config.h>
 #include <version.h>
 #include <asm/macro.h>
+#include <asm/psci.h>
 #include <asm/system.h>
 
 /*
@@ -73,3 +74,18 @@ void smc_call(struct pt_regs *args)
 		  "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15",
 		  "x16", "x17");
 }
+
+void __noreturn psci_system_reset(bool conduit_smc)
+{
+	struct pt_regs regs;
+
+	regs.regs[0] = ARM_PSCI_0_2_FN_SYSTEM_RESET;
+
+	if (conduit_smc)
+		smc_call(&regs);
+	else
+		hvc_call(&regs);
+
+	while (1)
+		;
+}
diff --git a/arch/arm/include/asm/psci.h b/arch/arm/include/asm/psci.h
index 128a606..3704f07 100644
--- a/arch/arm/include/asm/psci.h
+++ b/arch/arm/include/asm/psci.h
@@ -18,7 +18,7 @@
 #ifndef __ARM_PSCI_H__
 #define __ARM_PSCI_H__
 
-/* PSCI interface */
+/* PSCI 0.1 interface */
 #define ARM_PSCI_FN_BASE		0x95c1ba5e
 #define ARM_PSCI_FN(n)			(ARM_PSCI_FN_BASE + (n))
 
@@ -32,6 +32,21 @@
 #define ARM_PSCI_RET_INVAL		(-2)
 #define ARM_PSCI_RET_DENIED		(-3)
 
+/* PSCI 0.2 interface */
+#define ARM_PSCI_0_2_FN_BASE			0x84000000
+#define ARM_PSCI_0_2_FN(n)			(ARM_PSCI_0_2_FN_BASE + (n))
+
+#define ARM_PSCI_0_2_FN_PSCI_VERSION		ARM_PSCI_0_2_FN(0)
+#define ARM_PSCI_0_2_FN_CPU_SUSPEND		ARM_PSCI_0_2_FN(1)
+#define ARM_PSCI_0_2_FN_CPU_OFF			ARM_PSCI_0_2_FN(2)
+#define ARM_PSCI_0_2_FN_CPU_ON			ARM_PSCI_0_2_FN(3)
+#define ARM_PSCI_0_2_FN_AFFINITY_INFO		ARM_PSCI_0_2_FN(4)
+#define ARM_PSCI_0_2_FN_MIGRATE			ARM_PSCI_0_2_FN(5)
+#define ARM_PSCI_0_2_FN_MIGRATE_INFO_TYPE	ARM_PSCI_0_2_FN(6)
+#define ARM_PSCI_0_2_FN_MIGRATE_INFO_UP_CPU	ARM_PSCI_0_2_FN(7)
+#define ARM_PSCI_0_2_FN_SYSTEM_OFF		ARM_PSCI_0_2_FN(8)
+#define ARM_PSCI_0_2_FN_SYSTEM_RESET		ARM_PSCI_0_2_FN(9)
+
 #ifndef __ASSEMBLY__
 int psci_update_dt(void *fdt);
 void psci_board_init(void);
diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system.h
index 9ae890a..2bdc0be 100644
--- a/arch/arm/include/asm/system.h
+++ b/arch/arm/include/asm/system.h
@@ -128,6 +128,8 @@ void hvc_call(struct pt_regs *args);
  */
 void smc_call(struct pt_regs *args);
 
+void __noreturn psci_system_reset(bool smc);
+
 #endif	/* __ASSEMBLY__ */
 
 #else /* CONFIG_ARM64 */
-- 
2.7.3
