Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8300E60A2615
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lqcPcBH6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mn4gC1SDQ9/ZDzTc76Xuhb9wStSOLMM9zUYMjHgM8oQ=; b=lqcPcBH6iAYztxUPEaboUgvKHY
	tVZdjp/nXoM/j2u9bTnl+jASjA5d6EuNBhFsc1YpeVlC/8qOE8ejLYUosJTivWq9kNXvmbwrvbFvH
	SAGL7J+8Zb5uvOO6ZVGTHe7QL8BRkhhI8o56O/A0O/86K/Pfvlq/i9NVQXI9vqAlxJiaIqcJWzUoy
	vE4VPb8bMRIs9ocahtL3aDR2rOx+KVKCB/vI4JuegqSXaJqHeX0gvHYbPwS3ZcEb9KpkqrPknUDIE
	5fG/ImjLp4x4r92+uCBjlE0NGdAK3WalFaUF7gXc0zA1Rg+brJqjKYU4mZpZD9gZpUFXvBIkhzHc5
	+KA2upKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3y-0000000Et9e-0I1N;
	Thu, 22 Oct 2026 20:06:58 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3p-0000000Et1v-1D8R
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:50 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso1840635e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699607; x=1793304407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqXWTwTTRqCzzF0bQdyuAykpcOnACxEXXIFplcbdvJY=;
        b=PHdU/cIaRl3bJsB2/E2s7C7mhWyynzcW5rv3NbMb8CsHInFhTJf2w6ahR9VDxVqYru
         3CziIPwyy20HwWz8kOa5BnjRCU5jxHhlRcoxuGfXRMq7U/jt61JKDm9jlQsfo9+1NsDf
         Zt3HSBOPvXAlDTyC07W6UxCph4jYolP7pSxf0LkutORL7x0afD8wZj6B+V6nPO6Lb6Gt
         aVcZPSiOB6g/VRb1xo0cVs9ERQZSSoW1G5Y9WmvJPu23lJwGVtbIQvtXtw7EzoRzyzUz
         QOXkGR0HtJqewXGnu0aDo7Hf9YDmR0aBoVQhrReSuvZkO0trInOBZ1mtJ4Yxx8qeFY4I
         3tow==
X-Forwarded-Encrypted: i=1; AKwUvByj5Zl1wJZAVgjyE186GibJ9yOFB4ugW4nEsGOfzDrV+UNvNd52Fj3B6MZqrDVnqoY+AUQboPioyS3rtEh0@lists.infradead.org
X-Gm-Message-State: AFq9FYLOx58TTe2NVC3TF3BhGDPNd6ukOQkISAFWAPbfSrmvnf7qRGT2
	UsPIaq7S3QWyKPoyqOccdd8RFmQL2dSqn8IIyMbrvikMkDQqjOSTpEIO
X-Gm-Gg: AYBFou1hZV6tDme9dyrFLuqUibam4X5gB1bPYS5DzOiAVzokCHaJh2fz3ww2piakn5H
	vyJhXIRgK+z+GCRtVs6qih+8DAtznAKHSNFtbeKu5tEekq4biFu0C7pom2I4tbZ77p+mS4g9a/3
	i4wagPVjVsnYGWprV7pkHoAJA+la7jHftsb8cTPzVRlH8DAsnW8kcLhOaT+x7AwGjeVriJIef16
	qjj2W/HfWlRZOEMVQt1Gsz20ACa4VQrBA7/UkH6fYACxXsLLLQzn8IfKtuNKSV6SkC+vHilh1jR
	OYYqH5ekPf8BcC9hWH9KWcpIXbsrXi6bqXiEgKqefExcHQIvwfabFsVvyTSGForwXn/8ytXLv/t
	Z1i/AbMph8bDg1MRbIhttXltt7hS9PkCRvoCAdEcRlhze+LdxzXzxwBh/kNu8AqpaTxNcNZruBD
	BT5jfVHA9MKCKBGMk+i9kAAv7A0lcoYuY/anCXiRptLN36viTgPPtq9WGuai0XmLHylyoQmOpik
	s1pi58jAdX0F4FtDJaRpFeMKM1JJT5hORVXCzyWbBWFOCrYeQ6oBv34dg/vzhwxXPFF0Ath4o6q
	4hgkXfhkDtu9aoZkxdpgHPH7CRtpPTFDvMmm
X-Received: by 2002:a05:600c:5247:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a211caf3a5mr2595685e9.16.1792699607284;
        Thu, 22 Oct 2026 13:06:47 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:46 -0700 (PDT)
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
Subject: [PATCH v4 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Thu, 22 Oct 2026 21:06:34 +0100
Message-ID: <20261022200640.3101932-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130649_375553_7CE80F8A 
X-CRM114-Status: GOOD (  10.61  )
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
index 5c91716d1f21..69244afc4ff8 100644
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
@@ -172,7 +171,7 @@ unevaluatedProperties: false
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
