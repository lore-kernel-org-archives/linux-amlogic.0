Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90064C44507
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JH9P7JPVaP1Dd09eYoJJ5w0kptdTwNz4axmnyWPeX8=; b=Dq02BW3A1C/F4r
	h+V8LjibsUDs/3+pVhfrdGjgXggV9qaQhEpUqgNEMyKDNzSqLigiCJ/kVHL00CyagppY9UjbpqWAa
	+mmaQ8KiN82HI/UhBfXaiCP5QDBU5ZBqw1OPq7bZD0JfPX14D7Z3a1j0zo0i5o8QAqvlDagE4TMdj
	4P+I89hTCebfgOvaMbyLSXonkusjze/wfC72LOQR4o8ArPr3WRphIOE1YaUUi2EUyjGryd+anJ2pI
	ONBodF6PBeuVW+5ht42Q5KDiNWBpeOgTAwLWAYOBoju7NfSpi03qF4kOH0VSV4bw/VvMT54u1uI3B
	2obDj++NCoIUrG7ShHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFV1-0000000999h-2zHF;
	Mon, 13 Jul 2026 12:11:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUz-0000000996T-1sc7
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:02 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ceaf8a1265so16143755ad.2
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944660; x=1784549460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=or8zdD24QFos1ceTDAq+AN9AMfFHPT46CUnsHlWUgzA=;
        b=KbwdzeEtczSrJ3EDVAN7zS3+EoBRwlq8JZtOY5zEIV1u58EfqwBTLr3musD20RX39m
         m3o9C7aTJH6gmaQTgnuY+0OESWV5riKjzkGBmn2hguSLjjhAHZWzKYCI0BXB95kFuFc+
         rZKjFJ2FzOpBroE/aIEBAyH5fg82M8xg2IHoBK3g9qNGul5RQZ9aDoo+4ap0B3wR3ImJ
         yZd5Hbxtht028S/GANfFhWRx1gMB7qlXZ9Epkh9/RvkUH1PcZpqPfHwFFE5CeQ9dhlNw
         yGLmWOpx1S31B+VZq5n5/8l+bLDrhX46+mY4pr6vQ3CmuE5gYgdeRBWcp6amyaU8k5Xi
         zyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944660; x=1784549460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=or8zdD24QFos1ceTDAq+AN9AMfFHPT46CUnsHlWUgzA=;
        b=TQ6xY4lMFMK1obxp/QId5C6UoI2dJ8YdXVwrVM/fCaf0xFN0Q11IPnCDAbSloPpxy8
         5yARD3CkHWDaTE4/OqTXGHhFk1XHFMpKHu/EnTQCZt523VPqTDaOQ2B64acVRILcdfdI
         CbX2B28b471Q/NqAf7/KM/mOJwOQ84l0f9qw1O8RMVBYT1OfiqUBkbrZl+79bQCCHmA3
         D1xxNiPdB9qPCmFSXoid9nbiiBLW9Lzp+mQMhNKtfZUf4XNb1F3pWmgUyFxudoWB5C6S
         GOJyDn3wPyOUgmBE1cqzLFDzUuicXAKLK1YrRocDacDraoX6EReX3u/XFhcQBnON3psB
         oRFA==
X-Forwarded-Encrypted: i=1; AHgh+RoGaFEb8GQvHVtW2qjeA8OkHbFrTXjBZkpEFhm/4ETcpoBqOuwauQh+JiYk29/LgSYm4O3w+JHYAy+PSaju@lists.infradead.org
X-Gm-Message-State: AOJu0YzwXDgKrB2P3C8FHDcZriKUau43r0mir6EZz42fRGrl+hCMKt9O
	hN18uHHbPAWj1eYd/KJb59yYfZ3PcLLgplzMyeqBKx1N3kI5UmoqAhEN
