From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 20 Jan 2017 08:20:25 -0800
Subject: [PATCH 2/2] ARM64: dts: meson-gx: Add firmware reserved memory zones
In-Reply-To: <20170120162025.31806-1-khilman@baylibre.com>
References: <20170120162025.31806-1-khilman@baylibre.com>
Message-ID: <20170120162025.31806-3-khilman@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

The Amlogic Meson GXBB/GXL/GXM secure monitor uses part of the memory space,
this patch adds these reserved zones.

Without such reserved memory zones, running the following stress command :
$ stress-ng --vm 16 --vm-bytes 128M --timeout 10s
multiple times:

Could lead to the following kernel crashes :
[   46.937975] Bad mode in Error handler detected on CPU1, code 0xbf000000 -- SError
...
[   47.058536] Internal error: Attempting to execute userspace memory: 8600000f [#3] PREEMPT SMP
...
Instead of the OOM killer.

Fixes: 4f24eda8401f ("ARM64: dts: Prepare configs for Amlogic Meson GXBaby")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Andreas F?rber <afaerber@suse.de>
[khilman: added Fixes tag, added _reserved and unit addresses]
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index eada0b58ba1c..0cbe24b49710 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -55,6 +55,24 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 16 MiB reserved for Hardware ROM Firmware */
+		hwrom_reserved: hwrom at 0 {
+			reg = <0x0 0x0 0x0 0x1000000>;
+			no-map;
+		};
+
+		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
+		secmon_reserved: secmon at 10000000 {
+			reg = <0x0 0x10000000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
 	cpus {
 		#address-cells = <0x2>;
 		#size-cells = <0x0>;
-- 
2.9.3
