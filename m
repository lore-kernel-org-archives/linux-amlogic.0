Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417B4C43602
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 02:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nBJSLfvIs/IEHn6AqdMCNZmcsgObKj3LvDkGZFxC1M=; b=O3oP1vzweVibAw
	IQtGnFT4mQhtYkhjLNIYl6fYxJnvEX8mJKZp4XwBvkBOlPm4NuyeGauJPZj6bVklhTOTCMZG0P4iJ
	96Le8R95Ig5F3wDHOz1ndSnWoR/R3PIE/jnnnQd/U40OEqV2sof9A478gsq3S4LttbmlfUu27g7qE
	mPY4z7CRjp/aT5CQLoEGcRuc76DZuX2K8sl8nlqmJonzlTiecdfnQKTbExhi4E7J5D1RBchhOytN6
	AngGTG7k62DBgo+qn1u3xSHA4jCA7w3ze6ra9Oe45e8i215sbq5jNU+qt0wLikzn3hDmcy8+d56HA
	qmoDkBbkfqRLSbntNJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZIy-0000000BPmn-1y6o;
	Mon, 06 Jul 2026 02:43:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZIx-0000000BPm5-2xU9;
	Mon, 06 Jul 2026 02:43:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C624943D05;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2E06C2BCB8;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783305810;
	bh=BP3Iyfs6C5UPNFRIIV/0n+AQzmZGr/qNrx/ZTsVwliI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TW4c/3ohfU5NQEsuq/Ly/Vhkk0eX7+9PB2+7YgYVopVq/23pRYgb3Q/q7gBYIdb8Y
	 3b/4tKHONRt4Ru0mUv+f1QFGUk5DOWUUHiZkQeW0E5UN57BKO3njSgMQhgBPCoQ7WU
	 XUoK9iOVk9uXHYWmBalGJ0fI/9yDUjQwGTG9sHqHokdHt58aHKFuwEPUnHyflYONpg
	 ribWNmYZy6KJq2YBvOFBI07ScjThZFM3LgUM+PU4nq+WixT3euLkeAOMiONe8/6Gt7
	 6/0ustOxEykTUwj3XBM/JF512sY34it630JMJFhH/3ZtqBHv638i0E1PK2CWD7ixFL
	 jya+PeX+xpyGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D75C44501;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 06 Jul 2026 02:43:28 +0000
Subject: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
MIME-Version: 1.0
Message-Id: <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783305808; l=1999;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=zFrCQ/4LL7v8cXwBeBaMK1lFT/U3mMj2TYJXY49GEuE=;
 b=rFxorohK+9RKciBUQ5U2kSjVGHirLUr10V6m8Y0NbHAsF/lOl8FTZriVfx0+1BNsI7fxPqsMj
 q0YwkUEM0A6AKT3DPhAqeHIY8Ka6J7IRoQjUG/USTxdaDKIIUZP5Dlh
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the IR controller node for the Amlogic A9 SoC and describe the
corresponding remote input pin configuration.

Enable the IR controller on the Amlogic A9 A311Y3 BY401 board with the
proper pinctrl setting.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi             | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
index a6b380ca47a5..044d1e8e086c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
@@ -38,3 +38,9 @@ secmon_reserved: secmon@5000000 {
 &uart_b {
 	status = "okay";
 };
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..72d1cc88c9e6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -241,6 +241,13 @@ test_n: gpio@c0 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
 				};
+
+				func-ir-in {
+					remote_pins: group-remote-pins {
+						pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 5, 1)>;
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_ao_intc: interrupt-controller@4080 {
@@ -254,6 +261,13 @@ gpio_ao_intc: interrupt-controller@4080 {
 					394 395 396 397 398 399 400 401 402 403>;
 			};
 
+			ir: ir@14080 {
+				compatible = "amlogic,a9-ir", "amlogic,meson-s4-ir";
+				reg = <0x0 0x14080 0x0 0x30>;
+				interrupts = <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
+
 			uart_b: serial@1e000 {
 				compatible = "amlogic,a9-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
