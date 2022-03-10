Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66341C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Mar 2022 03:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=byLHbApCFYdWFfskJoM22Kyym/o/o4ruvOUChMphViU=; b=QqtgarnRzAJy+x
	gNwnqVClK97j2q2ZOJfRpjV5qz6sMe/WLG1Hw0G1tdaDyGGr6O4/rLAcC9Mk1LgWW4A9Dy3c6SlAO
	K+8KWkTTSJr8fCsmdsrpANUcqXq5UHRk2xAZKyz2l1Nzmt8ygibIkEkKRkTrl44mswPjq5KqSkjS0
	RkSSq7KXghCtFzcARLuJ0p4kfyoc/P5l1hE6kn/rY1NIGZl++eRXwpcX23M27vPEfpO+RosbjEC0S
	3vW5TpW3bwXQqFcZ3FS+PA6CrNs/U33yLGpd5nc6hT08mA8uNrYACXYwJC6NvbCUlHmF4rxj36KMW
	3H26yMD28SnFVtuOWB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS96N-00B8Fl-5o; Thu, 10 Mar 2022 03:04:31 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS96A-00B8B0-89; Thu, 10 Mar 2022 03:04:19 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Thu, 10 Mar 2022 11:04:12 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: meson-s4: add pinctrl node
Date: Thu, 10 Mar 2022 11:04:10 +0800
Message-ID: <20220310030410.718-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_190418_318538_6C355B1C 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
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

Add pinctrl node for mesonn-s4

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index bf9ae1e1016b..e440efcf7a92 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	cpus {
@@ -85,6 +86,22 @@ apb4: apb4@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			periphs_pinctrl: pinctrl@4000 {
+				compatible = "amlogic,meson-s4-periphs-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio: bank@4000 {
+					reg = <0x0 0x4000 0x0 0x004c>,
+					      <0x0 0x40c0 0x0 0x0220>;
+					reg-names = "mux", "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 0 82>;
+				};
+			};
+
 			uart_B: serial@7a000 {
 				compatible = "amlogic,meson-s4-uart",
 					     "amlogic,meson-ao-uart";
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
