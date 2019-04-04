Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26669C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:17:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3AC920855
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uvM0bPHF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IlCQxrhQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3AC920855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwYOgk79GqlHORsXwuGFYs0NJFY1xcV1MMuTPq4WYz4=; b=uvM0bPHFF+RfTU
	dgoQKaLyQlBODHMExVDUAqGUxkGphc+q082LQdD+KU8GOU5ziLYa6B55M5Zv7/yb5eiHPTrPLL4Ag
	HAspM0h2JS4QfvpzyuPOJebtf7eSz/O64Um2CNFT6UWT/h7krG7qSZ9bAR0bM+DKUmUjkSo9extVc
	0+C44pFqRNMgbtpcmE6xqRazEyq0Enq2GFQJhDtV6iWsTdtVa1OvMHB9yy1HOqDUNvti8OWFw7e0T
	1yJZZyWDPT/AEdiFrNDCdcrqKJkj31cUV5/daVMVr+LhUKycCz5+Ugp8f/WALlQOmxtGxuy4M6n0u
	mLgevplZSeMqEtFabUDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC0NS-00043B-IF; Thu, 04 Apr 2019 11:17:50 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC0NP-00041Q-MO
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 11:17:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id t17so3206505wrw.13
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 04:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THvGG4Utk/yOwuQrm+R95dAZZj74janifYZa4/M9XJQ=;
 b=IlCQxrhQiFzp0pFJ/mN+j38HrpoPXfY9hI+kbZNIqGDS2UyzPLqUWKXh5o7IkWcFrH
 M/oHchaABXJb/6sak+Bes+NL1fXHsI8dDFNnkg6sjI/jU2zAPqYMY83d1/CsFeGql1V8
 lvEr9Pq8gvjhtcoJ8rtBMs5ANcsGrOfK59jmEDUPIS9QNtoqaJAMLN+bu44DVISE3qfp
 fKspSnM4K/JN9cbRlfP9S+hD3ARAgNA7aiHgcSRcy8zlA8KpOm6pxVximGe5kAdjL5NG
 ZOULw+rKsRbcJXtq2t6jdczacGpAZEHCYMhUf3kZnzCw59UeL+xZ9OWaZNDZdPzPW6e5
 dy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=THvGG4Utk/yOwuQrm+R95dAZZj74janifYZa4/M9XJQ=;
 b=shhWS+KoQy0Wpb+lNl4sI954S7Sp2B57zjBO6ufUOLMOp143AzQtR6/vfm9StfB189
 Jrf7IDcyIljUMYt48vFGu9PeYBpHgOwjZn+r2t+14OS8u/ozNFhZfR2N4PkYSI5FhT9b
 DToj4DiZPNpsEfl4Am36LCLZimZoys4IFs2SMzQf63iYCxXgoLsrDE5/2B993bvqOecq
 ae/9r9e+dWi7bZ3gqqU3FTsiWUrUfYzEflWB3lQHzHX+k7un4N0S48dBPeiSGDuunzNl
 UamcZ7IZ2OD3lmM34acT5OghSc1OxFIr4LfcK6hyv/BQkC5uadqoMqUpJNN/57aYb7W8
 v1pg==
X-Gm-Message-State: APjAAAWS+Z7KrxlbFhSDX+zXiLep1FJSS6ecm2KFBUqMRZqy09PS7P0K
 WhitHMVh6b1135HRwL7O1howtg==
X-Google-Smtp-Source: APXvYqyZVrHLXXlnXSB+vYPXcp7Q9YJaa352Ul3dd0qE/uG0Kg30TmP1XfxKVrCszoObVeuWJwwOKw==
X-Received: by 2002:adf:e602:: with SMTP id p2mr3474242wrm.105.1554376666071; 
 Thu, 04 Apr 2019 04:17:46 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id z23sm9024771wma.0.2019.04.04.04.17.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 04:17:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/6] ASoC: meson: add g12a compatibles
Date: Thu,  4 Apr 2019 13:17:28 +0200
Message-Id: <20190404111733.28705-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404111733.28705-1-jbrunet@baylibre.com>
References: <20190404111733.28705-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_041747_728367_86E41A5B 
X-CRM114-Status: GOOD (  10.33  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add new compatible strings for the g12a devices.
Audio wise, the g12a is fairly to close to the axg, yet some differences
need to be handled.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt  | 4 +++-
 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt   | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifin.txt         | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifout.txt        | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt  | 4 +++-
 5 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 3dfc2515e5c6..4330fc9dca6d 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -2,7 +2,9 @@
 
 Required properties:
 - compatible: 'amlogic,axg-toddr' or
-	      'amlogic,axg-frddr'
+	      'amlogic,axg-toddr' or
+	      'amlogic,g12a-frddr' or
+	      'amlogic,g12a-toddr'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - interrupts: interrupt specifier for the fifo.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
index 5672d0bc5b16..73f473a9365f 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
@@ -1,7 +1,8 @@
 * Amlogic Audio PDM input
 
 Required properties:
-- compatible: 'amlogic,axg-pdm'
+- compatible: 'amlogic,axg-pdm' or
+	      'amlogic,g12a-pdm'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
index 2e6cb7d9b202..0b82504fa419 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -1,7 +1,8 @@
 * Amlogic Audio SPDIF Input
 
 Required properties:
-- compatible: 'amlogic,axg-spdifin'
+- compatible: 'amlogic,axg-spdifin' or
+	      'amlogic,g12a-spdifin'
 - interrupts: interrupt specifier for the spdif input.
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
index 521c38ad89e7..826152730508 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
@@ -1,7 +1,8 @@
 * Amlogic Audio SPDIF Output
 
 Required properties:
-- compatible: 'amlogic,axg-spdifout'
+- compatible: 'amlogic,axg-spdifout' or
+	      'amlogic,g12a-spdifout'
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
   * "pclk" : peripheral clock.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
index 1c1b7490554e..3b94a715a0b9 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
@@ -2,7 +2,9 @@
 
 Required properties:
 - compatible: 'amlogic,axg-tdmin' or
-	      'amlogic,axg-tdmout'
+	      'amlogic,axg-tdmout' or
+	      'amlogic,g12a-tdmin' or
+	      'amlogic,g12a-tdmout'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
