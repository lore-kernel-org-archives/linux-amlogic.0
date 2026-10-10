Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D1ACA6004
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLJ7+KhE588XHbJbCI/Zy12REL/YwNC61sHxLLD3dco=; b=ZHMeHf+cl700uA
	msZYmm9tvPGmv/vW6XDpe1emw9073HBYGC1r9CNJAFRFPOj2zLeBPH7QO03Veu4+LTFhcXwhyIs6i
	KjMJau+quUXEho7xawlk7kZXQEDNuRVJRVpp3FxeJm8l4SOTgy2ev18GNHfvFMt0i92j6vUCiOaI3
	WeyQ4F/vTZyAMyX1k707pdCSOzi6RI+kEmVb0WKm86VfKFUk3f0Ei4CPNj2buadge5Yc5TWTwuxl8
	+PVTpQguW53qh/0rWqyrrrXzPVn8bQ46wfaikrDcaMB3r9ouXr8nDOeLu8zUsdckseECexyI1TkEs
	0LpvwiXN230xXFz01XTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnI-00000007s6a-2gD9;
	Sat, 10 Oct 2026 10:59:12 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnD-00000007rzu-2Yar
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:09 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so456648f8f.2
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 03:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629946; x=1792234746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4gXjrYN0DCkNltbrRiGH9pQiOBUm1iOh6yJiBhfVz8=;
        b=i8Jwc4pCYF1a7mBQJdSoxlJHa5krcB4fFAYA7H61bRHSoiDSeodthCDKcrkAXH20KS
         WLpw0sRa6RgKiAkHoC4RuxxMl8dEvlyFOrF4ukgLru2Tp2jJOz8s+dlm6Xl7ssAZfeOe
         0IkfOaAaf/zUi3p2BNPUAc7f2xkw7IWjIdVXBrwy6LaxPJqIEklNhGl8BNOk3dZC9m3M
         pRn54quPshEzBtrY/TOiITctSNETRGcDcOdO4x26xUoVWNmLR2jyVeyH2paYNOm3XAJu
         dbsRBg/f1RrnSwOb/OjVBmLDK8t2vjHpv1AVEzDskgrlephZxqy7uRg/owosH86MNF0n
         5BYA==
X-Forwarded-Encrypted: i=1; AKwUvByi6ghvyXQJRsNJ6SeMxhU9eSIMAJzp6Wfv528ECe3Fz1AWFrjwYyc9vdNz7HHfFQ0dujloSBXUi3n7oQ3r@lists.infradead.org
X-Gm-Message-State: AFq9FYLE2dlhSOLiasPxjB7ZNRAOGggTY+QE4jeu/xdS/cX3Y1EomeJJ
	pH24Jl9MLLz7EWuwIQR4wNQKi+UhQHR40oJXZr70lqaWjj9wH1ucqi+t
X-Gm-Gg: AYBFou1J9h4jYV7WKCsRhNUfy9V+0mUZo1Y3B3CSMqRKOhw4Anuvcs3D+tRkj3rCoAd
	EsFx84imLQq/uR00vLD4U794cloX8h/MmGcXsjUuCPCBR9NySgXukO9bomhK5hY6o5ivpL86kdV
	dYqhosXco6G6Geg04xwZdr70GEEXaDYWYA7VfOCN5FT2KCZ18d186aAlz+amwyXTxvxVw0smqIT
	+8sq0d2ULkkXDPgF2uIl7XXzWCSMDfVEossu/yMT5zUnTAOKgqXByj+rYj+/AqXXovv1s4QfSHw
	2QhwrKno8H3sxxvQUfCDJ1m0XQNX6PWMwuweXAn43J56cLSQHCvqI3SG4bn2RCGI1xtggNFbc30
	774tlXo4gA1rhBHHGhpzkiqetyC+yDvbqoxVt3reph4MULhGdDldRUYMWQPf4fjS7co2N4EffkJ
	05DzfOPLeuekz6n8Wy02oZF6kzfAJLYUQfdeuplyrfScvG0hL/dv7VDtgxh6XdXx54w3sI/CxMF
	fAg9R2GF3UYLxbPlop5VIzm6LDbBrqJ0fk=
X-Received: by 2002:a05:6000:40ce:b0:48d:bb54:77e7 with SMTP id ffacd0b85a97d-48dbb547b24mr8860590f8f.29.1791629945711;
        Sat, 10 Oct 2026 03:59:05 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:05 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Sat, 10 Oct 2026 11:58:54 +0100
Message-ID: <20261010105900.247342-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035907_667075_E74BDEDF 
X-CRM114-Status: GOOD (  11.64  )
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

The T7 has the same ethernet glue as the G12A, but needs two clocks of
its own. The controller reaches memory through a pipeline stage with a
gate of its own; nothing else claims it, so it is switched off as
unused and the port can no longer finish a transfer. The glue registers
sit in a block clocked together with the MDIO multiplexer, which only
probes after the controller has programmed them: with the clock still
off those writes are lost, and the port keeps whatever delays the
bootloader left behind.

So the T7 gets its own clock list, without the timing adjustment clock
it never uses. The delays follow ethernet-controller.yaml, so the
vendor properties are not valid here.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 90ef79161ab1..2353dd9181ed 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,56 @@ allOf:
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
+        # The TX delay is a quarter of the RGMII clock period per step,
+        # which is 2ns at 1Gbit/s.
+        tx-internal-delay-ps:
+          enum: [0, 2000, 4000, 6000]
+          default: 0
+
+        rx-internal-delay-ps:
+          default: 0
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
@@ -106,6 +157,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -143,6 +195,10 @@ properties:
               - amlogic,meson6-dwmac
               - amlogic,meson8m2-dwmac
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
