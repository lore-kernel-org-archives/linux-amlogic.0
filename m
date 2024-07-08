Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8A2C3271E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 19:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZPtdTPpJz8W+1i2B4UjedhwBtlXxdMcYJixz7QDrNI=; b=tJPMpwNk5UNUfL
	B6rVi3xzVzhZCWj8Id0Wfj8I/rNUnra40jPQ2/r/P/44XkP2fJQ+jzBtDirSoMaV1P4jKe8Gsa3Vu
	tca73pdSM6cm8LqvLJPy39cSAR404EckM0Ci+udM1KSTzJ/MNyZjQBCyIDehYulcptSasGLh4Suib
	thIhUNwqr6Cf9LP2c6Zp9XZfXCwdUR3auScszYaRhblvgAJ/tRP8ZD9+shjvqScP1GwcjjKqOTn16
	a8DdawuiXBoR0t72fxwzE7lwvSdss40qhu/z5j1XSUOKfz8DVoYgTqyidmzY8W3B1jiyLGH3y//fU
	hpB6JSRvP7u12x+udaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQuMR-00000004soO-1P2n;
	Mon, 08 Jul 2024 19:49:19 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQuLU-00000004sNV-2DNE;
	Mon, 08 Jul 2024 19:48:24 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8D5F1120008;
	Mon,  8 Jul 2024 22:48:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8D5F1120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720468096;
	bh=eYYjDzOe3nYpG5HmNbnsVn4oH2wx26XOb/Mak2E95m8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ZMHqgFrA5GFPtPF/Td8d7r4FodzDXFsxN/3QvscNO7gMtyX8yPtUgx8oDUKiO5fie
	 fppAx22Hz+DvFpUpf/fOIk6L6tAYDWfwrfyX8bgAUbhJPtkJZqpCb0XJhD6/QszYd3
	 28VCriXjRC71aIAYru6PZLJX1xPOyxLDN6vsZU1NYSgJWH4joAbUiNWw7365WNmNm2
	 MOR/LUtBEacaD4cxaabeXUefySbHUxEnvJWbdduc1o9Y1/GLDCKxFBdIa3LkJnQDkM
	 tynldDGnemxss5+jx6Dbd75Lb0408J53ceG1a8FCahmMNcgA8JwOuC01g0MQbg05+f
	 HnSmnsPKGiTqg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Jul 2024 22:48:16 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Jul 2024 22:48:15 +0300
From: George Stark <gnstark@salutedevices.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>,
	<broonie@kernel.org>, <glaroque@baylibre.com>, <rafael@kernel.org>,
	<daniel.lezcano@linaro.org>, <rui.zhang@intel.com>, <lukasz.luba@arm.com>,
	<b.galvani@gmail.com>, <mmkurbanov@sberdevices.ru>
CC: <linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH 2/4] dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
Date: Mon, 8 Jul 2024 22:48:06 +0300
Message-ID: <20240708194808.1819185-3-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240708194808.1819185-1-gnstark@salutedevices.com>
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186376 [Jul 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 23 0.3.23 8881c50ebb08f9085352475be251cf18bb0fcfdd, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/08 16:01:00 #25918429
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_124821_277201_898F2878 
X-CRM114-Status: GOOD (  10.68  )
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

On newer SoCs, the I2C hardware can require a power domain to operate.
Since the same compatible is used for older and newer SoCs make
power-domains property optional.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
index 26bed558c6b8..c4cc8af18280 100644
--- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
@@ -30,6 +30,9 @@ properties:
   clocks:
     minItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
