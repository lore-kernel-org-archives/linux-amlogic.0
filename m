Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792E4C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpsYPsxWko63gzltOJkepmDi9lpd+OiLpiu0a6xxXgo=; b=4wa3LG4zxC6Epr
	3ttsqQ103sWIyxQ21DEw3cR5j9hBdPME4C4FvYHpQGQzKG69n2VPEbZa2qTUWQCEczBvbNtdMO1iV
	OcitOPSOYpW06CxjfI4bxg/FvYnboqyTkppadE4NHVX/nLnoSXLLrX0mvebm3VjY6a5xF4MoRPNiU
	zVp0Om1M6aEAh1X5JpR3+weu5Ghc38vPkUd2NMbZ3BrF8WKrPolcawD41WUTWdE1OLI+1BriTSdOX
	ucgjUyWVhx/9QKph7qtU+sWrmLdnRpdpsCg7QvoetPGJmWLlPlKWKqwKB+6pnM0rI0Q9ly1Mzgxgc
	dOpXXz8aRX2i9/4qP6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUX-000000098ng-2O0v;
	Mon, 13 Jul 2026 12:10:33 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUT-000000098lX-47VA
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:10:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2574626b3a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944629; x=1784549429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0g+WRe3x8NF1Lsmp6BpHJTM0uwdyJj9zKy0hm9x5WoY=;
        b=mwZS+uiNuDAWdFe2D0rACYVJsGdRugi78eZMoqt7FL2EQcMkmvi0KBVIkDySEWLyfd
         LhlgoRR4S11OQKeNhOMZw3Qm74cWWvg2BEAX/is93GC86FIr0PSgaSRyWL2t74N0mQj9
         6qn1xVWNbUGEVV1aLnL6pVh+/cHGSWp85VlpQ6AkdJg2cwCUn9mnQomkkvTlVn/Zd0vl
         zMMH/PjP40hlSIWS0iidLqHtLF2Pnc6BJDcfkyER89lz/eXWCPLJMLZNkT9lvHI3ECQw
         CuNqXa7iKIn88xANnIfZCQuYWJ7UFRxPVeEvPKz+gvZ/lxMYwjaClQSBJZBPyu3gKFiJ
         SlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944629; x=1784549429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0g+WRe3x8NF1Lsmp6BpHJTM0uwdyJj9zKy0hm9x5WoY=;
        b=PNXBWW5lpRaTnyeIPqdgbyrJVb0FFxAUIZlSkzlg/JP+RB7l6/9Mu10nU3p96xGpQw
         xf/rAJ5b3xYKut8KhuE+pjUD4QpsV2JjXKVWRU61MtkyN8YxUOpg9c2teiDCb4YtAPnH
         2XxzrrroklnZzROobcWf40Qq/qfUwy3/klPMkEpLXqzQU0rrX8+Bx4giX4NPVZNaXeQn
         2L54t/Y+0BFolQeYOoA5yQXxHA6BT6ferxp+WW2gQhcWol2OfSQbRs4v6nBf5fRq2J6d
         JymU29jtgkGZF5W8IfdR0Mp1fQ6SVD+/79Vnd6vas9Tx073T/3vawReAyfoR0IptwLGE
         kyRA==
X-Forwarded-Encrypted: i=1; AHgh+RrLV66RUEZikN5HIP7AnC/HqNV0g6Nn8DBrW/LoQrPadZrdVLdGlOJ6TwYDZewiNZjdp8KBEdF0dUASnN2F@lists.infradead.org
X-Gm-Message-State: AOJu0YyL56mmGtL9nXJgQP5FI4JU2548aZ4Fp7oiPElCiHKxXFj2K1n6
	diMRV5FhcNcxSddTIEUaV59AUlJGvpi7LLaE9kRlmIozvgG7IBLwLGvS
