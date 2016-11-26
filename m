From: narmstrong@baylibre.com (Neil Armstrong)
Date: Sat, 26 Nov 2016 20:02:10 +0100
Subject: net: stmmac: Meson GXBB: attempting to execute userspace memory
In-Reply-To: <7a575702-2232-61b7-048c-e4075400be17@gmx.de>
References: <c8280798-453e-bd1d-bd4d-bf0956a169cc@gmx.de>
 <CAFBinCChPSTGp-1sez7rzOa3dw3A6X863FpPmUcjntiQ3-+o+Q@mail.gmail.com>
 <7a575702-2232-61b7-048c-e4075400be17@gmx.de>
Message-ID: <5839DC32.3010800@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Le 26/11/2016 13:38, Heinrich Schuchardt a ?crit :
> On 11/26/2016 10:08 AM, Martin Blumenstingl wrote:
>> Hello Heinrich,
>>
>> On Sat, Nov 26, 2016 at 8:53 AM, Heinrich Schuchardt
>> <heinrich.schuchardt@gmx.de> wrote:
>>> For Odroid C2 I have compiled kernel
>>> 4.9.0-rc6-next-20161124-00001-gbf7e142
>>> with one additional patch
>>> https://github.com/xypron/kernel-odroid-c2/blob/master/patch/0001-stmmac-RTL8211F-Meson-GXBB-TX-throughput-problems.patch
>>>
>>> I repeatedly see faults like the one below:
>> do you see the same errors with the RTL8211F patch *not* applied?
>>
>>> [ 2557.400796] Unhandled fault: synchronous external abort (0x92000010)
>>> at 0x000040001e8ee4b0
>>> [ 2557.952413] CPU: 0 PID: 22837 Comm: cc1 Tainted: G      D
>>> 4.9.0-rc6-next-20161124-00001-gbf7e142 #1
>>> [ 2557.962062] Hardware name: Hardkernel ODROID-C2 (DT)
>>> [ 2557.966980] task: ffff80006ddb7080 task.stack: ffff80006dd9c000
>>> [ 2557.972846] PC is at 0x6a0d98
>>> [ 2557.975776] LR is at 0x6a0e54
>>> [ 2557.978709] pc : [<00000000006a0d98>] lr : [<00000000006a0e54>]
>>> pstate: 80000000
[...]
>>> 0000000000590578
>>> [ 2560.054186] [<000000000046d4e0>] 0x46d4e0
>>> [ 2560.058155] Code: aa1503e1 2a1403e0 52800002 97fe895d (2a0003e1)
>>> [ 2560.064244] ---[ end trace 7d280955c14d4ff4 ]---
>> I am asking because when you look at the affected processes you'll get
>> this list: cc1, mmcqd/1, gcc
>> it doesn't sound like any of these using ethernet but rather MMC instead.
>>
>>
>> Regards,
>> Martin
>>
> 
> Hello Martin,
> 
> the same error occurs without patch
> https://github.com/xypron/kernel-odroid-c2/blob/master/patch/0001-stmmac-RTL8211F-Meson-GXBB-TX-throughput-problems.patch
> 
> Best regards
> 
> Heinrich
Hello Heinrich,

It's a problem we identified, some DDR memory zones are reserved by the Secure firmware, and thus should be excluded.

A fixup patch should be posted shortly, could you try the following patch and adapt it to the Odroid-C2 ?

Thanks,
Neil

-->8

From: Neil Armstrong <narmstrong@baylibre.com>
Date: Fri, 18 Nov 2016 14:17:12 +0100
Subject: [PATCH] HACK add reserved memory zones

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 203be28..5e5e2de 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -56,6 +56,38 @@
 	memory at 0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
+		usable-memory = <0x0 0x1000000 0x0 0x3f000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		sec0 {
+			reg = <0x0 0x0 0x0 0x1000000>;
+			no-map;
+		};
+
+		secmon {
+			reg = <0x0 0x10000000 0x0 0x200000>;
+			no-map;
+		};
+
+		secos {
+			reg = <0x0 0x05300000 0x0 0x2000000>;
+			no-map;
+		};
+
+		aml_pstore {
+			reg = <0x0 0x07300000 0x0 0x100000>;
+			no-map;
+		};
+
+		sec1 {
+			reg = <0x0 0x3f000000 0x0 0x1000000>;
+			no-map;
+		};
 	};
 
 	usb_pwr: regulator-usb-pwrs {
-- 
2.7.0
