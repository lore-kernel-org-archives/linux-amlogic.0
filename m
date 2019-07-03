Return-Path: <SRS0=97z3=VA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98FCC46478
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 12:26:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88D01218BA
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 12:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MGe8gjbz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vKwjNK/h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88D01218BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKfQ6tXEtk2gz7d6DGEHMoKF+2bkwzyg/ZraWeFJWwE=; b=MGe8gjbzaqJUgC
	t01vDCSic82YyoOQ51G6dZHPDG3o6mPupumrYEN1oGWf7NZWFQ5+VYb27m44dVCrwROcYI5eqUg0N
	TbgMUon/6bABE6/iyZlSp4lk3BAxbOBfY+9FSeQfkAjk3ZKne/cLVpm5k7aVlsSW6tp1VZn1Eya6L
	1mndUquzOSfphPLp6+GjotbFoyY9qJahChsYqlP73xFws+7mNZhjLdkej+SvNkCf2BMUOqQZu4ZAB
	4QvA/E6OHKU9y8OUa48L7C8wJBrEMgL1H4PagbvFXhdoTD+pdPC09HQfbUUmzOySyUmU9gTyTGJX3
	9nMXCbgtdvgwY+fsoI4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hieLE-0003qm-8w; Wed, 03 Jul 2019 12:26:28 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hieLA-0003oW-WB
 for linux-amlogic@lists.infradead.org; Wed, 03 Jul 2019 12:26:26 +0000
Received: by mail-wm1-x342.google.com with SMTP id x15so2005946wmj.3
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2019 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plGjGyOid1jI+Xxis9Als2EenBhEyLHhPcpZxpUYN30=;
 b=vKwjNK/hbuj6CRQyXmuujsWGLSTqcTiws2yP8LSdxlJtYieRupvb/tstkm0v5ucpoy
 DLpHwzTi00otlUo6DokRJOPR5J/p/RZI63uNqAGusirRv93U+drv1lY6fDhVtuCo/4XM
 4+fumzfXgWgThbkFfyKfdF24HsLshbXFCe5whSS88ST24f3VZJ2sZOIQjj+pt0kqX1oZ
 cvARhlbm8Q52SR73bwi4J7gDhg/3Qcwt2teLzkl94He8lRjO25Eae31tJ+uVIF93V3x0
 s9LEIT3KkZsss+DitpyzKUALqapb8sLePy/fqGvXgf9fQ8XXkJwj2URsmlbhXxU3JhTa
 ukMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plGjGyOid1jI+Xxis9Als2EenBhEyLHhPcpZxpUYN30=;
 b=HnJ4J7k6WJLD6ctS3+N82feIZ/CUHpQ/nvv0pJBn2kP48K9ksttOB2Uhb1tIrFDaVw
 19u/qi7uF/P2uswjuilIaCkggxUExRYs3CbxBnV/M/Jo1u6kcAtyb7wm8KdqBd3piKya
 Iv2/EzNCV7+pCxshqROZ9jNziykI3qYTArHZ8/Bhhzmudbei/05SVsMXrJJxIkJVy5i1
 yZtbzoP4bAZhlcyXyEDnXUOHjCunNR5rlNxi1yIJgjoBF4jOKlWJnNCl4mcJoEq547uh
 47apqP6w5JMXQGsJ2Xj5vzQn3z2JB7t4yP1dXdJ90r2bSD1AiLKKgRDtXxXqf79eT1Q5
 D9Pw==
X-Gm-Message-State: APjAAAVnS+/02aehn67p5BY8rdF1zifQirFSFZ/3JUDs3vVOL8xC9h0E
 qsS0I+N7f+8fJ0xnD7BNIYch1w==
X-Google-Smtp-Source: APXvYqxekxAtRSw1KL+dcb0nQEkMKDJSI1lDzUIG2OBv7pXWrxalbz0a5fJ1T3HDFVQvQuZzrFX8lQ==
X-Received: by 2002:a1c:630a:: with SMTP id x10mr8506501wmb.113.1562156783223; 
 Wed, 03 Jul 2019 05:26:23 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id v67sm2868132wme.24.2019.07.03.05.26.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:26:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: clock: meson: add resets to the audio clock
 controller
Date: Wed,  3 Jul 2019 14:26:13 +0200
Message-Id: <20190703122614.3579-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703122614.3579-1-jbrunet@baylibre.com>
References: <20190703122614.3579-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190703_052625_033441_B67CC9CD 
X-CRM114-Status: GOOD (  12.39  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the documentation and bindings for the resets provided by the g12a
audio clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.txt |  1 +
 .../reset/amlogic,meson-g12a-audio-reset.h    | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
index 0f777749f4f1..b3957d10d241 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
@@ -22,6 +22,7 @@ Required Properties:
 				       components.
 - resets	: phandle of the internal reset line
 - #clock-cells	: should be 1.
+- #reset-cells  : should be 1 on the g12a (and following) soc family
 
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
new file mode 100644
index 000000000000..14b78dabed0e
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ *
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_G12A_AUDIO_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_G12A_AUDIO_RESET_H
+
+#define AUD_RESET_PDM		0
+#define AUD_RESET_TDMIN_A	1
+#define AUD_RESET_TDMIN_B	2
+#define AUD_RESET_TDMIN_C	3
+#define AUD_RESET_TDMIN_LB	4
+#define AUD_RESET_LOOPBACK	5
+#define AUD_RESET_TODDR_A	6
+#define AUD_RESET_TODDR_B	7
+#define AUD_RESET_TODDR_C	8
+#define AUD_RESET_FRDDR_A	9
+#define AUD_RESET_FRDDR_B	10
+#define AUD_RESET_FRDDR_C	11
+#define AUD_RESET_TDMOUT_A	12
+#define AUD_RESET_TDMOUT_B	13
+#define AUD_RESET_TDMOUT_C	14
+#define AUD_RESET_SPDIFOUT	15
+#define AUD_RESET_SPDIFOUT_B	16
+#define AUD_RESET_SPDIFIN	17
+#define AUD_RESET_EQDRC		18
+#define AUD_RESET_RESAMPLE	19
+#define AUD_RESET_DDRARB	20
+#define AUD_RESET_POWDET	21
+#define AUD_RESET_TORAM		22
+#define AUD_RESET_TOACODEC	23
+#define AUD_RESET_TOHDMITX	24
+#define AUD_RESET_CLKTREE	25
+
+#endif
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
