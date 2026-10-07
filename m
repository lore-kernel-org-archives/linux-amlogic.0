Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F30CA6002
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTGYSOAdF7oZjnfeqIjj7TiIVmEtzwbTpfbmw2n0kdU=; b=O5M55mYEdAjgkp
	xWTGLI977o+6XHRjbT1jdnQ2Z3qFCKmWS6fNbTCuHEp//f/tWu2n+AhD0s2rWex3/jVQNToWyjZNZ
	1DEGo1DjcX6ijerjfSnVlB+8FM7IECbrhqNR3QgMFRXFIW+LStDoGcOOPM9IDARx6SqYuEwtUoKkN
	gi2QbzhLmb5JKUdXskNjv2UzHudp+npvIW3SNdS1RiZNoNa6g6pUPhkbrHtGXyT8OdZWus2GNE1RE
	PzKJsGWjiuTOc+ya9eMrwPBFh/XtNORwGoOSY4pkyLSgcx31m3O7Cx4rEX2M59J2n2T/FaFG+txUz
	OVzbtg0vD44HTbLQQqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyz-00000001wUL-1Y9X;
	Wed, 07 Oct 2026 08:26:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyy-00000001wRl-1BdK
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Oct 2026 08:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tB0xtSwA0keDPf16UgDp3Oe50ABzW8mrbEXvFRXPXyk=; b=bwD8HDBR9ABMQNS6bYbyXAqyW+
	WzkFmqK6/qhg0AfnWgcNcbTiOVTKJ/l65IIfR+3V7IYqo/OrTsjpp+3MmXeO3aOxwErD8wZW5dj9u
	RqoI3qnaSD8i97LcMgnYJxV+Gvn6x+itmFTzEkEkEDdMn9StR4HuS4OxymwNd0cTDUcBdEFFMlHPa
	a6AfWlY3lHCbY+BpukscFMFKn1RZO7HAeiIGvF1jDbnL4jg+yygrd2KhjmF98luiW0Y3t8qeWX2SM
	pkxCPCdbjHu9SKR8u3xwcDIFgdJKjYTWrQJfsPF2ZJI5Pdc5tpBH7ieGlshNN1W2iF3HI8dCOpl5r
	ewuFMCRQ==;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xEMyu-00000009L07-3UX6
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:34 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b042c0759so1243712f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361591; x=1791966391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tB0xtSwA0keDPf16UgDp3Oe50ABzW8mrbEXvFRXPXyk=;
        b=TJBAUSWzle965qyAHImSEao/9iWV95BiqhGG5FVqFFt/ESwX3w0H8VMZFxMXAjlFF4
         gdUXVe0xeKMxtsmP68Xbx4oyP3a95VoqDlxRxmDLOs6wnGFR4ht1C75L7eIkyt3ByJIs
         lEOKLEjWk7dMiW4IlsnrZbRLS/5xtFz2EVOdtIcg4GKzB924wT5jjyj2aRb2C5yfuepD
         VhalWo4/GZErbI/66CH+T776qwVvSAH0lTijqr/ei6F8oM64Jn+DfLRL4Pzkgh2K1khB
         VPybdZrG8CF4JbSpOkKkDMDbvvO1ON88ZdJYoEJ/NPzm4RlM/1kqVyPij2ekzLJHGx4C
         RlHA==
X-Forwarded-Encrypted: i=1; AKwUvBzJuzWK/q7Vy9UeMpv/Q2zpstFgfqlc/VKlKxgakM6kcvh4S8RApF0LTA7u0G3vJWhQ+az1V+uf9Uv4DXwS@lists.infradead.org
X-Gm-Message-State: AFq9FYI7UDyldWumCsYgccUbYE1ykd+RwsH9dJbUcV5RDM+JzidvUDuc
	ByMQq8Kzbh4Lx6wx2TLAJRF9Wf1wdppP04iGzwq4kb7RTj445jfCf3m6ltf1IzvJpydVfg==
X-Gm-Gg: AYBFou20M+UM6Bp1RCzJvDifEtDfvuQusJGaBPTH5YhI8t/lYW5YwpEfY1f5l6DDc0z
	ibpou7jNBqBHQmmvoAeA+xeDXLUN5oNuj3njPUop5crmQvuYcxJ4SxwVJPKoKR8HYR1tz5YYPu7
	j6CMq5Uyir6cm8+QmHWkdQQw7BRa1hseOFnDm9HDsEE8d9Xw/MZdcniCOCQjCtAtZpccCxm1fgt
	18RmqU7oBbXDZTXNDxxLeMI+N4JVEWaWoI5GzxiOxStwb2Dv5jf+jYR283ida6uyLv5HjuYKfxb
	kytJS9pA+nwZDp4i1tdEqmY7SiOsZ+zB4IySd7OVoNqY+rN2zeCkYSXpLiYQwy8F/s0s5vV4uY1
	Lv/C0zfKQjYp/eq8RumxN8yWUHrBT/CDwv4AYlmn1pqtaa3lMSrnDDzcaD0oYJe7gEUVXn86gHd
	Awt7Jz3KRphwPUtHjzYgkx/uWidhoBHjhu89rqUax/WJIyWj9rphVyl7srtIYB0GZmsv5euMdcD
	5feYiyoQT8zl9QNru4aw+PZNFFxtiPo8e0=
X-Received: by 2002:a05:6000:4210:b0:48a:fa0a:34d8 with SMTP id ffacd0b85a97d-48c7277eb69mr2959645f8f.38.1791361591588;
        Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
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
Subject: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Wed,  7 Oct 2026 09:26:23 +0100
Message-ID: <20261007082627.63807-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_092633_109198_55FD7599 
X-CRM114-Status: GOOD (  13.35  )
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

The T7 has the same ethernet glue as the G12A, but the controller
reaches memory through a pipeline stage that this SoC inserts in the
bus path. That stage has a gate of its own, which no other member of
the family has, and nothing else in Linux claims it. It is therefore
switched off as unused, and the port can then no longer finish a
transfer.

Describing it needs a fourth clock, and the fourth clock of the
existing list drives the timing adjustment logic, which the T7 never
uses. So the T7 gets a list of its own with the gate in that place,
under the name the SD and eMMC controllers already use.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 90ef79161ab1..96118b4d1560 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,47 @@ allOf:
             - const: clkin1
             - const: timing-adjustment
 
+  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enables the
+  # timing adjustment logic, so it has no timing-adjustment clock. What it does
+  # need is the gate of the pipeline stage the controller reaches DRAM through.
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
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+
+  # Delay definitions for Meson8b and newer (including T7)
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
+              - amlogic,t7-dwmac
+    then:
+      properties:
         amlogic,tx-delay-ns:
           enum: [0, 2, 4, 6]
           default: 2
@@ -106,6 +148,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -143,6 +186,10 @@ properties:
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
