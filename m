Return-Path: <SRS0=0C1t=2H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A1AC43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Dec 2019 11:20:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96BD520733
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Dec 2019 11:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A1gSp7L4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JkP2cBOd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96BD520733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oG5rYh9VRwdLCK8RMqVKgxTbG53A++KqphGWc5FJ4zc=; b=A1gSp7L4I2eH+O
	Z/mFqxYHNZtSauUG2J9Ry6a0XAKCQbYyW2ZqinHX7yOuMjfaOv0XCHLu2d5kRCG2JY6Yw9zhr44FF
	SiJ7FrpMYt/NcIjkNB3jjai1uauleNHpJnU1LZ9nWz6wwfnrVcLZNzM/vnQlsvUrIj94Xt8nYDbhN
	ByDzCQ2lsmIK9bYFMsESbl8+7VHlQ2TnaMIxkftwzLXr3eK0SLF/WfRYNM9aBZDwKUjGJAmXIe3SO
	6wwHqLAqEmgzg5G+DtH4H4jAhR5ISfQ2byLmgPruW6SgGV2T1otjMoBCBvlfwbRpQQbElas7yQmDr
	m9auQL13kxfuI/rprmOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihAtn-0005oj-7e; Tue, 17 Dec 2019 11:20:19 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihAtF-0004K8-FH
 for linux-amlogic@lists.infradead.org; Tue, 17 Dec 2019 11:19:48 +0000
Received: by mail-wm1-x341.google.com with SMTP id f129so2686703wmf.2
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Dec 2019 03:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nq23CNv+1Mccfg53lZf4BbmhYzh0ats8L7b+6kh1lhM=;
 b=JkP2cBOdB1jizFRg1waiD4qV7ueEblfSlWDYkogvCG9zIEqtulTxydzio6qhq9ONoy
 k4KKwRtj8XYwmjolQg1cgjCxQTWEck5bqRQp9Lv6/VgtqUITpWapRM75azFpkFzQin7m
 rX7hfKpVrVGqQB3t0LtAqV1km8r2HQXp6/DaBhgv13tm/DrkNd/TposlDwEMG395qO+y
 r37a8fSNxAv0dLHEx8kN5nY2XD3C0JgwEp8ESHOzdPFsQ5tTjfnu26uHAZis+lGPNAwH
 7cAFBcKAc3mMk3Wc+I5l1ca0JifPkUqH0XrRjK/HaP//pO6QZnjOq7AqikGQ9Vkqu3oa
 wmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nq23CNv+1Mccfg53lZf4BbmhYzh0ats8L7b+6kh1lhM=;
 b=slKPAcHXhipsoL+J06Hk6U8JW7kPUbhCAIMuGnEufvd+Mlw5lk6Jqj6NJZzWnKimrm
 mWqAQPnzIHMCqWaOkc1AcwHm6v4jNPcJWdaP9FqfFEwXaXEjef8ALwxdt2gB3w4Lj6E+
 wGZ6HgCWMymYKNfGfDKYnLsadNv4S39pzQxAmVKtsRHF0Odp7Hl08nus2QE+BIITEGgr
 C9FqAkJutdv3ALqApSCPXeqvar8xDKiCsbEdHJhAFQiRY7cIjB17WRGIG/8tdbhOZYgM
 7fA/4yUm6WrNJ5N2Rf9kifF1+T6xbWphgFh5dG9QTq2ToYYcPUdDzbxZiQ6Fx5nPBVj6
 hp8g==
X-Gm-Message-State: APjAAAVAkQy6Y7Y7XX9LQSEy2Cjb767nxH4UvxYHNPLP4H6zzW/I5qP5
 Ie+Fk8WAO7FvwMhvX6sH83ESsg==
X-Google-Smtp-Source: APXvYqy9goZ1j0cNPEceJSpdmJLFMACjHYGJdKCXZXrKYvBR8MdlhGzlXmaLhM56FCaykJyKN3NTxw==
X-Received: by 2002:a1c:9a44:: with SMTP id c65mr5171515wme.30.1576581582745; 
 Tue, 17 Dec 2019 03:19:42 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id a184sm2713113wmf.29.2019.12.17.03.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 03:19:42 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Subject: [PATCH v2 1/5] media: meson: vdec: align stride on 32 bytes
Date: Tue, 17 Dec 2019 12:19:35 +0100
Message-Id: <20191217111939.10387-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191217111939.10387-1-narmstrong@baylibre.com>
References: <20191217111939.10387-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_031945_509319_969337B5 
X-CRM114-Status: UNSURE (   9.93  )
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
