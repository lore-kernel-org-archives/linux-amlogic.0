Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC878C3DA41
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 22:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7eoizvznab25Q4n/21CaXo6UGov1HS1cgSl974gSvc=; b=Lpf7ZhnMOdx3C4
	7n4J/ed5Vg/n3T1Ye4167ARLr2ZvkkpQWTpgtDCTfOARaknlPz3eMK0oDcsnXQ6dHmaJ1DL/Jp6cX
	kfVGQgeJk9RdjN/WUSlg0omUsyFmxxTZqTxqpHJ0NFTY2cJQ+y89GTmGAHqms1g3jbaS0GTX/zuRT
	MR9bKSTjxvu7K+UyK8zB65zCIC4HDfgEGtM0CKgm1DgNhpLV7Qr3VgVE33WZ7k0FyCMl27c5hHkxK
	2TMriuZZjFeOpWXKTLB0ZmWO72UKJgUuXWon1BPjmVTz/popOlOA5rXaDQj6cCCTbPVg32TS2+YnA
	HafLReCmgZJpG9TXSpog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfsC-0000000BxEd-1Cij;
	Wed, 10 Jul 2024 22:33:16 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfrO-0000000Bwuo-3pQi;
	Wed, 10 Jul 2024 22:32:31 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 918F912000C;
	Thu, 11 Jul 2024 01:32:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 918F912000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720650742;
	bh=EZPnynPyf1zfhY1MLF9NL+wcInfJ/C1ansM7QDzzuyI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=UyHX3DyAswn2Mqcywl07RPt684WapKbCtU9oTs7mGkRKMcDBmAbsz/J3JrYsIb57x
	 eu9OSJAZhdQBnL2IyVGSP31Jt3AbAj3hoU/jsbnGSeTjb+rqnZGxPo/yvUatr0Mj0n
	 RLR+Cx+2sJ1sqjsZ6D5ftvug4yJvkD6mt/+3V6O4Aq+oPfaa139cnXQ/DfvqgpGT77
	 wG+k5SAJpBdfXA1RIcrNR/42TTyr+W0s8Hs+mrrxPQzdcT0knChxrirmLRsZhM3Vru
	 auu9a/fN1QTBaJKi5FeaEnF9shHguViu5rGwiO/znZzv2x3TZkFkK9ZdqTfGlozbJC
	 5tC9QoIOLN5og==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 11 Jul 2024 01:32:22 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jul 2024 01:32:22 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<glaroque@baylibre.com>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
	<rui.zhang@intel.com>, <lukasz.luba@arm.com>, <b.galvani@gmail.com>,
	<mmkurbanov@sberdevices.ru>
CC: <linux-i2c@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v2 2/3] dt-bindings: thermal: amlogic,thermal: add optional power-domains
Date: Thu, 11 Jul 2024 01:32:13 +0300
Message-ID: <20240710223214.2348418-3-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240710223214.2348418-1-gnstark@salutedevices.com>
References: <20240710223214.2348418-1-gnstark@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186446 [Jul 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/10 21:42:00 #25942395
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_153227_653654_053A5C5E 
X-CRM114-Status: GOOD (  10.13  )
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

On newer SoCs, the thermal hardware can require a power domain to
operate so add corresponding optional property.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 01fccdfc4178..462bd7237bb7 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -30,6 +30,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   amlogic,ao-secure:
     description: phandle to the ao-secure syscon
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
