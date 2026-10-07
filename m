Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB2DCA5FFF
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SBnVU/5pv2vR9D4J8M+5xpKSz9LW66kzqr+RzbJAWo=; b=bphtXo8gj/Ms24
	zogSQk+8rQKkFTssLcmfU4WHNt8dH92Fz0Ofnzi61a6sULACW71AW1bRn1mGwL0M7mlzV80o5/f7x
	KcZo+2qrOTSlb/fY3CvrgU41V1Dm3wdU452c1jMtgqJxdywsdrg/HKtIf7gCq7p3KnVoQemCT+pw9
	l5Daa7z/SkGVmEMC2QYW8xsxlKbIWwcc7OxrvZZvA11lUfeRvnTwmzq1qnV0ms8aRIIQBqRoNCkMV
	iUp4F7NEwVuIpusrsoIry6D+s/aMJvF+3ZiNrIY5sD3vye3+msl4uK6zDljWURiLht9XqlgfuQWru
	Jr4tjmRrYfrJ6CRn4QVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyz-00000001wUX-22K1;
	Wed, 07 Oct 2026 08:26:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyy-00000001wRm-1Lrr
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Oct 2026 08:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9iDEeSRYepWdUPmgZSkaxaPn0y4xYgwY4k/M0MT4wvc=; b=BSTtIJkj7PkxjG7uZhxgzNjTn4
	CaLEPS9R0yXZmKRmH6q1sZCZdReV4vdW0D8aJ8RvPu3GSSWE/TP5MBv7+jNERVcFJGod45Kl3NPCl
	JKg6b4mAt/WO1aV19zXfRzyBogXCCLTZBi+GBEJ7qcWz/Bk5xG3udy9DE73uNNG0UbGOHWtrdBLQy
	eMgcyVdNzN1AdHYENqRvwQLb/ixwUT9snhzAfXV4OKw8b7+RGt62DhazFdGJ3GF4fK5lyqVZ7gF9f
	pkIF4/s3dosdUyeHOSJ2EQ/i2FBsYSftuuag9GJro48AcwK7GCkE6Gl4Ci6nTB0zj4khSA605Qvf6
	dOJrqtEg==;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xEMyu-00000009L04-3KtQ
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:34 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4207ac26so1094675f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361591; x=1791966391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iDEeSRYepWdUPmgZSkaxaPn0y4xYgwY4k/M0MT4wvc=;
        b=biqooaMT4KD2gYor/1HVgvXcHcY1Hf5ZC8gNs/rHY1eBim/2Za6jGq4Zvc2L6oi2uB
         CdnB0FRkOYPBGCzmxen9L1Giukua3Zszu0QtkvalvG8A0ia6DQReuyaCLQ/jlgNOn1ng
         uMtp4i5mbN1RJ2t0LgQMouTTTLv5aePZlxOdYBX76zb0Bj02LBh5DU0B3J8HIvo8p9aa
         PsbeiK9hCnF1hLUlrWeJBcJV7tfuQBFnSte26WwVmJffB0UiR5LwrpFSQWD2MUV4GN3G
         z5Ij+UNOr3qWRGgWeeHxnNYXcMPlcpxc+KIF0KkhA7+YaphtcM4U7pNgqe9ghwICon4L
         Z0zQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhLMs2UUA1TgqL3PkLSyE0gEH2u58ADzrYzpAozPQ2NxK/wvubg1i+occH22E30COIpVspkgBaREzvZk/r@lists.infradead.org
X-Gm-Message-State: AFq9FYIpCOrBRuKnqqQIcrff0StZ2XclpYDdtJSp+WnxFVsiqaHlHAym
	R7U6uSJU7fV6Fh0v3lHWXJZetZiZM7rdfrUQdbVlW3Ddd/Ji0Va6W6+/
X-Gm-Gg: AYBFou0dqfpf8+KTAJRnjYym/8Edsrr1BykAPe/LXHOFWSXncvRv+iBrX7+3zLThsBM
	5l6VuHg2IV0ojLZHAWwUyGh/tHdJrh/myeBsgoFnR8WUol3v2/qmDWfkfMckYz4XSAXVRRomxg3
	kpSBlsu3paptWUoEygPmYKp9TXroAfg/OML5eJofpIxBsnz55ec6PDEdeTo1msee4/U+wMniiIM
	PysGaOudUDz1f7slMi63vkLPMbdjAZ0xRG+GgA9cxLtUKRu9ywSxAO3D9MGMTy0BdGD5/5lcwIo
	v7U9HV1e335e3ODsdIM7iMF+WDR6mxnC2vV5AbxfPaomAigOGaAyC9N9PjwFk6BFsC9WNW98QDz
	8/XjC9+I7yKCsqv8ZBA2I1qOvC6aQdXFbwRGkXKFfcimh2I7TthdWx8PiTTsNnrfQJL620Q0EVL
	MDiYlUACs0CgyYOdLUOahSUUOe7l7KvC4ThLAXwgDCUI5L4kwUjBYvd+vtH2fIiMMAs/huQKL4s
	vjnzl+oGUb9EVpKc5rNS+qtCKWP7EwsRlg=
X-Received: by 2002:a05:6000:2dc9:b0:48b:123e:2f5c with SMTP id ffacd0b85a97d-48c7278ef3fmr3047018f8f.29.1791361590762;
        Wed, 07 Oct 2026 01:26:30 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:30 -0700 (PDT)
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
Subject: [RFC PATCH v2 2/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Wed,  7 Oct 2026 09:26:22 +0100
Message-ID: <20261007082627.63807-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_092633_114271_5AA70376 
X-CRM114-Status: GOOD (  12.38  )
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
