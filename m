Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F00C352AA
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 11:55:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F93421920
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 11:55:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g4/np0ge";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1TOMxkxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F93421920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkMlFTpTC2/K6FlxUhFnuVa55K865slTcgooFittBe8=; b=g4/np0geAbNsOw
	yPxUHzeJyFhUhR4PclMkWFYtKlpfrpXhQQiBOW5QZJfl84RZ1XHSgUAhkDx9rav5oFC0fgNZg0JKA
	H4878eId8x0OH1TvcceozeT2DNI5pJUa96z9uApCKPLXV/ndFtBu+QxYFg/ILNc/L7eT574Ig8LXq
	qRhSGGhv79BsSyuJzeQVjChbM4AACUf0zVsmTbSULsnmezg+TDuf0Y2uUYRmp34CVxyZp6+pHT1Gj
	qgaZ5t+a8sTEBwEJxTpXN2z4g1v1wfknLP7xE3YKI8hLavN1+VI3Y3sDdr+YpOfdymetk8B9tYM96
	tvBdfhO2bsFk5ZrCwYRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFGkU-00077P-5R; Tue, 01 Oct 2019 11:55:22 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFGkQ-000733-2s
 for linux-amlogic@lists.infradead.org; Tue, 01 Oct 2019 11:55:19 +0000
Received: by mail-wr1-x443.google.com with SMTP id i1so15156110wro.4
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Oct 2019 04:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FPzLmAFxVlvoWlrn/cPfzD8ybuBQrABYqNe+NltmaKc=;
 b=1TOMxkxerDcDdYyn/c1uIZ/uj0DzxKShl5K/0P2F20uXlMC/bcb2a9kp/Ml83JiaM/
 nStHdsK13vmQlXn9VMOR42LNGxNuIbd8C3RKY01DILSPwTnSJZGR/oJIbJif6Wsh5K5B
 azww9ja9DlPp8yQY9HjnEPBlvy4DWPiYKLg4WD4eZmfBdUH7IKfDnl9/afRBKvTL9JoS
 I0qZQcB7YwdBvXDPz9CxLqkjhUpsGmE5Dm2/jfNx7d7WqswIM7mGP7KGU7BJswOv3zbm
 mC8y5kAP2rEd71fMe+wi1MWU02bTa8H/oiQ8VPSsSJ4pQVJfnNM9KrTe0bImFosGuLx7
 vnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FPzLmAFxVlvoWlrn/cPfzD8ybuBQrABYqNe+NltmaKc=;
 b=U9rC11m+BhoKDaOLHrd8KtB5uTmxs5vs2UOgG2/BRRh5iHi2ZbgQACJ6nayz+RKFdk
 adzisQYdMVAo1dQ1nO0rhsTz6llEe1nPz20zMpBVB0HOzLHJS72d9Kxq47d0S9iAUMtN
 pJlV2+ELthuTofNCWxW98kWB/QI+zdS2DChvLN2GEyF5vPI7gR2dbESdRPRsVuCEhcph
 14tbb8N5tvV2rBEgKnofqRRApGFbCoZRHMmAz94YL+fH08WWDcMekQq2XYnDduSkB2yl
 bOuRwswH7NhRTjmMdV9KjbTuEOlQciJiV9VvOiL5/w7BYVTpGZVzD+Ov4KR4v6WORtph
 Dg3w==
X-Gm-Message-State: APjAAAXxWqDSOFTKbd6m4eCCprIz9RVuxV1rZyBGL7ZotWvzJ0y5D+l7
 O9Dwz+iYzVcsijPDDUU+FseD5Q==
X-Google-Smtp-Source: APXvYqwRX3j5tvwuz4L808TXtlgd4FkFR2XCdK6+VapPQ5njw/IymdIRWI98q3TvnLuFXi6YyC6Whg==
X-Received: by 2002:adf:cd81:: with SMTP id q1mr18294507wrj.185.1569930916922; 
 Tue, 01 Oct 2019 04:55:16 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p85sm4052171wme.23.2019.10.01.04.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 04:55:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/7] dt-bindings: clock: meson: add sm1 resets to the
 axg-audio controller
Date: Tue,  1 Oct 2019 13:55:05 +0200
Message-Id: <20191001115511.17357-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001115511.17357-1-jbrunet@baylibre.com>
References: <20191001115511.17357-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_045518_121650_8647103D 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the reset id of the sm1 audio clock controller

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../reset/amlogic,meson-g12a-audio-reset.h        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
index 14b78dabed0e..f805129ca7af 100644
--- a/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
@@ -35,4 +35,19 @@
 #define AUD_RESET_TOHDMITX	24
 #define AUD_RESET_CLKTREE	25
 
+/* SM1 added resets */
+#define AUD_RESET_RESAMPLE_B	26
+#define AUD_RESET_TOVAD		27
+#define AUD_RESET_LOCKER	28
+#define AUD_RESET_SPDIFIN_LB	29
+#define AUD_RESET_FRATV		30
+#define AUD_RESET_FRHDMIRX	31
+#define AUD_RESET_FRDDR_D	32
+#define AUD_RESET_TODDR_D	33
+#define AUD_RESET_LOOPBACK_B	34
+#define AUD_RESET_EARCTX	35
+#define AUD_RESET_EARCRX	36
+#define AUD_RESET_FRDDR_E	37
+#define AUD_RESET_TODDR_E	38
+
 #endif
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
