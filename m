Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228AEC43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqEcwAMQh4TZsBtCVMjqZ58zfkV4VPfl1o7apw7L7BE=; b=Whqj+qCyQGjbzI
	E6Fz7Z0SHeU+mmtIuU2VWkanQpuajpxj9kiYsvHL3IpRXpkz7llrmVkphQDtf6jeZAeSZLqJAZFi+
	kWuNts6IbgLTwrHjbRoP70dG5+JpA5+dg7zAr6T9g+4/erMYTVYCnw7BGc+cXbTCbd+nAvIow5Ywb
	z+W6OUcI6lAMJXSXDPvWdHeOOv87ivl63cPWtki7FyGiLEe422kbll/IGyEFYIJLnrsp0NZcGqMfB
	dzQWi47l63QF9b7SX05ovMcQo04MC4qrLNowTyOSpzlIpYg/S1Gq5u/72uBLF8XAImk7tEsktfBQA
	0p+1pRUuuV+4oTPNvztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTf-000000098H3-3yLX;
	Mon, 13 Jul 2026 12:09:39 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTc-000000098EW-3GqN
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:09:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3513437a91.2
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944576; x=1784549376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3WTyPeomnpShciKNumkAzLHLjjvlL0zze6H3PBXARM=;
        b=P6ugSiY7zbxSP4liE9YKzsg5317OtGiANU0bbfZNEEqeEtVxnYSupYqlxNN7lZ8Prr
         FIrEHDsHJVF2TTKo12EFgBiXBtaoEfLUajaGi6m8L+WvyOPr+1glfVVT8zqlFuuz3UFe
         31QoLi54AoOtAXP/bxgxxob3+KX0J99wC2WyH1nWovlmk2tklQ/7F4Cyg+5VqgJAkLiV
         D2bMk/eJ+SdtOuMkLnGMaZqNCnMhLzwbR1c2P/G6ILupSELgxL96LhWM7NPrEriqTU7K
         0QpJQb2bLGFlY1s+7DaEp7hdVuQn2WUU/V5kivuHzhNciKFmcKDQwHDy30dLWkd3Tw+c
         IAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944576; x=1784549376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3WTyPeomnpShciKNumkAzLHLjjvlL0zze6H3PBXARM=;
        b=XjmXEd7V3OZHGj3x/M36oS9AtYMJAohZag7XCamkSTpbbTTKBETSrSejgi+5IPbKMc
         NUt1vS8wQsxh1lXhvWJp+KRAgeQEVPfAf69ypXjHVtJ2Qt3WvgQMQdeb+BUzDN4Lf5eu
         GkA+cbxGq/0a0xL6zz+4I1YwLYzWj7gUjJbzY+sKR56GZ/KzfpRYkHWlOVahyQu9VtkE
         Cszk35C+VZmccOje4amwzk3lPsN8kAdZA2Miyy7eEnlexq+IDQ/viFmCoUdyMwZa9Tl3
         M121U9dHb8vL2FioJAKM9udJB0jW6MS444JXJq9XBOBmZaaOw3ROnqU+BpLJQWV3cDYa
         oqmg==
X-Forwarded-Encrypted: i=1; AHgh+RoW1/84DGoaIQXHdQf35WH/5G9co/CMrLnMbVixedeJWKYCMhMK46E81UbPzJocke7X08+o0wkFff4RQvHR@lists.infradead.org
X-Gm-Message-State: AOJu0YzbH3LzAuJG0i6m83Ikbkmjwl9rV14f58jDTyDKuynL5KD7Bfyk
	fRTPYw3jX1s50N0Nq3RUwnVaBNU+cl5DlpB28xiV7/CBWJOSVUyjAIJq
