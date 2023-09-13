Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502C6CA5506
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Sep 2023 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6ERS3p+9T0FmJVklDRweIbKFEXhioccZa6uiDQLEZ8=; b=dYjMMBSkTAfMU+
	N7Q6tmJeUt03pEc4MRkd6c6KJXohNTitElwhcMyYgEyOjpY775h89JoruO/U6gp8Ooqn0VQI+BpE7
	YmBufzKYtdTntmtd137EG2KSnyUQhEMgIabSxdki5xtnPvOoAq4I2PD1P1fTvBjE92Kg06tTYIQpU
	0ZRu19N5N4z5Azhi9bA+/hHRBgYGnI+u3gUF+WYUJeRr7wTMevVnG+mWoQ+gMsrWhfvxl9cIXUcYK
	fBnyOP0bLWTgeRFzJgS0wTN7+pfXC6rOyvwWVm3vpsYxPVXjSOd9tqPYLr2hmPhwaazP67sIa14OM
	X7qiYhk2JxFrlRGQ5yww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKwy-0052gS-0w;
	Wed, 13 Sep 2023 08:10:16 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKws-0052b1-1x;
	Wed, 13 Sep 2023 08:10:11 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 13 Sep 2023
 16:09:47 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <tglx@linutronix.de>, <maz@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 3/3] arm64: dts: Add gpio_intc node for Amlogic-T7 SoCs
Date: Wed, 13 Sep 2023 16:09:24 +0800
Message-ID: <20230913080924.3336391-4-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230913080924.3336391-1-huqiang.qin@amlogic.com>
References: <20230913080924.3336391-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_011010_644724_CAAC906C 
X-CRM114-Status: UNSURE (   6.97  )
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

Add GPIO interrupt controller device.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index dae3465bd39b..21b2436c47e2 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -155,6 +155,16 @@ watchdog@2100 {
 				clocks = <&xtal>;
 			};
 
+			gpio_intc: interrupt-controller@4080 {
+				compatible = "amlogic,t7-gpio-intc",
+					     "amlogic,meson-gpio-intc";
+				reg = <0x0 0x4080 0x0 0x20>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts =
+					<10 11 12 13 14 15 16 17 18 19 20 21>;
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
