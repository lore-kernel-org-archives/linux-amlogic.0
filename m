Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161CACD4F2B
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Sep 2023 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3QbAwfQB3ZiL1J2ZWNBeLji5+OGf3G2f9jC3Bweo4Ec=; b=HbT6iYdhQY6H70
	2cAh2iwM8/Akd4Ps3Aq5mjNlaMcD2hTQfyfusQGd5Z2UST6hWuxysRFYq1aTrau5GGItBNS4iDZ0q
	WXYLjBbiNqdOjaD+VOL4s4YC5Mjh8NFFSR2Z2QGaq895pPOQyJFiaDuLMpeaemfke1HWOsAQDr1kJ
	kYqxXT093WDpwc0hYnBI1l3vl8Xx84+sh1xPru5NbCUlRuZxfY9qFswHhIS4ALHs/+j3PzAd0TrEH
	GdQiwESpUJHXyBJ8/tnWobE44JNE2DLqIEYraZsaduPdYddS1REUaRFAwg8g5i5liIGyL09BNxE64
	OyibZ0cmMXEcElLaapnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbAx-008Kt7-1v;
	Fri, 22 Sep 2023 08:06:11 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbAs-008Kqk-2j;
	Fri, 22 Sep 2023 08:06:10 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 22 Sep 2023
 16:05:49 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH] arm64: dts: amlogic: Fix IR Controller register area for Meson-GX/AXG/G12 series SoCs
Date: Fri, 22 Sep 2023 16:05:46 +0800
Message-ID: <20230922080546.26442-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_010606_903526_76EF08F4 
X-CRM114-Status: GOOD (  10.31  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Zelong Dong <zelong.dong@amlogic.com>

Amloic Meson-6 SoC only has one IR Controller, since then, there are 2 IR
Controllers in every SoCs, one is Legacy IR Controller (same as Meson-6's one),
the new one is Multi-Format IR Controller (abbreviated "MF-IR",
which supports more than one IR Protocol). MF-IR was updated several times,
so different SoCs could be got different register sizes.

There are all IR Controller register areas from upstream's SoCs:
                              Legacy IR             MF-IR
Meson-6                  | <0xc8100480 0x20> |       NULL        |
Meson-8/8B/8M2           | <0xc8100480 0x20> | <0xc8100580 0x30> |
Meson-GXBB               | <0xc8100480 0x20> | <0xc8100580 0x44> |
Meson-GXM/GXL  	         | <0xc8100480 0x20> | <0xc8100580 0x54> |
Meson-AXG/G12A/G12B/SM1  | <0xff808000 0x20> | <0xff808040 0x58> |

About Meson-IR driver, MF-IR was supported from Meson-8, which was distinguished
by compatible string (of_device_is_compatible(node, "amlogic,meson6-ir")),
and only one register (macro 'IR_DEC_REG2') was added because controller worked
in raw decoder mode, later registers are unused, so we recommend that register
size should be 0x24 if MF-IR is in use.

There are 2 ways to fix.

MF-IR is in use:
  Meson-8/8B/8M2/GXBB/GXM/GXL: <0xc8100580 0x24>
  Meson-AXG/G12A/G12B/SM1:     <0xff808040 0x24>

Legacy IR is in use:
  Meson-8/8B/8M2/GXBB/GXM/GXL: <0xc8100480 0x20>
  Meson-AXG/G12A/G12B/SM1:     <0xff808000 0x20>

Fixes: 2bfe8412c5388a ("arm64: dts: meson-g12a: Add IR nodes")
Fixes: 7bd46a79aad549 ("ARM64: dts: meson-axg: enable IR controller")
Fixes: c58d77855f0069 ("ARM64: dts: meson-gxbb: Add Infrared Remote Controller decoder")
Link: https://lore.kernel.org/all/20160820095424.636-5-martin.blumenstingl@googlemail.com/
Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 768d0ed78dbe..dd8c58e74322 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1705,9 +1705,9 @@ pwm_AO_ab: pwm@7000 {
 				status = "disabled";
 			};
 
-			ir: ir@8000 {
+			ir: ir@8040 {
 				compatible = "amlogic,meson-gxbb-ir";
-				reg = <0x0 0x8000 0x0 0x20>;
+				reg = <0x0 0x8040 0x0 0x24>;
 				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ff68b911b729..e12cea5fa889 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2084,9 +2084,9 @@ pwm_AO_ab: pwm@7000 {
 				status = "disabled";
 			};
 
-			ir: ir@8000 {
+			ir: ir@8040 {
 				compatible = "amlogic,meson-gxbb-ir";
-				reg = <0x0 0x8000 0x0 0x20>;
+				reg = <0x0 0x8040 0x0 0x24>;
 				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 2673f0dbafe7..0c04e34a0923 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -506,7 +506,7 @@ pwm_AO_ab: pwm@550 {
 
 			ir: ir@580 {
 				compatible = "amlogic,meson-gx-ir", "amlogic,meson-gxbb-ir";
-				reg = <0x0 0x00580 0x0 0x40>;
+				reg = <0x0 0x00580 0x0 0x24>;
 				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