X-Gm-Gg: AfdE7cmZ6z88pJQIGGm/z8oUCsylpXiG00fI/adfJL/MdkiycR7Bsu7epOMid2L8b9l
	mqKKJxnG0eJ8SA992hDxF/CDzo3i+2PGC0ytdOe8P1XDDDUJ0fEtDDceobmvK0iVZME3Wf47Ilb
	NWxlvYAZV4ywwbtuu4d9u7BG9cUlI0UJjJqm0iGs16thmyKufi/t2DOntggfi6HwksIClg6BVGF
	CxFhMFO4NFMr6eCE1XBtV5WPQNVsIE/Fp0DOyRFpUAmjt2h/k3fnPZzpKfYqVaI71dG9MWo0ReO
	YO2mzvaPXLVyL1uamgntwkYIb4SHTzKtkFdSvKcj1ajoWYSGNzkW6yGrcdwvbRNnK9YvMXAT8ao
	XH95F8QM1bW9RjKzXn+5ScyROFekpHfSl7SEY42ZhmWM1nBAn70Gk6dNjdh/zvN3jEjgslEj0y9
	GnT60YG9pfUg==
X-Received: by 2002:a17:90b:2248:b0:387:e0db:3fae with SMTP id 98e67ed59e1d1-38dc7779d32mr8371305a91.39.1783944575701;
        Mon, 13 Jul 2026 05:09:35 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:34 -0700 (PDT)
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
Subject: [PATCH v7 04/19] media: meson: vdec: Fix use-after-free race between teardown and ISR routines
Date: Mon, 13 Jul 2026 17:36:59 +0530
Message-ID: <20260713120840.17427-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050936_836253_33B8052B 
X-CRM114-Status: GOOD (  20.04  )
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

Prevent critical race conditions and null pointer dereferences inside
the Amlogic video decoder driver by synchronizing the interrupt service
routines during session teardown and file descriptor release phases.

The hardware interrupt handler (vdec_isr) and threaded handler
(vdec_threaded_isr) read 'core->cur_sess' without proper synchronization.
During a streaming teardown sequence via vdec_stop_streaming() or session
release inside vdec_close(), the underlying session structures can be
modified or freed concurrently. This creates a transient window where a
late-stage hardware interrupt can wake up, read 'core->cur_sess', and
dereference an invalid or NULL session pointer, causing a kernel panic.

Update both the hard and threaded interrupt service routines to capture
the current session reference using an smp_load_acquire() barrier snapshot.
If the snapshot resolves to NULL, terminate immediately with IRQ_HANDLED
to guarantee execution contexts do not process stale structures.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Suggested-by: Druk Tan Ozturk <doruk@0sec.ai>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 22 ++++++++++++++++++++--
 drivers/staging/media/meson/vdec/vdec.h |  2 ++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7fc73d5cdebbf..7ae3d5a9dd6ab 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -484,6 +484,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			}
 		}
 
+		/* Synchronize and flush pending hardware interrupt service routines */
+		synchronize_irq(core->vdec_irq);
+
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 
@@ -989,6 +992,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct amvdec_core *core = sess->core;
 
+	/* Synchronize and flush pending hardware interrupt service routines */
+	synchronize_irq(core->vdec_irq);
+
 	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
 		kthread_stop(sess->recycle_thread);
 		sess->recycle_thread = NULL;
@@ -1038,7 +1044,12 @@ static const struct v4l2_file_operations vdec_fops = {
 static irqreturn_t vdec_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/* Secure an atomic acquire snapshot to protect against concurrent teardown */
+	sess = smp_load_acquire(&core->cur_sess);
+	if (!sess)
+		return IRQ_HANDLED;
 
 	sess->last_irq_jiffies = get_jiffies_64();
 
@@ -1048,7 +1059,12 @@ static irqreturn_t vdec_isr(int irq, void *data)
 static irqreturn_t vdec_threaded_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/* Prevent late-stage threaded interrupts from dereferencing a NULL session */
+	sess = smp_load_acquire(&core->cur_sess);
+	if (!sess)
+		return IRQ_HANDLED;
 
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
@@ -1136,6 +1152,8 @@ static int vdec_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	core->vdec_irq = irq;
+
 	ret = devm_request_threaded_irq(core->dev, irq, vdec_isr,
 					vdec_threaded_isr, IRQF_ONESHOT,
 					"vdec", core);
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index cc0cfafb8a951..d165c343fd022 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -67,6 +67,7 @@ struct amvdec_session;
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
+ * @vdec_irq: irq for video decoding
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -93,6 +94,7 @@ struct amvdec_core {
 
 	struct amvdec_session *cur_sess;
 	struct mutex lock;
+	int vdec_irq;
 };
 
 /**
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
