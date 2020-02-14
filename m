Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C95C2BA83
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 13:14:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2370B2086A
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 13:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="saV8FNcv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CGm10tVl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2370B2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FXGcuDCSMlungwe51zv6FHE6xCKOEPtdHL9seLggRk=; b=saV8FNcvAsyEQK
	P5Sau5l+/9cXeRMTLUdsYcANw6rZsmI77HyqXooBOCkv3i2TSBBLQQhiU1qHBAAeNmgsJS78Hc2r9
	ZQYoUvKUzD1y1YI1S+k0L7GA5Itx2TcWlb+jP9zY9iObKnMfA7d0h5p5A0Dn1AJP9yxvz1VsVyZWE
	KPi69JETfPkP3OHy3eBBtLE380EGN4VdB74dsBywN23w3X1audNrlJjZlBCXfFGxcr64viFcW3ZnF
	ThDe8mJGdhCcydS2ntbL54uWZf4/jtAH5QIEfZ4U/1nYHh4N5vEAArDGtwyMVf+6Ucsn+MLHB63T8
	8Z2xuaoZlLke2+cyXydg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2anS-0006Zj-1w; Fri, 14 Feb 2020 13:14:18 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2anI-0006MX-3z
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 13:14:09 +0000
Received: by mail-wm1-x343.google.com with SMTP id a6so10586367wme.2
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2020 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i72FvbEWLa3zDSTR6a7Xw5ZV70drp4oYObx4m5ZAKZw=;
 b=CGm10tVlypJ+HwiqhcWlQuWRUF0hlJcMq8xVEJ/eDxvmAEJlr2zYS4wpbPjcqL+U93
 IhxLuUYVG+v8BsfHZZcmwHPgSKW3F1HmDtVGCG+xnCaht38WxONG0t4dR9tdd7byyR17
 idJtcPQU6ggpfUipTMm8XhXRfGt63U7vymlcpzZ+mWw1XOmcUqqCj3QjmUjeFxoMCa9p
 vFo3+ZbDa/KqK5nsz2gi6H171NGwxr6GSIBNX3lJUicDseGgghPJUkbtw0b/4wl7WvYp
 +LpnDDehRSkXeApfKWk6+WBIxPM8oXcB1uc0NJqotUalwHIaV7UDpcf+UJ3rL6IIFuDO
 i5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i72FvbEWLa3zDSTR6a7Xw5ZV70drp4oYObx4m5ZAKZw=;
 b=SSG22xESnTErS8sHB4BzESKXWIICfB+l2wk9p7VC6W1kQAUXSD9VTLEN4DFeeVFTyr
 IT5L6iVEknS227IODA4Xdfseqo71ZuPrh6J8fpn9vrCf4nCSOUapNUFRB0s3OK3/6eYP
 TgkPFBr6XMX0iMEADjR37FaEaQPCR/+waHylknm96MUzUPngAmCPHpbUZvOR0s1HYYF+
 K7gZkAXp4bKZNrqzo07RrcnYu+EzZtzvWhXfA2Alg5IV0caTsY+j9KNeVix/V64wpb2C
 PMfCBkS4jkZ9xkiN6msWIhfUI/uxgTFd6XiP4ltQMo8+BnAl3VsKtpL817tCM2PVOVIo
 iORw==
X-Gm-Message-State: APjAAAWEzLZ8adApzaMhA9M0/+aThc+FcGp2pHobXoZ3Xa1hhxMN+h6J
 H3MuHEH5ffagFrKcY41YjHhTXQ==
X-Google-Smtp-Source: APXvYqzUVheOHVBk+bnulr6p/1Aot7pY9Y1/9GteYZ9lCoDqBaU0C2n0XPV3QxsnBugGDKHbDB89JA==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr4621941wmi.58.1581686040170; 
 Fri, 14 Feb 2020 05:14:00 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm6760792wmi.9.2020.02.14.05.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:13:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 5/5] ASoC: meson: codec-glue: fix pcm format cast warning
Date: Fri, 14 Feb 2020 14:13:50 +0100
Message-Id: <20200214131350.337968-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214131350.337968-1-jbrunet@baylibre.com>
References: <20200214131350.337968-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_051408_162977_2A1730D8 
X-CRM114-Status: UNSURE (   9.43  )
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
 kbuild test robot <lkp@intel.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Clarify the cast of snd_pcm_format_t and fix the sparse warning:
restricted snd_pcm_format_t degrades to integer

Fixes: 9c29fd9bdf92 ("ASoC: meson: g12a: extract codec-to-codec utils")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-codec-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 97bbc967e176..524a33472337 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -74,7 +74,7 @@ int meson_codec_glue_input_hw_params(struct snd_pcm_substream *substream,
 	data->params.rates = snd_pcm_rate_to_rate_bit(params_rate(params));
 	data->params.rate_min = params_rate(params);
 	data->params.rate_max = params_rate(params);
-	data->params.formats = 1 << params_format(params);
+	data->params.formats = 1ULL << (__force int) params_format(params);
 	data->params.channels_min = params_channels(params);
 	data->params.channels_max = params_channels(params);
 	data->params.sig_bits = dai->driver->playback.sig_bits;
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
