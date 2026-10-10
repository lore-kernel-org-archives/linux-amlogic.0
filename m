Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F0CA9EBE
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SBnVU/5pv2vR9D4J8M+5xpKSz9LW66kzqr+RzbJAWo=; b=Sk9S6tfayGEKp1
	XjxzxVjfATEjOzgfMc4RsdhqBPYYtaoTB5d1i+41m1P+87HWSU+WexzezeIWtrJb8EjVoe5lye1im
	6bHBa3cWYan5tlK5tGQ3UWMhiwjdL14gn8oOKMl9PHFFdVXPIaoCF0KC+zH252r7ZeD84+700aTek
	si0f9d3oOQ8JbnOGWc77qnHOwmqk9CqRQayHNCMcs7OzlLHj04o8gxjl3mJV3A/hQHQc5h8oQwZkk
	3331C/9Ocy2LlhA2aDhE7lTSExskS/FSzqh8lm1sz/5S2snGBz8zSeOlj911OUopCrFgrumIMrjZd
	oPkZ5n+kXzPwdPMtfJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnE-00000007s1q-1gb3;
	Sat, 10 Oct 2026 10:59:08 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnC-00000007rzh-3M8q
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:08 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so4459495e9.1
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629945; x=1792234745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iDEeSRYepWdUPmgZSkaxaPn0y4xYgwY4k/M0MT4wvc=;
        b=kyO10U3hMwG7wnmio0FWlu67dN4KouJzK292KqbDfXsiMy8WL4uBSUuE2gVzgI9eOC
         l3lPlfMXoi+AGEqgjVnr7jxvH0Z8K9Rpm/w28uunoE2RJAVvOqbeZRSRvniUKY0YOa2f
         2QJjRxHr83/4y9NhzKbY3D24/Bzh0CetfN/TANwTMal5JooiZVNYxk8ZlxghUWCgTb0d
         TPTxTW6bDu+PUMinJedrkDjw2B2JIKpRHFPUALcm9R8eVwYiJt9LI3Q+gjZo7MK9KAe5
         Q7HM1eWmrbUmxFpCt3sdrGyYwL07JGGi6WyBfep4iDIemDfiSdpKelKFq0Ze+tEpheOV
         nCuw==
X-Forwarded-Encrypted: i=1; AKwUvBxar2LW9wY11CAF5165nyXMMwsvI05bSiNIxzjoaUIGfUN9N5PSE9CofoZwjRM1JYoyh4VkJtDVr9yUiNkI@lists.infradead.org
X-Gm-Message-State: AFq9FYJEV1/uMj8/GY6vkz+NLsWcPFiqmUhrH29qZfAsQpFKGjS53uic
	5FQXqIn5VzdohQR9gd7uT9pMjZcDDIGxV3nMc5ZRjzWnqGPFJOqzroMbvw3tRer6pkM=
X-Gm-Gg: AYBFou34zgQDsEuPnuv9C8pJafanBrRORkAT2pVMeicZ9j94RZguG75/wCHaWJJ8XOL
	MHdOTNyvVwvZXH3rYuosm35MqDq2mhdqNxIv3FIdjiSHU81wZsIzw5vnctzVjN3Mxjd5RHj+UYz
	Ax+K5eWHkbX8XOlyj9P/1nVDxKdjI5klBBQWE0q1uyWgvgqj3wpZI0YuB0lMNlFKJsLFHFtuA0/
	6A215Vdh7JeASLD7dz2HjXx0db8kl5iAOWbe1rsHLr6GTfazjFguSGEJqRIhaAWgLzkd8hOpU4C
	JgdeIOjj/+GbIB7MgbIsSnlmphIJUag/qdYOVAZLez4XPPuoxgtz3LURH6QFscUaKoruk3x1LhB
	x/EY0a4zsbK1Y9DTF/AeP3YryLkw7IL1yR7m46LSE/BynSroKqS6bT/mi77aG+26Z2O5LfL6KVV
	JmpB0PnO+EBznRgyYKxKH9vX3pVvb7tuj4jkBJ3uq6tNpvVVuEM3KTymjTPphvmWJhqwGGmou5N
	doh65nZ0zZLUcqW74Joj6PDdz/D3WChw9/q6EJHbOcAY0k=
X-Received: by 2002:a05:600c:3e14:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a18e49316dmr71091115e9.7.1791629944857;
        Sat, 10 Oct 2026 03:59:04 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:03 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Sat, 10 Oct 2026 11:58:53 +0100
Message-ID: <20261010105900.247342-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035906_854125_36D45832 
X-CRM114-Status: GOOD (  10.34  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
