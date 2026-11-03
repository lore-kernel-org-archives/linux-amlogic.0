Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2830F6082BC8
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SbGq2GPr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xy5bn6ECeQJqbcD4Y8OndQXNpL1nigbUmF0AsIZjwQQ=; b=SbGq2GPrt2fsz7XoGBWdxsRnnu
	wsbwQNUVohHsTWiWvpkMHSkEH+DknWH46XEsH9UqeDKnOqdbcH5x0E7OQceLELmnQe4T1hAeoP2H6
	pTZcWsoa0isq99Z8fUUTo7UsGDsBlk9QG3JfTtR5pivw8oaPmw4cKodTdZDoGxLGaVpqZX595iZNR
	z47JeuBzM7bYmRy0AWtsh5fwvycATfVqoCLUWPwTm4Iy7NDiBpL0sjrEUMCEoyF7Z4+tHb32tDHv+
	pLS44TNQ1h1pDmTLEUkWOOabBusQX09TQCl4ZvIIw82kbamGlbmP+8v3G4EBLgLTDTVNEDmSqqoYS
	RjTlaRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVk-000000039Wy-2j8Q;
	Tue, 03 Nov 2026 16:37:24 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVg-000000039Re-20q6
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:21 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so618511f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723838; x=1794328638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
        b=MiIJl/N2K1qYxIQzV4e7qbdy0dpelGGpkzhM+9JLuZNYVYi5VH13TQcw1/ZL7m5UsB
         xkxZXmIs4XqsnwjsEGhGdLHTM/eiCM0JCXaU4P+RJbStEF7HNxQdzuufrwAlONNKJ3LE
         tBqqNIGBr04yVl/XYkaAToB/o5W9A3FKUiTXJ/YyW//HEQMCujPKJiFzm1Bht5g7O5EM
         oVtlV1lLcex1FO+UbtyaPy7HYvoi4ZBldDpA68dezxQ2O2ZiKPmIO0RiO+bJMHXtzZZ4
         y5MUSZpLoegCQvyiRX6r6Kk+iDxX4TaTE3x/AJOpGQLo5WWb+aKpXZEpDsmB9zRJcWGM
         DNhA==
X-Forwarded-Encrypted: i=1; AKwUvByzrWSAdXlvs9swmBSNtwFj3ckYcYwksLNmoqBfrvlDkDgq+2TPG2G963XO9MwiUORMIYbuwmk15IGItX5O@lists.infradead.org
X-Gm-Message-State: APuU4Z96mhQyh3/jRlGDuGU4PL+2aCXNFAtLPH0QIhqYDJaTKjoL9bpM
	YuyNY8r1EdQ9K8tLmz8tFU9W4s103Vvb+X52POr63+QLMVlD4D5KfXD+
X-Gm-Gg: AYBFou3mlW5QWpWXSp/1IMDCQButRCy/ICa84bQLOMoxq5PQImAstBCftx/Ln0C4ilZ
	31Oz95knbrOcwXi5zi7IX7oop7rXa5L5DrXw536LeiIWifT0D7NgJNKQPtAWtNpQw8fHQvfbDgU
	ikbzUt1zyWMKoLCxTqLMa1CJtzxnJiG4tKvT9Iwi9ap0sQOfQnwROGoNOj3/jbR82cSHFMh9dxO
	2Uc/GfhWJYH7QLUo2IlCPkYPf4BG3gLQp/nnppEUrFEWl+ULw4jlWp2U8Hsd26jpuRMP2bn4ypm
	9jzUnh7h57lkRJHuxv7FWS0Vc6R9LQfx8qJl5OT7hwF/4vprpk9X7+m/sD0/q5O3IngRZNmeRmv
	98sV+DMGmA+7PZvHT5RdSEn3IUIMMKhlVUTNgFMRWpooUNNGXgV/ef2+I1t4Q2zdv+miFNdTcD2
	kohQGUK52iR01ZTikHQmPa4qJ8hoLMhJS0L8AWEb4YsB5v+8Lw6/pZZMYZwQp9xdOXKUtNVomy9
	J/FplRt7G7AJQAJvyp6i3DClXFyqiaDW8PeXB8Q4ctej/7SXbZriNzROVKNoxx37BuPJ3i0fGJt
	n/WaQSRVfxuj/NToySLOPY5xbGc1bBD0hfpclC1H1t359eVeX5JKCGYadnGmdwQbu2/CFkd0ZyD
	V2beePqOsWUwuKmEgQc6aOT+CgsnEgOQ3EYszO+c+HAL9kpU=
X-Received: by 2002:a5d:59c3:0:b0:48e:76ab:78f3 with SMTP id ffacd0b85a97d-48e76ab7f04mr25543431f8f.15.1793723838237;
        Tue, 03 Nov 2026 08:37:18 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:17 -0800 (PST)
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
Subject: [PATCH v5 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Tue,  3 Nov 2026 16:37:09 +0000
Message-ID: <20261103163715.385394-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083720_543931_62BB5C79 
X-CRM114-Status: GOOD (  10.36  )
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
