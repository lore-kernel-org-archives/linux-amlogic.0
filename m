Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6901DC3A5AA
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5A222DBF
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sDFeZs3/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i4HxGKUM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5A222DBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4NN9g2Zvmx2mG6sfJwLqnCDkz1e0AofTT9vJuOWtIA=; b=sDFeZs3/cq5sok
	tF44Y6y8ZCjYNojB4Vx4kw4PcC21gjXfVYo6OEITyDbUO9PWSblOVo4TIbuuz9uh94OTx2uCDoGIw
	9RBQJL8HOtkssQ8CpQHHRytuE8nikK/DSreWEcOcdlX+thgAmhZmjObefnpFCvSK3XPbBsvWrzrDR
	zjks8mpgx/okqEjMEixy8oc725V1iyF6mcHf8mYTuedAlLbDKCStn6ODjk8Qzcm0RgS40YL2a5LoG
	ceoCJNg1ul6ZwnADz3EhVahNQ2o9/9Eq6/QBDGGWD1qtmNzkNCmKAzd4CYpjk6XbD364zpPfSZj5B
	KjTt5FnYTqdMfcL23YVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5qSF-00083T-D7; Thu, 05 Sep 2019 12:01:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qSB-00080J-Ci
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 12:01:33 +0000
Received: by mail-wm1-x341.google.com with SMTP id r195so2676341wme.2
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 05:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=frXECa7oB40w9WZ9n2ecYzcH89/QDSFs1zSP6u+7Qvk=;
 b=i4HxGKUMtgFYoZ5e+oi5v+JhlTAUa42yN4QdLJHfvLUZyZvd+x6GDzYM8VAmo50xRn
 NRMPhKfVV9dJhhrhUxM7Hvq7YhR7+HCGoqV4SpkB/isItxpnJHFjtG0ttT1tIS8JU9MJ
 I9/XLbDxxTLI2rNtvYwbXmiYZUqfHX6W0Jef+ZURbKfOnjNzZ3Hyhz84kw7aOrlv5Fiu
 Q0EseEc5xuJHTwMboJ5tDsZhWWE7ASGCU83RjCI5yHIGLO6CUFH9ofQTFDij2KaSdHUl
 sVwcbhWVPWSyyZWejd9g2GuqseEp2/FRfl17WRUgI3ZwWeQtFupyorp5d1hIoBQaRfVv
 hm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=frXECa7oB40w9WZ9n2ecYzcH89/QDSFs1zSP6u+7Qvk=;
 b=R3LRxter7ciT3/k2kCwuV5fRxbasF7qW4HFMV2LHeuDzSxz9OEtHDilyZbbkVvjnB6
 oGOQQRKGgIRGP03rN1CJC+tGTKutcQolOpGRGIJBZwpFsGdE3e533w45BgPV/Pe97pM+
 wFyOYgx7VQkNxPAj23mUKHmksZPbazNaqJpnNbHmOyrhge+rv+J4R1/6I5ohr7x41WCy
 dfQlUi+TcLCtgj6ELQsCXyrJ2saOfy6JLv3PuzNaVpjH3jiKODQh2jOXpZEgzuRy4Kba
 FIRnfxen3tcSGLSOk6DSvmPImJC9gm382nJsxlSeFMgJ1uCMMyHv+7bAAtDUWtrILY57
 J6Tg==
X-Gm-Message-State: APjAAAUXcxAxiOYZr+qDsZbO9wdQj6B/r+s4MLPIXHqAxZaNBpfb6LeZ
 XmUYNouas8JvBdh5vaACPSSVTaq+3O2LFQ==
X-Google-Smtp-Source: APXvYqxA/Q9whlszOMfcSkbW9Mrtlo0RubDAdo+i8gx27YCkWw9SpbgHeHqvHsmJM0vvSdovJDDBnA==
X-Received: by 2002:a7b:cd97:: with SMTP id y23mr2422292wmj.74.1567684889405; 
 Thu, 05 Sep 2019 05:01:29 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/8] ASoC: meson: add sm1 compatibles
Date: Thu,  5 Sep 2019 14:01:13 +0200
Message-Id: <20190905120120.31752-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_050131_429150_E0D7830E 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

Document the compatible strings of the audio devices of the sm1 SoC
family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt  | 4 +++-
 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt   | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifin.txt         | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifout.txt        | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt  | 4 +++-
 .../devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt       | 3 ++-
 6 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 4330fc9dca6d..4b17073c8f8c 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -4,7 +4,9 @@ Required properties:
 - compatible: 'amlogic,axg-toddr' or
 	      'amlogic,axg-toddr' or
 	      'amlogic,g12a-frddr' or
-	      'amlogic,g12a-toddr'
+	      'amlogic,g12a-toddr' or
+	      'amlogic,sm1-frddr' or
+	      'amlogic,sm1-toddr'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - interrupts: interrupt specifier for the fifo.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
index 73f473a9365f..b3f097976e6b 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-pdm' or
-	      'amlogic,g12a-pdm'
+	      'amlogic,g12a-pdm' or
+	      'amlogic,sm1-pdm'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
index 0b82504fa419..62e5bca71664 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-spdifin' or
-	      'amlogic,g12a-spdifin'
+	      'amlogic,g12a-spdifin' or
+	      'amlogic,sm1-spdifin'
 - interrupts: interrupt specifier for the spdif input.
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
index 826152730508..d38aa35ec630 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-spdifout' or
-	      'amlogic,g12a-spdifout'
+	      'amlogic,g12a-spdifout' or
+	      'amlogic,sm1-spdifout'
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
   * "pclk" : peripheral clock.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
index 8835a43edfbb..5996c0cd89c2 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
@@ -4,7 +4,9 @@ Required properties:
 - compatible: 'amlogic,axg-tdmin' or
 	      'amlogic,axg-tdmout' or
 	      'amlogic,g12a-tdmin' or
-	      'amlogic,g12a-tdmout'
+	      'amlogic,g12a-tdmout' or
+	      'amlogic,sm1-tdmin' or
+	      'amlogic,sm1-tdmout
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
index aa6c35570d31..173a95045540 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
@@ -1,7 +1,8 @@
 * Amlogic HDMI Tx control glue
 
 Required properties:
-- compatible: "amlogic,g12a-tohdmitx"
+- compatible: "amlogic,g12a-tohdmitx" or
+	      "amlogic,sm1-tohdmitx"
 - reg: physical base address of the controller and length of memory
        mapped region.
 - #sound-dai-cells: should be 1.
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
