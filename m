Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67A9C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1qIPPwMfvfmpbX2x2zY9NpdhaPEhTxAHpEDe3Eqea4=; b=L5sHo2dr4YJ64M
	t5nNjRxg3oNomgllOcXvprGCwJZn9QbR5lIZ49/tw+KD3HQMl1qVWfux5rVF4M/c2jQJeiBo+hOiE
	0EVm9DnVn12xpLJHljM9kp9P8aQ1nJqoFLnk000p7s1t0f9h3L/D3lPOffHhZpRc39yA7bcE2Qkg4
	6iE9MdDs7zhLT4y4aXMsDWkgsVE6nspOkDFtodBGCQwWSzZpVRL6bmdE2hVFufB3tjrnzEOR/6BnF
	MiVH+0BavpcOVH7emFkpHyL2tNalyWtaOut5MRnvvGF6jljSQM5KeNjRG5ZDc5oKW+aRppnVTbvrj
	EmQuUiE8X3t+6ajgeIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTV-000000098AL-3Iny;
	Mon, 13 Jul 2026 12:09:29 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTR-0000000987x-3kFr
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:09:28 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so331860a91.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944565; x=1784549365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Pn+IHk1Sk762XTDH7lvSm6CZZGNFHunM58OnD0jYLk=;
        b=dW1uH0wErn3q2OLj6PzywZHMVn0xBvKOc+W6fjWBW/fQAuthn67Rc0DIja5PAUFlja
         g0+SFct0cjTEyO9ffY7IMX9e51p/rB/xe8EN8zO5+MU2r0JcSbTy9aWsqAw7bBQ43kgi
         eGkjuN51eyfBan89xeENzP5ydI+pSka3gLolvOqVmqIB+70QDCwbecfE8rbvMoel8IhY
         44lZuTaK32GXbu7wbXC+HJHmO0FTqOQSrkcWw8ZbMHnBxaceVjN///1liUN/wzdj31qS
         vRBJxyHxAsZTPCknCb8pFKWj8GhAAgI1Y6Vndg+SgcIyCqzz98/mPfzGw25+QwKhkIY6
         k6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944565; x=1784549365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Pn+IHk1Sk762XTDH7lvSm6CZZGNFHunM58OnD0jYLk=;
        b=cAnUtdSOBE1Ev/LxQAxnRh0jd4cbai1+XnbsOyig8dfniAiKL1RUiag+Wb7krkyrZB
         PnKwex5jPjDe4FgrlEjYoMCjsc6vJYebTf4LQc+JrjewXnTU/F3WaDXBpnq/mzB4OsZE
         TZphLEjLNedy9QlB3IBl8h5izLDW/Eq7hgBrgYeNs/WJ8NSME3qz/lNr1dFwwOGHLkva
         zznYtBFxnzN7unhXQUugELBfgskUHO6YnAT7+djpOUjVFrl5Gvsw1hOdG5S5Tw1AmzEC
         cMvWYkIyvHMAMrv0CbsgH8vXSMaKxlEc578SRLXrqK9GqQbr7+2ZJNZKyYC5GhnkHFt1
         FxqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1hZsfiLTFyar1ShVuQVo/4N3Xnnvt4jblmC8v2rB7HpjlJmG/JDVex9w1Mho9iJ8703tYUM2F0HsuCmhi@lists.infradead.org
X-Gm-Message-State: AOJu0YxsSkWCe40LpM7lkPcBxw0ldOeuvfssG5ce1ct4J+lwjaKt9tnG
	t3bRkUZDlpS8/Y2k4lz+5aNdpF9Y5m+KBBcTkKrVWXOxBhw3cvdzwlw9
X-Gm-Gg: AfdE7cmkq1FFvN5vI074a7kjDIRqEVLY/7kJ4O05x9YtTPG8LGweRqc6RMiks2GIx6Q
	trF7NEWYXSRkLeicsMSgaaNS7bUVgip7qZtgWc/f27mbgax2NuxY/EFs8oydPqEnh6UXwH5TCun
	xZ6fq/EiNwYxXoHM7M39IvVyA6zN5EKtxw47sYfcal+rIikJngW1aLqG3JljjvJO9sWYJRicG8S
	i5HoBEXx6zI0iM9H3oatpc1dI7kzC+pCBjvT32BbDS1M8grrtIebqS3bfV9bQoTBeIiTpHzVklo
	rVxjiRqordzZBhuEFcwdMjltcR4LgdAjWWcKYotnm9meb/dLQxdU38CIs+X/rhdJkOjG/enfsl9
	9UV8C9M5+22ucCYncuJiC7YKwPWLDWYYAzdIwBCeNu4cbtYlhxH4125Q3rPhZNxa/xpeGC6uhC9
	syIMF+e3+zZxhJZq7r2jUN
