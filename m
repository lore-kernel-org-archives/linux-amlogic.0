Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13D660A2614
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pObkkTny
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ClAAloR0O193mlGr4QjuCofPbC5j075EDpDqwutsmlQ=; b=pObkkTnyww80ofnFhwE0JG0Ex/
	kihbWDM+eVB+kxwVxQrqPDH3jvysTGIJFRcd3+QhKbYY9Kr0wwA+j5kavlra7SOaA+Xjo8TAE4LFS
	BGa1Z3nDFlJ3IQ4CnmUwEfX7CK3+GNwu8DERNUds7B2LcWPgJj88DS3VYYkA8/zGIf7gePCNPMEHM
	kIT5yi++caEG8jcx5+ny4XpOxEKwZEmDLCPjMQioPHiGv7MMrZJyYkjnHETSldmqMSQZTORU4KlPz
	cR2c1zFcOoIynf66z4318UgmwZV4afBMs4agzSQXslWg49yPYc5HfsUpM7dUFzLcxlk9PHNgmQ7OK
	dnaTEJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3y-0000000EtAP-1j89;
	Thu, 22 Oct 2026 20:06:58 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3q-0000000Et2Q-0tlm
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:51 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so2157945e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699608; x=1793304408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJU4MN4q31InnCqnmctD1bfgzdWMNbsD2UQnbMenASA=;
        b=fOHf8vUYYuvvBw2NQEqVEeizDpx97a8V+a72qzwyFbrv7kkh9xOtcckI+bX1K+65ex
         zZufOjYvXi5slyzvVlk9lJNGiro6Y69GplVXrDk4Fv2lvnNLzKqXb2SN5JNWSKvLuDhq
         OWgviQ5PWqD5jLD5byCDydNi//iBdzPErVeTekLcfzUQIMyib3D+yH3mJDoEsdAHRigg
         TY50aI99SisLGkuCX8LirVGO69XtLxmDgePA/U179ILnuRKdtwum40LhOkLTtKzH91ya
         trYm5Zv/esE3oU9lH6/KOMu1dVvQBkiQL9hXjq6Jq3Clw8oVviWUEob1cQbfzQ167lyY
         vKxw==
X-Forwarded-Encrypted: i=1; AKwUvBxaMuRBLasISKQJFHBrZNwzZVC18MJbNCrlRsOptXk5GZ4F4i+oEnQoF9KKhj+XNfnH3i1+MIsmS441y6Uy@lists.infradead.org
X-Gm-Message-State: AFq9FYIv6Vy3TKJ2ti4aRiufZlwex6FXn2TwOgLosWJVozI1sLHLTiWg
	3w5+vB5ZoozeK/USIGufgMPDmHLq/ouACVFsQe79EL1XJ/7SeLvOnk8c
X-Gm-Gg: AYBFou2ytx+1okqRHAzB1gdeKqZCJ0/jivquDzyNXcaEsEoJr4/R8ZmwG4xMDFTubhV
	0CruI0RdwnRTJAoxvgaHHN7Ng/KTM0et8aNUYmt+kv4sjkvDHovLIbgEKF4UwyANNtO2ivb0dDD
	E3PYDFjCpOhno3nH9iGxsT9nkSNdMO4Nzetr3R6scKy8FtSOuO/08alEzHSjMUAcZid757t/+sS
	ZJYQmCr8VXNimf029A58X4/tf6bHNjEdoPbRPIk4sy5xuLNUBvP2Y3jcxfeHoncFUtJdwn10Msx
	VQNdpic1MxqPxAXYyRc5z/Zd3vyJof7DqwtX6vL2lSo2gEshjIH0IkYKD+OizajAhHi3CJFIXrO
	dFqqllSAuej7wpCvlarp45Dtd1GZk4sAbBF5XdBs6whQ0YBhugzKYC4WcodESucfyOyf+pfB2wh
	zl3esHDmkJvPGZ2jD4/nsG5slCjGOc8LgtHmXDOvSM2lbzYSJgSIMZBC39XFkDQwX1YRsnYWuQ+
	UGFmtQHb/T6CjuaOfEavODK+kIYdo1k7PswouWIii0VzGNwimhb0/YfRMknmfTxx+yf02lj2yNY
	KAqTv3ef+/wvBpuQaOzevxgHcNKCNkiR5Hgy
X-Received: by 2002:a05:600c:4e8a:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a211eeea21mr2127325e9.6.1792699608276;
        Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:47 -0700 (PDT)
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
Subject: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Thu, 22 Oct 2026 21:06:35 +0100
Message-ID: <20261022200640.3101932-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130650_301147_FC1832A1 
X-CRM114-Status: GOOD (  11.89  )
X-Spam-Score: -0.7 (/)
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
 .../bindings/net/amlogic,meson-dwmac.yaml     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 69244afc4ff8..d27f0f2c52b0 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,61 @@ allOf:
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
+        rx-internal-delay-ps:
+          enum: [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000,
+                 2200, 2400, 2600, 2800, 3000]
+
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
@@ -142,6 +198,10 @@ properties:
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
