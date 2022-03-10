Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E17C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Mar 2022 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vz/2M8b2Vn8LrbXbAcPfXhZsDtRihv7lVzEzWPAhwMA=; b=KizAT4OUCY7YDW
	1x7/zycseg8ZKqhdKRuU1NM43OyYPjKenzqAnUWiL4dLtff39qSbNhOSteirn12RXemD+vux/gC/J
	IZi5Pw1F8O7KjOwPet0EEkDjky5vijoL4FSjhAp8jUSyraTtVdJ+xdu6rMqX47rDXDursvr0YMjTt
	ajffwQyCc+gYHNWCoKHLZKpm0CCR7pjfWmyTzY6Xg3t+AhHFg1UW6pdwFqDWmA+Aeoa18kexWdg0n
	uBtgNr7hKkogT7e2SSyiI4Wpv6tnhRDsxI4jM3sY6hhlReOdyU1M3xae/ecfJh3gxRGCE9T8vPClx
	83w+7e2RSfbR44u1jpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSF50-00C8Nn-U6; Thu, 10 Mar 2022 09:27:30 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSF4l-00C8Is-Td; Thu, 10 Mar 2022 09:27:17 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Thu, 10 Mar 2022 17:27:11 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: meson-s4: add gpio_intc node
Date: Thu, 10 Mar 2022 17:26:45 +0800
Message-ID: <20220310092645.4303-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_012715_980545_B2005084 
X-CRM114-Status: UNSURE (   5.84  )
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

Add gpio interrupt controller node

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index bf9ae1e1016b..6972f97e0062 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -85,6 +85,16 @@ apb4: apb4@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			gpio_intc: interrupt-controller@4080 {
+				compatible = "amlogic,meson-s4-gpio-intc",
+					     "amlogic,meson-gpio-intc";
+				reg = <0x0 0x4080 0x0 0x20>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts =
+					<10 11 12 13 14 15 16 17 18 19 20 21>;
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
