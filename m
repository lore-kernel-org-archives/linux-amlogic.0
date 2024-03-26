Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DFAC54E67
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2024 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBjn1elocfJmi09lOiAlmHZy1RhaaeOnSzNg4yqpVK4=; b=Qx8BlsB/0P4/dh
	0GObxMdgLQPxGy1Utm0MfTKYaIoGvRacDj3BRL2mCHHT39Lv1ZH4pnZQq/LhATMkDHellnaLpbaPV
	4VtnrYQ+1/+hhz5LBpcPLNu6G5eZk5eaKWhoUErhZLmrmQKxqGkSKOEbe56SBuJrpRIIkdOybcJPF
	Z4uui9Tctdv+SsulqvtuxA0CE8P2cVgvWKAQb/7IKqOayo4+aTMY5Ux3789BaPHX7amV/pjfWH40o
	lN1JQ8O2owRMrZi+KxfNszTqQjWcacgCcwRjcMPVJwF/aEsOJUS9ATPgHh8TajrlcAZDTdkI+rUr+
	RFVtZA7GKMWK1936wMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8qw-00000005DRV-33Dw;
	Tue, 26 Mar 2024 15:36:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8nM-00000005BUT-49Qq;
	Tue, 26 Mar 2024 15:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OLA6Lkhoz7gCcP8JoJQDn0rr0DM3isWhU/EFIlQtI1w=; b=Gama1MIbbkBy7A+hEZgW3z8yNO
	0o7wZiim4ypMA51S4LvKc/iWElwLuMOww0SeKV+OS6tNbytB3djYzufWW4lLtxjr+5xQpOAcIA3+5
	fWq27ZBgaQi9FKCNH9kuknwVGA1QNM+8c/u+qTl6UEdATNRwZ9FBheJ42zgah6Ib5bU8hFJFnhGtp
	PeuEMSfUmD1uwOqh+iye5tQAAayVmGfcJHFL7wdHCehOcfGo97gtUEMq3yRL15fMj08v3cYl/HVnI
	caCk0yinnuq7EIrtTxxDPveJQwPAlJsRBhG3w+a8U9MCplDeUVMCe8ZjhwUExry3S5BSsfS0wn/kg
	B7MnfqIg==;
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8nJ-0000000HGaO-3IHd;
	Tue, 26 Mar 2024 15:32:59 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 42D7810000F;
	Tue, 26 Mar 2024 18:32:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 42D7810000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711467176;
	bh=OLA6Lkhoz7gCcP8JoJQDn0rr0DM3isWhU/EFIlQtI1w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=YlI+IlpoksGMCKK640hnbRDfWMVpoe8JdCE8+SHcJ44ffZcbEfvb/DAv/nV1Yof7u
	 1y/IRoWLWKwE/oISPfu5sLXow8cm8bsopFyDakdpg7DHKxz+PneceLMniySuthKJLz
	 K0kDoY+kdKXpiOMngoS5hanq09etrZOJ8Rka4ZowKLd+rrShwhUaHnPjcCucWt6ego
	 XYVL9/Vm/f4ftBq7CdhKAX6m9UdjBtp0esAslTBv/Gcy3VvvUef0vbfdNFkOiM6pBT
	 /9AYHp/8WT06r50KJ7ExrBZn0id1gsv+WeZNv+mubli9ld6y9K4y0KG/edbFvFehbY
	 MddmG3eB3V9ng==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 26 Mar 2024 18:32:56 +0300 (MSK)
Received: from user-A520M-DS3H.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 26 Mar 2024 18:32:54 +0300
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
Subject: [PATCH v6 17/23] dt-bindings: crypto: meson: remove clk and second interrupt line for GXL
Date: Tue, 26 Mar 2024 18:32:13 +0300
Message-ID: <20240326153219.2915080-18-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326153219.2915080-1-avromanov@salutedevices.com>
References: <20240326153219.2915080-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184425 [Mar 26 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 12 0.3.12 d1a01b14eb3fc102c904d35fe6c2622ed2d1c16e, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/26 13:11:00 #24452135
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_153258_025627_018AA850 
X-CRM114-Status: GOOD (  10.73  )
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

GXL crypto IP uses DMA engine, which doesn't require clk input
and second interrupt line.

Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
---
 .../bindings/crypto/amlogic,gxl-crypto.yaml         | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
index 948e11ebe4ee..d3af7b4d5f39 100644
--- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
@@ -20,20 +20,11 @@ properties:
   interrupts:
     items:
       - description: Interrupt for flow 0
-      - description: Interrupt for flow 1
-
-  clocks:
-    maxItems: 1
-
-  clock-names:
-    const: blkmv
 
 required:
   - compatible
   - reg
   - interrupts
-  - clocks
-  - clock-names
 
 additionalProperties: false
 
@@ -46,7 +37,5 @@ examples:
     crypto: crypto-engine@c883e000 {
         compatible = "amlogic,gxl-crypto";
         reg = <0xc883e000 0x36>;
-        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-        clocks = <&clkc CLKID_BLKMV>;
-        clock-names = "blkmv";
+        interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
     };
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
