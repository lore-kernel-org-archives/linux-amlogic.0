Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB10CD343F
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 07:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Hc9fxonpq+ds9dQNrMC8uik+EZEQa5G5eg46Abc2BE=; b=AXy77LOionCOZs
	62zR2EBzYPOUFuLqRLMGOzxKxPckIXckXLjnjpueGHEPI9WJZfi/PECSQa2IzUkOyeKUYcJ4bS8wB
	73ISX9OEX80GI4ZPUF+bp8S2pEl6/E7qkIeQNrmlO0956mhSvAsVd98l2elF3v4sjd247qjpo5Xu/
	WjFhY5tOy6s9XxZJ3kEiDHzOQzKoFa9mMuri0TsBO+jaTFZVCYiuYLjOstWHKBkU23OIPAeKGJkhw
	VqxF5oXV9Sw2diSa8N4x1diP/ZE2t9daAMwsuv2Rvw7GmtnS4qI/vjRb0D23wtssJUiKJGvENpP0W
	8/g7XtkzOhzEPV8WsFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxwX-00000006ylX-2io1;
	Thu, 21 May 2026 07:35:45 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxwV-00000006yju-1nVU
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 07:35:44 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso2700503a91.3
        for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2026 00:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348943; x=1779953743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mklgo4SEnQFqu5UeBwzviEPZFhn2UwuL3rIfaoDrBUI=;
        b=rgU1/da1ktDqBamY2YoMm05SErwLAId4huZV1DBXqgNbB47XpRMKOIt1wVRkRXSazX
         2+dmWdBYeVKw6p0caexIooyi5LfszeZ4vrvx1fPjzRiMDZqQjhzPfSTjN9SwhR955Zlc
         E7Lwy5HXT/J/v/8+MuXqYbMWqt/YNnleQDXGbFRPqQSPvnIu+WHkEXJ+lWuohjXhfgg3
         ju+TTVNJ7dqDHsLquP/ifmG3oYFtGuMSEV8qjTuFUmuDxkQmYGwl8uBHrz18PN/vxcCY
         j2/HtUI0wFGdqEE+j/wFahCMpgTeF3f9JRx2OCN+sQMXq0lWcy+eGm10J9xoIAbMMzMQ
         rsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348943; x=1779953743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mklgo4SEnQFqu5UeBwzviEPZFhn2UwuL3rIfaoDrBUI=;
        b=ATQ0omQ7/wSBgRI+NoP2n49lfTGFize3bE5SCUvuU2exzKKX9jWs7M7KWG/t9ST7aG
         5O51EedgyYsYA1CTqVYW9MM4I6IKr+k5x4nKtzVduxtHvy6wNMgZtWJuaMwEk/yF1gQx
         BqrhBRAsPShihMUEDFuaSUD3SqNv89ieBeTQ64mNNjzVewJNRizI8fvytlc4J6VKoO1z
         9YZW2v3FFgBN4ZicwZdDwgBIFU9zU/nopwIDyvAOiE292cHHxzJ7htqZ0piyFkqcsaw9
         +EWB2jl8Gq6LrxFzoWVOQhsSBnh92IC1QDLTWYCdY/s0vYp5iUuAAnOMb7E6sibVwlqw
         2nEA==
X-Forwarded-Encrypted: i=1; AFNElJ9iK3esFCBQbeT6nYJA8qUAvMUcfyrNZnimCCGegupo9GscA92Y6lXIwSMK5BNhAouB/pdMNg3goacNguET@lists.infradead.org
X-Gm-Message-State: AOJu0YzW6MWNFpmQfD52cv03mZr1wHkWrEcW8iMh2/YwgVbck0r2KQ0E
	FH92mAjUFqknIQRslWsgzctZCfZl1euLIqJyWrOCDf89P8mTM4QNYKtp
X-Gm-Gg: Acq92OFVfbrLKFGq1D3qdAxBWPdmFJYdVwYW/A9DtpAGl48i2qQh7y36f9mphtJlmrM
	/YyCoNsuU0EJRdeXdHKnF3dTEZHUVpRX9t/9z2yz/6K3795tWUMVo7H1xcpjY5IlAKz3Yy4v4ZB
	OR3E34EarnTTgoK+e8XONQtldg+0/wjYDZmyzP57V5Qf+l1uf21zKUWYsyuS/VALE/ekmtRY9eB
	wtiaOGGzLKbnUrpAUq474EEFnMeuK6Vjg8nLuDu24e9pn7GQpHDZhDW3SsxG9O0W1lPkRga10g0
	yz+limOp+9yxS2gib0VQOWdKU7KpbRYDAS6VgeRD/K1JpRjDqwXiQYeKXvGslwefi4iomzd7YyQ
	qPZa+sXo2wmF2WCiXHyVYSDTyjAFNPmrBDdsRi9omcTp41q/OYJAw0p2bu9FSAnjm/sT9W235yU
	G+0LUijmIxtIVUpGFXhTGRSAy3vGEFTzE=
X-Received: by 2002:a17:90b:540e:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36a4514fbcdmr1729123a91.8.1779348942657;
        Thu, 21 May 2026 00:35:42 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:42 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 3/3] media: meson: vdec: Cancel esparser work in error and stop paths
Date: Thu, 21 May 2026 13:04:13 +0530
Message-ID: <20260521073449.10057-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260521073449.10057-1-linux.amoon@gmail.com>
References: <20260521073449.10057-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_003543_470133_DCFDCEE7 
X-CRM114-Status: GOOD (  11.66  )
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

Ensure that esparser_queue_work is canceled before freeing the
session context. Add cancel_work_sync() in both the error path
of vdec_close() and vdec_start_streaming() and in vdec_stop_streaming().

This prevents background work from dereferencing a freed sess
structure and triggering a use-after-free.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: new patch
 If vdec_close() calls kfree(sess) without first stopping or synchronizing
with this background work via cancel_work_sync(), could a concurrently
running esparser_queue_all_src() dereference the freed sess structure and
trigger a use-after-free?
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 8615a935e86d..a57bd4a8e33c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -358,6 +358,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 0;
 	else
@@ -415,6 +417,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		if (vdec_codec_needs_recycle(sess))
 			kthread_stop(sess->recycle_thread);
 
+		cancel_work_sync(&sess->esparser_queue_work);
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
@@ -937,6 +940,7 @@ static int vdec_close(struct file *file)
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_ctrl_handler_free(&sess->ctrl_handler);
+	cancel_work_sync(&sess->esparser_queue_work);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
