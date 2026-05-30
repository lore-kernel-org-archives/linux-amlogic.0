Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C59CD6E4A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Jkz6AXT4zpqDPSAsjswbHnvWQ4q1JlhZvTLrh0PF5s=; b=LK/4cINer5Yzh5
	b6Wwph87+MFojCt4+JsaBW8L9HJp8BGMTX3vrCAzf5cdEn2X6d3ZLnJZZL79oC7MGQIlgPqFPXCFj
	1PsoWX968lcIEWnF1l82ElPGz1zb0FLxRWdD3e/xhuSx8Pf2RqOFvkHuWhqFgbsci2pWJmAtFwLnd
	d4HMq0JZrlDQMDcm9E5gXpPM01VnLxBryB/sn3B9mNmRN+ZfAOb2eds9ETaPdYuLjmuLPJIU5G6Y+
	Zg1alkpJHHQjJJuYEa34j7gxwREkRUiMXvCzIkS++4zZ1lHZ+FMcJ35ZgUQq5weYwy2/TzKBdw2eU
	P+qX1zAaaDHRax9yaTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFr-00000008b6s-2vMo;
	Sat, 30 May 2026 09:45:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFo-00000008b4O-3SU0
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 09:45:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf30d530bdso10171025ad.3
        for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134316; x=1780739116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5aJiRofz4S8JTYcjNZpyXHhE2VKKeRqZ24DGJJ/QHU=;
        b=ko8U58S/MnD0prrMnlHedNusiZBwM+iVSf5fJPFtmgUXGg3swuTNXuBlSJ4x+TAMd5
         /VOEgNmkeRCyQCGktyGvPKpanWIl2G/FPgIcECBDDghBd8rxkmvPpBjlCMfO8tHk6n58
         xBEZEGHfzu3KNxsHHW1kbn2OHa349/fnwC7zyyVAD5RyxRiKgdUouXB1OZv76vw+mI4+
         zQ5hVFMogKBgm8GBu6WdasOxRNHX63h2+Lm6JmuWOXLaotp75Bx1l9ptL0Gi8kn/E6AO
         We1cBjBgubym93fb7E4jkgtOZGWmCKlf6w1oNzfdC2y/1Gu8V5y2LRRuyAuGkw5KxFJs
         c43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134316; x=1780739116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5aJiRofz4S8JTYcjNZpyXHhE2VKKeRqZ24DGJJ/QHU=;
        b=pCnI+B/PpVLfG9JqNLhA417kb5/IN953vr+3+xC3QqqbHcswdpBq5ZDvhPlEsc5QIy
         FhiiqATv1PJrarf71I0HvX99Xx6pXZ7y+yHR2u5AnUwkBKvWAteXdEPJZdlPP8th5TB0
         6XYdmTjCYNoqZQOS7BZkedCDX96rtVNjPoCMAVny7CO+tsy61niAS6y/1k764Th/AhjJ
         vaRZQF01XcNfJeNfKOa1ZygU+/RJMGVQ9WgArDeetfmAJdT/vj5v+Lrmhl8nm4U3h05D
         4dzi//m9r02t47+MOlXc6OyWx/JO5yFbV6hK/x+65Ut9Dwuu6k0B8fztMQ5S5jeloYx7
         6evg==
X-Forwarded-Encrypted: i=1; AFNElJ/1KPrqUx+5VHepBK6o0yezqKpTHrOUPa5wTIjLGHV4HNSf9vyHP6Wft99oits01Nid1HCSLgdgvoNmUKiO@lists.infradead.org
X-Gm-Message-State: AOJu0YyCm1KJlJTb/1Ib+9ew39g7PPpJw/HGN5cM5KfeNks6YfMk8Ywg
	Hi/lNALJJabKmhSOJmnfpoq6hVCHpAQAcX8uBqwvS1P/ZOPCSu4B0HWV
X-Gm-Gg: Acq92OGQnavk4JSnZQZUTX2VBi1VYf/PDo082nLWpfCme0KkO9COrQN1LGt0jbqb/xS
	jKgYQeqF/K9ixVVTXuVxHZRivY5mkDA+gdDZ6hFxRPM49aPB8Fm5yjrOGhOSkv7aMzDhDKL/kYe
	179klYQokMzBcsOZDYIXiDuWQB9ck2ioInSHLSRWKNhjpogQigecJ79qTsxmWMvvGVLU9UA4cgG
	7eW0dn/c3IltizBixLJXYkQD074X8Yva4REF20Yst7X53WYrE4dSFzBpkxAvdWx/iWDX0wZSPdB
	tWhImaKX942JfIvXQsUB1T7mg9m5ENqA21fhhFLlkdxGbPd6FlzJHu7wiKE4IaDgMRylkVCkwb9
	sNZfgt52eBAvHBtYFpltlHQS/Ku0EbeKYHDToyJKtptPxwwLz4Upw+6SS308B3cCLOW8FgsBt4K
	hnfbQaElJlEZ9iBGObZ4+93DZTawfZS4k=
X-Received: by 2002:a17:902:e88e:b0:2c0:a3dd:4e6c with SMTP id d9443c01a7336-2c0a3dd4f17mr23090205ad.38.1780134315999;
        Sat, 30 May 2026 02:45:15 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:15 -0700 (PDT)
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
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 7/8] media: meson: vdec: Fix NULL pointer dereference in ISR handlers
Date: Sat, 30 May 2026 15:12:53 +0530
Message-ID: <20260530094326.11892-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024516_870669_19CC226A 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The hard interrupt handler (vdec_isr) and the threaded interrupt handler
(vdec_threaded_isr) directly read core->cur_sess without synchronization
or validation. If a streaming teardown concurrently clears core->cur_sess
to NULL while an interrupt is being processed, a NULL pointer dereference
occurs when accessing the session fields or codec operations.

Fix this race condition by using READ_ONCE() to obtain a stable, atomic
snapshot of core->cur_sess. Check if the returned session pointer is NULL,
and return IRQ_NONE immediately if the session has already been torn down.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index f99335effe17..3897c75b19c8 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -996,17 +996,36 @@ static const struct v4l2_file_operations vdec_fops = {
 static irqreturn_t vdec_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+	irqreturn_t ret = IRQ_HANDLED;
+
+	/*
+	 * Use READ_ONCE to secure an atomic snapshot of the pointer,
+	 * protecting against concurrent clearing during streaming
+	 * teardowns.
+	 */
+	sess = READ_ONCE(core->cur_sess);
+	if (!sess)
+		return IRQ_NONE;
 
 	sess->last_irq_jiffies = get_jiffies_64();
+	ret = sess->fmt_out->codec_ops->isr(sess);
 
-	return sess->fmt_out->codec_ops->isr(sess);
+	return ret;
 }
 
 static irqreturn_t vdec_threaded_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/*
+	 * Prevent late-stage threaded interrupts from dereferencing a NULL
+	 * session.
+	 */
+	sess = READ_ONCE(core->cur_sess);
+	if (!sess)
+		return IRQ_NONE;
 
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
