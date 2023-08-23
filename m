Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756CCC727A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 21:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2QAg6bNp7u7tHGR/Y85bqcCFus4JWTrhcNUe8aDasM=; b=YodZm6jex24Yvn
	6+4LbQS1/uc4ogGNLzECmKMCHcNBCFLvxrdsGtYc9OAHiaDg2E+RqKUOIRuY91tEbmWgL1ASYsmPV
	EudqsPKcI9KqQn1q6cRmIY/aF4+g8p+1DSmsdjsJN11CduC8AKxTbyazmG7KoFvsrJQInATo9VmXL
	40IWeBMhI780P6RPH2APJJ+AWj0IPsn1EzeS2b5jBLfzlGa1dHYShGVUMaLjoTeb4rFbOda9Xgp5z
	QYcUwkJpR5T2fomIqNe7fehUs2Le3mOUO9vLm56KSpHV9i0/NiWaaMeTlkewt1jNmCmFLjoSwK0l8
	rQTvFz4o6h5FGXt97F/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYvXl-001aem-36;
	Wed, 23 Aug 2023 21:37:37 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYvX0-001a9G-2g;
	Wed, 23 Aug 2023 21:36:52 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6ECFD120011;
	Thu, 24 Aug 2023 00:36:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6ECFD120011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692826605;
	bh=11pju9wuWu0pqEy6jDH/9H26g8XzldK6mkE+T058OUs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=a30Hst7I/vWoDMPnB7HqMo0/NXrZEbUOG9Yvxy1NLUijvAalTyNemeCRGJCBrX0xG
	 pxS6j2fjSd8RRqvJoNk6TDGeCujRcDQcXR3o9XqZ9M8YhRxApAbWAWGAcbwNltFOLz
	 Q41jmnoO+cmaWtmJlQdPMvnBX9ZTRupStTWkkM/Ioq3Fkn0sxCk22ngdGEYzq7dOUg
	 Rn6gXw8xcYwK64nsErLowMcJWbXyc7PxiYpymOwN3gwxlIy97eh1YxoGDw+fCsOTps
	 IFpJyaV8n1d4+vW1NY+eABTHkfKyyEjlIGuX+hg++XY7V8G9hFQeIuwl0jKB0GzBzV
	 zCj1SlQNW++PA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 24 Aug 2023 00:36:45 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 24 Aug 2023 00:36:41 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Oleg
 Lyovin <ovlevin@sberdevices.ru>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v2 09/15] arm64: dts: meson: a1: introduce UART_AO mux definitions
Date: Thu, 24 Aug 2023 00:36:24 +0300
Message-ID: <20230823213630.12936-10-ddrokosov@sberdevices.ru>
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
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/23 18:49:00 #21688451
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_143651_323532_F09641AC 
X-CRM114-Status: GOOD (  12.50  )
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

From: Oleg Lyovin <ovlevin@sberdevices.ru>

The Amlogic A1 has a UART_AO port, which can be used, for example, for
BT HCI H4 connection.

This patch adds mux definitions for it.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 8d479bc8e677..1cc34fe003af 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -126,6 +126,22 @@ gpio: bank@400 {
 					gpio-ranges = <&periphs_pinctrl 0 0 62>;
 				};
 
+				uart_a_pins: uart-a {
+					mux {
+						groups = "uart_a_tx",
+							 "uart_a_rx";
+						function = "uart_a";
+					};
+				};
+
+				uart_a_cts_rts_pins: uart-a-cts-rts {
+					mux {
+						groups = "uart_a_cts",
+							 "uart_a_rts";
+						function = "uart_a";
+						bias-pull-down;
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@440 {
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
