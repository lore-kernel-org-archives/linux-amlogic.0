Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD935CD5BBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2026 09:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9MaxLh1IZsbrKRIpruB1T3qW89mjdZMZki6ZYzKm2Q=; b=qvpu9CvCTZ2OWR
	ItWeSi0nTxpNtFiDB2rpJdNxFEXR29ttyyMJWfOi0xkcmALyQxizJZlcUSILllzmGeKG5qG82jnmu
	mYjwVg37X5QA1BfX+en0TiBowlLDTjXXrCuqEKKGVFs9CurwPlDAf0CIO1tWh4LLTwC+pL8ZoFC1V
	jAxIdQ6jsp2m+sduimvCm3wcK64jGm2jbD4tImksJqJvcz1X6YlvC4JCbwqa5D/ZFMVoSRyUYsEfe
	r4yJS+jtuw5vdFEhzikO/gKrPHD+bJeqooW6d+eyOzgT7eCGjve6H1VLhI89mf8krfGWbwvKXP4wM
	Vx0fGQrlu3hvfFthooTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzo-0000000Gsfn-2uoH;
	Mon, 25 May 2026 09:53:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzm-0000000GseB-3JvZ
	for linux-amlogic@lists.infradead.org;
	Mon, 25 May 2026 09:53:16 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ba4efedbeaso71570995ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 25 May 2026 02:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702794; x=1780307594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez92gLCG1+yJIQjG46e8Hvs9v1kkCpJ4jicfjTVkky4=;
        b=T+XvPfnzvtcJApFscUX2mGXLVtZCwBlicAszBWFL1JpMgAp+/AvxO7blPjTbia32+U
         qAS/rvWDFVU2ay/XKE2pr0k35bgVXez5swJDEigrHQm1RW0efQZm6nGI7obqIo4VdLw1
         2Z6boCoxzO6uwynEig7KrjmTpWBSogP7q/EhalP/qpZHUeoxJCp4lldlMtnPsYnD6a8O
         dxp5TTwIpyHUt+tjOywMBtjWVz9goe+cQm8egbBKCykfhbn0UhskCs+8Cb3N6ZEAm6vw
         Frh78ntRPBT/lWNWBy45yNy5fnEcy/ZKslP9+iB0iGRdEI0gxuKqzjxG3pZeAY8cWMPu
         oCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702794; x=1780307594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ez92gLCG1+yJIQjG46e8Hvs9v1kkCpJ4jicfjTVkky4=;
        b=a0EEyD6ZEz8Vz4Ipk9harBWbqsYSJ7wz2QL+A6AtikZq42M2vZBNwPU+R8PMy8D+ob
         Ae1MzmTIUhcYkj7Pqoul98MElW/S8lT1t21Epp/yf5noXUHA0kAX0wY1Z/3Crzk6G93b
         QP3nDYrrFGJM6WBwV2kb9ClQWltRgup7fKYscvW+lX2nC2uPb960q3/nWgq8iUYjfyja
         yRoRIDLTVgxIvDlkVGyCL0hJNqNGzxWTqYkIRQ5hfpPFoibGWsn63swWlgAzAvM85Qm9
         oaXoKRe6Au5N6Jx9lHMWWASyhs25NBDOshRnNkAW78zvrBlumL3Wns5x0un8hbQMbeKG
         sw1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/SftXofs6FWDLc8gNTh3y1VkYuPHzuML7JALEKIGRr7Q8y+s703T50vVADCFg+sOYTtXB0ikfv+5Kvaou3@lists.infradead.org
X-Gm-Message-State: AOJu0YzgiTMHT8QD0Z4DAfveMhlrvXRU4hyv5479FFMPLO+bJzKdCatN
	Q49j7eYpDy0HBkjbVrCQqy+RwSQz8JHZxeSGF7PnV9DPUt9SkNpqjuWt
X-Gm-Gg: Acq92OFZ+FCqeHtdDo7NeI1zxU79S2I0CF/y4lzBlU15ey71q6j3z4e8qw6+MCJgPm6
	FuO3MNDZ6UIRo4+cKcRlrSyK4TNKcOndHZ1quTMsTYlc6g3a0sBtskibIEipSuSoU4vd690zlHO
	/Ix8zfMtJId0/cdjO5S6MCHn0gDLteJ8smgumWfg/GMXLl/Ocsjkn4xVP8l9eLxTNyeY4uZmvl8
	Dgn558YP2WX3iSbMa05DVFVg5N2tHOY8i5T9AHTsH/PVOgligs+aAdvxM4jx4ke6HY1uNyy8C/I
	D+09MahiiRjIooD78rohiGYQbvR04A8MAZMgMbRMKPMq20h/QVBBRhltrOE5r4LVLJHOqGBwFod
	ePeWjUcTF4sI78YfcA5PSl/gxlg35Vr/bxkCyXum9m4gtHx5BQtw1xmWUNbi87OPuQjmRcGb54u
	D1fGWrQMoZtgSmdAflGHfQVfl2QraegbHK7Cer5Y5cHg==
X-Received: by 2002:a17:902:e548:b0:2ba:78a6:7dec with SMTP id d9443c01a7336-2beb05c07aemr160215525ad.13.1779702794227;
        Mon, 25 May 2026 02:53:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:13 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 5/6] media: meson: vdec: Isolate error path buffer flush to the active queue
Date: Mon, 25 May 2026 15:21:53 +0530
Message-ID: <20260525095216.12078-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_025314_845667_AA8E0549 
X-CRM114-Status: GOOD (  14.10  )
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

When vdec_start_streaming() fails, the error path clears buffers from both
the source and destination queues unconditionally. If one queue was already
streaming successfully from a prior invocation, flushing its buffers behind
its back leaves videobuf2 deadlocked waiting for completions.

Fix this by only sweeping buffers from the specific queue type container
that failed to initialize.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5:
This is a pre-existing issue, but will returning buffers for both queues upon
a single-queue failure orphan active queue buffers?

If the CAPTURE queue was successfully started in a previous call, returning
its buffers puts them back into the vb2 queued list while the driver
discards its references. Because the CAPTURE queue remains active,
userspace calling DQBUF will hang indefinitely waiting for frames that
the driver will never process.
---
 drivers/staging/media/meson/vdec/vdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index b31bf08af88e..925537bd4d0b 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -372,15 +372,15 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
-	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		sess->streamon_out = 0;
-	else
+		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	} else {
 		sess->streamon_cap = 0;
+		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	}
 
 	return ret;
 }
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
