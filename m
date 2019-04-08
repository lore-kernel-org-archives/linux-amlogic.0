Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A49C282CE
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 203D420870
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ftsT5255";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="K5Yxzj7o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 203D420870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qulHYq0/8iRgxX7z4wWZlUU9Wj4rrYr86PC37S9Kjes=; b=ftsT5255rpIG0t
	QIcXL0GMs5SPeXXJZ5KYw6ERnfkieDz4itkTLvnOFIZdKkZ868c7ceIpz4rNwqXyU6d5gwv4+wpQo
	5JPNkj3tssOxeuTnz5AsBiYjSSzwBrYySZA74Qng29GXNR+BDjKkZL6e2Sk0cTAD+dNQL9FIgX0RN
	9hN56TqHegJ3Bmrx9FbnOGstmSCag9jaJ67VFvEVvivaUec/e6F+2HrmbiZQluWe4UJ3294Cz6jXS
	jhltp631Vhxy8eX00VQjcxx8v1XJbKNPCwd4gxL9q/njR9wamRCpfE1IdI3TXvENsOLctVf1/GMhR
	VxlVQYQ6eTWm7wrw4xrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDQ9w-0005bU-E5; Mon, 08 Apr 2019 09:01:44 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDQ9t-0005aS-0J
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 09:01:42 +0000
Received: by mail-wr1-x444.google.com with SMTP id w1so15391433wrp.2
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Chqmz3DLAhI8VyDEHCtkqYxXlFJ7zTtEYN9MLmqcUM=;
 b=K5Yxzj7ohVIHXnDYusnX5gxa+m5PV8nzOxijASwOkBBX5ZyzGNGFsVsfSkILms16fZ
 9CiV7by57eQxhdc5shP07cDvn4XdMQBelbkNQS6BY1jACf/JJTr/zkl8KgAb8c9ZYBvE
 3dHN3+DXPIGjAXK9m7j6O1XdMoqmC9nJMcWDPYR6shrgkxiNU6S/63/H2AF6ob4V/53I
 mUPenIxKysjPcSpvJXqK6RmrA6mDX8fSHHVqcY5wLfsx+aKsOsRvYODdhg3OSZy37PrD
 PoIwbwYYnSF3Q7FG3ZFJCRyq+BPCx8Wut43YtTJxZh0+eKDZ7euFzQELi2EH5+iCG/P7
 GTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Chqmz3DLAhI8VyDEHCtkqYxXlFJ7zTtEYN9MLmqcUM=;
 b=BL6f+L8wW7Cy4/W9ZzPw3tj/9dEQ9OTVKqPEjBsj+xu8HrO7w1YMYSArmQt0WHAJTR
 ZsZ3tvxkPZUMVMn+qVHpGMCjmOx5OAp64yXRKl/L9prX5R21AZ5Pf6A3Y2theaiqKYjx
 kNfceJklhopDXarHVQ04G62/kgEXKW93FBfKWreNuC5JwwcYvCMWVl7X2amwuNrMGq8k
 ZDnvIZBDG6muVTNr8bQqtmrDMGOK4bwtUGLr6yhK4LIQSdVqCevjbldmmQXRg0RDPcBJ
 M9oLeNrca96QWqsnU/9VBG1kqrf89xPespBN5/ivLKBYi/nEFMsyCD32G1ROlpDrojp4
 yrgg==
X-Gm-Message-State: APjAAAUGRt8WQcZsTjVoIonK6A8nFlKntR7ovDgJjuItfjCUATSpV2Ko
 2xgwKpEiW2F1TMOurVZ1E0C2wg==
X-Google-Smtp-Source: APXvYqwYr7N3z9lZyDvO5/6UxOAAhUi8HsUMm4KG5KrLg+QTml0skMaVjz/83v9qxwjFzkWXWAdeHA==
X-Received: by 2002:a5d:4087:: with SMTP id o7mr18595917wrp.9.1554714099199;
 Mon, 08 Apr 2019 02:01:39 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x5sm26799116wrt.72.2019.04.08.02.01.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 02:01:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: add size and alignment requirements for dumb
 buffers
Date: Mon,  8 Apr 2019 11:01:37 +0200
Message-Id: <20190408090137.2402-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_020141_179236_2BC99C7C 
X-CRM114-Status: GOOD (  10.52  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: sky.zhou@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic SoCs Canvas buffers stride must be aligned on 64bytes
and overall size should be aligned on PAGE width.

Adds a custom dumb_create op to adds these requirements.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Suggested-by: Sky Zhou <sky.zhou@amlogic.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index faf1b1b0357c..72b01e6be0d9 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -90,6 +90,18 @@ static irqreturn_t meson_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static int meson_dumb_create(struct drm_file *file, struct drm_device *dev,
+			     struct drm_mode_create_dumb *args)
+{
+	/*
+	 * We need 64bytes aligned stride, and PAGE aligned size
+	 */
+	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), SZ_64);
+	args->size = PAGE_ALIGN(args->pitch * args->height);
+
+	return drm_gem_cma_dumb_create_internal(file, dev, args);
+}
+
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver meson_driver = {
@@ -112,7 +124,7 @@ static struct drm_driver meson_driver = {
 	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
 
 	/* GEM Ops */
-	.dumb_create		= drm_gem_cma_dumb_create,
+	.dumb_create		= meson_dumb_create,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
 	.gem_vm_ops		= &drm_gem_cma_vm_ops,
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
