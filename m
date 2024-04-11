Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71698C04FF6
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2024 14:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGier9qGwbsGMCQodLlYu0B2XYCtanwdJBZunS12ZIE=; b=hGNtfizQFIqs0x
	MH90E309WAQ3h92k3Tv1Pqa0dNd2pl7PY07BGYFknjaynnCE/V84hef9184bumej4IA+TovDnatUN
	MdNA0u5U7dMWrW0o6rej+WSiryscVocOy6Y11X11+xzozK4BqWprkaxmXdyMs8njKT/1Dn+B25nx1
	H1ABWRbO/bb9KA8zPLlhyP+vdhgbmrhflva4jhdmwo9TsrMfN/7u0B7L3xIhMdEVPa20G6fpuBfE4
	XMz3Vqe7T3k5BMEeulgkv+CPuIZxuEIYsg8kJG+r3OL9Hi+EJ8mSJfGdNY6c6tJyYPvyP0E9IkHLS
	aznECei+1nwfPll2oBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruvia-0000000CYPY-1wyV;
	Thu, 11 Apr 2024 14:48:00 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruueA-0000000CCUA-3MpX;
	Thu, 11 Apr 2024 13:39:35 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D500510007E;
	Thu, 11 Apr 2024 16:39:17 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D500510007E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712842757;
	bh=A57FStZMZTG57y300fP+OYKnrsCuYIERChukcAKBT4Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Al+XlUuV3SO/xImvsUUsqZPO2cZqbbmsQBZDlsDhyfyLzOs53mQFzXRZN04VwHjYz
	 rAYRIpsO7Mn6ImgVtHsJRDWeX65h/dGJKtNADNaie3/pXWLR4HKdJ53PRGqKzlUf05
	 QbImjYJiUnYfu4bjtYjAX/wwLhqWFYOKTqpitl1QlvsF/wvaHDmW/8TJtGGr7Uzb2H
	 d22BO5045GSaxH1KBzJd8GeLCC7Gybm/YcYQdrt9J+7msgp2M8VGxLBpSJGOh1y/oG
	 O16z9/QGxr+0avVi1WYWtslfosgbNFnGvc+pg29XYAR6cETE7lNoQ7pgNfJEfXAJYI
	 S5o6dr4T+tnMA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 11 Apr 2024 16:39:17 +0300 (MSK)
Received: from user-A520M-DS3H.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Apr 2024 16:39:17 +0300
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
Subject: [PATCH v7 23/23] arch: arm64: dts: meson: axg: add crypto node
Date: Thu, 11 Apr 2024 16:38:32 +0300
Message-ID: <20240411133832.2896463-24-avromanov@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 16 0.3.16 6e64c33514fcbd07e515710c86ba61de7f56194e, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/11 09:22:00 #24744908
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_063923_920937_50270A80 
X-CRM114-Status: GOOD (  10.59  )
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

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6d12b760b90f..b19be72abdd6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -294,6 +294,12 @@ ethmac: ethernet@ff3f0000 {
 			status = "disabled";
 		};
 
+		crypto: crypto@ff63e000 {
+			compatible = "amlogic,axg-crypto";
+			reg = <0x0 0xff63e000 0x0 0x48>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		pcie_phy: phy@ff644000 {
 			compatible = "amlogic,axg-pcie-phy";
 			reg = <0x0 0xff644000 0x0 0x1c>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
