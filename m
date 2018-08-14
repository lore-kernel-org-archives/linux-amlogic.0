From: b.galvani@gmail.com (Beniamino Galvani)
Date: Tue, 14 Aug 2018 15:07:54 +0200
Subject: [PATCH u-boot 3/3] arm: meson: null-terminate the serial number
In-Reply-To: <20180814130754.19294-1-b.galvani@gmail.com>
References: <20180814130754.19294-1-b.galvani@gmail.com>
Message-ID: <20180814130754.19294-4-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Terminate the serial number variable with null to avoid printing
trailing garbage.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 arch/arm/mach-meson/sm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-meson/sm.c b/arch/arm/mach-meson/sm.c
index 2628591fe6..23eafe87b4 100644
--- a/arch/arm/mach-meson/sm.c
+++ b/arch/arm/mach-meson/sm.c
@@ -64,7 +64,7 @@ ssize_t meson_sm_read_efuse(uintptr_t offset, void *buffer, size_t size)
 void meson_init_env_from_efuse(void)
 {
 	static u8 mac[EFUSE_MAC_SIZE];
-	char serial[EFUSE_SN_SIZE];
+	char serial[EFUSE_SN_SIZE + 1];
 	ssize_t len;
 
 	if (!eth_env_get_enetaddr("ethaddr", mac)) {
@@ -77,7 +77,9 @@ void meson_init_env_from_efuse(void)
 	if (!env_get("serial#")) {
 		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
 					  EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE)
+		if (len == EFUSE_SN_SIZE) {
+			serial[EFUSE_SN_SIZE] = '\0';
 			env_set("serial#", serial);
+		}
 	}
 }
-- 
2.17.1
