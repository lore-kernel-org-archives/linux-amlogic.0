Return-Path: <SRS0=R0qk=Z3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F83C2D0BF
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 09:25:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175E52464F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 09:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D/d6cYoV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I/lfkLke"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 175E52464F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oG5rYh9VRwdLCK8RMqVKgxTbG53A++KqphGWc5FJ4zc=; b=D/d6cYoVuOz33M
	tLhaFnzqHYcU3bipjJfbY8abZn4cSNNZmo1wc5KY6rIojpdO4IURB82kvithqC7HkoNrf2uwfUO7j
	gCVZV3nG/+rk/0u78ySAZxV17vRitAZUpB8b1C93GvMepSaGD6B8wlL3mvSqhFfFVhC5eURhRuQoB
	ZgX0nIAY/0+u3XN/pQar0UKkqZMcdXyuM6JxSNyAq6usyGJRW6D0etXSlxGiqu7lgyI8nKj0nBgBN
	LNBUdBx7YrfeKdaCkF1sWX6dJdh6icjOeNasq1OFuuDXix58bV6kyHjuK/CwEPMqRb48CwuMIZSRq
	SaK+ef9q8/9/wsTwo8qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icnNx-0003xa-Iy; Thu, 05 Dec 2019 09:25:21 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icnNb-0002Wz-G5
 for linux-amlogic@lists.infradead.org; Thu, 05 Dec 2019 09:25:04 +0000
Received: by mail-wr1-x442.google.com with SMTP id z7so2517388wrl.13
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Dec 2019 01:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nq23CNv+1Mccfg53lZf4BbmhYzh0ats8L7b+6kh1lhM=;
 b=I/lfkLkec9xB4Lt64wD0JnmL1JPuqJcyEsa4h0hoXOUU/LWyELsD2B6FcUs8hnngLr
 s+iXCwOz//+2tsj4q3jUPAYlFnr0S97iUKEIVw+bh962MrKywBxIUjTHjF4VGEmEXxVu
 CblxxSfJpk6JGELdeXTC1lPCXGZpZRt1miq63dr0M1xsDi7IUpJfGpOe/EuMDXnbgnJM
 Qc58/qbQsGckCR1Kc1OD/KYg1fDFqt+cCX/Kijan7HudoaA1WfcMQMK+a/xiAv0p67PL
 4/gFjYTNRyxXZCX+yStyq4ucTXOkp3V/Ye3YdM2rquaNhy/4TNzxz3RKEkPx3e6p5Va5
 ok6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nq23CNv+1Mccfg53lZf4BbmhYzh0ats8L7b+6kh1lhM=;
 b=hau0HNG9g3cvCdtwccewE6ueH2gHZK7vHSgySlNpAvHO/ftcmCpwh23IVj2K/OrBeF
 PCgJrA6g89HDaTE9utRQz7DwMi9byuyNtE7Na32kHIE/SVQbqKxZ2SaCP9QxtRur/lc/
 pz+POP2gcexNdc7GKx26SdusE5jwwMj1zltPakoaGPqsO1WyTBOGYQYASY5Q0xUKsIxl
 b+1Coa31qPXl4jAOpN4E2Wcadf8uXNQgCMZHHQ8+JG9FN5SFrlM1NMt2d83bA6V1WvIO
 Eab0VH2rXzWPjtq/BwIsbi4JAz+l4XpbozTK3xG6DLDwr8yv0AG6xQs+HvOnApu6RSNd
 nD5w==
X-Gm-Message-State: APjAAAVZymI/r9lVt4LR/qira2VwLOO+YMKEHmKBNMyBNf5+Tg6kczaT
 NwU8GDsZh+bPKNW6Bwe2xZzj6w==
X-Google-Smtp-Source: APXvYqxM/twH277jtVYnEriu835IS5kknyb1j1etNDY9mX3nYl9pJof1Rjwetb+ekuL3yMja3982dQ==
X-Received: by 2002:a5d:4752:: with SMTP id o18mr8664381wrs.330.1575537897807; 
 Thu, 05 Dec 2019 01:24:57 -0800 (PST)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id t5sm11642620wrr.35.2019.12.05.01.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 01:24:57 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Subject: [PATCH 1/5] media: meson: vdec: align stride on 32 bytes
Date: Thu,  5 Dec 2019 10:24:50 +0100
Message-Id: <20191205092454.26075-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205092454.26075-1-narmstrong@baylibre.com>
References: <20191205092454.26075-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_012459_542528_8E23D742 
X-CRM114-Status: UNSURE (   9.40  )
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
index f03d9eba6e23..bd59d32b92ae 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -525,20 +525,20 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
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
index ff4333074197..fc59d8801643 100644
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
