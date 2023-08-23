Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF0CC27C40
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amLztOT8njIEEPt1m9r8y0CTIJFRkHd/94u/vSV3l5s=; b=Gz/ouZLoNhdbHE
	1m01KfI44LcPfJg7FxK7sWYeSTQRQ1oJ4jSXQgUHK81qqIplidmX3NtPRvVH61MKO81rJ3KAE90YR
	2hFa3WXLJDCaUc+u63+unE5eFQYLG8F+ErTwgOBjZWEO8+aXEstkE7uFTEpCTGMGkk7bF8usJuw1m
	5th3/Tj4jz0WZyyJrGR1PFoiKxgGJVw2WvlTUiRZwfxRimggs7yovV3hUP+aHd9Br5A7jlfjvCa8f
	UIjPk8PcLAZRAR1cTVqJmLjeZfFzQoGakWwLoV337Nlhoie6PWEXMZ215AOuzWv+2MEp/xEV6EJvj
	r96M03CnX7SYa4YtKZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYvX0-001a9H-0p;
	Wed, 23 Aug 2023 21:36:50 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYvWv-001a6T-2y;
	Wed, 23 Aug 2023 21:36:48 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5F34310000C;
	Thu, 24 Aug 2023 00:36:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5F34310000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692826601;
	bh=ofem6esa7IqI8462uKhai0hK+fnryfGoYKUd31YzbPk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=p4AX42JqJ4OIuwPgodfzr8qMJzwJwKIXJTG7E8mNv88EyzBYVGBh7EESEpz3/DWXO
	 OXhl4cMNzUNlykV2M56fHPX17yt5eVtssrtY788TN9xYSqeJcw2bMVuF/VqAIvxoLP
	 v1HwtiqarXRwfHFUE1gf16MGxXGmWg45n4QKWGxrX3UXjOic+6cKWdFJNY3z77inU0
	 zfJVE+tcdELOi/5+yuhwTH44/7yO//ClluXNeQoKdwAbL7Kq/FenB8Q/D3padfyMl/
	 jX12DFWWm3Iy/nSWqjdDU38En3MsdLAdrfaLnxwpyIYAOR9MKVQPC5B0zCOK2nqW3P
	 9JMGrCt9On/dA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 24 Aug 2023 00:36:41 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 24 Aug 2023 00:36:37 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v2 04/15] arm64: dts: meson: a1: reorder gpio_intc node definition
Date: Thu, 24 Aug 2023 00:36:19 +0300
Message-ID: <20230823213630.12936-5-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
References: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179413 [Aug 23 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/23 18:49:00 #21688451
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_143646_704337_DA625505 
X-CRM114-Status: GOOD (  12.36  )
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

It is recommended to maintain a sorted order of device tree entries, so
move the gpio_intc node ahead of the uart_AO node.

Fixes: ea254644a228 ("arm64: dts: meson-a1: add gpio_intc node")
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index f740153f3c1e..f95f4daef02c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -105,6 +105,16 @@ gpio: bank@400 {
 
 			};
 
+			gpio_intc: interrupt-controller@440 {
+				compatible = "amlogic,meson-a1-gpio-intc",
+					     "amlogic,meson-gpio-intc";
+				reg = <0x0 0x0440 0x0 0x14>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts =
+					<49 50 51 52 53 54 55 56>;
+			};
+
 			uart_AO: serial@1c00 {
 				compatible = "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
@@ -124,16 +134,6 @@ uart_AO_B: serial@2000 {
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
-
-			gpio_intc: interrupt-controller@0440 {
-				compatible = "amlogic,meson-a1-gpio-intc",
-					     "amlogic,meson-gpio-intc";
-				reg = <0x0 0x0440 0x0 0x14>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				amlogic,channel-interrupts =
-					<49 50 51 52 53 54 55 56>;
-			};
 		};
 
 		gic: interrupt-controller@ff901000 {
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
