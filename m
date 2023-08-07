Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0A5C001DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Aug 2023 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wb2bwmthxb1JA4IwnvjM7iGqXedE268edqn3ilR6DUU=; b=M+KFfOqswA9IFp
	3nFEmFfPlLz9Z6N0mFpZXQQ68kdLV+Y4BkILBsU/UC5Pk9ZKQy/1aFoNEapl+tplWEfbFCyzRHXRP
	hGZH8WF/7aQnqQ2NeaqIzRazdXJarX5cQCGCFbQlNYgvQTfuDJ9Tw3L/r8ACXmMHM5pAgomLLtzGv
	e7VKaOdWK6AQOj1hv2q17+Pmr6pNn+9IeAYc3q+EHCPtC0fa2+UiEmMgasgPQmTsYrG3TaxHDnPVK
	t+uD4HjNh5j/c+Vthnmow2uCu/f6q1mkEi2SlY7jl70Z/iyocbomQChVnULgaRBS7z8RwAW+ntTNA
	7AS1cnoavJqKE+xLf+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzwa-00HIcF-1C;
	Mon, 07 Aug 2023 13:06:44 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzwW-00HIXx-0M;
	Mon, 07 Aug 2023 13:06:41 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2B774100009;
	Mon,  7 Aug 2023 16:06:37 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2B774100009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1691413597;
	bh=wmVs04V+ZYyznAROOcSaMP4Fv7d2hoWqBtKr4yQLETw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=AL7+EhlGy77101vVTs13e1WYo/fjpsAWICvwGF8es671u+Jz+uc4YIX0sHmOM4GJL
	 +szaCyyBj7rBSA3PA31eeOOFiLxenbbTNYhTjPsl2vnd5zl0ycSt0z6NJzY7HX9EGH
	 gMGqsdeJhSQVnU5swmKfyuMFa1+C85jw5gVPTUSRN9OObitV2U8fCaKl8qrtWhy35R
	 r0gYyXH/23RA1ADvzeY2FCuBUyhM6FlG7agiV9f4/Lhb17i1gY8LKjRZc5l6dcYNcA
	 1K/MGhTEZdAy/uGLuhIaXgCkzu7uxvEsLJCTQl6FUaiaPI6kniiGzVb98PQYlK4HK3
	 dBwaZVSeVPLgA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  7 Aug 2023 16:06:36 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 7 Aug 2023 16:06:11 +0300
From: Alexey Romanov <avromanov@sberdevices.ru>
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
Subject: [PATCH v2 3/3] arch/arm64: dts: meson-s4: add hwrng node
Date: Mon, 7 Aug 2023 16:06:11 +0300
Message-ID: <20230807130611.63914-4-avromanov@sberdevices.ru>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230807130611.63914-1-avromanov@sberdevices.ru>
References: <20230807130611.63914-1-avromanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179098 [Aug 07 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVRomanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 526 526 7a6a9b19f6b9b3921b5701490f189af0e0cd5310, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/07 09:29:00 #21554951
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_060640_501303_28FB1491 
X-CRM114-Status: GOOD (  10.19  )
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

Using this node, we can obtain random numbers via
hardware random number generator.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index f24460186d3d..b3a1ecf36467 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -133,6 +133,11 @@ reset: reset-controller@2000 {
 				reg = <0x0 0x2000 0x0 0x98>;
 				#reset-cells = <1>;
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
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
