Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1D5D41C10
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 07:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuMAzdgnL9f6Wa667ea6iXFJyCaq9PCdPtaIqeaMFZA=; b=KoW7hP121Mnqzj
	2IWTxwFRwY1wPi0AKriShrqLwu1Ftqv2+PWtuHBb62oM4+ET6ASvIDM/xW+mk38tetfRUZ0EHV4cX
	IJztzK+Z2yYV0ga1Dtn88hZgr8npGj5/KHPtxQWA+c6UHSTa+CZO9DJJp0vEsaOYyqGwpyqy3Sczs
	wOtlxr7QOK8yH8N6H6ebUZQGoUTIiLqAh94qr+Ixz/v2r5OFSDJnJMGfgn9h5z3OsEfsqS2egEZHh
	2N3mP9xJ7iTxB4ugiEuJl+mdJn2hiTT/3Bm3+8QGbNBb+oQjeJvBUE764GbFd3WNzcal0rqTndRtc
	WiaPAq0h1bkeqsgpSZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7sZ-000000060oj-2Iub;
	Wed, 13 Nov 2024 07:33:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7ou-00000005zr7-0s3I;
	Wed, 13 Nov 2024 07:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBCA5A4044B;
	Wed, 13 Nov 2024 07:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 468B0C4CEDE;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731482982;
	bh=emTg6gDh6BXC5WxZiY52CWHMm6aFR9q/BDSunW+ZUto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Kq3zjgSePSFD0p63NIcqUH/CSepcSbug2uQRAKUglQ1KliwEGwdTVMVGS6N+7HfQR
	 6yDrsoklGp1nARdnMYIUwjzGcY7MjOXiNCWLQaZnEvjJ3+HvTMRu6JUZETe2Au6/lT
	 ZPx+t9ZY4YJqsPphi531pCtkY7ZJjAsc/p2R3bRfwUNSxuv1Nb5bdC16Vp65XKUhGc
	 msEF5enNXZT0q7Lc/HKg61GWOFmTNq0ehutrCjbFxV1IL4m8lF5FUmWSpY0+zFSDPX
	 MGjIgDpD1MkVn3JuHnBNC11wRj4zGNEbnvHUVqhF9iNe5x7IoByukMpzQkjgnVT1Jy
	 kIJgKwb9jeoPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317BED41C11;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 15:29:43 +0800
Subject: [PATCH v6 5/5] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Message-Id: <20241113-a4_pinctrl-v6-5-35ba2401ee35@amlogic.com>
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731482979; l=1622;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=BwmmxNbUHc87jVbNysKI2HGP1eTeZdpPlPo2pspjE6Y=;
 b=3/JaPWV+OnNB85AwLp9WTwyXWpxvU/jvJYGO8PpsGmerWXTfj569eY23LBomf44sgmK+NqNuu
 Wc7IWgf18dcD7+xWPSWzxrE/efzjYiqziU/aYygK/xIC40npjl8dHvH
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_232944_411835_EF01E0A9 
X-CRM114-Status: UNSURE (   9.12  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A4.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..a176faf7f1ef 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/gpio/amlogic-gpio.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -48,3 +49,38 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,a4-periphs-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
+
+		gpio: bank@0 {
+			reg = <0x0 0x0 0x0 0x0050>,
+			      <0x0 0xc0 0x0 0x0220>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <3>;
+			gpio-ranges = <&periphs_pinctrl 0 0 73>;
+		};
+	};
+
+	aobus_pinctrl: pinctrl@8e700 {
+		compatible = "amlogic,a4-aobus-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x0064>;
+
+		ao_gpio: bank@0 {
+			reg = <0x0 0x00 0x0 0x04>,
+			      <0x0 0x04 0x0 0x60>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <3>;
+			gpio-ranges = <&aobus_pinctrl 0 0 8>;
+		};
+	};
+
+};

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
