Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310CFC678D5
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 22:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTE5sqRdcfsml3Vz6QnvJ4BeHc9oD3TfoTunabohkd8=; b=N4qOqeCy4/apgS
	QOdZsP1ag3RYBiB3zuM1yny8zF6AKdBtWOx5nqoczFvr+TYtW/5z/cDdK+lkArQ2xXToFzcFWzo8S
	vWW3VQ888Do9SUBC95+IxB5CJsvKQsakTM4tc5Nu/TF0FZ5rNTjecnrvO8jyeeaXiP75i7F7RDEz0
	mZAgvgSj+tiX4Lj66srhjvfyYizc1ybMlfnY1rU8oZMroM9sxIJvCdRrDY0Y9caKA3T2LmLuH4qz4
	7MH6TyZY3YQJVgPmnFL607wANg+TYPAqemdoUtq8pQ/V0rLQUrkjhnb9D1m0/73i7j/XPV+ummeRc
	yNLnl32NN5slSPmDN3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfmG-002f6i-FT; Tue, 07 Mar 2023 22:27:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfly-002f0B-Sp; Tue, 07 Mar 2023 22:27:08 +0000
Received: by mail-ed1-x530.google.com with SMTP id s11so58475691edy.8;
        Tue, 07 Mar 2023 14:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678228024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExpR60rlK67/XKPCeTgOHd008brYtjClGvCmbWSFbwI=;
        b=Zb/ggaaQyv+CkyxjYqpj/Dy3WUdP/IdFF0xtREUhsz/4gu2BR3xwDR29s1j2lq5Nr3
         gMibyzTFlzcEArZliny/JoXY2WWrfPF3m74+XGzSLtzdixRjF0OTfvjpdSeL8pb5b7iy
         tfIKXizsoEbEjJImbsAkw7ejDSKfzuh2BlS7uxXsNNlUmSh45ITD8m2l3mTgbznGBSXV
         1N/3mG9zXst+s2dhcQXG57D9G9NobHu15G5IcDiiDgS9tJwsbWcRU+O7BCzwmWJcAcqt
         uMZ+QqJ1VbozXtBKmC/I4AWnTRW3jXGxyVCZAqKOKrOhgIDrM6mO1ckkt5xNjBWLKER8
         sQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678228024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExpR60rlK67/XKPCeTgOHd008brYtjClGvCmbWSFbwI=;
        b=dlTwYEtnfsNlzD6fTEXdqjZbrow2YTusqlPy3anCOMtGiRSfL3wEBaTdjXNk4Dly9R
         ci6a6PI6ZIBg6e25J5oDjbkqzfM8RwygyiojOrfnzjkdeSO3QE/IFofhW4ZpWNCRpW5N
         RGCMZmMwuUlwal/CRYCS6GF7MWrPEOtk8wMLse+Op09BMezWXfJZKBulukX44xX4L7/d
         guKQyNyYiKOeZmNyj/Ln6UXeMJv9h0t5u188p9INwnniFYopZE7QXnNW4dWm/o4JLvNE
         jEzzvj5/p5uj/qbWt27PgM0bJaL9ywfDQlkIAzphQHc/gBdsAIgERMAxjX0D7YftxcZz
         Pl+w==
X-Gm-Message-State: AO0yUKUtOI/Cl73AD8gnkvcw+pknLM5cLrMfKxF2laQUtGkXN/m9Z7lM
	1SUgd5Obiy6gAtcbyobM2Qmd+vfgZMw=
X-Google-Smtp-Source: AK7set/o0PL2VR+sAsODNx7yzEKziGZhE38Th2SLl9L8Pm3Fk4SOFX1CvOJbUItRhB8Vx6c43w6oPg==
X-Received: by 2002:a17:906:c9c2:b0:8a0:7158:15dc with SMTP id hk2-20020a170906c9c200b008a0715815dcmr13158932ejb.74.1678228024215;
        Tue, 07 Mar 2023 14:27:04 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c485-ef00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c485:ef00::e63])
        by smtp.googlemail.com with ESMTPSA id t19-20020a170906065300b008be996c1630sm6669412ejb.39.2023.03.07.14.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:27:03 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: meson-g12-common: Use the G12A UART compatible string
Date: Tue,  7 Mar 2023 23:26:51 +0100
Message-Id: <20230307222651.2106615-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
References: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_142706_967918_8C6FE6E0 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: neil.armstrong@linaro.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Switch meson-12-common.dtsi to use the Meson G12A specific UART
compatible string. This enables the "divide XTAL by 2" divider which
improves support for UART attached Bluetooth modules (for example
RTL8822CS) running at a baud rate of 1500000. Without dividing XTAL
(24MHz) by 2 a baud rate of 1500000 cannot be generated cleanly and the
resulting jitter breaks communication with the module.

Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Greg, please don't take this through your tree. I included this patch
to show the overall goal of this series. If Neil won't take this as
part of another series then I'll send it separately.

Changes from v1 -> v2:
- keep meson-gx-uart as fallback compatible string

Changes from v2 -> v3:
- none


 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 123a56f7f818..904bcd4d2acf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2046,7 +2046,8 @@ pwm_AO_cd: pwm@2000 {
 			};
 
 			uart_AO: serial@3000 {
-				compatible = "amlogic,meson-gx-uart",
+				compatible = "amlogic,meson-g12a-uart",
+					     "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x3000 0x0 0x18>;
 				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
@@ -2056,7 +2057,8 @@ uart_AO: serial@3000 {
 			};
 
 			uart_AO_B: serial@4000 {
-				compatible = "amlogic,meson-gx-uart",
+				compatible = "amlogic,meson-g12a-uart",
+					     "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x4000 0x0 0x18>;
 				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
@@ -2293,7 +2295,8 @@ clk_msr: clock-measure@18000 {
 			};
 
 			uart_C: serial@22000 {
-				compatible = "amlogic,meson-gx-uart";
+				compatible = "amlogic,meson-g12a-uart",
+					     "amlogic,meson-gx-uart";
 				reg = <0x0 0x22000 0x0 0x18>;
 				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc CLKID_UART2>, <&xtal>;
@@ -2302,7 +2305,8 @@ uart_C: serial@22000 {
 			};
 
 			uart_B: serial@23000 {
-				compatible = "amlogic,meson-gx-uart";
+				compatible = "amlogic,meson-g12a-uart",
+					     "amlogic,meson-gx-uart";
 				reg = <0x0 0x23000 0x0 0x18>;
 				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
@@ -2311,7 +2315,8 @@ uart_B: serial@23000 {
 			};
 
 			uart_A: serial@24000 {
-				compatible = "amlogic,meson-gx-uart";
+				compatible = "amlogic,meson-g12a-uart",
+					     "amlogic,meson-gx-uart";
 				reg = <0x0 0x24000 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
