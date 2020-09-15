Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4929C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 13:04:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35C8720829
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 13:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fU34BFP0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="A7lEcSG1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35C8720829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OJPN/NHaFM+5UklYcAF5mRiamFmmFXaaxWipac5vmO4=; b=fU34BFP0UUNSteoaz7O0oojJB
	/eejgJSunOvMXbNThmecp/gACOKBQul3Gy46A+XlrusAKItEQotP9P+goMw33mrX0r/eZbnEbPfKc
	AxdQlyM2YX2Wm/K6MWSTouaJviBqNVzdYpX+6pY1rtFS4gMKXoosE13YYOTvyxmme8BwFZtN24HRi
	s1SXlUAwk3bLg7JOQqM0a6wdHNF7FL9p/Lrj+HPf6Dlj3ZrNyrlc2qZHLeNjuU0bc93kwbrmtWnxl
	DFRGlAHoHizmfU7Y3d73cStG8rrxcS8t4NZ30t8CEGvpPJ08P88K9pdf5KIo63vQEGFQly0i1FugX
	u/KHyGmYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIAd9-0006lr-Ap; Tue, 15 Sep 2020 13:04:19 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIAcd-0006bp-VD
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 13:03:56 +0000
Received: by mail-wr1-x441.google.com with SMTP id m6so3277258wrn.0
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vX0wBDrE7Wq2nn//WJkF8Dib3IdNVyaQg55krU2+RVM=;
 b=A7lEcSG1nV7HMk7A+Uu53yjsYr5DLG+1EpZ4q6Dn1Cx/Ji3lFJxQs8oaImhJJQ9u9y
 ixDePh/08rw1xISVpdes394uXJ/0HJJcJduTAmU/R7d0yaKDifsaDN/UB1aTTYQmyOTd
 UHCL+8AMefTcUimMTIA/gUEI//EcgubNCl92z3purFPSVtDceorGEpKBbhkVfGRO9T49
 v+LRMX4uo1m/dGDM019SYQ3vBbApwrlm7KMAXE6sdPKpB8h0YoNAU1n9KpEkJiFNf+0t
 RvaJr6PMvKM1ST5av6kere346Z/PsC9jM9i41bQ+01kv23+yg3Lfgt+JoiYh5//WHlc7
 0U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vX0wBDrE7Wq2nn//WJkF8Dib3IdNVyaQg55krU2+RVM=;
 b=gbRI7fdieviC/A7ZSelbRrvO6aXwJxefUdp63qGNWnABVvsFz2sTKSkncIfdxQT24x
 g03o3wGmF/WKvHwYloGJgN6IxhTgV67cCWkNwlTqbOAKs4pfxQebO2gAqp0Foovy3lee
 WIEljC75DUfcFfkq4zjw3k/EliTjXv9u6F/SF7vwyFbiJTCmZMEjoJXbZdxWM3L1M5Na
 j5fgMcCPbW1S+laW6E54JN6YUGjtSJNw6i0u32RyUKGO3zBZq8NL/hw8Phfu9iEZHH+2
 PESHwxiuscr9kwY2mhzR/yabBWBHBu2m6Xo+cyRc8EwcUCkQ7dkba8zlXdR/JC8zOkFo
 NpUA==
X-Gm-Message-State: AOAM531Z01Df7SGLwI2GtF7iHsvrVAZJSgyXpE6FFA8ZoUTi/K1jv7ys
 CwFEwfOTn8mWWGWxqUThS124UQ==
X-Google-Smtp-Source: ABdhPJyKxH0J77Hul2dQeLgqOmwvCF5xpY9DSjomP+D9iu8BXUX25mVUUXGQPbyHdi9Juw7YY8a4/Q==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr22850767wrp.217.1600175026747; 
 Tue, 15 Sep 2020 06:03:46 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 t16sm27098671wrm.57.2020.09.15.06.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 06:03:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove phy cell parameter
Date: Tue, 15 Sep 2020 15:03:38 +0200
Message-Id: <20200915130339.11079-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915130339.11079-1-narmstrong@baylibre.com>
References: <20200915130339.11079-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_090352_047632_59F74353 
X-CRM114-Status: GOOD (  12.76  )
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

The Amlogic AXG MIPI + PCIe Analog PHY provides function for both PCIe and
MIPI DSI at the same time, and is not exclusive.

Thus remove the invalid phy cell parameter.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
index 702763a84dac..4d01f3124e1c 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -24,7 +24,7 @@ properties:
     const: amlogic,axg-mipi-pcie-analog-phy
 
   "#phy-cells":
-    const: 1
+    const: 0
 
 required:
   - compatible
@@ -36,5 +36,5 @@ examples:
   - |
     mpphy: phy {
           compatible = "amlogic,axg-mipi-pcie-analog-phy";
-          #phy-cells = <1>;
+          #phy-cells = <0>;
     };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
