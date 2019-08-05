Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C3FC0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E6B220880
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BZccMVq+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XY6BtsEB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E6B220880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1KsZ/+FGI3ISqAX2aLfbtVedS+dpRWlFuyHogBNRoM=; b=BZccMVq+EsP7iz
	mmsJ/jt2TTiHZtXzpoGJzU7OykhaiDFAom7wQDdUS+bWRZwu/h1Nbj0xK3nvRedREgLZJqbvbg83M
	BPj9y5FPAnmTIbS6+iiEFhY1WhBkp4c/Ndx6FVReaTKIVWBZB4Gpx+/xvXeXlgyZ5H2kcMk7YKUJs
	hG9PBEA3JfatWOrvgaa3kkTTo3faSFaeNYDF4U5BXXV1Aspxx476loe6yAfsjk83aubHPk4pBOebg
	lhw8FYa65zkDut/6SEypvWSFgg8obLmgmGB0Ol4DbveYOosB4cY/uoadQCHvNrCuOIUL3Wo7pQZpl
	kp6/LphTq3oXha40UJUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hudEm-0000nQ-6E; Mon, 05 Aug 2019 13:41:20 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hudEf-0000br-13
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 13:41:14 +0000
Received: by mail-wm1-x343.google.com with SMTP id u25so62702869wmc.4
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2grGK+7b0cBByVRRUu0+TFl4ki5jcSq2t6fD2bzIBcg=;
 b=XY6BtsEB1h0Gtg+bL5p1xMMozbLebyArx8o4E98A64UfAQwGnp5hTTSwxO3wBSrqNs
 sjtDhqO4sss6ywReivGGAP6VbBnP2qbrBZ5RDcxsWDX2P+Q9CaAIWgOrJZQHEH+twJPE
 C/kxG+bLpg59JjLS7HcM/K2Pehm7/j8fiXU6UnxOoJr101ja8u28RuDLs8CT+zvN5Rvg
 2Ns0saVhFskKwefkeTaCx8x6mDEL08r4MclXBIMcTbDgbjKDJp0E1Nz+mXzDNqVCTsRy
 fUbTPcQbKGuYauyamy2q/FlnfnOy4z8lWR0PNpP7fonXJu8qTymVLyzDNFJJVjFG2kGu
 yZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2grGK+7b0cBByVRRUu0+TFl4ki5jcSq2t6fD2bzIBcg=;
 b=sChvvofl+bpee7qTTrY7JQIkAN0hwnSjiqPP/qknq1KR3vTvohDDq7zh8DLbkmLXH4
 6/CD2h2RW5zSkvl3csgYhCNEP2tah9IXmECxVfIbDvtBWc9+ns1wq7FM1g+nWrwkGIEj
 9uTGzU16DOtenVQcd7mqjqgv1FJSAYACePbPbPBHE1zWZ8m6lw1qeKEsxUIC6EC/6UDk
 v8S2Aewbf+jJ7mmdwCR6XCXrKZlkm6pj3NMOHOD8bL+je+98MpSTv5xv/OI+i5KIBct5
 0eeYOmq0DXXh8a6qDz0BcgQuH01ATgDqoDII/i65DH+WgLxG8RmTMggH8GB93aDFu8cT
 BBTg==
X-Gm-Message-State: APjAAAXa9tpLX2dmwwMhZJwfBVS7gwjqNqexX2dxOoYG6lSx5MN+8xqP
 mV5Cjp/RhZBZa15vA1x9Xr9dLg==
X-Google-Smtp-Source: APXvYqxCpcovHfHjK57i7gHO5E0iPm5URGttLvaapaIyenpv0N3qiZvBMVpLedY5JPKCE562WeBNtg==
X-Received: by 2002:a1c:a7c6:: with SMTP id
 q189mr19275733wme.146.1565012471772; 
 Mon, 05 Aug 2019 06:41:11 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 5/8] drm/bridge: dw-hdmi-i2s: set the channel allocation
Date: Mon,  5 Aug 2019 15:40:59 +0200
Message-Id: <20190805134102.24173-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_064113_085317_7654D263 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

setup the channel allocation provided by the generic hdmi-codec driver

Cc: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index caf8aed78fea..0864dee8d180 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -85,6 +85,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 
 	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
 	dw_hdmi_set_channel_count(hdmi, hparms->channels);
+	dw_hdmi_set_channel_allocation(hdmi, hparms->cea.channel_allocation);
 
 	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
 	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
