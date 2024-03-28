Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FE2CD1284
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7CTriM0LSw6plbdDuWWPumRIQXFUsZdTnvW5kZZdQU=; b=SKp/J3lKfMZvKJ
	GYnNr4evM5qND2fw1IGMVL6GLeYLkveIE7mq+pNzAW/NoEsDOyFTuzC/widePRHOy0sFnettlyj1j
	pSn88A003IBR+uVCyGZjR+ZexNYFsSbW9PcFt0KXKJaeZKU2NJOkCLHKIzCbSGY8aJdsajzMLDTCk
	X5ap9+Djx4ZM+2qrWoTLPu+JW2CO5/0Wf3loFIf0v+Li/PjXODyp3ftCfHKr438Rmoqhb1xI2en01
	urRSXsYvu1ff6vixU7ldilEzGeys+xDrkZ/rDca+Y846PE1BLZTrKtvDRTLjC+30lTrsI612E2C/H
	Q43W5E3jqPnnSZgUhjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppxa-0000000E8P2-4A3t;
	Thu, 28 Mar 2024 13:38:26 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppxX-0000000E8Lc-2A6x;
	Thu, 28 Mar 2024 13:38:26 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id AD74F120002;
	Thu, 28 Mar 2024 16:38:10 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru AD74F120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711633090;
	bh=4qRZdUHB9Ov6yM433hxyPD/kVZr4M3hR3znxgjgkKUw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=BYfL54vRw+9C2l7mhlWB3W7j7xPz8+n23YBx9J3HyQO3VAhikJHCjwqqWzXZxRlvO
	 J2Ddj9ONfxY0/VePV6sUhBurxrReLL/P4fCvxgIJ7526OKRLXCz1S05rUiQiq2BbBs
	 huAP4rr8YB5/DSKYQUU1k3eKfLEnLRwU82dLsFWUvI5GpXK3GUWLJd+pIKCF1xgbF3
	 cqNUIfosqTu5BdLkVpBCJtABONxaTB+SWl03MAvi2i8pbQGWV78S9ptqpxLX6HhaM8
	 pZaBUQ4qkTAudK+RFEFIt+QxqlJiSbo37L25WUKOHjZIFgPivn3gdy1430YH8bSpbQ
	 xnniZrTai/kXg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 16:38:10 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 16:38:10 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <glaroque@baylibre.com>,
	<rafael@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
	<lukasz.luba@arm.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v1 1/2] dt-bindings: thermal: amlogic: add support for A1 thermal sensor
Date: Thu, 28 Mar 2024 16:37:52 +0300
Message-ID: <20240328133802.15651-2-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328133802.15651-1-ddrokosov@salutedevices.com>
References: <20240328133802.15651-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184470 [Mar 28 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/28 10:33:00 #24492761
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_063824_110445_C8F7D86F 
X-CRM114-Status: GOOD (  10.82  )
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

Provide right compatible properties for Amlogic A1 Thermal Sensor
controller. A1 family supports only one thermal node - CPU thermal
sensor.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 .../bindings/thermal/amlogic,thermal.yaml          | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 20f8f9b3b971..0e7f6568d385 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -13,11 +13,15 @@ description: Binding for Amlogic Thermal
 
 properties:
   compatible:
-    items:
-      - enum:
-          - amlogic,g12a-cpu-thermal
-          - amlogic,g12a-ddr-thermal
-      - const: amlogic,g12a-thermal
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,g12a-cpu-thermal
+              - amlogic,g12a-ddr-thermal
+          - const: amlogic,g12a-thermal
+      - items:
+          - const: amlogic,a1-cpu-thermal
+          - const: amlogic,a1-thermal
 
   reg:
     maxItems: 1
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
