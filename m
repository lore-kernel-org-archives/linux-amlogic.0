Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66078C636D4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gLyfcIKASzC6OJ9O55SkFpX3kERr/wUlsmBtBKDxh7E=; b=YC6+U97jSeibra
	251HZenyMqIprimxLbp6eGNEFlUJ2sYaBLhhrucqD6de+cPiONSzXqPcNCtqGToZI2TELgmfi//wF
	DCBiXBBvEWNFRAJlPBwUMhD+G17Q8IEgv7JkvEJdzf9axPwgslwF65TQz8hJj5JlrN/fl0oiv63no
	NxpzkR7vlSmeLQEGCp3Z9c7NYhwnAholVM5cAWj84JLxuCnmf7azsXornyc0A7oPSspsHlhJnB0As
	UWnbYiybnxSAAzEPAKXXzh3cx7N1mHCmhzgyVd0A3bVis8pADnD2f987K7WipLl8mv2bJFFetRluC
	M9Cal+nvEdhsCAHUs97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNaNO-00G7Lw-Bt; Thu, 02 Feb 2023 14:15:46 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNaNJ-00G7JZ-OH; Thu, 02 Feb 2023 14:15:43 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 3A07D5FD02;
	Thu,  2 Feb 2023 17:15:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1675347329;
	bh=x+mS3XduZ3+b7heAKDTw6F4UI2ioHdw4aSRUeHVmiWA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bEwIf/urHTx8gra33bGPcLFTDkqa2q49MKxqfvDDN7+xRuSYh8mH2xq57OlWffiv3
	 qr6+wfGcLWULLuhbAHfW7G5/A3KbgZ3nfz2iEkn1AseOStKl9DrYtIyyKGYqoVHLE7
	 EF7did1CWKLCvsVvbzsZkuZLZ56ciKlq0fQfTriFVVQLaohxBZ8adV75IIOOIR6ycr
	 QGm1SKanRrirlH31vQWmC3yyr7FVHzF93g0CmXwsAY4hBj1oaCNjjDJWNS87rItvW0
	 iRzWTqEKfZXeKhB43BAgjlOn/+oK2hNaXJ13qeh90C1PbAzYMKmu1fjw7ML0d3/CO9
	 MOtgsOHO+Y6xQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  2 Feb 2023 17:15:28 +0300 (MSK)
From: Alexey Romanov <avromanov@sberdevices.ru>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, Alexey Romanov <avromanov@sberdevices.ru>
Subject: [PATCH v1 1/2] arm64: dts: meson-a1: add gpio_intc node
Date: Thu, 2 Feb 2023 17:15:20 +0300
Message-ID: <20230202141520.40003-1-avromanov@sberdevices.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/02 10:55:00 #20831577
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_061542_006277_DA944A8E 
X-CRM114-Status: UNSURE (   7.84  )
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

Add gpio interrupt controller node.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6268c323a810..a04ddf0f4cd3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -158,6 +158,16 @@ clkc_pll: pll-clock-controller@7c80 {
 					 <&clkc_periphs CLKID_XTAL_HIFIPLL>;
 				clock-names = "xtal_fixpll", "xtal_hifipll";
 			};
+
+			gpio_intc: interrupt-controller@0440 {
+				compatible = "amlogic,meson-a1-gpio-intc",
+					     "amlogic,meson-gpio-intc";
+				reg = <0x0 0x0440 0x0 0x14>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts =
+					<49 50 51 52 53 54 55 56>;
+			};
 		};
 
 		gic: interrupt-controller@ff901000 {
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
