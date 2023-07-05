Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2EFEB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 18:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmPWdduWxGZA4qhLmwoascPUhqYBnD4Pawqg/31B5F4=; b=VGWw6eLtDz7T3d
	lgF3SUw3/NfbWu1PZOrHX7Jm6CM6J35ARVqHEiivuLNNJduNvu+hDBF90lUZgeWbMmeCEchvvq53G
	akrZyzDT7iQbNd4337H9NF64ARJ+JcQpvcKPYNPU7IhOQvViX52SC/QFS+l2yo7NQB1yXU04SZEg7
	6Ga8re2gxIMo/wv3v9HpkJyeIxMl1jhXZjDMJGhf1I+5Ye+2NN5hG/kUUkbGcMnwvcyin9tLDNqnH
	Vm2wxF5zts3KSusRscQx2WO2BbuWtUsxjZQDnU2/ZvC4mhj6NkytfJSisJi0d8/a7TXRdHN5DhtAX
	6+DlSo3976JkKGbUpkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH75X-00GjFs-2b;
	Wed, 05 Jul 2023 18:18:51 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH75U-00GjDI-1W;
	Wed, 05 Jul 2023 18:18:51 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1B56B120071;
	Wed,  5 Jul 2023 21:18:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1B56B120071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688581126;
	bh=OllYyhrUJ08P7wMySV5F6J3h9lBYzlt948FsMshI588=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=RRT2fsKX+4aBYJHk8wqotSPoX9ajwXxJA/z27vHSCg28qI07e4Q3QdC+DOQsO05aN
	 hJWNJT7JyoITSJ4W8TewnamvRVio5cwFyBtd18QTd78qZ5fZhUBEEPsYgKhtXQg98R
	 OZw41A7gm/a+8r4ZRMiv9smll3uwcpCj1Ie7W53Iw2TT61UHCyXv3r/TwcUnxVFy1q
	 2Ph9Dk5ZSBXyn8IKTK+VrA0kzGN/DHf2PDOzX7PZgnh9ChFI3TM/XrqFDeXeteaBgG
	 JRv1YXTsqR/howZcb0PHfXCf6xOMtL6UOi+pBpy7VFI7u/MnMz3eiCoUisXrcj0O8+
	 OxJznG/mrlH+w==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 21:18:45 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 21:18:43 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <jbrunet@baylibre.com>, <jirislaby@kernel.org>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <xianwei.zhao@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v2 4/7] tty: serial: meson: introduce separate uart_data for S4 SoC family
Date: Wed, 5 Jul 2023 21:18:30 +0300
Message-ID: <20230705181833.16137-5-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
References: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178461 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 14:57:00 #21566867
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_111849_241927_B4454DC9 
X-CRM114-Status: GOOD (  14.60  )
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

In order to use the correct devname value for the S4 SoC family, it
is imperative that we implement separate uart_data. Unlike the legacy
g12a architecture, the S4 architecture should employ the use of 'ttyS'
devname.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/tty/serial/meson_uart.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index ad0748a10db7..6a63184b8091 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -818,6 +818,11 @@ static struct meson_uart_data meson_g12a_uart_data = {
 	.has_xtal_div2 = true,
 };
 
+static struct meson_uart_data meson_s4_uart_data = {
+	.uart_driver = &MESON_UART_DRIVER(ttyS),
+	.has_xtal_div2 = true,
+};
+
 static const struct of_device_id meson_uart_dt_match[] = {
 	{ .compatible = "amlogic,meson6-uart" },
 	{ .compatible = "amlogic,meson8-uart" },
@@ -829,7 +834,7 @@ static const struct of_device_id meson_uart_dt_match[] = {
 	},
 	{
 		.compatible = "amlogic,meson-s4-uart",
-		.data = (void *)&meson_g12a_uart_data,
+		.data = (void *)&meson_s4_uart_data,
 	},
 	{ /* sentinel */ },
 };
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
