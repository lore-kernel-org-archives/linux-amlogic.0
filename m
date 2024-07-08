Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C903EC3DA41
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 19:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsRt+1fDD6qLTRqV7jJ3R+IxEObNdsRL++5kl5otYOY=; b=WIUZIt8fP1MFuD
	vQx5J+ASd9hWMvwpeM2X56KNNwbACnO6IFonXpnK0gmUdu0a1grGXN66gEEy4VqHySd+BVkL2tc8u
	eLn+y3tsY8UCmgXL3tthbOCIWeJSyR4TnuTUQ1RItfO10IxoY21E7PtuBjmAIcPoCmzVOiYW4pC9J
	MteIROImTLaflvyXAef9PKxq1wgyqQN7mjhihNGlOkVC5+j6AGSyH/hwjqe5T9cAev9XayYGQ2AYM
	F/v/WoCp5EULenc0ReH7xjDHRTThJbi2jROlPR9ue5yejpFtw9fMi3hvA6mR0xrVWRofZVe3eFQGK
	bdah1g1XWmVAMoh8xy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQuLz-00000004sYZ-2QhX;
	Mon, 08 Jul 2024 19:48:51 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQuLU-00000004sNf-2NJr;
	Mon, 08 Jul 2024 19:48:24 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 573F3100008;
	Mon,  8 Jul 2024 22:48:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 573F3100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720468096;
	bh=4pw3BIb7UkYmI26H52edi0SuBLQRphrtybtYpFnSD/I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=CQjlXO7nvTTKO2ZWZdTc0wDSsPXzv8AAv4RgHv5hfoEyWr2gQVvwsgLjpIMcnd/zO
	 NhrEUrZ1IBqTPA333iIjp1UCt1UBhzicESCV0x821YeWnlhx6b6wdZJ+3aw3CK129c
	 9B0xZCjP1pK7pEMqnHEwNH2/yJjaTeBGqLAHXS6BSCDJAPuOSw50TYdIClfUklaTVU
	 cNoN02KvrnlLxvsmAIVqxnhtoPGksKnkQGMdlpfq+jmuayoVqAjsECSVONgoUCkyqB
	 u8sLFOrZRNzG6JikG4M0sgIpJxpeWC14gshOhIuTRT/Kn/zd325Loik7geSZorh+6B
	 gYT5ou/cx280g==
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
Subject: [PATCH 1/4] dt-bindings: spi: amlogic,a1-spifc: make power-domains required
Date: Mon, 8 Jul 2024 22:48:05 +0300
Message-ID: <20240708194808.1819185-2-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 23 0.3.23 8881c50ebb08f9085352475be251cf18bb0fcfdd, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/08 19:07:00 #25919740
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_124821_280048_7FB441DA 
X-CRM114-Status: GOOD (  10.89  )
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

SPI Flash Controller has dedicated power domain so make the
corresponding property required.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml
index 043879b434ac..e704aff8a862 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml
@@ -30,15 +30,19 @@ required:
   - compatible
   - reg
   - clocks
+  - power-domains
 
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/power/meson-a1-power.h>
+
     spi@fd000400 {
         compatible = "amlogic,a1-spifc";
         reg = <0xfd000400 0x290>;
         clocks = <&clkc_clkid_spifc>;
         #address-cells = <1>;
         #size-cells = <0>;
+        power-domains = <&pwrc PWRC_SPIFC_ID>;
     };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
