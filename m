Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC65C34050
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 14:10:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70C5A20801
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 14:10:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LWu+J23C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SfyZK5ow"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70C5A20801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3WsXzuOiqa6RIgAsQNWGjigOu2WNm8vHscvBcb3KrU=; b=LWu+J23C0TTbp4
	3egTMP8Hw0xA3Mxz6h1q6iBZR/zX7JkYJiEqmGv9RcyRf/o2DcN2+meptM0Hn+HU3VhYGXR+YJMDm
	C43Vom9TUSRGDiAd6JD9Hm4H7Eb4kysVN9HaVixFAWWoTkXEtIF/OxT6g+b6+yJZUTH8/bVzWQStH
	bKBqnERueYJP5Ggbx/wgp/OHuoFK0KRnmvud4BJMC05RLYGsTdZ+S8Q6f8EU9noRmtjZUSgtCwJHk
	BvTRiN73Hi9y1MDcbQwHu3qUEAxQQE0sdgBua8erUB9a0sCZp1iznQq4XWxeMNn32mUZ6WJHyW3a7
	h6cXy9zwFZMoFIcDx2wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Q3W-0005dp-Kh; Wed, 19 Feb 2020 14:10:26 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Q3B-0004iZ-FX
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 14:10:09 +0000
Received: by mail-wr1-x444.google.com with SMTP id e8so712624wrm.5
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 06:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RVrXPTZwBbLcZaQ9fhou/L2fbd5WchWNhoBm0tMKEHc=;
 b=SfyZK5owPyqQsSdRWhmTcSJjmleC78ElDcjV+UjXDo+G9awOf67LIinPNyC9+ExkO+
 glEZlTBhGurOG1midLd+rUDFuMKco1SH6LTm1T94IwGLuqBBL/voCT2kEhAfTxMcTIzo
 PCFzdAfkDzPyvUrf6xpyb0WxdDvMpICa7U+etjNUoC5XGdHmD/oUsgFJ9fl+zQqt4cES
 6e5lS7PyZ6dVCsahbh5qwwm5x5lHv6rJq4mdg8pZIt5mWITNWRG03zSCCG4jsszFGvwh
 dp/zMjzvY5nxNsK5ynymDY12dQ9SoO4JNbel4e0RkNIqwa/741tAMGiDtRC551KQ5cVg
 BaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RVrXPTZwBbLcZaQ9fhou/L2fbd5WchWNhoBm0tMKEHc=;
 b=qOFwqEbvkCuSodT8YQeMFIM8yVSoqP3klF2wOD+f1OGrS6rFIk2HdrUf4z0yBdxdtH
 GNjO1itQacFoCVZo7Q/iWYutzfloJ1f/aKGX9UcanFdLeU46ywwsRobqW2Hid5pirEmN
 eZml7Er1PEarLPMbyuDV9bEko4yIo1edQeM0m/PCvsjt+dpSa03+JehUoq0XCq2n3lxw
 0dG0XRKIRciDUUaNANCZwf/cSpDw8B9ys6YNDsJ4ngtk37dcGZasEKM94vM0wEiq7A1o
 NAWLK473lhag2MJjvJT0XOAcl0AWKwmtF9FtHR0nMIbxB0T3eySXK7PD+F283m7K225M
 FWrQ==
X-Gm-Message-State: APjAAAW0zYWWMhZTM0XI7prFX+s3q6YMHIBczbyvdrFRu3O5fm/uoQso
 sBb4lXvmqkgIFrylOeU87MFLkA==
X-Google-Smtp-Source: APXvYqzG5qEyUqHoQ5AtmHYyezCCrK4QAqFgwDEmQK410ch5CMcSCeiuKt5/7DbqU9uDyqAu/vm2Qw==
X-Received: by 2002:adf:f504:: with SMTP id q4mr34534537wro.28.1582121404144; 
 Wed, 19 Feb 2020 06:10:04 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
 by smtp.gmail.com with ESMTPSA id
 m68sm3182789wme.48.2020.02.19.06.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 06:10:03 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Subject: [PATCH v5 1/5] media: meson: vdec: align stride on 32 bytes
Date: Wed, 19 Feb 2020 15:09:54 +0100
Message-Id: <20200219140958.23542-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200219140958.23542-1-narmstrong@baylibre.com>
References: <20200219140958.23542-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_061005_525663_972DF89E 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The HEVC/VP9 aligns the plane stride on 32, so align the planes stride
for all codecs to 32 to satisfy HEVC/VP9 decoding using the "HEVC" HW.

This fixes VP9 decoding of streams with following (not limited) widths:
- 264
 -288
- 350
- 352
- 472
- 480
- 528
- 600
- 720
- 800
- 848
- 1440

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec.c         | 10 +++++-----
 drivers/staging/media/meson/vdec/vdec_helpers.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 92f0258868b1..bfca4c82aa56 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -528,20 +528,20 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 		memset(pfmt[1].reserved, 0, sizeof(pfmt[1].reserved));
 		if (pixmp->pixelformat == V4L2_PIX_FMT_NV12M) {
 			pfmt[0].sizeimage = output_size;
-			pfmt[0].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[0].bytesperline = ALIGN(pixmp->width, 32);
 
 			pfmt[1].sizeimage = output_size / 2;
-			pfmt[1].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[1].bytesperline = ALIGN(pixmp->width, 32);
 			pixmp->num_planes = 2;
 		} else if (pixmp->pixelformat == V4L2_PIX_FMT_YUV420M) {
 			pfmt[0].sizeimage = output_size;
-			pfmt[0].bytesperline = ALIGN(pixmp->width, 64);
+			pfmt[0].bytesperline = ALIGN(pixmp->width, 32);
 
 			pfmt[1].sizeimage = output_size / 4;
-			pfmt[1].bytesperline = ALIGN(pixmp->width, 64) / 2;
+			pfmt[1].bytesperline = ALIGN(pixmp->width, 32) / 2;
 
 			pfmt[2].sizeimage = output_size / 2;
-			pfmt[2].bytesperline = ALIGN(pixmp->width, 64) / 2;
+			pfmt[2].bytesperline = ALIGN(pixmp->width, 32) / 2;
 			pixmp->num_planes = 3;
 		}
 	}
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index a4970ec1bf2e..3f7929c54dc6 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -154,8 +154,8 @@ int amvdec_set_canvases(struct amvdec_session *sess,
 {
 	struct v4l2_m2m_buffer *buf;
 	u32 pixfmt = sess->pixfmt_cap;
-	u32 width = ALIGN(sess->width, 64);
-	u32 height = ALIGN(sess->height, 64);
+	u32 width = ALIGN(sess->width, 32);
+	u32 height = ALIGN(sess->height, 32);
 	u32 reg_cur = reg_base[0];
 	u32 reg_num_cur = 0;
 	u32 reg_base_cur = 0;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
