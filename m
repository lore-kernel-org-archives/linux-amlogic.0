Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8267606EE97
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3j6vOxJD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xy5bn6ECeQJqbcD4Y8OndQXNpL1nigbUmF0AsIZjwQQ=; b=3j6vOxJDXY6N0dgZa8g6jLe7a3
	lFMY7rCRQYEq8SPuBHsp7Avm+6jEyNeUcbbJy2e/mTty3CIzwE6GsWIySgL5k8+yJr+kKVpwXL3SX
	wQQU6Ud/kw63RYJ8wxBt3pikTsiHd9oiz/LmHtFFbuso/N9IKp6FhDJj3U+judFnssBLRFB4qAoDr
	P60YWYlCtSnMchrasr17LPqiedIAzSdVmP3E98MS8FtxK9siqkXru9YRpQJ2EgXdau3o5AHlr2Kdc
	faVrTQSkxxoLCuU3sZ0Y68ygKQywvY6ZaQILJOzfT2v6ciELadqa1aOzMhd7s9GkxmSduQtsIb2Fd
	MERZrULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJf-00000008OCl-3Qk1;
	Thu, 05 Nov 2026 10:03:31 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJc-00000008O8y-29aN
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:30 +0000
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so4947405e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 02:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873006; x=1794477806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
        b=v5nClE9zg20AB/qQ0g1Tau3k3AqXKTK196GA7qxLWxsZcENC0+zM2HYL9cwmzeyVJS
         VIBkJl+KIgNnODdjd/c9yyQYDX7WfK5Ls7N/9UEDmSFmbWARnFA2MbEYqfumhhKpk+db
         9tqbrK9AUxJ0xs4FHdyePE92l5KqesN/ZtDQVfW/Qi8m+T3Ih2uCVu6y9Pn1caWs7GSQ
         w+c8sLlC17mZPIhyxqSgdROZ6PL2aVlV98NGuxiPT79aB7HHcHeH+dMwqJX6xXTu7EL9
         I/ClX8I7g0OfkNLR6o11vBvh4pn3JcCcGDXtp803fXul0hYlY338YefhCtUB4PgBd4B3
         XflA==
X-Forwarded-Encrypted: i=1; AKwUvBykfyKnXcCWSjq7C70nNrXIznpXd4BVQXND+BeU+2UBXQ1FVVBrO1HU4U4a3y0DKOEPfvzQQ7YfRJoXkNjh@lists.infradead.org
X-Gm-Message-State: APuU4Z/Npn+rnMu+aZzmoLyugBtj4ZsdR/6tVcCEe/9uSDY1MbglxcAp
	jTiMImhT6Be7yTfeEti/dkvmWQwu6xNXuhEddq1GdjiNkP5Sr8+tYyQM
X-Gm-Gg: AYBFou2BAwSptvMyrXZZODsgg9/mJ4rSLAjMhmM1dA6WG7CEv/cfTb6NvVE5qaqJq3C
	PHioIq7wPjBywQ3jiMDLoWlOHr4e3df4NznZpxVhFprP8wSKMaR5B2g+ALLYyA4Z2Ygldt/YCNp
	UX8jFXlNxp9tHg94BRcwOfCoISyzlmaM+krwaRdfg2A0MuiCbrmGdjqrPZZZQxz+BvJD3MxUGIR
	T1nnINCYBEw2fwRtoBRQjKAc5gsqeH67x08G6E3csNv6GHskPBfgNTXBOKj9HGnYfCd5+jWC/3H
	kICDagaJNsWk4NfSM3HjqAi9ASRlwnrboLRWBmXpxg+/Da6HwOKWtuVx6YHZz1LwfGbFpG4r6J9
	3kkAwwQs2VpFvz5JBOVbo+DSidtif5t0yVvkOVJ8AR7NOJce8TCGQApscrZ117d1EUyRfo2GtgZ
	ajeP/KUXYlhsUAxG373OcIgXFcfcqGh53IDb/DgnsprVE74eksicEN1iIoP0APeZJ/v4PXOQ/PB
	Z8KKYdQ4Gttj8FU/mIre8K5HUjkMLuf7AxlPdlNeqrkpTVCMVuTqtzQe8cKRf2YWynGQZ561gtK
	f3OgG61R40ywNNJwrw7uHB7pKzeR6x7TlM1BvPkNhPDxlen/exME4XlmcopWUf/DY3GGKI9nnT6
	VBuwZtnyBzXuLplRb3zjuQWdBCw==
X-Received: by 2002:a05:600c:45d4:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4b55de92333mr36628635e9.14.1793873006268;
        Thu, 05 Nov 2026 02:03:26 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:25 -0800 (PST)
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
Subject: [PATCH v6 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Thu,  5 Nov 2026 10:03:16 +0000
Message-ID: <20261105100322.37816-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020328_968300_AFB7FFD5 
X-CRM114-Status: GOOD (  10.38  )
X-Spam-Score: -0.8 (/)
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

Assisted-by: LLM
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
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
