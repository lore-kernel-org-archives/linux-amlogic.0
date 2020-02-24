Return-Path: <SRS0=TU6n=4M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E592DC11D2F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53A02072D
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WfQhWt19";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HFA4ICVw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53A02072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljkljmdWO7grCyQeEp6CTp4nuuk7hocLnXcpLPIsATs=; b=WfQhWt19AeHFnV
	7/LNLBW2MtBrQ9R1NDgCt/g24+EHqJ2P3dF6lJtFXMy+g82rbez/RvIHUOe8qw0foTpEm6+4ucRz3
	tY7f03ONE5uHmPFW9A+Nz8ajwjFn3yfpOQZ0Wz4ohGMKOmvQRaC/6clrvMYY0iCg2V5tm4/bREIr4
	bT+MzZhY3ABXPSYWo0I+gtrsJ4SMvSaTEXsC2Wvb8W9tk7j6vQsaAIN7+kGVFon3QYieE0wnp4lGm
	/oJnYKPeKAegkTxn8ccrpI7z2f8jPKc99GVZlEEfeq51NHSkQGs6BSaLTkJRRcf3tYMvuitsCZ08M
	vRST7T0ivJiCXT0GqqHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6FBu-00041j-JN; Mon, 24 Feb 2020 14:58:38 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6FBk-0003si-QR
 for linux-amlogic@lists.infradead.org; Mon, 24 Feb 2020 14:58:33 +0000
Received: by mail-wr1-x441.google.com with SMTP id e8so10742466wrm.5
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2020 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QbPDnJvMb3x4DYL4TCdJnWqdiB62oTXrzN6fiKtZb+M=;
 b=HFA4ICVw6V3LfO9qsOscd8/53GDOJ3feJ6Ji0HTsOjTTuAfuXMA0hsAdQkCSU+bL1q
 qhfqsEkCP2czU4Xjmkmw+EEm6CZaDVFNLQIiAg+kUooHrcLk+Opg29JGVI7CWnl4biTJ
 Juwq/Os17E9C9puNGBVtGWkN4iKkMLauBzjpW6A0K6hfC2sAB+hy9SgW9Sexlmlgs/7B
 W+JJ1c3ikKSjCl0izRj2FzutJE98f+IzxhtqGCxOzFm7enLHKcK2BweferHjmXshlRAR
 qay7/kngc50egqFvqA6+AOFo/Qe+IPVz8uXpFDz5wYPax0ITcqQ0eQQzank8PArcR/Fk
 2+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QbPDnJvMb3x4DYL4TCdJnWqdiB62oTXrzN6fiKtZb+M=;
 b=Dn7LcMi/duVDN+v+9WtOwWZrFW6aRTvqF888kVPE0cezRgg2srIvGiozMUC65SWGD/
 vCwmA2FOUwZN0c0mdt0Z160+9kvJ+T3UNUQM4/PA8ENdW6l0lcJk9ZnzC+VNnx//7Y+S
 1TqguPHZzHPmgKIQ6qcXySzHHCHVAkqhmNMNejs7HdLZXIg7DFJTnSV3eiw7OMBO5+9L
 90W9aqCgMyoiDIzd+LZBwffaxwb2dfb5KuPCML5V3DnhGol8oPy9eUFSxkvvhg40iNwi
 lg54bCOCH4qiXIKv8WNFgDOUctvnKcd5EHhRi6mJ7H78q5IPZ7BAscUd1DmpF4+aHuu4
 6Bxw==
X-Gm-Message-State: APjAAAV//XYI570J2UivCVRAjLXhF/kY2Otuqz1haZWf2N8RG4W7hqpv
 3+zEuBPsuu7uy+1I1bzTfI5t8w==
X-Google-Smtp-Source: APXvYqwPxiP3e2VegzNZkK0egE5/QUcECBQ7ji696G0f6DJy+KFTKe13E3vEe4wS2WyJefgjBE6iMQ==
X-Received: by 2002:a05:6000:118d:: with SMTP id
 g13mr64415099wrx.141.1582556307308; 
 Mon, 24 Feb 2020 06:58:27 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/9] ASoC: meson: convert axg tdm interface to schema
Date: Mon, 24 Feb 2020 15:58:14 +0100
Message-Id: <20200224145821.262873-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224145821.262873-1-jbrunet@baylibre.com>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_065828_853291_4D1E89FD 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert the DT binding documentation for the Amlogic tdm interface to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-tdm-iface.txt  | 22 -------
 .../bindings/sound/amlogic,axg-tdm-iface.yaml | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
deleted file mode 100644
index cabfb26a5f22..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic Audio TDM Interfaces
-
-Required properties:
-- compatible: 'amlogic,axg-tdm-iface'
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "sclk" : bit clock.
-  * "lrclk": sample clock
-  * "mclk" : master clock
-	     -> optional if the interface is in clock slave mode.
-- #sound-dai-cells: must be 0.
-
-Example of TDM_A on the A113 SoC:
-
-tdmif_a: audio-controller@0 {
-	compatible = "amlogic,axg-tdm-iface";
-	#sound-dai-cells = <0>;
-	clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
-		 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
-		 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
-	clock-names = "mclk", "sclk", "lrclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
new file mode 100644
index 000000000000..5f04f9cf30a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio TDM Interfaces
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller-.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - const: 'amlogic,axg-tdm-iface'
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+    items:
+      - description: Bit clock
+      - description: Sample clock
+      - description: Master clock #optional
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+    items:
+      - const: sclk
+      - const: lrclk
+      - const: mclk
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+
+    tdmif_a: audio-controller-0 {
+        compatible = "amlogic,axg-tdm-iface";
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+                 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
+                 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
+        clock-names = "sclk", "lrclk", "mclk";
+    };
+
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
