Return-Path: <SRS0=mJnT=6M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C27AC83000
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2020 12:51:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0126D206E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2020 12:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYV67QNr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CJ1HWPYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0126D206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsHw6KBcCNwCnEmmQzS2W4NEg1AvanyecbkXOAk2qeU=; b=ZYV67QNrinO/t9
	nnCTx6pOFfMez7JFoALxr0aF/hYqCaad8hhwvA/6PjdXDenx5qHAhETg/Lgs6eghKKuB/u6/GvJ7c
	utMHbznJat8aiLKZ8harlmqXbfnBRB+ckrAGVKhM/JWHd2iuyCWVO7W6C80h4uDawHnXoGuWBK9Gc
	r67zpuP6Pd9CadQsVQuyL7koN+JlwZdjFbWc/ISkRkdWjKxSpruFBuO7deoNdVDkAp+4vYEFqqG0/
	WytHEfaLKN4Rrg2f1rA1nkff1exvifK4VvXlPWgR+dlcf/FvCQ1q1OmIAl4Xz/YLvvmXuMgXFpoE9
	6oq/qPaz6q48wayGQrzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTPhz-0004Yd-Ca; Tue, 28 Apr 2020 12:51:31 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTPhG-0003zZ-Pr
 for linux-amlogic@lists.infradead.org; Tue, 28 Apr 2020 12:50:48 +0000
Received: by mail-wm1-x341.google.com with SMTP id x4so2623343wmj.1
 for <linux-amlogic@lists.infradead.org>; Tue, 28 Apr 2020 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bS1/sm0XxWUvP6abjHta7A4TuogN+Inw+AeKvST2rX8=;
 b=CJ1HWPYa6lmeaiOGvITpPEE3yiBBS9ByoXcQet3Ewn7USk0P0L2v6kpGBwwVeAbOFj
 qaBVV+2OJEDE3NPzqfV0vm9K7As0NHUxa311IdVrZ0pNcKclHW8uy52KshOBmizJ76OR
 E5ENb5bdFQpElej+VSUYUYv5G481/tNKYFDrFNRmgE8Q9ZlHsaJghyhsFWqQeTDquklo
 BWc5H2O0F69bpTAjwrPRdszY3TXrWFrhiY0PUV3y+GQn496C55TBA4HzmO8S0+QZlwb0
 FF5/Yl8RbGFzq3a1GgtEp/vrOkdCDp1AXaM4Myml+k2PMAu9Etnoy8vqrKYGEaUYRy4N
 jsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bS1/sm0XxWUvP6abjHta7A4TuogN+Inw+AeKvST2rX8=;
 b=oOrsjmd4Vgua7uBqcKNu7U4e4XmnPFSEziIyiy3wFzs+K3qSgEeAWPinAG9IKdbrJu
 r4H2rhpyGU9CmE1nJ/vcpaIgm78dYir5GOCdg8smITYcN0J3qh2gW5CFx4XtL3429W/v
 DQO2UGLHusQGzrOFArdc8Sd1BOdOgg62qfUywj7swfmYCWorIs8L2dDpcoVhA6IEPyaP
 Y1zj/y3NHGztrlr98pAwAGfLWxBLIWkNzWqCY6DZD+TQWzma3dsjvK6GYO/2YfLQnt2M
 n0sym4S+XhnC1RIkYiC1zP9kSYzBkPyUreJKFdrJXWGBvMcQB0tkilX+FNqKNTqhYYm1
 DonA==
X-Gm-Message-State: AGi0PuZbkUyXrNp11rbTp9jracgPYrtmr6VDXQSQPokFty1wjFBXJQ3A
 waTorn8joc68PWAlNtn2/JPg6Q==
X-Google-Smtp-Source: APiQypJ5w0jIkk9TNeGTgbLsSl7iD17zkDITUusCBji+wndwzT9z5UrwElq+jr6HWA18Jr9/fIejuw==
X-Received: by 2002:a05:600c:20c6:: with SMTP id
 y6mr4328740wmm.131.1588078245188; 
 Tue, 28 Apr 2020 05:50:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id
 q184sm3246115wma.25.2020.04.28.05.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 05:50:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-media@vger.kernel.org,
	hverkuil-cisco@xs4all.nl
Subject: [PATCH 1/3] media: meson: vdec: enable mcrcc for VP9
Date: Tue, 28 Apr 2020 14:50:34 +0200
Message-Id: <20200428125036.9401-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200428125036.9401-1-narmstrong@baylibre.com>
References: <20200428125036.9401-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_055046_839566_DBA8FCA5 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

The motion compensation reference cache controller allows caching
parts of reference frames for faster decoding.

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 60e4fc0052b3..897f5d7a6aad 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -854,6 +854,36 @@ static int codec_vp9_stop(struct amvdec_session *sess)
 	return 0;
 }
 
+/*
+ * Program LAST & GOLDEN frames into the motion compensation reference cache
+ * controller
+ */
+static void codec_vp9_set_mcrcc(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+	struct codec_vp9 *vp9 = sess->priv;
+	u32 val;
+
+	/* Reset mcrcc */
+	amvdec_write_dos(core, HEVCD_MCRCC_CTL1, 0x2);
+	/* Disable on I-frame */
+	if (vp9->cur_frame->type == KEY_FRAME || vp9->cur_frame->intra_only) {
+		amvdec_write_dos(core, HEVCD_MCRCC_CTL1, 0x0);
+		return;
+	}
+
+	amvdec_write_dos(core, HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR, BIT(1));
+	val = amvdec_read_dos(core, HEVCD_MPP_ANC_CANVAS_DATA_ADDR) & 0xffff;
+	val |= (val << 16);
+	amvdec_write_dos(core, HEVCD_MCRCC_CTL2, val);
+	val = amvdec_read_dos(core, HEVCD_MPP_ANC_CANVAS_DATA_ADDR) & 0xffff;
+	val |= (val << 16);
+	amvdec_write_dos(core, HEVCD_MCRCC_CTL3, val);
+
+	/* Enable mcrcc progressive-mode */
+	amvdec_write_dos(core, HEVCD_MCRCC_CTL1, 0xff0);
+}
+
 static void codec_vp9_set_sao(struct amvdec_session *sess,
 			      struct vb2_buffer *vb)
 {
@@ -1267,6 +1297,7 @@ static void codec_vp9_process_frame(struct amvdec_session *sess)
 
 	amvdec_write_dos(core, HEVC_PARSER_PICTURE_SIZE,
 			 (vp9->height << 16) | vp9->width);
+	codec_vp9_set_mcrcc(sess);
 	codec_vp9_set_sao(sess, &vp9->cur_frame->vbuf->vb2_buf);
 
 	vp9_loop_filter_frame_init(core, &vp9->seg_4lf,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
