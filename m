Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015D0C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oOr2/+zg1xx3gTN7GQ2oudQezomZXWExqYlQP0oueA=; b=bFQrE+/TZWLpSb
	2hmMqzPz85HJP/QvekhD2/HWzReEs4qPGxtpmefWFk9iRna58YvT8oudSwIeEqw9Yq1T0xFuMXn0M
	Jvgh3rCPHmDFFwu70Ye02ya8y0OBqX3ZBkWIWLA4Ni/wwjv4SjEzeXeXn+YMK22EtIncyvmywvaRW
	N+ltT0xuezzUU/b3gscA2fEnBPLJJPSVlyKiDZBrwSbB/3jak1henOy7+tTj18CZvY+yW/ZHLBfXx
	Ubv/db5F/qhA1UEOM3r+XG6bS2CQ+Uf/f+rZenpDc8LGbT5w3SjR9n2BqOGs/WLypWzpqPQ8Fkas9
	wldjQw+LDzdl6vVJU/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUj-000000098vY-446J;
	Mon, 13 Jul 2026 12:10:45 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUe-000000098s3-317w
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:10:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2766432a91.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944640; x=1784549440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GCAuneNa/1gKb9DW8CBD7WKj6dTVzcbk/e+PXY8YBw=;
        b=HmvMGpeov73hGdUdtJWHBFSvanwO03bQScU2R7cdZOpq4GSJRIwJOV9m9c6uloIheg
         uGdFbYOpeNURJxq2Bahhpg7lpbVZEkKAZKGAMDo8kJtL1R0ozSq02ZpDJMNqTEuLu8RD
         R00iY3l2n//YxNBolg1QiRycLczSDFA19eGh/LR7VjeH3dXfSp4EN8NN3GosTAhRXM4O
         G0ueUxsjNzG+8b5uhMhF0bObSYaxpprseuyCX6f/ShyxnvytImNdhhwk9D1jTJppyZnk
         zgZiYOeTIg1x6D2q4p4RShH9ryg3G/cPKH787P3PGyZqgamclkgFjdcNJR8K0TLCUT8i
         +0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944640; x=1784549440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6GCAuneNa/1gKb9DW8CBD7WKj6dTVzcbk/e+PXY8YBw=;
        b=MeQYCRUic7aUBoEF6nx2VtRpleZD5J0XdiV85zL9ZsF7vD7QpaEWdGdmC0Nf9LBB+v
         hCVJSBxA/i0op7Q5Kh2wtE7MPJJu7LQAGkUNm9qr4T3Yviom3Wa4M8XA5d/wDOrikp2m
         ArmXRwgkZiI8ed5VeP6JJIZe69tyPmew6iHu5kXDHqHwM+dMFdGUjdzlgkcT+v+6Bp9s
         oxQtATPv4ReOzdGOmfNWJG1o6+9zUx1xUqL2yB19t/WsqTXWwM526hErbrDuv62/0Lro
         ZsihaEgrLjwXVnqM5pEMry/67T1mvI4tXB3kBDZ/bIxjl2qtotcsmH5ipB1Jo8FguFb5
         BIew==
X-Forwarded-Encrypted: i=1; AHgh+RoJcAhgVmRe2p/84bG9WV2Ed6KQ0aKO6dnUP3RZrggVUnHY9doAWG3eCxH98JJmmvO+suYLpYzYUc8Q3sNN@lists.infradead.org
X-Gm-Message-State: AOJu0YzS8T1WDbfUkI3FhAtD8VjSKH50PdEOLMat/kNP37B2kVyw68Di
	223WdHU6kQOi7ybN++/Xts0mhrjxQkabC/y7oM2/Kgz+H9W3DW9XKmzB
X-Gm-Gg: AfdE7ck2ymqlM9SF58KFUYmrEUYIkE/4+cYGuzAB1BBpA9VbAF2HyxwVfJOou0kepLx
	hrVtlVzhD36ErHPimmt7702/YMPjhI8Huq/XflKASAIVL0fNSe8sar0In90R/oFTXw/HYuotw22
	L8/8I3zzaYXbDrqL/wegg8HMGiDI3vhfaxO4HuPBLLa7glvUMRRC30sVV1JjPWijNIMQNG4/Sfy
	uNBZAOWGk4THfKsMqOnoWsE4U1RqZDLw8UxV8AMrinKwis4FjGNEr/uD97g0hmcVa5QDRl1ZZ09
	2J27qLM0N2chsWMyDJkYwmRxoszew68eiW9h/AHcafQYOy+mcBaHYCApnNsaw8Ib4FudAUuFo6G
	8fGPfgydHYxFIMJ03HtJ8BAglNok++HLZMWMaz4bALms/UOT5Ev9dBatpCsw19Q+p/khYbyBgTB
	OxY7Tjyf9qBA==
