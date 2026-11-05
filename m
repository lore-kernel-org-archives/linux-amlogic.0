Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB19C606EE98
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YIz/frk1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lXZ7tXCXLvvBLH9NGCQrkOhSM9xItUcmH8ZFNehZrvc=; b=YIz/frk1cL6RWSRIYH+q2nItb7
	O6qpVZJqcUQYalDa0TYxLfvCvgDtf4G181g+TCh/5BGUJewf1bi1ALr/qdNDYeFqzAx2Yxyp07aOO
	pkJXQWGn02lyacm00SOgnI4sW2YKtq4S6vKeuF8zYovxb4kPOx2cDu+qP2508N2pOt/rLTDiZgH4P
	slSY52aI9YWUCIrSGI0xCQ9LParfktBZdQddnxkvmdDJKSnBtCs5MtWhplmOslLvCAXR5oKFHF7D0
	RXHk78uKRPfgjf0CH8X7fN5qNmJPtQIuVmXDNgO+QHK7Xen3dD3lTaRMM+T0ylrb4Daue/2xuIw0c
	12Q7wyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJh-00000008OEf-1Em2;
	Thu, 05 Nov 2026 10:03:33 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJd-00000008O9d-3I55
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:31 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so10794665e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 02:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873008; x=1794477808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=riOJeDHnKOl8qZ1I9NldksXV+t7kX6cUU4xrN1nR2eM=;
        b=UXXFwO+nVw14HNiPhGewVqdyg4gFE0Khhfp6LSzWfmsdo8vIKKtdP9tCv2c45fmmTA
         vuMDO6U+fR6Ie8s7uUdiBwRkd9w0No+E15sDClVHlLhR/WN7IfHkgUDUq8K6ukDO337J
         P3fT9nFEWjV127jnLJI9AOALC9J2zoie3XclA8dkWHHUr/Q1imuJSW4pUshBRyldRMg2
         ggdywujsbjzaDeIGqV1wADkju3teoiYC1euxnmtyMOgAKsK6OH+GDJPDmaQNx+cqdkBs
         W1IZQ8/KxLeCTtGY/D2rQcaoQOq1L0Yb5PZUXupCwksQVUasiejbNo0ors4kbc3wWDzL
         SZcA==
X-Forwarded-Encrypted: i=1; AKwUvBxyGe9h4M3itT+Q86/6dlLeDrYbXKrG/6s6U1jpzTqTFgS+bIxjddXX5jxdkIfGBr7hFVWm8Zyq+nczKaxg@lists.infradead.org
X-Gm-Message-State: APuU4Z9jO+CA4gEkDpMJe4YY5qIFdKORfQzYvY63uygZ/aukJOQ4mIts
	Mjm9G9vhgWz0biB8MLWVPEsuM+p7sSKBSKM3fgr1tYdlxiTq8/TU4cTu
X-Gm-Gg: AYBFou286tRqvztUeCHr31OQ0fbyDksiB5hi9+Vkrn2tllUOncYqo+tlje1jC356yhq
	dai0tLxloMZYVWS4NrIpWSqpS3XCHTTTNvOfx324LoJPuuv55wEnM5XRDd1/lRZyTXzMBN1nJpN
	lrIIIg5Q33Q6k0oCsh9prbyW2v1oPvyPEA2PDu+rPvo6omMbz25Kgi4kPgm2jlu9GGDqsNc+/7i
	0zefaqcvpo7LwFfIlozgAMvwo9/FoGfld5exkgSNflaQtRQ3lgD7AW5M9Wglb/ML3q0F8HYs4si
	TMo81gKZF7i19zCEuc8Nqj0GmgiJhFc2RStT94bubcP+7fRpGRztdbWZmIgQDJfP6//gIBrqHDB
	kKQOnTQVDE6VUaf+5CO43T80zOgv/VN/LaETKKGUUILWvpJ3GG3wu69EUuJq/MDgjUOnHz6qE2m
	9eOL0X8RbPUI8tJx2BqyWeBBEEUqnV377w95r+e/ZzlUSeuFz1ylK6HfcuPb0NcS8FbUfCFQrm2
	HPDZaXAgwLYoajgypS2OW/gVKOcAexTZFm73jJCdnGATZShjbZkibdM29tg7JOSuwJUVMGzvKB3
	NEhGMBDQN+r8rAQglNJuYcGHpyC8yG4RqrhyqSgJUAepZfbW8nA6JFGX/WwQ0Ga7cVBB+R2KXbJ
	EwLZ1JS1u4ieSw5L88uawE723Mg==
X-Received: by 2002:a05:600c:3b2a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4ac1709a2c3mr391986775e9.15.1793873007590;
        Thu, 05 Nov 2026 02:03:27 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:26 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Thu,  5 Nov 2026 10:03:17 +0000
Message-ID: <20261105100322.37816-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020329_841731_2C44F49D 
X-CRM114-Status: GOOD (  11.97  )
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

The T7 has the same ethernet glue as the G12A but needs two clocks of
its own. The controller reaches memory through a pipeline stage with
its own gate; nothing else claims it, so it is switched off as unused
and transfers never finish. The glue registers sit in a block clocked
together with the MDIO multiplexer, which probes after the controller
has programmed them: the writes are lost and the port keeps the
bootloader's delays.

So the T7 gets its own clock list, without the timing adjustment clock
it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
the 2ns, and only the receive delay line offers fine tuning, so only
rx-internal-delay-ps is valid here.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index e769c9bb70d8..ff5e50f65114 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -84,6 +85,49 @@ allOf:
         rx-internal-delay-ps:
           default: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+            - description:
+                clock of the pipeline stage inserted in the bus path between
+                the controller and the DRAM. Without it, the controller cannot
+                complete DMA transfers.
+            - description:
+                clock of the register block holding PRG_ETH0 and PRG_ETH1.
+                Without it, the block reads as zero and ignores writes.
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+            - const: pclk
+
+        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
+        # The RX delay line of this glue is fine tuning in 200ps steps,
+        # added on top of what phy-mode describes. The TX side has no fine
+        # tuning: its only step is a quarter of the clock period, the full
+        # 2ns at 1Gbit/s, so the TX property is not accepted.
+        rx-internal-delay-ps:
+          default: 0
+
+        tx-internal-delay-ps: false
+
+        # Deprecated: new SoCs use the standard *-internal-delay-ps
+        # properties instead.
+        amlogic,tx-delay-ns: false
+        amlogic,rx-delay-ns: false
+
   - if:
       properties:
         compatible:
@@ -106,6 +150,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -142,6 +187,10 @@ properties:
       - items:
           - const: amlogic,meson6-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
