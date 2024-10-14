Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FC9CFC528
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2024 09:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZpSxbKdn+7GqM7ITC2Kp/0holO7OM0Hz8FlaxEYS4c=; b=e9BmDNECa7FC/L
	BmJtImK32Kdjq43A5DnrsQsFPUGy71keSsUhPszHPO1Pywp4gbifnC9OxdOvP2Asoki24b1Ezk577
	mErj/mqEnJXaTeD6beQjR4QPTnS+rYKa6HnnwXpcTB65JALs3HFEWV9RCuwlR33RLuQdWxNc3fjSn
	5dpIcbFj7KeYtTQ1vCfREtlX5Hoi0/rtKcrkfM0kiMdhdvRp4pfOheYtAQXlJ5tJVBBLS/ASNIKXC
	ee2SFppgdqiHsrFc8fE9t3q9p6QIwSuqjFatNROV6NZgTGRKL0K4l/P6uIKAWH0R2PAq80HoXt5cj
	GRO07+r+CR8IukV9QYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0HKa-00000004ViP-25rB;
	Mon, 14 Oct 2024 09:25:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0H1i-00000004Qph-0jsk;
	Mon, 14 Oct 2024 09:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB2915C5A06;
	Mon, 14 Oct 2024 09:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82E3BC4CED2;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728896764;
	bh=MtB6QbmqNb4ufVq80lo9MPhDT5CunsbL/rj/E+3vF4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nUVO0SEUw0dbjsxbaJfZevaZJr3MM/qpom3NoWj4b+PDNr2LZHFnjFtii2kgay7Lk
	 cGoI+C4mcMKIbP+dVA0mZjQdeghhp9U/988GarYpHzA8zlfpUcsnB8kALc+d6sv9aD
	 Wd1qd7DcPvHL0cuyDVxeIV+jX6BGC0QhFYZtUyVWD+rui5lhg/t8b/SCk3oqgA97sr
	 5XDHBM5ZDl4HUReLxrsjzXzwMaBfTlMU2uohgfaT80I+X+zdRNGeRD8R8tkm6G5PZu
	 AU7Y7MsiF614aW9UsAyFy0n2zyUQDPVR3C9hHwQmQOjexLjSnNUp06Ox9/NwYmqIW/
	 lottLx82Rk40A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B34CFC527;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 14 Oct 2024 17:05:53 +0800
Subject: [PATCH v2 3/3] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Message-Id: <20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com>
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
In-Reply-To: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896762; l=1593;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=C3HURuKYy33qf23hNf067NewT9lHq3pt8By8uPgxg5g=;
 b=qqhTr2rQmwMKDgYY/dL2jR89f0X7pkQ60FXWN8yWMQYWvBlmArE8F7hm2XIkZQvzjNY0Ylx73
 OGigvcbliGmCPdGvYMNgsw5QwjEgSqUoIJzLUXFJNqjMSea2R64bQ4i
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_020606_421280_9AC759D8 
X-CRM114-Status: UNSURE (   9.15  )
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

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..a748351e8b1b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/gpio/amlogic-a4-gpio.h>
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
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 0 PERIPHS_PIN_NUM>;
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
+			#gpio-cells = <2>;
+			gpio-ranges = <&aobus_pinctrl 0 0 AOBUS_PIN_NUM>;
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
