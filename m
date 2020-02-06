Return-Path: <SRS0=So4j=32=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199D1C352A4
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67D4222D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pn2sZ/ni";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jIEgyffu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67D4222D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uaIquB4gGY0eYn30qGkq4rK21sYtG/ZbaVyh0M7rPk=; b=pn2sZ/nilxlLM+
	RrA1JGSdnvX5L9gnHTOLEtiaFI7lkn19QRdtPhxcy5gKXOJXRe5TWm7OK4Cz6vJo6ZJBqP5VL2tzk
	Hh+qA2jJtB+3S1g8kQe3OukzyyMWSAb36CBRFCge3SCAO2Kre8mduvSREcQ1D845Jq0gjaAL1WUyE
	EJGoP8dqZNACOb2+TXrpH/JflPNyhfTHfUvcvAfXCWofTwL8B76W2rT4FvznGg9HzTOyDTBZtjzqs
	SUac5y228wGTo9kKCOkVszVE+S5T7EuwDXuCZI4EJ8eKLN9vk+PyTVqlcDDoeus5XUVZSgOA/1P7z
	eK4jwWnnhyFmYiWxO1Nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izmfm-0008Iw-BK; Thu, 06 Feb 2020 19:18:46 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izmfi-0008Ec-UZ
 for linux-amlogic@lists.infradead.org; Thu, 06 Feb 2020 19:18:44 +0000
Received: by mail-wr1-x444.google.com with SMTP id z7so8536205wrl.13
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Feb 2020 11:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0g5Mh0a78aE+slLRezbmkDONRPTkqMWKBMePAh+3KlQ=;
 b=jIEgyffuVibQCcxof6bK7UZux67UyEapZihOaFD5RcCLtYAM415gbl+b2IgTkEJEvq
 /CHcnb8leeCz/qGnFD7VawZJ35dzdM15lB3ifg2Tq/NqTXsgfyX2fsj9t5C494aNJhYE
 pe6Hs0gknoOBaQWpSi95SPt8YSRGCteP5kQFil5/rm3CVo1DpH/nziVTbk33LzlpZIt9
 td0yuhnM20waWn/D+BS0sFJMnMPglTEcmh25grwiBCULI8TECk/l0vnsN1E/JOuOF+TO
 8yXFgbNApsOqeamcvi+UI4Y279iHxaQPPiPYKPEYoQVnuv7nT0esLBfMGnmCrYSoaisB
 DjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0g5Mh0a78aE+slLRezbmkDONRPTkqMWKBMePAh+3KlQ=;
 b=anBE8aTKEZX5EW63iHt27S0lLrmuTyE6IG6b8EfC7Jj0H3nLWYcdAq3v0ZbJeq9HYj
 GlF0wjTusIRPeYhzHYB2KK9NX6dItGLWln4XIJ2VULwFjskShoxjlOmusHpUEhuZVorI
 ZqnycxXZBsmaYbplh3EMvOnr6tbjz1FD3pD5O7ItpGXzVgC0lJTNUaed8nLTFspLac6s
 YbW2ahrKc910W1rqDJX6w//Vylxph3GZM8l82z7QwyePU/J1Ay6tjtm08/ZwprWF10yt
 /wfXOCzDRYZF9dQAKYRqpIOBkZAf/kDBvMSwZ8zg8XysatiHjXUbdimXp1IMPs2t32o/
 TMTg==
X-Gm-Message-State: APjAAAUUynurw8a8Va/oXXDZpfACZakky29R7TRWQ39V3B0IMF2I0jvL
 PFymOTTeMGQ2wFggmVGSRpUclw==
X-Google-Smtp-Source: APXvYqy1Eu383ojtVuMTe4GlaMccR2VzKV14GruGHGYGabKmoxhKDRG84mifGs+gI/xchtHoZecR9A==
X-Received: by 2002:adf:9b87:: with SMTP id d7mr5552131wrc.64.1581016721267;
 Thu, 06 Feb 2020 11:18:41 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:40 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 03/11] drm/bridge: dw-hdmi: Plug atomic state hooks to the
 default implementation
Date: Thu,  6 Feb 2020 20:18:26 +0100
Message-Id: <20200206191834.6125-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206191834.6125-1-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_111842_989031_6EDCCFF0 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 051001f77dd4..fec4a4bcd1fe 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2494,6 +2494,9 @@ static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.attach = dw_hdmi_bridge_attach,
 	.detach = dw_hdmi_bridge_detach,
 	.enable = dw_hdmi_bridge_enable,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
