Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A764EC43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OHs60aYsoeCJGWq1sZa/5ivtBUE5EZG4XJDEsFHguA=; b=xK+4qzZn3rTuaa
	JEcB55K7J7wUG0t6hgFg9/biGgeefEUCrgr6pMo4hLC+RaRoIrJFrfkFrADhvwVY4ZGEeaEZ5hwHu
	vzmy3GnVFFfH/9Ea+GzkZpOqdt2Wy6Y6S3H8JfwggM5NkW0WntRBfi9iOkaWddoNSAz8lFoHG6oLQ
	pwP037Y/czXn8wyw5ZfKYdSkjspkt93mNKsifKU+r+sETsc3nOc8u0eziebE58bFBv2HbW1I6orQ0
	MOX/STwyDg96DJrbDOOcPeZ+GhOXipWGGrLdtuhjlO0l2I8xaDOResTLOA/ADbLqvYZED4oYVLs7z
	ty6yacUuHkwRH7RRkc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTz-000000098S1-2GKw;
	Mon, 13 Jul 2026 12:10:00 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTx-000000098QX-2PA8
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:09:58 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3811f512167so3648845a91.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944597; x=1784549397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5VN0Op/PYgxXXGiNzBVb7Bc2A/YDsd2gosba72MniQ=;
        b=C6N3rLeziakWWU22fFH0tyPcsBzFU39o8XkOIe6hkqHdLZaL8jOF8WiODUP0tC5PJG
         N3jwjMVS2NDbIUaj+XcmmuyqKYeyGRgf4JcjLcRvwfrWq1nAUczB17QVfOVZr6KRZMA9
         8tf636aC6hNYuN2P2I1EIzYjhIcRwfQE7zReeJK5IibBzoRPX346HK+eJIzs9osliMGL
         dMlyE0cP4/4cf6rRws/mbXXq9WNbEtDJtYVOQDeu/SrfSgT7VE3Ov4GHu4d2hqDCq4hk
         9sMb9U6V17i8/9XZXDePOGhM+IT/P49PINHEVNXmjAbZ8kAltQgg7LagYPxS212A25B3
         Hk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944597; x=1784549397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5VN0Op/PYgxXXGiNzBVb7Bc2A/YDsd2gosba72MniQ=;
        b=PlFf5EFEUS+H4ARGpsSPJm60Xqr6uF6+sl5iwWSduG/QJ91fi+s2a+njXKUp0+3UV/
         JtjXsdTup2S9WSFwiYqXmVVTUpX/+v+iuFEat/a7XNOilFB+Bfny14iLEujIuZh2/bxC
         MN5gy/jMLAVo093+B6igTUCZajMewGch5XApJLy0hk2QPVd1tYOHk9ByIuV2HO40xeyk
         N43lVSD6zxMG6n/Vxr9qZzIeL9HUTs82KPZyKOlaP9aPWoB88UhEnCJGaLmfXDYtAltB
         32fSkplFFu1zlH8lC4tXPDKN/lBSNEqtkvbrI10lFHlbX+JJCgUhIhJg2N7uO/XwBs8a
         5heQ==
X-Forwarded-Encrypted: i=1; AHgh+Roq4ywB2fRd3lfEOI801/92mhQvgQAZ4zKHwbIMiz/LgaKYsLXc4fGZEQbV1CIjguzbk8AaponjKZr9ft8W@lists.infradead.org
X-Gm-Message-State: AOJu0YyGve1PO1cYwGSBmhZ2WlW8e4/Atyw6zuqSWoQ8ZtuWVXQj5z3K
	r0PfFEjMKJgDNz/Af0ovzCkRunV5C8paFqZ5rKAK1A5DYMgHjUF6IzB/
X-Gm-Gg: AfdE7ckwGAfAhs0mCuVDzDJMrcZVRoGUJRlsI5RXpAESAjHmnIBMoSEhqBiJRqgaox8
	ycAr9L1Ra1ge0bZHluwWHiGRyKqzcHcGoItd9KXxql9cvtWWR3MM73WBvMLmSmYpiabQjjs+CL0
	nQQQKvMnwInIk1O1gnUDZRpIdFY8KfVVAjJm0AplmwJbK7nnIwxj8IJB+3KzMX2ienrs5EHe55e
	5dQ2Wijvx6Os/+6j3cIb+xqooqiYf2j6E2H7+fzl+BDoCgfkwxSl+dp0Z3nw3Fz3UZa/6H3yhks
	+LrIbYTLJhKijHZhjFdZLonroVnfAtSWtJtZlrhlBUkaxHGC3YsA9bluN+DroSaLvs6b49v70J0
	yoc1yp85M+NH0OPv/eEalkvnkw65No9iI8DTgq5nmLS2BRk7RfXyKTCLn0a9w51zWKlvMul2Nq6
	Oh9r9/rY3mXQ==
X-Received: by 2002:a17:90b:3c43:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-38dc777b8a2mr8263084a91.32.1783944596948;
        Mon, 13 Jul 2026 05:09:56 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:56 -0700 (PDT)
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
Subject: [PATCH v7 06/19] media: meson: vdec: Fix race condition by canceling work sync
Date: Mon, 13 Jul 2026 17:37:01 +0530
Message-ID: <20260713120840.17427-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050957_614313_6DEC19AB 
X-CRM114-Status: GOOD (  11.16  )
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

Synchronize work-queue states cleanly during streaming teardown and
close operations to eliminate asynchronous pipeline race conditions.

The esparser ISR can schedule work onto 'esparser_queue_work'. While
synchronize_irq() ensures the ISR itself finishes executing, it does
not prevent any already scheduled work items from running concurrently
during driver teardown. This causes a race condition during stream
stopping or file closing.

Remove the scheduling of esparser queue work during destination buffer
completion, as freeing the vififo is handled elsewhere. Add synchronous
cancellation of any pending work in vdec_stop_streaming and vdec_close
before synchronizing interrupts to prevent use-after-free and race
conditions.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7689ffdb2e500..6fe9722577179 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -484,11 +484,15 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			}
 		}
 
+		mutex_unlock(&core->lock);
 		/* Synchronize and flush pending hardware interrupt service routines */
 		synchronize_irq(core->vdec_irq);
 		/* Ensure esparser ISR finishes executing */
 		synchronize_irq(core->esparser_irq);
 
+		cancel_work_sync(&sess->esparser_queue_work);
+		mutex_lock(&core->lock);
+
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 
@@ -999,6 +1003,8 @@ static int vdec_close(struct file *file)
 	/* Ensure esparser ISR finishes executing */
 	synchronize_irq(core->esparser_irq);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
 		kthread_stop(sess->recycle_thread);
 		sess->recycle_thread = NULL;
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
