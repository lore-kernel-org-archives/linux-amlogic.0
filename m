Return-Path: <SRS0=kgfN=4U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B329C3F2C6
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2020 14:38:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D156020842
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2020 14:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nm4STcr6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iNrm0CI9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D156020842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLAdk/g61zcVbhzD1Y0+F/eVw01ioxck7phblWBi3OI=; b=nm4STcr6RJZL8a
	gG1Mw3Pzsqpcl6I+BaK+mMn6yLYpcDxFgKRVZl9HbnsZ3/tJdps1vFXgi2YfGHnW6R1cqZR/6rYn1
	zRPyvqDGusptNGXt/FTnEZsKTlEZRfHi82mQnwfDd/jTK1TLWHxHMO4pJCF4YRL89ni+mOLFGKhA9
	cDvYztD3XlvacY+ipbh/yH2dJAdturUM0t9SHZQEnuZ7f5i0BC1pft24/3s9KofotAJkQKQKNfD8Z
	bNtxL0ttQ5nEyJe3oPnJb7wQ0Z+T7PoOJQLBN2gr8i7MklUnbkaRi4i2H4XN5MP2nnaseKYXqvEMK
	wjdnboyHa/fmlft64oIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j98gF-0006Qq-DF; Tue, 03 Mar 2020 14:37:55 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j98fw-0006BJ-92
 for linux-amlogic@lists.infradead.org; Tue, 03 Mar 2020 14:37:39 +0000
Received: by mail-wr1-x442.google.com with SMTP id j7so4558022wrp.13
 for <linux-amlogic@lists.infradead.org>; Tue, 03 Mar 2020 06:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K5hjg1G3VFJLeuZ62RXxBnJp53DPSao1yCpZ+ZBtBN8=;
 b=iNrm0CI9XnahfkY1GKdbv7m82hqORspH2rHCweh+wIBudNC2ZqFrcVAnaaXt7uDpCy
 eOWYuWZdiQ8nxSKtcUSXqN5o/NCkO70fo22VX8gYL63tV53T+rWuSE9e6mLiaevS0Ff4
 6M2FGsxXj3GoRVu27Q/2kIYiT4RKTrcngLYpiHQvNDqhyEWatZMzY35QMk8rOBe7Wc4Z
 an2h2ylpm7D3382SDTEw7p7Ia3K2fERXdyabba14Lsi+KMozLek0GLJ2GArlVQm9HUYI
 BeI+g3eiumyugaCfnPNyWzZ/uvi0ouNBGZPILG3gzL59aIjyao9pf6rXzpkOGg4NGTMo
 YqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K5hjg1G3VFJLeuZ62RXxBnJp53DPSao1yCpZ+ZBtBN8=;
 b=VRVeREenTWNPiEo/FS89t6GS1h2qZUj/2W4TP4vOdzvrNvR2u4Cg2QDKpC9fd/Q1Po
 3IpypVgfxghx6jIlRytscsFLhuz6lg1WmsNVdYLkOB2GCY28zgEX49LurmoUUdfbFf6Z
 AMhE4XJdSX6giRURtdfURbgu+eUUbu6H/uhKiD/Ngb2rBg4KoxjnprXtGr2HS+Wlqd7l
 wWiYJRYgTekg0dRt6VrOt2IfiNxUCOOaD+ddg1sgCeHBWoPQJTDv5Ht/lpydauEK6Akv
 qDzGp1mrTPfRqNBLcRcnjkIdfrKoQn5UIMjkoiZWCgNtAVTDDCd3ls48t9R5rJVfcDDB
 5Ssg==
X-Gm-Message-State: ANhLgQ0KDuOm/aCAuxsIB76s0Q+RqjOtoueFhcWZiyCDbcwn/KiSobIA
 jQSzFEWs5YtpReuu3i162r6V3Q==
X-Google-Smtp-Source: ADFU+vubH5FvBdZxArVu9XQq+51wNWYXHqzexBNcTn8d0oRpiHzqnZXe/qfgWED/LdX7eNM+kJIlAQ==
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr5635176wrw.319.1583246254899; 
 Tue, 03 Mar 2020 06:37:34 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l4sm4652779wmf.38.2020.03.03.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:37:34 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Subject: [PATCH v6 1/5] media: meson: vdec: align stride on 32 bytes
Date: Tue,  3 Mar 2020 15:37:28 +0100
Message-Id: <20200303143732.762-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200303143732.762-1-narmstrong@baylibre.com>
References: <20200303143732.762-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_063736_321548_6DB5F950 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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
Tested-by: Kevin Hilman <khilman@baylibre.com>
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
