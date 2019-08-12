Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A36C31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:33:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D83214C6
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:33:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQhbDIIf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XpYjyWdY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D83214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKfQ6tXEtk2gz7d6DGEHMoKF+2bkwzyg/ZraWeFJWwE=; b=NQhbDIIfdH/lQ5
	bC9l8wls8nUjoEFvG+x4djlkT2CYlyoBvMLkNy5/a/VQKIwGhNdMsxHJmqQFSKk1JFmFHSH0IQkmS
	X+ijRrTb+nak3C99CyVmwtwQEB54wJetoqq6zRyz49Vwi3tUJnbGXwfVL3ZeJTaQe6CYxIfKIRt8M
	KxGlR+f0iAWtZ9uHT2g+m27/H7uI0X0zCfkFq1FycmSd1hRpyVpTLJjgl0pPE2mO+eSlPOcasPtXX
	xelp4y1ZmVEtfwaTrEuUwEPH2Q7hrf4Y30W1jheIvMbjuLnVz2L5Fmu6OfjqvGt/Hh2LFi5Z4NQ2m
	rG0uyC1gM82RrTn32aEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx9W1-0003Un-So; Mon, 12 Aug 2019 12:33:33 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx9VU-0003AE-0R
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:33:02 +0000
Received: by mail-wr1-x444.google.com with SMTP id g17so104396142wrr.5
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plGjGyOid1jI+Xxis9Als2EenBhEyLHhPcpZxpUYN30=;
 b=XpYjyWdYBPsfSVDPqs6fexsdgC4vL2x6VRpB6oaxOfECc6Mn2cmm6J/8mSgqpaawLe
 W3P/RY77ybPvnTPMIxOq36v5XwRau6gkHfMlvDqV72+eqoIJVPF6kHoIDGvFiIOBCqDA
 zw0YxxmmDvx0T4x+sVAPSCxL2aVRncYaifq4S63oRnyjBD7JRlN9bVz0hjexlWe+qx92
 8PRyRwf6GVeu2i9C7D9nnDbyh+jNo1l8Ea6i7jHkuXCWjk/pATBN+CqJjI+JIesAcHS7
 zdCym0I/xWqggw9bfpyyXbyqvbiSNRMSASOmfrZgwWBHHxfzbvOBKjjiZ60JUQgXmSQJ
 GKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plGjGyOid1jI+Xxis9Als2EenBhEyLHhPcpZxpUYN30=;
 b=uhCifFv1j2TLKb4EQOwAUwmBeUrxE3CSstoOUQfOj0jjzb7h94J2ABrHHqhFvAg/1x
 O55jKSur/7nXsGlYiJXgPJrvRXGZyzaONLYhwC56pMe+FaKUQ//lsB3H76zwMLzGIm4L
 oFwMABwk1z5f+TF8WnG/2jHbHL2w/r0JoNl8uiBfhuAuVMDcpFpoaz7zXrxorGGClIM3
 zDv2i/WTdgDKA4DkE2l18qU5Dzoft1yM65I3UOwW/j4ZL5BLZvvRkowJJApjsSGw1JCB
 smwkrGJHnu0evaurt6PiaEL+/LjjaPgS5zDAk5unLrIBlz19Vp9kcW0O4bkq6NncSpFc
 cY5w==
X-Gm-Message-State: APjAAAVeJi6P7/yEhHgL6LRNDDEHIvmDkYFKc9eY4g+4Y/Xbb8fePNQK
 ojker8KvSbTMdcoHVruFAkN7/w==
X-Google-Smtp-Source: APXvYqzHIX4tNNjkOMLzgNZUMPelibgCS0O7pJpM5ShGJto2BBvnGspYwSkJjUPqNI0ReZ/bAsYCEw==
X-Received: by 2002:adf:9484:: with SMTP id 4mr13629346wrr.14.1565613178522;
 Mon, 12 Aug 2019 05:32:58 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z6sm15886432wre.76.2019.08.12.05.32.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:32:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: meson: add resets to the audio
 clock controller
Date: Mon, 12 Aug 2019 14:32:52 +0200
Message-Id: <20190812123253.4734-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812123253.4734-1-jbrunet@baylibre.com>
References: <20190812123253.4734-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_053300_049156_7BF3F7F1 
X-CRM114-Status: GOOD (  12.48  )
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
