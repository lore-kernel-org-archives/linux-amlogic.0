Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E27ECE587
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 12:39:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B2432089C
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 12:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lrnvlHNQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ky997XRI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B2432089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2meNbOfa5ro3ENj2oKBeC9tOEeznbGKq+tZUNhxFEg=; b=lrnvlHNQDshq9L
	F5N/LacrWR+7iQ7n5oDRy8s1mCRdg4MdqidXCEdAV8gde3a61GGDprGUCAo8IJbjN+UkXTVKmite6
	73GkIxqErlqm329N7UQH1xIohO4QYAtONTeRsR/804+FMlNy75t9sazJcTobz63vUZZgbKDctCdPM
	wR+jbLhCYG7vacOtGkVUHxQZagj8/HWnIe+BdkRjLkbIBD9evqiqPuBbxIBpOyUvPKANxGr7f9JCZ
	ifmZSANlpKmuwSNqG6kwP5gqFHe1pGPYlJMOw4wszt52PUu7Cx/vcl5v6Sl5izlrdNZcb5chWOlSs
	3q4CrtwZrPaJJH8NGSCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJzdO-0000QL-VP; Mon, 14 Oct 2019 12:39:34 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJzcQ-00082o-7H
 for linux-amlogic@lists.infradead.org; Mon, 14 Oct 2019 12:38:39 +0000
Received: by mail-wr1-x444.google.com with SMTP id o18so19497867wrv.13
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Oct 2019 05:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=ky997XRIQt2f5E94jo8Ad4UADpcpymsI40Ut9P/rKg8HSRGnyFKZM2UDsfUtXxqOQ3
 dj7nMQi4IPsnIDnKJ5h8+hp93S0xQUPpoqMQEnlHaTbCM2/dc+NADw1taElaADL9C+qU
 SbE3aFnFYcKp0S/WGIcltZZV1KplmV2jKY1uTfcVpVHpOsmsaXw4bK8oWaK8HSPdpuCu
 5ALKEnzp5vA6mRgI60mPbfkMNix7x8EY4YPpGN2SIVSbJJ9F8Y1I2rOf4Ij3Rm5TsOfW
 tcLkaO2ysImc0kitgHBPQFkIhtRd3HivvdBggacn3e4Pe1kmCeDy+zrxyIW9/nuBoVvl
 NTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=V/x3bTLzQpHnSMqAOPTXGLkcegHmTum0XvObZnH45qEujwVxSssj+9EEVfEb5FEgch
 1qQh7aIybcMsumAI1xJQh+b/OKSedKb66drxg17qq97dxtH8buBVOxunFFDpe+4KNJVS
 AGr9NuBjBKBOrBXdgaeNL51B/ie7aaT3CnsvP3aY13PzwJleOUZune7Nri+FPee+cwd3
 2Jtx6+ZM3oZ7PlFJ20kOeS+f4t7g/Frc/uO4+2cGjmmuBJA8zxgO2/0Q911J3qd28DmO
 rQPLG/dIfikYj8OBFNJ3T0gi/OBfDXRNr+3YS1WfHwciXlVLUKXN2qsgMhyaZC5h5r6m
 Xqzg==
X-Gm-Message-State: APjAAAUCEYb2h87SGD4aPLkwfg3SdK5AViam2wWlpEkGwYhNaaGYMq30
 w74rI7mUyJBUT5gYvi1G9Kbg7w==
X-Google-Smtp-Source: APXvYqz+FgWNXKrCNOXoVmPUuC4i7xprw0Czm06Vdv+ea21YC90NRDy0PnWiGTBp87e54R4LMiZMrQ==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr10203757wrs.158.1571056712727; 
 Mon, 14 Oct 2019 05:38:32 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 3sm19171203wmo.22.2019.10.14.05.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:38:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/meson: store the framebuffer width for plane commit
Date: Mon, 14 Oct 2019 14:38:21 +0200
Message-Id: <20191014123826.27629-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191014123826.27629-1-narmstrong@baylibre.com>
References: <20191014123826.27629-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_053834_257292_A46AFE4B 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, ayan.halder@arm.com, Brian.Starkey@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Also store the framebuffer width in the private common struct
to be used by the AFBC decoder module driver when committing the AFBC
plane.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.h   | 1 +
 drivers/gpu/drm/meson/meson_plane.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 820d07bdd42a..3287282450a9 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -52,6 +52,7 @@ struct meson_drm {
 		uint32_t osd1_addr;
 		uint32_t osd1_stride;
 		uint32_t osd1_height;
+		uint32_t osd1_width;
 		uint32_t osd_sc_ctrl0;
 		uint32_t osd_sc_i_wh_m1;
 		uint32_t osd_sc_o_h_start_end;
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index ed543227b00d..5e798c276037 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -305,6 +305,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	priv->viu.osd1_addr = gem->paddr;
 	priv->viu.osd1_stride = fb->pitches[0];
 	priv->viu.osd1_height = fb->height;
+	priv->viu.osd1_width = fb->width;
 
 	if (!meson_plane->enabled) {
 		/* Reset OSD1 before enabling it on GXL+ SoCs */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