X-Received: by 2002:a17:90b:2884:b0:387:e0db:bc22 with SMTP id 98e67ed59e1d1-38dc77b3846mr9100073a91.34.1783944564932;
        Mon, 13 Jul 2026 05:09:24 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:24 -0700 (PDT)
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
Subject: [PATCH v7 03/19] media: meson: vdec: Fix lifecycle leaks and race conditions in recycle_thread
Date: Mon, 13 Jul 2026 17:36:58 +0530
Message-ID: <20260713120840.17427-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050925_944834_8845A2C2 
X-CRM114-Status: GOOD (  20.44  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Validate the return status of kthread_run() during decoder recycling
thread initialization to prevent memory leaks, and enforce robust state
checking before invoking kthread_stop() to prevent kernel panics.

If the system operates under severe memory constraints, the previous
implementation silently accepted error pointers returned by a failed
kthread_run() operation. Attempting to pass these invalid error pointers
downstream to kthread_stop() during streaming stop or application
teardown routines triggered instant kernel panics.

Furthermore, when thread initialization failed, the lack of an explicit
unwinding path leaked the session's private context (sess->priv) and its
associated firmware memory block allocations. Because sess->status was
never transitioned to STATUS_INIT, any subsequent call to stop streaming
or close the driver file node failed its state validation checks,
permanently orphaning active platform DMA assets and codec parameters.

Fix these thread lifetime and memory leak bugs via the following:

1. In vdec_start_streaming(), add an explicit IS_ERR() verification
   barrier immediately following the recycling kthread launch. If thread
   creation fails, capture the error code via PTR_ERR(), clear the
   dangling pointer tracking entry to NULL, and jump to a newly added
   'err_poweroff' label to unwind hardware settings and clear out
   allocated structural components cleanly.

2. In vdec_stop_streaming(), protect the teardown execution track by
   wrapping the kthread_stop() invocation inside a safe !IS_ERR_OR_NULL()
   conditional block to ensure the target thread structure actually exists
   in system memory before stopping it.

3. In vdec_close(), cleanly wind down and terminate any lingering
   recycling threads at the absolute entry boundary of the routine
   before flushing data framework contexts and releasing the file
   descriptor matrices to user space.

Together, these changes ensure predictable driver behavior, prevent
kernel panics during low-memory conditions, and guarantee that memory
and DMA assets are fully reclaimed during teardown.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 48 +++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index d1f35fc893de1..7fc73d5cdebbf 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -32,6 +32,10 @@ struct dummy_buf {
 /* 16 MiB for parsed bitstream swap exchange */
 #define SIZE_VIFIFO SZ_16M
 
+static void vdec_free_canvas(struct amvdec_session *sess);
+static void vdec_reset_timestamps(struct amvdec_session *sess);
+static void vdec_reset_bufs_recycle(struct amvdec_session *sess);
+
 static u32 get_output_size(u32 width, u32 height)
 {
 	return ALIGN(width * height, SZ_64K);
@@ -353,13 +357,23 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
 
-	if (vdec_codec_needs_recycle(sess))
+	if (vdec_codec_needs_recycle(sess) && !sess->recycle_thread) {
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
-
+		if (IS_ERR(sess->recycle_thread)) {
+			ret = PTR_ERR(sess->recycle_thread);
+			sess->recycle_thread = NULL;
+			goto err_poweroff;
+		}
+	}
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
+err_poweroff:
+	vdec_poweroff(sess);
+	vdec_free_canvas(sess);
+	vdec_reset_timestamps(sess);
+	vdec_reset_bufs_recycle(sess);
 err_free_vififo:
 	if (sess->vififo_vaddr) {
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
@@ -464,7 +478,10 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	if (full_cleanup) {
 		if ((q->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
 		     !sess->streamon_out) && vdec_codec_needs_recycle(sess)) {
-			kthread_stop(sess->recycle_thread);
+			if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
+				kthread_stop(sess->recycle_thread);
+				sess->recycle_thread = NULL;
+			}
 		}
 
 		vdec_poweroff(sess);
@@ -970,6 +987,31 @@ static int vdec_open(struct file *file)
 static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
+	struct amvdec_core *core = sess->core;
+
+	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
+		kthread_stop(sess->recycle_thread);
+		sess->recycle_thread = NULL;
+	}
+
+	mutex_lock(&core->lock);
+
+	vdec_poweroff(sess);
+	vdec_free_canvas(sess);
+	core->cur_sess = NULL;
+
+	if (sess->vififo_vaddr) {
+		dma_free_coherent(core->dev, sess->vififo_size,
+				  sess->vififo_vaddr, sess->vififo_paddr);
+		sess->vififo_vaddr = NULL;
+		sess->vififo_paddr = 0;
+	}
+	vdec_reset_timestamps(sess);
+	vdec_reset_bufs_recycle(sess);
+	kfree(sess->priv);
+	sess->priv = NULL;
+
+	mutex_unlock(&core->lock);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_fh_del(&sess->fh, file);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
