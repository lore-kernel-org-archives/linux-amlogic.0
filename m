Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF470EEB581
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmf/kBw10u4pq2jrV2qCTOr6I+M5QfyuwDP33FY6Zl4=; b=Opp0qXIzDZ5t9C
	bizvLYIhDYYVQMLGRaEcsW9tP+BhNMe/Kp9QfGvzjw1/XqdvrDC9A7uDqVjzXB5iGVwcRfQNvvT35
	fJBFaeIGLWanU9IxzNnbWd0VHA7VJw/bebfmxcEwg3az1Lp3UlUPLe1ae0ksTegKrEcdidwF0FQDb
	JceDFHBU6FtMOHYCKGjr3DIW4ydZzWwZFuzm+t/QCuQg9C9eFKiyNyT/qWRAM3U36hK8X5A3lPaoF
	tf8qPx2dNX+rENwDc8d2iAvDkSbaJExJITp90Fc3RTqNox3Ww7WxbpfnqR3YRy4hrULNkK98rsOuA
	XNbwMZR0zhTpfDmCeWcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdtW-0006Tp-27;
	Mon, 11 Sep 2023 10:11:50 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdtT-0006Ri-0I;
	Mon, 11 Sep 2023 10:11:49 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 89432100011;
	Mon, 11 Sep 2023 13:11:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 89432100011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1694427102;
	bh=FgKxXDgE/uNx01ueWhXfT0y9HcY1omQL2iYWSfBMwSs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=PMuEZYZ/R9REqqord3g0R8+qNfikzRB8HMWU2D717WSdTmHvfUwKgx3czLu+EUN/e
	 SJcYTpsEvHVh6y07ZkKtiH8lyoNvqj38uDFhdOzK8mx/1PWQrkRAu7xSRULatCYstX
	 suVMbdEvexjFVgHwo4JMtLqmvYscypMZVcvBgrwX86hTcNlgbRhnLvYYBlVx8GF/X3
	 zFadnR4sOfFGVikC84soGSq567yAuXrNGXd/Kn1qjNW93EnHxdBngIyq0yqYIxqoO7
	 URYDETIL7+MtGrFdx0DGmq77+RZ789h+JoXShr55qzT3RVmOmjJCxcZ7KV7bo9DxIc
	 BXptNue08+zDg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 11 Sep 2023 13:11:42 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 11 Sep 2023 13:11:41 +0300
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
	<kernel@sberdevices.ru>, Alexey Romanov <avromanov@sberdevices.ru>, Conor
 Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/3] dt-bindings: rng: meson: add meson-rng-s4 compatible
Date: Mon, 11 Sep 2023 13:11:28 +0300
Message-ID: <20230911101129.10604-3-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230911101129.10604-1-avromanov@salutedevices.com>
References: <20230911101129.10604-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179765 [Sep 11 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 530 530 ecb1547b3f72d1df4c71c0b60e67ba6b4aea5432, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/09/11 06:02:00 #21866861
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_031147_803554_638B95CC 
X-CRM114-Status: UNSURE (   9.82  )
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

Add compatible for hardware number generator node for
Amlogic S4-series.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
index 457a6e43d810..afa52af442a7 100644
--- a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - amlogic,meson-rng
+      - amlogic,meson-s4-rng
 
   reg:
     maxItems: 1
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
