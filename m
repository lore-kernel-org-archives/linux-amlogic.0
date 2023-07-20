Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7FBEB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jul 2023 05:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4HovBTDvM+sVpiKrvW37Whwzh5pFec77OAEa70ol2oU=; b=TgIb8rvpE+i5ay
	toOr7SQlj5afs67FWO1cNNfI3fKxbumJ012Gf+FCUNkzk2TbO2n/0FMIM0vrHJc6bopOzrkBVhnGb
	jKZ/tILkeIqP/AXNHcXz0jvSTu1MOk1LzgKOIbnqPdENdp6iD4W/Kw+CTfF5zO4sHk1cV992gjGuC
	m0Iu0BpjW3JOShXbIzvHrZYhVD7HMX07qjdfV/IzEQ1Z3Z3IxWLN6vou0caLaDXdKEMoihpS3IPWH
	umLE9XyzMnEdmM21s8F/fvOIqdCxdGUafYnU4+0oUVnqHF9nt/mwUWLiizBa9kp/S7uTmX5SSReQq
	QSjEF68I5aYCcUwoawNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMM7C-009oyi-1y;
	Thu, 20 Jul 2023 05:22:14 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMM79-009ox8-0k;
	Thu, 20 Jul 2023 05:22:12 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 20 Jul 2023
 13:21:42 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH] arm64: dts: Add gpio_intc node and pinctrl node for Amlogic C3 SoCs
Date: Thu, 20 Jul 2023 13:20:54 +0800
Message-ID: <20230720052054.3909902-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_222211_293499_F99331FA 
X-CRM114-Status: UNSURE (   6.55  )
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

Add gpio interrupt controller device and pinctrl device.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 25 +++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index 60ad4f3eef9d..4ad9c042f85c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -82,6 +82,31 @@ uart_b: serial@7a000 {
 				clock-names = "xtal", "pclk", "baud";
 			};
 
+			gpio_intc: interrupt-controller@4080 {
+				compatible = "amlogic,meson-gpio-intc",
+					     "amlogic,c3-gpio-intc";
+				reg = <0x0 0x4080 0x0 0x0020>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts =
+					<10 11 12 13 14 15 16 17 18 19 20 21>;
+			};
+
+			periphs_pinctrl: pinctrl@4000 {
+				compatible = "amlogic,c3-periphs-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio: bank@4000 {
+					reg = <0x0 0x4000 0x0 0x004c>,
+					      <0x0 0x4100 0x0 0x01de>;
+					reg-names = "mux", "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 0 55>;
+				};
+			};
 		};
 	};
 };
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