X-Gm-Gg: AfdE7cmEWYRc4n1gAksG+N61M6Y+vNEpZwZhBYnCYMSgC11lT7uKPIFIGaZi1ecEaF4
	MWD+CrRByR49dIM2O7tzhPwdJypLNV+ouoFOM1hrQn73A3ZT7Mt3c2djz4graiGeZwv06oDC/cB
	/9WgMglW8H424UrFdsHfmU3eI1AoQOcc809PYvibo6pT9k03XPg1145yCvhuvJRAKkyrSMGp+KI
	QB3Tf5pnhXdTL4GXgqIZYrlnXWMUhygfz/0cApz63BYk2xJ4+VkRnA6gh2thX7GU/TKYCdy7b25
	siKrZkbNrP6Fbf0wSbx1YGAtJIvHV8t5Gnp2sR1mURSzENUKwVYRsYXazs1OeWnGKbzBp1YnOpn
	FAjFP3P5JE5aflDYfsGlyOyelzb2e6EWlMXauhJ/T4kDC+vICj0AZjtONoZ8fOR82wnyuC7p6ft
	fxpsZEntED2xG+/F8nGsvc
X-Received: by 2002:a05:6a21:6088:b0:3bf:9fc0:f6c2 with SMTP id adf61e73a8af0-3c1109ec872mr8713076637.11.1783944629120;
        Mon, 13 Jul 2026 05:10:29 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:28 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 09/19] media: meson: vdec: Fix vp9 header update failure on invalid payloads
Date: Mon, 13 Jul 2026 17:37:04 +0530
Message-ID: <20260713120840.17427-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051030_026496_CB365A57 
X-CRM114-Status: GOOD (  14.58  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ensure vp9_update_header() returns an explicit error code on invalid or
malformed buffer payloads instead of silently returning zero.

When v4l2-compliance injects short, empty, or uninitialized test buffers,
the validation logic catches the out-of-bounds size anomalies, but
returning 0 tricks the calling esparser infrastructure into treating
it as a successful 0-byte header conversion. This causes the hardware
decoder engine to stall out, resulting in subsequent stream-on timeouts
and failure marks inside v4l2-test-buffers.cpp.

Fix this by returning -EINVAL across all validation and bounds check
failures to force immediate core framework buffer drops. Additionally,
tighten array pointer checks, secure the mag_ptr bounds loop, and
convert the superframe parsing indexer into an explicit if/else block
for readability.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 959673742e699..edbfc829e2da8 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -97,11 +97,15 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
 	unsigned char *old_header = NULL;
 
 	dp = (uint8_t *)vb2_plane_vaddr(buf, 0);
+	if (!dp)
+		return -EINVAL;
+
 	dsize = vb2_get_plane_payload(buf, 0);
 
-	if (dsize == vb2_plane_size(buf, 0)) {
-		dev_warn(core->dev, "%s: unable to update header\n", __func__);
-		return 0;
+	if (dsize <= 0 || dsize > vb2_plane_size(buf, 0)) {
+		dev_warn(core->dev, "%s: invalid payload size %d\n",
+			 __func__, dsize);
+		return -EINVAL;
 	}
 
 	marker = dp[dsize - 1];
@@ -109,13 +113,16 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
 		num_frames = (marker & 0x7) + 1;
 		mag = ((marker >> 3) & 0x3) + 1;
 		mag_ptr = dsize - mag * num_frames - 2;
-		if (dp[mag_ptr] != marker)
-			return 0;
+		if (mag_ptr < 0 || dp[mag_ptr] != marker)
+			return -EINVAL;
 
 		mag_ptr++;
 		for (cur_frame = 0; cur_frame < num_frames; cur_frame++) {
 			frame_size[cur_frame] = 0;
 			for (cur_mag = 0; cur_mag < mag; cur_mag++) {
+				if (mag_ptr >= dsize)
+					return -EINVAL;
+
 				frame_size[cur_frame] |=
 					(dp[mag_ptr] << (cur_mag * 8));
 				mag_ptr++;
@@ -140,7 +147,7 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
 
 	if (new_frame_size >= vb2_plane_size(buf, 0)) {
 		dev_warn(core->dev, "%s: unable to update header\n", __func__);
-		return 0;
+		return -ENOMEM;
 	}
 
 	for (cur_frame = num_frames - 1; cur_frame >= 0; cur_frame--) {
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
