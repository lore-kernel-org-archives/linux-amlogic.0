Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ABDC04FF0
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2024 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XAJWBMcmFqBwBucKpfttq+WGOAkPrVeXtOLJ44LeBY=; b=id+1S21rbXcN8N
	tvjA+wE7vsu3MOe3o+OqT9AzBkRv1V/+t2NLdfMXQMQle3PCuOec0ImWzWjsz0HffXLNN/f9a2+Rs
	aVaOkGwY5czor2sZeUxqsghyz0fjlq5HfOzVgSTwQSmoaBGCyO+33Kylnjj3NymRMLS3f9q3MKZL+
	spN2BJuTydCEKist+eUSDFVAcnoL+p1K6zheRemR8sNZ46nYu3ZjZPpT3/nlhNzIAmfv0W75BGny5
	Tj2UiX6Q1Rjdys4fMjzZi8NDpis++dfgCE2HFUFzHvELN4tPv/R00POhM9aobHzcC+W8LdLU4sqQK
	xEdBWg7uc1m3dsAqLj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruufj-0000000CDho-0blG;
	Thu, 11 Apr 2024 13:40:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruueD-0000000CCWK-1QU0;
	Thu, 11 Apr 2024 13:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jSoviVVK1iz1k7MYUkXJBqES1AQfJEvBUgn3xP97XnI=; b=GpQ6VVejFZkDEM0w4nkVGpsNtO
	yMXBywKPD1h+ZO5bwVfbJ2Vd9keH1se3lL9mFdCSJJeudlBurwfJOXeDcNx3BzdnOrjI2ym6WW06c
	ZnuSLpW5CcYzvRRmln8/4ku8V2Iswg1JSpvY3VvTP/WoY/iHHUZAkklqMgMxD2+sQfxSDHGwWhYyL
	C7tvR9bYzRmF7JCb2NnLAapFO90El1d9KwEDtF+QP2FczJRgJdY4wUi1EN5/EvaBMKsDBNsGPaVPD
	eg6/if938tsCdjcPeEzW2ie4A34aKaqa3LRrYlBz15XuZ/Rc6/bP1iEHnAcebDKJsRTt8mAX2B9dj
	btxd02aQ==;
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruue9-00000008e21-1hDr;
	Thu, 11 Apr 2024 13:39:23 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E7357120071;
	Thu, 11 Apr 2024 16:39:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E7357120071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712842756;
	bh=jSoviVVK1iz1k7MYUkXJBqES1AQfJEvBUgn3xP97XnI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=rZC+eIpoljhC9bAXkb0K0Tp1R248MEeRQmQFJsv1gfeQW8r1ui1Us+i9Iv4PV+VJk
	 VxOEWaSh8lVi23MleLIZBmyYyLzC9RCpF/vOIn7zwyBRrGy9uqDMYfbMBpIYAWJ/+R
	 dsuX0NsEcR5WLhrXJvjMpnvXRz7l04FxlijB9zzJXZKebb0gvhFGQDPcpUlNV3hGy6
	 kXLj4Lx/RulYv3TVA36w+loAHdzKrQlff9LRlBzs+iGUcB3REdXe5c0ggxZP5aV3SU
	 72zk78I4bHPGDJ39FVVvSMRQBRJ+/bc2mFhP65cyoVfJWGt54jo9A6XqFncn6Pxo4Z
	 HKymsrLrXQqsQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 11 Apr 2024 16:39:16 +0300 (MSK)
Received: from user-A520M-DS3H.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Apr 2024 16:39:16 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <vadim.fedorenko@linux.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v7 22/23] arch: arm64: dts: meson: g12: add crypto node
Date: Thu, 11 Apr 2024 16:38:31 +0300
Message-ID: <20240411133832.2896463-23-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411133832.2896463-1-avromanov@salutedevices.com>
References: <20240411133832.2896463-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184672 [Apr 11 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 16 0.3.16 6e64c33514fcbd07e515710c86ba61de7f56194e, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/11 09:22:00 #24744908
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_143921_647823_B6905853 
X-CRM114-Status: GOOD (  10.57  )
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

This patch adds a crypto node declaration for Amlogic G12-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ff68b911b729..f6d7047a579c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1709,6 +1709,12 @@ internal_ephy: ethernet-phy@8 {
 					};
 				};
 			};
+
+			crypto: crypto@3e000 {
+				compatible = "amlogic,g12a-crypto";
+				reg = <0x0 0x3e000 0x0 0x48>;
+				interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+			};
 		};
 
 		aobus: bus@ff800000 {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
