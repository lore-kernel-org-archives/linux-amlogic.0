Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6162DC624D6
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Sep 2026 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlOBeyAPPrgIeBrkTDTmRAwcbzL2txXBwOZ1t9dl7L8=; b=y6XyfQ5HS4z75m
	FVMZXOhRUGzfjRtmTya7UAWZCOUUTWhxZD7saLWOk+rgDZfC2RqI1tva+5ogpdW+1aL1hRu+UN1zM
	CbziCb22zWHueXcjNlLqhYbs84GUl9hIMwShhVGUla2Uyeg/BSQ7F370fHmGnIFJvL+4Usp4KO83R
	N1KCqPXsKuZWOq1TJHhQ8pfCSHhNgZObuy2urAaXE/GoDEyAdNdfbvVcSK232AMibgb9ov+tcPPCw
	8s9ui0ITwLO3lPYdfrNm0yP+xlk60CeF0t0e52XEa/rsR86mDJEgy0HX/pshROJZs3Xu8e75/OCNF
	hITl/zbuLP39pmooY6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNp-00000004CnZ-0Zgd;
	Sat, 05 Sep 2026 15:32:45 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNi-00000004Che-2o8u
	for linux-amlogic@lists.infradead.org;
	Sat, 05 Sep 2026 15:32:41 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484392e3d33so1317998f8f.2
        for <linux-amlogic@lists.infradead.org>; Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622357; x=1789227157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JskkGqhdaY1l7i1ogeLg1oSPtvCeMbo2iXSDE4yNEI=;
        b=CqHOTW8SCgv3d7w/rG4tzzvNh1dwafMn/BlDfVGd36U14opiHSPQqq6ezwXczjeQVY
         MmUX2lic+Nu/qCuri4Sx8UC79sF/aAp4vM1Q/G/VoVCPmpRrmyh4tS+PONwpG7uaDN/X
         84hH9QcVy9CDrqbnsanz6b2aGxeWrNNdPhxaeaSm+jCI5MD4dMODrcDDz7cMYOA6QgmH
         +SMdPHHzX0rro0kJZdFbCtOOgVFr/dHfMCyVvxoGaLv382pdTnrC/ihw6OfgyEca/s88
         Fqh1l+782yt3AiRxdhfcaDn4wRGmhUdlAKAdYm7vSOtIxGnTq18DQ1I33UvspA4MdaBV
         /i3g==
X-Forwarded-Encrypted: i=1; AKwUvBwtW0l1BgPdd52GYBpWS6hBIh/wf+/R75akL3iTcu+rtJCqD17qsINNKvqM87D16JElidntIeaZIuJIgLNS@lists.infradead.org
X-Gm-Message-State: AFuF++nNmM0E4KQA4Ir4/CLGYIfxd6YaYVXSvBKb6fLYC39TQ+iaA5pq
	UKeARIeExQxIHGoYzVcnEqYODoCsEpxJwBKjldpf5Pn4LKG9X6IwqOND
X-Gm-Gg: AYBFou0umAFQ/RORZukJ3/VWq7cjLzcFLkHrCPpOoXB2/SEdiDfjndlk626paCrnFex
	LopKC7eUC3/XmrFi20zKPK/mwfolVqyVbXAxh+Z+MQsYuprGa5fuiUgiLm26lDsVLAka/lPNPm/
	yAeqX0nhs3pU+w0s/J7vCeSP6rH7vM/PxlxMEe1gOi5fUGaRj0XezIfdXk2G99nhzdGc6p+0zpI
	5uJ16+yxwbZc50T3zu5O1ohup6NjiTX+0gGHFarlE4sZuTkh+5b32T2F1Bs8YgHs5k6KJ4Ubq4Y
	xJjR0pZr+EMBhBb5xPmEuh77zywl18BP2C8Io75giWGAX97cS46hZ+K6nOaKBqaqmw8049FrVyr
	LfEDL+hpPNBy2uRucqV+QZGd+A9hQQKzam9sO6iIKi4CEEh7a0Txr7GPXSLscEGjA2Uvn604SZ/
	H9eP3lp99gr6S/JYPBTveOl2z3b9EA3ZQpf1UpaLXWvI667HohyzAYzFiqv2TI2Ay3bZsG1CTYY
	l5AhYtgUn9M3PyZnN3dI1d7rZUuUDmQAik2
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr16135052f8f.21.1788622356748;
        Sat, 05 Sep 2026 08:32:36 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:36 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
Date: Sat,  5 Sep 2026 16:32:31 +0100
Message-ID: <20260905153234.133217-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083238_721476_06D45A24 
X-CRM114-Status: GOOD (  11.25  )
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

Assisted-by: Claude:claude-fable-5
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