X-Received: by 2002:a17:90b:4fd2:b0:38d:a76:6470 with SMTP id 98e67ed59e1d1-38dc77c61d6mr7650924a91.39.1783944639617;
        Mon, 13 Jul 2026 05:10:39 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:38 -0700 (PDT)
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
Subject: [PATCH v7 10/19] media: meson: vdec: Fix race conditions and leaks in esparser pipeline
Date: Mon, 13 Jul 2026 17:37:05 +0530
Message-ID: <20260713120840.17427-11-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051040_762944_76310D64 
X-CRM114-Status: GOOD (  17.17  )
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

Fix a circular locking dependency (lockdep warning) and a potential KASAN
wild-memory-access race condition within the asynchronous esparser queue
by restructuring register write and context evaluation blocks.

Previously, evaluating hardware ownership checks outside of core->lock
introduced a time-of-check to time-of-use vulnerability, risking register
corruption during parallel stream initialization cycles. Additionally,
abruptly exiting the payload queue loop without sanitizing timestamp
trackers left metadata dynamically stranded in memory, triggering regular
kmemleak warnings.

Fix these flaws by moving the hardware session ownership validation and
atomic stop signal checks directly inside the core->lock mutex region in
esparser_queue(). Ensure that presentation timestamp pointers are cleanly
removed via amvdec_remove_ts() on all early-exit routes. Finally, refine
the VP9 payload evaluation logic to correctly catch negative error passes
from vp9_update_header() and pass the session context explicitly to the
padding helper to secure memory operations.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 29 ++++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index edbfc829e2da8..b9f36fef4be12 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -199,12 +199,16 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
  * the ESPARSER interrupt.
  */
 static u32 esparser_pad_start_code(struct amvdec_core *core,
+				   struct amvdec_session *sess,
 				   struct vb2_buffer *vb,
 				   u32 payload_size)
 {
 	u32 pad_size = 0;
 	u8 *vaddr = vb2_plane_vaddr(vb, 0);
 
+	if (!sess || READ_ONCE(sess->should_stop) || !sess->priv || !vaddr)
+		return 0;
+
 	if (payload_size < ESPARSER_MIN_PACKET_SIZE) {
 		pad_size = ESPARSER_MIN_PACKET_SIZE - payload_size;
 		memset(vaddr + payload_size, 0, pad_size);
@@ -313,6 +317,9 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	u32 offset;
 	u32 pad_size;
 
+	if (READ_ONCE(sess->should_stop) || !sess->priv)
+		return -ESHUTDOWN;
+
 	/*
 	 * When max ref frame is held by VP9, this should be -= 3 to prevent a
 	 * shortage of CAPTURE buffers on the decoder side.
@@ -349,24 +356,38 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	vbuf->sequence = sess->sequence_out++;
 
 	if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9) {
-		payload_size = vp9_update_header(core, vb);
+		int res = vp9_update_header(core, vb);
 
-		if (payload_size == 0) {
-			dev_err(core->dev, "esparser: VP9 header update failed\n");
+		if (res <= 0) {
+			dev_err(core->dev,
+				"esparser: VP9 header update failed (%d)\n",
+				res);
 			amvdec_remove_ts(sess, vb->timestamp);
 			return -EBADMSG;
 		}
+		payload_size = res;
+	}
+
+	pad_size = esparser_pad_start_code(core, sess, vb, payload_size);
+
+	/* Protect hardware register writes under core->lock */
+	mutex_lock(&core->lock);
+	if (core->cur_sess != sess || READ_ONCE(sess->should_stop)) {
+		mutex_unlock(&core->lock);
+		amvdec_remove_ts(sess, vb->timestamp);
+		return -ESHUTDOWN;
 	}
 
-	pad_size = esparser_pad_start_code(core, vb, payload_size);
 	ret = esparser_write_data(core, phy, payload_size + pad_size);
 
 	if (ret <= 0) {
 		dev_warn(core->dev, "esparser: input parsing error\n");
 		amvdec_remove_ts(sess, vb->timestamp);
 		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
+		mutex_unlock(&core->lock);
 		return -EIO;
 	}
+	mutex_unlock(&core->lock);
 
 	atomic_inc(&sess->esparser_queued_bufs);
 
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