X-Gm-Gg: AfdE7cmX+I5hALF2aGwKmZmXgXYEy2AhFms/GXupcOwg19eI4f9b5qMJV4OQ4pu49bl
	Li/rMz/q4QubvIQ4XZa544cFg/1WvqvtreSm8gB6FR/j/AeZIJJMEzG8qLkdTLWY+/TNnHEZz4c
	9Qpc3IPydeF1OigiDoP9bGI8XreT/yeiHYWWHeA0PO6AY2F2/Tq4AsKuymuKLM6KrZbz0vVXVYK
	2mYQF2OlDV7u9kfg2qUyO9mSQgWRscSdsfIDoSCp7NCcIYffRH2jk/JJbO2B4jWJNc7bUdMvOTJ
	0SLzbQWvx3m50TM1Vv9B/+Zq/9jLW0waFdDkneHzdrp/4aeINwDuNVjxn9m9t0Mqe+lWVxJmGZr
	YmwcLtTgR7OYKx/jHl5EbsUAVZb98c/8EhtUeYzJOn5gQ4t+ab9QXnpNqcqXTe5rOFrVmM9faY/
	eDGeu4C3Mh+sVHYCNK97Yo
X-Received: by 2002:a17:90b:3c43:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-38dc777b8a2mr8266584a91.32.1783944660581;
        Mon, 13 Jul 2026 05:11:00 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:59 -0700 (PDT)
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
Subject: [PATCH v7 12/19] media: meson: vdec: Coordinate m2m task execution inside async loop
Date: Mon, 13 Jul 2026 17:37:07 +0530
Message-ID: <20260713120840.17427-13-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051101_504878_78723DEF 
X-CRM114-Status: GOOD (  14.64  )
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

Introduce proper V4L2 Memory-to-Memory (m2m) scheduler pipeline tracking
by handling job finalisation inside the asynchronous esparser workqueue.

Because the meson video decoder offloads raw hardware register processing
and bitstream feeding to an internal workqueue engine, calling the helper
v4l2_m2m_job_finish() prematurely within the primary device execution
trigger context (vdec_m2m_device_run) drops the active task transaction
state too early. This timing gap creates a state mismatch in user-space
multimedia layers like GStreamer, resulting in a fatal "poll error 1"
event abort that breaks streaming setup sequences during pipeline preroll.

Resolve this architectural loop collision by deferring the scheduling call
to v4l2_m2m_job_finish() to execute exclusively within the worker routine
esparser_queue_all_src() at the precise microsecond after an input buffer
payload is fully validated, cleared, and returned via v4l2_m2m_buf_done().
Additionally, protect hardware session context mappings with core mutex
locks and implement volatile early exit gates within vdec_m2m_device_run()
to ensure stable teardowns.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c |  4 ++++
 drivers/staging/media/meson/vdec/vdec.c     | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index b9f36fef4be12..939b239c2af47 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -399,6 +399,7 @@ void esparser_queue_all_src(struct work_struct *work)
 	struct amvdec_session *sess =
 		container_of(work, struct amvdec_session, esparser_queue_work);
 	struct device *dev = sess->core->dev_dec;
+	struct amvdec_core *core = sess->core;
 	int ret;
 
 	while (1) {
@@ -437,6 +438,9 @@ void esparser_queue_all_src(struct work_struct *work)
 			else
 				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
+			/* Safely notify the V4L2 core sub-framework */
+			v4l2_m2m_job_finish(core->m2m_dev, sess->m2m_ctx);
+
 			/* Set tracking flag indicating transaction completion */
 			processed_frame = true;
 		}
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 0eb39aa6014ee..b3e1d99e8889f 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -149,6 +149,17 @@ vdec_queue_recycle(struct amvdec_session *sess, struct vb2_buffer *vb)
 static void vdec_m2m_device_run(void *priv)
 {
 	struct amvdec_session *sess = priv;
+	struct amvdec_core *core = sess->core;
+
+	if (READ_ONCE(sess->should_stop)) {
+		v4l2_m2m_job_finish(core->m2m_dev, sess->m2m_ctx);
+		return;
+	}
+
+	mutex_lock(&core->lock);
+	if (!core->cur_sess)
+		core->cur_sess = sess;
+	mutex_unlock(&core->lock);
 
 	schedule_work(&sess->esparser_queue_work);
 }
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
