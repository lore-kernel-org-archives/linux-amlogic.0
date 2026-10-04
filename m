Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0551CA5FE6
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zx7Wp5FoqDB5pp8/hN5Glro5wlOnofbq4Ff0yrYzR8=; b=MWxviw3ICSySfO
	F9gXlnXYFf/n3gNhdXfQFif17nvxCooWk2Ed6aH4xG/j2b/+hDg5dNCNy941A2YKtTF2ihprUlMJI
	VPCCv5MaMs64m+amKR6naY0Ml1v8VQrxon9iVoveyGm6CZPhgruZz4vBYTe9WfBwec/bYvoKzz9d9
	a4tdpJCZso9+jbEUCfXFc7cKAjJvnZYF3BWahRW6jf1dUUfwAfj/bOLzQCRn7ETGMQgj0qKxlJn+D
	pciVsPVcTmDynovuHKcIFz57ZT76Ig+Ht7EEjbTUJVa9MZbuJ2B2iu6eGePU3EXPFQsl+OloQ4qlx
	WTXMcx0Vx87amPIAMPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOZ-0000000EvFy-0ER9;
	Sun, 04 Oct 2026 14:40:55 +0000
Received: from mail-wr2-f41.google.com ([74.125.225.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOU-0000000EvD3-45yp
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:53 +0000
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so427052f8f.3
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 07:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124849; x=1791729649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPkMV4LDUGNtqaIPInjsEvbPyhBM9s86wkifiwBiN14=;
        b=saO04oYY466pu3xB83DwxrKeDF4T3Y6Bv2uxBm8DOqdwmHb9bYbsAnk6Xe9IQn71pk
         Te4BVwTWLcFjfTSz9QSWFRX8PJGWjbb69tg/Lv6QTlfct7rpa1yiVSsa59pZ6xFMl7QY
         mIuWXYLp8Zwi3A/jMGofr3bwvBHnIbWTmWM8abHpeozRvY9eYZihnGARb81EBVphEUwD
         QGvCHehl1eM+Ibbt3ENX3Mv0G6cVGtMthwIo9s4lnxMoH2j1tbMxB1GrCaAuAsaQjY2r
         Eq2ydDz9HWo0u1J+B7b7JmORzgfmBdzzQz2GCHzti4r+5oABONzs+8GnAICHtNOp4EPW
         6tRw==
X-Forwarded-Encrypted: i=1; AKwUvByfmVQFWCdoDGgeDQ2c7FhtU4HWe3wphYsP7KdHa8tviY8sr9hBOFqb3zMKh0nGYed1FCyVM4a75sBWV8nk@lists.infradead.org
X-Gm-Message-State: AFuF++m9m+MBOgN8f88Qw55Z439y0U82cZWACNJB8GDMd8qhW7XVQO0i
	6Ca+azt06zWIWetfTRQo3rXvI6EaMwTAZAKNREy3uc/QdAPLmqF97fyU
X-Gm-Gg: AYBFou0DEZ22lWRpNHgIoD13dFYtx/o6s9s5uCFjTnhb9r+s3GCuIJDAiyO0hRwBi5A
	6NMGNQTrbb97doVElEO1Jhk0ZJ3RlzrjL2Vh9m7TiTJxvIphaQW/AZbnClD2E3WHGqlPOEkdf7M
	VNdFKaaMWW6a43NTqhQCKV63sdJvcY0hfD97rhVKmX313qXwBf7PWPMsJ9Ldk7w0yEQGrY9Xxzr
	Szr37VkHEav5HmHHkl3ygI+AS4Gw+mbT29xk22LFMlhl6hizX3xtstOvcD+pyBSIeO9cOI8qADp
	z9iO88sba5gEPm0gwH86qRxkMODX29bazvI0zh9asqyn1M2KCczKfiYboqhaiWBptpIt/cbe/0x
	z8VCd3JuhOx0txKCJ4O0PcFFUZJD+hnzBWCzkAIj1is34/oDOi7O0sfanBOhu5ECIlxw3p3z/fu
	3ia5V3XiNn8DcUeyrnfw8OUWtdHrCdVeA0wdbfeaw7jkHjkTZ4Rhnv47O3gn2QX2a1Y7+laK+Dm
	/FxHr958B7H4RYSAgnqAMFl+n1lPe/kDw==
X-Received: by 2002:a05:600c:870f:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a0274e9d30mr145830305e9.2.1791124848951;
        Sun, 04 Oct 2026 07:40:48 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:48 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC PATCH 1/6] dt-bindings: net: amlogic,meson-dwmac: spell out the compatible combinations
Date: Sun,  4 Oct 2026 15:40:41 +0100
Message-ID: <20261004144046.391444-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074051_052876_56C84D97 
X-CRM114-Status: GOOD (  10.10  )
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees actually use: Meson6 and
Meson8m2 fall back to "snps,dwmac" alone, the others also name the
3.70a core. The example used a two-entry form no device tree has, so
give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..90ef79161ab1 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,20 @@ allOf:
 
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
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - enum:
+              - amlogic,meson6-dwmac
+              - amlogic,meson8m2-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -172,7 +172,7 @@ unevaluatedProperties: false
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
