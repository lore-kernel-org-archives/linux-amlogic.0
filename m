Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFFCC79F84
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 22:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7oHBNe75aSaKc6Fegxr4fx8TZEtjJzTzTyjARZFIvbI=; b=R2eTACqzHmj81K
	/5TH6prC/SclNs9LUAco3q6B9FJkAxDflU+3Jx+5pt9cIlGxAYY2qpPXdEk2Qv7xylCtxKJCK1Srs
	29QSVqb2tghvjZQwtHxsKMqHYs6mZEfAMtql9QvaeARkC3GYKL+BZ0fVeXhx7ScrVwsJDtOBf7917
	B2BEk61fO33eNEEzcoLs4GQLQAczwrTUIy/4F1eiqUMAG7R85Mr5jGsVil9pi5KNwli3JhBS5ydDt
	oTqJmZ/Ukem0lO7H0jkL4poox8GHqDrSmHiMcg/Rs6iSY45kaZCoY8u6Bq7UhPu7iF/7Ic9jp5X6s
	5e06/sfOf8ufHcZ8OlbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP4-00000000jxT-0FFV;
	Thu, 03 Sep 2026 22:59:30 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP1-00000000jtZ-3NKS
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 22:59:29 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so3759995e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476366; x=1789081166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYr0H8H+3w2Nj4aKKiG0KJqnlsCXDI1Lpa8vdufXlPs=;
        b=ZbYXNT6j/euOGNzDzSZQKeWDo4FpXBRed+fZvoFwxV6+xX1EQs4CUjMxZSLcz9kOWd
         +xYY1qylJOU7otjKBDxUL5WLFDhSFcG111AaR/9kcN5AyOo53bxvY2YVJON2pC5mpkGe
         b1S5PR5E19Bd/Fs272L+56JpxdciX39R/XQdgCaxhk1zNHpYfWK2gTk6IV4oF9L7QaFL
         3UxceES/noYrpfhW69zfnfhJZ5sLQAMh8YKz20qXpkoOqVU7DrL5rVjhrrN06oj87P6u
         OCrFDF9UDowGZIntgz6cvlvV+sUI6HypSCf6zmwx1C8uDeVplBjhMVZsldvftD0ZQCC0
         mekg==
X-Forwarded-Encrypted: i=1; AKwUvBzfN3sjH+rASMeI/Yi14GJKpCCDMZrS5cvlLHXZaEzIh0LTbavDIrSrn4ALI2+QGwMAfy/2cTZtVrzls6JJ@lists.infradead.org
X-Gm-Message-State: AFuF++k0vAaO12gkj7v9Qax4VW+yJRl3oVnDv31bRtL+XFdf3lPrGq5B
	CQrgDaoEo8/k7QrPE7kqfezzBtmurR8iHA2O4a64wImurHRhZt1RzIfy
X-Gm-Gg: AYBFou3CX/yFRleV3muq7WiXbZsdXzNPN6d5D6ug8j4OvUk4YLbFc/ThJFc/IeOnVt+
	RDroxoS7tvDfh/8gVIrdUETp9EhnlLyTg3mOWUuEgVqrxhGFuhvRvxpP7119915IeRpgAOwj/NY
	Gon4kfF01aA+ZKfHgyNimmIN6QA+jwrW8OOKJ16mprGgm/bZ9iaysYbIcvukAdFzW66chXzVENe
	moPO74lIQ517oZuz/qiuuPFeQNhly09sbITR3q6XM1USuRHQeLZlgKfQXLxJzroedCDI/qOMtWC
	LpNs+zVH+rjx2UMkjJn9ThVZOgNIVaoBoibz1XcEfFzQbOZy7Dq0zqscbHoDpunTleoUT5EaM4Y
	rWHaZgOLjX2AZhQrVa7101zLB3YLAqPdpLtzy8QOun9rcdYVUrUd/jpGDaYI0sZhDIvXlm0Kn1Z
	4He8Q6d+pn2nc73NnXCGwez9LvFDsd5+eUdbCXMm8iEZSIuzIhUEzfkNErlykeEhR1us11OdN6k
	qw/vu8K9o2p9QwY19ja5Qr9sw==
X-Received: by 2002:a05:6000:2010:b0:485:8a47:5b92 with SMTP id ffacd0b85a97d-4858a475dadmr290268f8f.47.1788476365986;
        Thu, 03 Sep 2026 15:59:25 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:24 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
Date: Thu,  3 Sep 2026 23:59:18 +0100
Message-ID: <20260903225921.2290441-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_155927_863454_42DDE734 
X-CRM114-Status: GOOD (  11.91  )
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

The SD/eMMC controllers of the T7 SoC are physically far from the
NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
in the middle of the bus path to help timing closure. This stage is fed
by its own gate clock and, when that clock is disabled, a controller
that starts a DMA transfer can never complete it.

Allow a fourth clock entry, named "pipeline", and require it for the
amlogic,t7-mmc compatible. The other controllers of this family keep
the existing three clocks.

Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index 976f36de2091..12342b1d78e5 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -15,6 +15,23 @@ maintainers:
 
 allOf:
   - $ref: mmc-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-mmc
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 properties:
   compatible:
@@ -38,13 +55,23 @@ properties:
       - description: card detect
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    items:
+      - description: core clock
+      - description: clock input 0 of the internal mux
+      - description: clock input 1 of the internal mux
+      - description:
+          clock of the pipeline stage inserted in the bus path between
+          the controller and the DRAM. Without it, the controller cannot
+          complete DMA transfers.
 
   clock-names:
+    minItems: 3
     items:
       - const: core
       - const: clkin0
       - const: clkin1
+      - const: pipeline
 
   resets:
     maxItems: 1
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
