Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879E4E7F153
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Sep 2023 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9fdiwVxoHb09VMvPmiD8iPdnStttq5h1su6gUcNBJU=; b=E6mHZR9MPgp78X
	7yPoDXIw3EOIQ1DoOsVSD+ZbrbcCNGpYcsYoRCwYp9cDi2QNDGXlR3dSCaab79j1TG8QVyGrraGiN
	S1QPlJxn0AgnDsbRRwhMxXpJDsOlKen9FqyflBMAidX+YKl0jRI9tXDbuKcIbDHQZOv8vfrOt0Hji
	dnztHrhFSRTkebNMDK9/XuKKNeMHpcQDouHjRdbvH42wy0F9UQGK0a8KDFLgI7sQUA/0mQPMw/KQ7
	zwiBPC52CfZXqV57zrYuq3jA0Z0K4OvJyob4O72vTUyMO78fcK9Z50nya74SM9QPw0+szATKKLwaW
	Xp9QlqsYr88ynTMbiWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmAl7-007Z3l-37;
	Fri, 29 Sep 2023 10:30:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmAl4-007Yzs-05;
	Fri, 29 Sep 2023 10:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1dTsc7UycRu0AzxWloIWtmkmCrMWxuzh8RJp/Vn8/ks=; b=AkLL99fwPQ7iwsJROhjrJ3pYxr
	6og4/krlTSz9VVWWDEXTdrPgHCNmr1qEiWIDPGuCrDYt9XBIdNkh/+i8Hj/Mia8i59FwzKPJqIQV7
	wUF4w9yMdSTaNrEdyEoj8ElQUoxaWBIdKlTEM8JRVJedwb+kc5gJ7MUqu0WHeQophxUBLbZrZAqGE
	Jd6IRLYJnV9WujOnXBjJoS25ORZ7dS1+JEKVNiSiQj06ECS077iMvRXS5GI0/T2/t8qfor/6nuJCs
	wbXygsTvQro2lbrlfTY9ZXZHvI6k2ZBfo6mi3XmDv1BslCxOSTxWxmqd3AABHhptdC3NdFd1tmfxr
	IzZKcuuQ==;
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qmAkw-008DCa-Kn; Fri, 29 Sep 2023 10:30:04 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B3C79100009;
	Fri, 29 Sep 2023 13:29:53 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B3C79100009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1695983393;
	bh=1dTsc7UycRu0AzxWloIWtmkmCrMWxuzh8RJp/Vn8/ks=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=QiAZe+vSEhWTPNx++eMrI4/O1K0a6I6FE7Qwkmq8Affurjc5DuHPP9KoScmyeN+RF
	 gOmg9ki96ywVqWE2RSPn6kgrXe3AEQfTtGtaKGiElnX38DOZx68UkQmphDJ0BgCQVn
	 xUGXKWvWJ0qyx9SB0p0njRTU105krcZgF6ZR1L+lTHXu0RoNLRjLs2/oz4NymDAJ4l
	 Fxpp6wvupVEVEaMaJrQ4DpKcWUwSwuRIGPVQP4i3RM0auUozX00hAUbG3XQKBwoMHP
	 jF0Td/6t+gezONqOhXxANQtDGRQJpo06OBD6kyBQcn0stKHRB0LJ8JU/xl3pZS3/AA
	 gonYS9RMNM7Kw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 29 Sep 2023 13:29:53 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 29 Sep 2023 13:29:53 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <narmstrong@baylibre.com>, <neil.armstrong@linaro.org>,
	<olivia@selenic.com>, <herbert@gondor.apana.org.au>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<conor@kernel.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <f.fainelli@gmail.com>,
	<hkallweit1@gmail.com>, <lists@kaiser.cx>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<kernel@sberdevices.ru>, Alexey Romanov <avromanov@sberdevices.ru>
Subject: [PATCH v5 3/3] arch/arm64: dts: meson-s4: add hwrng node
Date: Fri, 29 Sep 2023 13:29:38 +0300
Message-ID: <20230929102942.67985-4-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230929102942.67985-1-avromanov@salutedevices.com>
References: <20230929102942.67985-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180231 [Sep 29 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 535 535 da804c0ea8918f802fc60e7a20ba49783d957ba2, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/09/29 07:52:00 #22006267
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_112959_057275_62C647F9 
X-CRM114-Status: UNSURE (   8.69  )
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

From: Alexey Romanov <avromanov@sberdevices.ru>

Using this node, we can obtain random numbers via
hardware random number generator.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 5a3abcc08ee5..e0cfc54ebccb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -148,6 +148,11 @@ ir: ir@84040 {
 				interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
+
+			hwrng: rng@440788 {
+				compatible = "amlogic,meson-s4-rng";
+				reg = <0x0 0x440788 0x0 0x0c>;
+			};
 		};
 	};
 };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
