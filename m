Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4762EB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jul 2023 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=miYOEGUyBf4yBCryi2nbVMf1JWHVakIJ4dwKzlCUkIY=; b=jfZwEJAS8I5STc
	AyeMuyMgpNwjvRKPSjif38Ud5BmgJMhDVzEIMKiFoGDYAEw75JVeRRfwfPKOd6eTOd22Etsu5kK+s
	wNekXu9pdXykluUuezwYmu4O0M+7+vr8J+bmE3jrA4ZggBn4FAXEfIxdBh/iQegE/CtdFGFdRJh0m
	e96y9l/oEX8bezzC3r6gg3nYet4IY3BVFhDDAJ6VktZy+MAnciPPMnxyvjIcWBfus4+i1lf4rPcV6
	wSbds5TlDM6VZg/eSmB/bnCqX9orCE2cmaAw8XnMQZn35kXnrWfOPs89tD1lkbXPjrJNSN0M0OW4o
	Nvsou1VpEAcX1TK18R3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCSb-00ErgN-2D;
	Tue, 11 Jul 2023 12:27:17 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCSX-00Erec-1K;
	Tue, 11 Jul 2023 12:27:15 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6BAF7120012;
	Tue, 11 Jul 2023 15:27:09 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6BAF7120012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689078429;
	bh=MXjyu/391wbwe98qBtmauEqpw539WVygM8Im2jyQAFY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=PV6G7B6EvAIEdvL0zvmAcejjntBRWz4BJUrROajCzljBU+HvAzhFDsayR/A8YYFr0
	 HTkBh8HAuMJpK0ENttIfUUf9vrLNBltSQuE+LVncn1yb0AC2xSjbwv1GXfn1Ej8Gp5
	 NqYopp2hkHPJqZkTU5tTO0zFz8FWzG9XiGL86H7DPMmFyv8SMZUhclMn2ptN23rmGE
	 zOI7MRHxwZWoHoLqy8O+dToqSwVE4KX5DnlBnXpdZ/XHfy4d30xYLns9pLez147A1u
	 teNVUFG82lpfTQgS02835bekr85NMtjk2taMPsZ3uLC9os6b9Nh/5jksKgKRfHNfy3
	 3tMT4qdz1NZGA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 11 Jul 2023 15:27:09 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 11 Jul 2023 15:27:00 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v3 2/3] dt-bindings: nand: meson: make ECC properties dependent
Date: Tue, 11 Jul 2023 15:21:28 +0300
Message-ID: <20230711122129.2635558-3-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
References: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178543 [Jul 11 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 521 521 0c3391dd6036774f2e1052158c81e48587b96e95, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/11 10:54:00 #21597245
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_052714_093609_01DAA1D8 
X-CRM114-Status: GOOD (  11.61  )
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

ECC properties 'nand-ecc-strength' and 'nand-ecc-step-size' depends on
each other, so they must be both either set or not set. In first case
ECC core will try to use these values if possible (by checking ECC caps
provided by driver), in second case ECC core will select most optimal
values for both properties.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index e81757c9e0ed..4f6e56542a7e 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -58,6 +58,10 @@ patternProperties:
             meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
             meson-axg-nfc 8
 
+    dependencies:
+      nand-ecc-strength: ['nand-ecc-step-size']
+      nand-ecc-step-size: ['nand-ecc-strength']
+
 required:
   - compatible
   - reg
-- 
2.35.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
