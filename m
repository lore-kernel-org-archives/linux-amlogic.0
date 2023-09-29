Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335C6E7F153
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Sep 2023 10:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmf/kBw10u4pq2jrV2qCTOr6I+M5QfyuwDP33FY6Zl4=; b=zFPWqQiTjWDr0/
	BiLjlNCECEmRMfwqIf+d8r1Q4DnbIjJjyB3JFDi+/l7RcWJSIA6rRltAvBoHOalc7vdtesM61Ieni
	JH5vGrhNsV/uM5PSs6VyEYuL96w/oU95kpG6mm1UiOnd1P7MOe5qvSlUmx+1IZNcPxkxXAwFhO1GK
	7DIuXPh8CWMsHhay05Cag6uwJfW++ptrZNZ+bndkNxn7KrnuQEZrioCEiexjoHgn/HZqbEC+9u60B
	KZ7i+92qGIlg+MF2dfEk/CSXfNT1GnjbL2fd/SslIiXV+sPHf9IDQu6rHFBwl4LyfuMg7A0qNq+GJ
	dzg/uaHt0ck0tJX0vjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmAqO-007aK7-2V;
	Fri, 29 Sep 2023 10:35:36 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmAqL-007aJY-01;
	Fri, 29 Sep 2023 10:35:35 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BDE3912000F;
	Fri, 29 Sep 2023 13:29:52 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BDE3912000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1695983392;
	bh=FgKxXDgE/uNx01ueWhXfT0y9HcY1omQL2iYWSfBMwSs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=vQv732HclpwMEw6YQWa/0tPyfXhUeDwEEDOBKinaeQgtqupz6RYFPwoVMMrnJKYlN
	 qbfpQFQKr6lS0ZTpNrE8QIiyCJEVe4H7hGpza22h7mzMvRSz0zcJsMhqVnmeOWjljS
	 fUmB4hicra5Uaq3L3N9oNCcDgo5lqTcZzgjNsMb/l4O4Fx0A2KIrav9Df94Jzu399r
	 lZfbYc3K8whx0VfZNgYcTqoWZQfRs5hfQ4QUgYg3dGxw2X+jwxfkcdZ3ah3njWPHeP
	 m5F5w3bXr0asC6eBvY56xLZKfY4SJePta7aDEKz/VIt4spZMbG9OQrEKSXd4yc5rNB
	 gOOFgdr1C4FxA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 29 Sep 2023 13:29:52 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 29 Sep 2023 13:29:52 +0300
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
Subject: [PATCH v5 2/3] dt-bindings: rng: meson: add meson-rng-s4 compatible
Date: Fri, 29 Sep 2023 13:29:37 +0300
Message-ID: <20230929102942.67985-3-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230929102942.67985-1-avromanov@salutedevices.com>
References: <20230929102942.67985-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180231 [Sep 29 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 535 535 da804c0ea8918f802fc60e7a20ba49783d957ba2, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/09/29 07:52:00 #22006267
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_033533_411733_CA35B2AD 
X-CRM114-Status: UNSURE (   9.46  )
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
