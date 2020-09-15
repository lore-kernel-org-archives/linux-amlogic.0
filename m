Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCB4C2D0F6
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 13:04:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE63C20829
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 13:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XGT5mTrF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OPNLQs9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE63C20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZsWD99P3CE0p+o2vVv7sGk5pftQCwTye/IOPC5Ie8SY=; b=XGT5mTrFpjvc5PQN86RfV2vXs
	1g4I3fwiYF6+9vlUuC1Le4dVQbn+wMezTlIaIkXEw9KMdqqWDyzrIaLznRy1Jutb54XT662E3s2AK
	WdOBFeXr1OMzMKulkWDNToE1f5kwvbIAHo6TScvTAdsMwiX3ctR+0sLIj21hn7QoyhtC4Z1O7d9Fl
	pyNgfUtGxmmLuz2KD8UlVj8uH+3lDn4KnX4YHzjEel8mGF1xi3PaTVnw06t5tCsv/oFt7XX8JCKHh
	Xe88lCGCCVG+Gw1X608N2oQHi5WkIj3xwPobHZEDGDkQBxeo18otPw/U3QTtryF00tOwIgMKVS/JS
	Ovray8Ztg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIAck-0006eG-MF; Tue, 15 Sep 2020 13:03:54 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIAcc-0006ag-M8
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 13:03:48 +0000
Received: by mail-wm1-x341.google.com with SMTP id b79so3369599wmb.4
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hTMmw7cDb/Q8xHmIbpSzi8XliWIPH8G939s4NmbDgjs=;
 b=OPNLQs9bObumhLvVLyYmqL5evLWsMZSh3I09yJYb6WV+4xFmDXcR74QfOG3wAtcdDM
 cV60Bp2v8vzOch8MOLB0HWE2oY1q4i02nHWirILnLII1tGJYr+23zqZkeeLb07fLBklZ
 y3yB4tckZ/axNi+Tupn/DteDRvKRPQ/ajpHYyNzL0LFK1YJLV97V7dyjbVsOGDUeipT7
 ngpWbrvDx/p7OEbdn+6+X1n2Q3CBQYhI3Mv37/JyhrYacSBSE/lKP/1hqoeeAosahcJm
 BsuOjDUk6p4QM/EOOYpnwSISyyJa1Ow17lx88F40J4orXVbBnuM3ERBORmaLU+C3M1tO
 xkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hTMmw7cDb/Q8xHmIbpSzi8XliWIPH8G939s4NmbDgjs=;
 b=TQgJmzyA71i49FVY6/kh7SUZplIedXpjMiXDFyZjkJ1Lii7Tgdx8yl8GgXCjsDYHHx
 eM4XRZCX58XjscWhXHpZfeEViKjqL4s9CxsCyISQUdHIzeE4fTYLwkUPIsH5wV+YghXO
 AK9/7Y7WOm2KKxjYiBmilXq0BxyrR4XXUZa8G3Ew8WA7s47XBZHvCXDfzU7/rZayRswB
 2tHhwP7UJIOFKWU/61yHXHsH1pT+T0au+bDJCMPcWoG6LhTv89uq/k0wUwbvpuTSR0U+
 1uYbDEKF0X7YJ3vmTjipoarXYk19nLaHVHKfe+vTrgbNL0wNNhG0gcGRcqFK+H3pt4+N
 ekRQ==
X-Gm-Message-State: AOAM531v7cSEfKGLOUZ7uWgXgnMVaLYdqh8Jakk7BMMpWUs0GZPcGC9u
 J+1x3iazgyNkzzp59PTkOSK60Q==
X-Google-Smtp-Source: ABdhPJyr+qSNFVd6jRIg7M8zkUejJULi6GDU8qVcdpcAcd9/G9WIiLkoNZXXOe2hBywHmuAKX3EdOg==
X-Received: by 2002:a1c:3bd7:: with SMTP id i206mr4714210wma.162.1600175025305; 
 Tue, 15 Sep 2020 06:03:45 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 t16sm27098671wrm.57.2020.09.15.06.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 06:03:44 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove reg attribute
Date: Tue, 15 Sep 2020 15:03:37 +0200
Message-Id: <20200915130339.11079-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915130339.11079-1-narmstrong@baylibre.com>
References: <20200915130339.11079-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_090346_866848_D6AFE7B6 
X-CRM114-Status: GOOD (  13.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The PHY registers happens to be at the beginning of a large zone containing
interleaved system registers (mainly clocks, power management, PHY control..),
found in all Amlogic SoC so far.

The goal is to model it the same way as the other "features" of this zone,
like Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
and Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
and have a coherent bindings scheme over the Amlogic SoCs.

This update the description, removed the reg attribute then updates the example
accordingly.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
index 18c1ec5e19ad..702763a84dac 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -9,27 +9,32 @@ title: Amlogic AXG shared MIPI/PCIE analog PHY
 maintainers:
   - Remi Pommarel <repk@triplefau.lt>
 
+description: |+
+  The Everything-Else Power Domains node should be the child of a syscon
+  node with the required property:
+
+  - compatible: Should be the following:
+                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
+
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
 properties:
   compatible:
     const: amlogic,axg-mipi-pcie-analog-phy
 
-  reg:
-    maxItems: 1
-
   "#phy-cells":
     const: 1
 
 required:
   - compatible
-  - reg
   - "#phy-cells"
 
 additionalProperties: false
 
 examples:
   - |
-    mpphy: phy@0 {
+    mpphy: phy {
           compatible = "amlogic,axg-mipi-pcie-analog-phy";
-          reg = <0x0 0xc>;
           #phy-cells = <1>;
     };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
