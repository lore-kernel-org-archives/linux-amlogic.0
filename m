Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8701B6082BD8
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hr3vGhfP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AVA9XTjYtvJRls0v1tHcSCF0zVKBeQa/lvYoQNbM6rs=; b=Hr3vGhfPbHjshFk7toa0E1Cd0d
	i0NjMIztTYL80hwxRsPzYStxCWTvozt5HG33D5LbIpdf6p08wKOmv3cRlJRicAmpFBM2nLHXDnoCk
	cnh/kD3yYbCyiQjDHqQg/lUCzXRyyGbZFKqpGYGUJUP2N0meTaezFdtp/LqmDjutNHir1WBUGFA/K
	W8upzp7rp+HNVlloXOLacXts4BUNL/6gLxTTR2/R82bbfNmq0RDXMRvJVDUZPEi7vY4B43KgTd4RR
	uZuHNAX+CwJevV44S17oA3qjiP986Hy5keXD5hGa8UvsROnpmfkP6OM7RicQRhSx0dgmM9cafKbNF
	NwCmNtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVl-000000039YN-0my8;
	Tue, 03 Nov 2026 16:37:25 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVh-000000039SF-1FGr
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:22 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so599740f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723839; x=1794328639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zl50UKdvdlW8XEIziu1Zq0cNn23HYvybJSqNilE3YHc=;
        b=hH+dVbyp5BhYl9H0qgBpIjLMlZkpGQjAalAX7qig5+Ra+wOSFbETeABr6D801D79eE
         fnh+E/aHBJCTM/KvgJfq1ZciwpcfBe9j94HFH1GQICeeBPzdGtg+BIYB+1zxzyf16Djc
         9so+QOLICOj2Juo7V3VOmGWJ1kr2LveyohGpXEDVLlPIW9vuSQPncJw2q50pkOTqtwbG
         357Jf1QHUHFjg2u8TKR+b2EMwOESNUltKMQ5azP6j3mqHKbXQUtcoVs1fEbrPAMIzOEO
         NswGypmpNSS6nn+5p5LJDx4dZZFKqXbA6NJjS7vxDAMamAR4xjvUx1OhCXDbvYnoEI27
         NMvA==
X-Forwarded-Encrypted: i=1; AKwUvBz6bUR0ZOAm/EK8dJhsNDjWfPG75nlNDcVAo1njxhDm3igQE0LNv3MXPKWAiHjsKxRW5fxNr4EwMyigisNp@lists.infradead.org
X-Gm-Message-State: APuU4Z9sJyPCtSMtsn7yGiNriZbD6JoNpsN6R5TCwzdeJchCqnTCuZxS
	2FGPCU7D3vJIPNe9JJr1VszIbYYox1q5gJi+ujQkHzkS8CdIqIDAry6U
X-Gm-Gg: AYBFou0i8yEukWGnCbXuhwFPeYEA2WZftsKyn3bMBjnfySoLDw2Tpq1EMf2a+xWanrK
	abmgSLGIfi6hZiOjEprjXkTlK1m/0AeEp+kEB5XDyCLXXFQCnllr1l5d3mUMhmIDxPlKBVpmYxY
	NfzAUIFVRTFIvGsIdmE7/UZIPXVmBFrkHiq1mT7K3JL8UzFrNpAEyjz647cE4PMCNKSD4Xs98V7
	9oP9UdnwY/3H1HLmSzM2/y5rsycZNYLDGDRTNZYbH5P63NwFxjB5M37vUUxAZ2c0K1WrY+cOdFJ
	8mFKDl4fvWab7+3vxl5M9KcOTlvCE1MzlLNb+q7ZV2sExTmQVFrg7O7lJI06gBtTWQRFnV9TSGL
	np4XC0GHV9VXGmh1A7U7zwV+8nRUUv3yaM+ZtEHx/K6FKqU6AiZhiYjBgV1KrAgDBq3YhQlAzST
	eAc5PW/45wRG0CCfNzzx99Y9O/Qojv830482pi9Nr8Hb2myxlT2G615pRYqCvI5hvKb5kvoYaEX
	fbm1pMp0jl2M+RWHlkIAOrVXju+FE7AF5nxERkLH5KZUgZiYiap2QDMPdphP3p9JfHvagmFS6RO
	C0NRhY1N0BNbuQTRgm2Jg+mfvr9PdO5aI603mF++j8VoD0KgM/uCHEWRuJHrpseK7pgDBewHaUu
	dREgDHGMEq2RHiFnrIbBH9yV2Ng==
X-Received: by 2002:a05:6000:2082:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48e6e2cb572mr32349416f8f.10.1793723839219;
        Tue, 03 Nov 2026 08:37:19 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:18 -0800 (PST)
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
Subject: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Tue,  3 Nov 2026 16:37:10 +0000
Message-ID: <20261103163715.385394-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083721_373408_77D159C1 
X-CRM114-Status: GOOD (  11.71  )
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
 .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index e769c9bb70d8..6de013e3e8f6 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,59 @@ allOf:
             - const: clkin1
             - const: timing-adjustment
 
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
+        tx-internal-delay-ps: false
+
+        # Deprecated: new SoCs use the standard *-internal-delay-ps
+        # properties instead.
+        amlogic,tx-delay-ns: false
+        amlogic,rx-delay-ns: false
+
+  # Delay definitions for Meson8b and newer
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+    then:
+      properties:
         amlogic,tx-delay-ns:
           enum: [0, 2, 4, 6]
           default: 2
@@ -106,6 +160,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -142,6 +197,10 @@ properties:
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
