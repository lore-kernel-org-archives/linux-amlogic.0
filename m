Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC39C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 20:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMgIsR9XSTS0i7cLEUZvXSAMRS8SoTrGi+IBFGj/3tU=; b=CtXJ58molQd9Q0
	pDjmQCi/tlM4/rixXYOZtwLpW2j8Fx6pDeQlHp5aleLdg2GnbNAiM6lvJNzoe7dbrRqHH0GhbyYkb
	7LQKKo8jkzEiaxRAAvSTS04Bj5Q23PldAqYF2Nn24zXU7R9tso7lrtCOHmctgfz2wvLwqwPf+sGnC
	G6KtLed3drXYywUZGJqg3gKkq6DowS4CESdILXeyKpP6w2ViRUFwbTsc3Zrs2XuIP7ZIMOGwgqJgR
	/atmtJx2IYippvqQXEhnnerFRv2a+OSa+4xGoBxkMHh21khX+IY7MxFx/QCLk0ZUoJoEYyPtIpTpW
	+h1VpsLKVy1a5OZcqimA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zad-00750w-35;
	Wed, 07 Jun 2023 20:17:07 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zaW-0074vN-32;
	Wed, 07 Jun 2023 20:17:05 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 36D085FD71;
	Wed,  7 Jun 2023 23:16:54 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686169014;
	bh=g3y8T0WTlJ3jzmj8lOKHVsw9Ja/UPAZJGv18YRUKJy0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=g69kBCUVxKU3MeagzwSZlDYO6xykarWKd7igIzWqgS20j/Bs79FFQ1SVKXIYnI0LH
	 WS2LldPlX7FVQ4rb3Y9f9NYxx5kPFORDK6Wnyit67hiJd6gqpJSLld7O+jH5eN/lyw
	 GPu37RYc/MAE9h7rvCl+0jJIqlhYTdupCDFrgVQF2iPRZajSGiAxqeVVNmD6TY5CfX
	 zfADPI1oM0/QSBhc8GlcjrQytSpuUtyNG5SuvzTsmMATBd1Sj+IrZpo8k34Q1Q9/wU
	 0wLXig6YO2nFXfoJTS7yZZm/F1QZyGy1hLBu95gQo8htt++tYStJxbHILNoZvYGuO2
	 5a1ndu8qzrOMg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 23:16:54 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Martin Kurbanov <mmkurbanov@sberdevices.ru>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v1 4/6] arm64: dts: meson: a1: introduce SPI Flash Controller
Date: Wed, 7 Jun 2023 23:16:39 +0300
Message-ID: <20230607201641.20982-5-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 16:55:00 #21454472
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_131701_181432_35802EE8 
X-CRM114-Status: UNSURE (   9.01  )
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

From: Martin Kurbanov <mmkurbanov@sberdevices.ru>

This controller can be used for spinand flash connection.

Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 63faccfc1134..0efd922ca7e1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -199,6 +199,16 @@ gic: interrupt-controller@ff901000 {
 			#address-cells = <0>;
 		};
 
+		spifc: spi@fd000400 {
+			compatible = "amlogic,a1-spifc";
+			reg = <0x0 0xfd000400 0x0 0x290>;
+			clocks = <&clkc_periphs CLKID_SPIFC>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			power-domains = <&pwrc PWRC_SPIFC_ID>;
+			status = "disabled";
+		};
+
 		usb: usb@fe004400 {
 			status = "disabled";
 			compatible = "amlogic,meson-a1-usb-ctrl";
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
