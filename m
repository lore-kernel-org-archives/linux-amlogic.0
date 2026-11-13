Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E412760A5BE8
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Go/Qziwi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=p5dZPtzZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dW9vVA9a3rQs0TeqmIm/mbeSLAqIyRcwFE/5SCEQMzU=; b=Go/QziwiaYGo+Uh790KaBxa/Il
	ZjKfPz4ATGaNFnzdW2TQinWxmIoPezPCI41Puakv+5FNFa5UMh8InFrP8DeNWnj0RBCbymeEn+kPl
	CuBdHeP47gxxx+DmGp3Kxn5lG6szym66NVJfhUgnpbvR6xZ2/mk7H9erW+tnllkvjKlSlyZ8Btyca
	mhMYkBNtFzAcT1T86BAWWCUU5ji8fPKWbl4w3MIxCvXT774ujYfIYj8rX4jviFU34GXyGjEVdWyNA
	VvZ4YHkHi7MP1zW0iVa3L2ju/IRg7j16DdwEMJK6lFKsO17ExMUYR74JMNNMul90MkeJlSfoLLejR
	dKhBl0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFD-0000000Ch9b-0s4m;
	Fri, 13 Nov 2026 12:19:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFC-0000000Ch8s-0nlc
	for linux-amlogic@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=erPMA1s3GrrjDIAYXKeMxd8td7q74oejXK0RvW/RZfA=; b=p5dZPtzZu+phCRqjJJV00Heqet
	wg76SoenA0ib276rFg4GGNpXT0/0tqcjMJdPdZ7MQADqvL53c35WWivSIu/qSlO4XPxteSVIe3Os9
	PYCH8laYwQ3e3QF07nfhQ4f2Y4vvdfhGPTNi3U5U8diAL5Poe0+pa/HL/FMjr3gvge1ZHQtGvSonS
	Bj93b2buOOVKyaOm4y8REZm4jVzTb/vqSaMu9n0pBCuo8n9Kio9N5efrwmlpcKmrpkk95KIm8xdsW
	Km2h3Tt1QW03iMUDSMSOobDx+uL4PxY/WyCsLUVZ7g0G1/HixFQvDZ+lv6LVtS/NeHzTcIsmjxEBk
	x+DLkjfA==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqF6-0000000BEI2-341W
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so157948666b.2
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 04:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572335; x=1795177135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erPMA1s3GrrjDIAYXKeMxd8td7q74oejXK0RvW/RZfA=;
        b=CCXNiaNMGe062DuolTSg1uJ8Go+hvxNudJbOcOHEhD5HXhm0izKBO8jgdXUlAiX3bh
         VShJVAQNk76Dn5hRVX+7l2pK3jiJMtamTZ3CTfdKMmpUfYhymLQNoJ4CyiArcphXuA1o
         DHcFgN0FlAMMUK0CdHHnyl9H4H19aPNJVU063dPcTr3rWQEUcznri69WOqpatg36TeDI
         j9o8IeMSTTaJTcWzyhyR8jPBYZe0JGGvRE1hpbq1Ne62FIYN5kGeeRswoo2ao5toL0wP
         xy1g6CVVUoEThbS0be6gkxgKrEWzilJH3Xi1QSzk3Gm0XxhuSafdqbK/wEP2GhNltm3I
         iCGA==
X-Forwarded-Encrypted: i=1; AL+hErH9KuZ65F77gopK6LAUj8mpIKuol6R/X1KOA7NV1vQ1LOkfC1egwNypJ4xDwjlOQl4YQaomsQbMgO0aEL6Z@lists.infradead.org
X-Gm-Message-State: APuU4Z9zGM7VTOHkb7YgQtTRtkjFDienfnTSKersL9ETTifI7Fd5S1PQ
	Vw7Iw/ctFegjh4eeKiiV/v/i3mCPC7M79l9k/xmVbmzhcFWAEd4OxvjL
X-Gm-Gg: AYBFou2LvTF4qgm0su6sVjDV7QsUEWG+qv3p+sRnqVsCL1P9yDxl0vRt2SKqz6jZkSo
	+ZbHDsFu71Elc4yWGivD74dI+bjGS9bhXwZvI6hEm8/StC0JL6JhCP+M4pkc6srRV6NSRmbTTl7
	oZHfucLxD0PiQ5g7AR00n1Wi7u44GBQHrIlhNPZQ+0guIOU2h1gSKxv2QLcmy9yztnrUMKX4P9P
	1DsC+7pEYVbBjJ+M4FG48tAEY0Ffbzx7OwPawAtiAncQq3XPrSoQ4fWvY0u8QRiht3x75VVZjXf
	90gcRFk2X2BZGC9xB7zH0TTmAmzycBjRzERPnwWFyPrTdWSc9JQk/nv8w34om210jyeB3qCoZ25
	pk8iLRhoCn9Rku6chqNl4s+3ZPT2TNftlYApKJvms+i1TBHFTi80Bmbhnh+izMlagMLl89liRSq
	sYvXUWgjVNiiEQZTqRjRiym5BgbWKbNcGh1M5fyJJEvF3z1gPR2OytRg0nMG/uj7IlU0GN0SCLz
	mP7WOMlIn+PlAGZoyEMXkokdoxiiaMbQm0GbcBKZuUPcl+nrI3ynTwFfDrb00KdeQdMH7v/mURy
	+I7kjbbWM86feNk20IHtSQ9ifzWwEY4xb3tEDRKW7nDuZQg0udHpA9CHOU8ceTbpTqF6GJbIaQ6
	5w9q1pjllrCspT45Yj6Zngag7Ee2+hgGXT6zWtnEf9grhfA==
X-Received: by 2002:a17:907:72cf:b0:c41:e75e:5889 with SMTP id a640c23a62f3a-c5096398b58mr185619766b.33.1794572334460;
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Fri, 13 Nov 2026 12:18:46 +0000
Message-ID: <20261113121852.334604-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121856_730240_D39E81D2 
X-CRM114-Status: GOOD (  10.90  )
X-Spam-Score: 1.1 (+)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees use: Meson6 falls back to
"snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
reports a 3.70a core too, so it joins that list; its dtsi gets the
missing entry in a separate patch. The example used a two-entry form no
device tree has, so give it the Meson GXBB combination.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 9c9cc3ef384d..e769c9bb70d8 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,19 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - const: amlogic,meson6-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -175,7 +174,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
