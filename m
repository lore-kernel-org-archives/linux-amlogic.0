Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050B0CD6E4A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 09:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtB9M4ZMlxEdw4Zt8jZQbNFkTh20f5frLAd+ZDUJ5x8=; b=Q/jc4DyNqtMHWN
	Q7K2sakihICX4RI1Tf3s0mn0EIEzDsVzb/qJai12hjl1Z3x7YlbdyYpbGc8z18Igxip793h8LfJuH
	Y0alpriz0tQuYqODksxuaPZ34ecPn0vhmeS5W00Dcx72i8wCrceXstaAdWVZvWAh83g3Q5iNUvsvU
	/PYB4qUyrsxgagAyFVxa/Mvz7pzbJdhrVQha/sS0c4+z9qwid18Vr6ZeJtrLsBJBN8a9XKkhPsfSX
	HSmH0qhDkdUdlZZP+Nfi6E7rJx0hWItvlQ09IkZvpKF0bEeT5yNQm4C2ZSr/hFdSIqOEb8cMesYzV
	Nea4TQgutZMkvPFWfIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFi-00000008b0B-1Xlj;
	Sat, 30 May 2026 09:45:10 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFe-00000008ayR-2VuX
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 09:45:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso2173736a91.2
        for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 02:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134306; x=1780739106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsfY8GRrXZdSk9lyMdgzW2ibIF3DXFt06J5TGlB1HVc=;
        b=aj7jHy5hTdWJZl5j+N34BMId2oKqOFppCk/c1Jx5L4QZ+JpbPvLp/vAVg01+TbQ75F
         rwSd37cFMOTuLqHsaz/F+aYqna5gTrFzUzOSZv8MD6D6QVO9/VbEP5XlrV5vuv6sKXr/
         ukjhgLC5Sdgg36TtmIaaWgi9mCNLr71kxfFv8mIOfmMhl7/BJRzfPIWAEa/qmwRKZfP8
         Kies2R3807FJk2rzfmfg5OfI5Oug9YP8Fj19RuwsR3BcvKAHQvOZ6z/l5XhgUZoKDseJ
         kfCbmfyYdSASeh0aT2BnFyykCVLfBfEI/BS1qo6b0TPZ8e8WCErArdQbHKFHuJQRenn2
         VP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134306; x=1780739106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsfY8GRrXZdSk9lyMdgzW2ibIF3DXFt06J5TGlB1HVc=;
        b=U8iN+5ioRmj5/GuLhZiInXMjBhGqQFDFrRCIX5WY+xianUdYsvJ4sQtbN4t74aSpxz
         lq6ITNxgOYepDkKoZ3NL/YCfjPinVwIkoaEQv4/yuR18XbQbyXUqmiJE2SBbwjISZtwS
         Z8UnjiHx8X1ZOeEwfy2vJqjBtBkf+DZs/yIHl8DrNxLblzqSDwhTjtFD3Mp/CizpEgW+
         MstsRcrqiClG8pi+p8thOHWZgzLg1nVdXGEXXOpNNvFD1WJyhGzA2S/wxq8EASg9PPXP
         0K0hXbl47umPQfC8njP3VQUIz5fNlqvAGSL6rShuWDqFuf6WTJHSECQIvEcloVeiRA9u
         aocQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CRE8UvWYw5tD8kzpK4J9lwKBCP6CREI6HCh4A4JgUZ9xf5SLnxcYHm9uZ8aWNWvd4R6iDcML0vBjlSQxm@lists.infradead.org
X-Gm-Message-State: AOJu0YwH9wo4XvpjOEbYS5YL33mFvvsCIM7zaJ4Gk5y9rUqFZhV9DYtg
	+x936y8o+WKQdYF82jPVvM8nbv8hu/FPJg3A2/r7Hwr+Em3LL4KtJSKd
X-Gm-Gg: Acq92OERN2Gpiyk6FPHMeCt3+eT5/o2eRqEvUuyPOnaXVrZH5itHYRAgeUX4v3/lAQ6
	EK7HnC+mjzcJRk469+7uZ3FSgv8ji//2orYsfndO1FlxLJdjK+jaHM7G43SJUhgS/j2z+4IVW/m
	z4Z7dhtj4aEp/XFQoOc8NSaVlYDBRDN6zBneh9ZxSk6TofV9Aj3tLX1BXTRkfYWWoFuwO3eaEKM
	hj3V5b0Wt2LhcWsOaQhaY5aUzusLDZn+z2/UER+0YnNg2ZnwB3OaBdhf+L8Edm6KYb+e6KRWvYE
	b3KngTUlQ4+TcsB9rbT4yJWmZtDoBBe7McdTLwy9Ekii17If7arr2iIs83TNcMpC37psrd8ZuSC
	BmyIZQINe3X2xbxZHc3xQIne5cjAWnacAP6bwPpTL1mB7ZVT0JCs66vG/Kp3NXbED5TcsRw+oKk
	+eSLqq3g8A0QmqcXUNQoJq9JSmohPgDGFPu2zRtj1kdw==
X-Received: by 2002:a17:903:32cc:b0:2bf:23ad:8598 with SMTP id d9443c01a7336-2bf3679336dmr37430715ad.5.1780134306001;
        Sat, 30 May 2026 02:45:06 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:05 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 6/8] media: meson: vdec: Configure DMA mask and segment size in probe
Date: Sat, 30 May 2026 15:12:52 +0530
Message-ID: <20260530094326.11892-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024508_150334_9D7B2C44 
X-CRM114-Status: GOOD (  13.38  )
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

The vdec probe routine did not set explicit DMA constraints,
leaving the driver dependent on platform defaults. This could
cause allocation failures or fragmented buffer handling on
systems with stricter DMA limits.

Fix this by:
- Setting a 64 bit coherent DMA mask with
  dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)).
- Configuring the maximum contiguous segment size to UINT_MAX
  via vb2_dma_contig_set_max_seg_size().

This aligns the driver with common DMA setup practices and guarantees
large buffer allocations work reliably across platforms.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4884ee04b352..f99335effe17 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1064,6 +1064,15 @@ static int vdec_probe(struct platform_device *pdev)
 	if (IS_ERR(core->canvas))
 		return PTR_ERR(core->canvas);
 
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set DMA mask\n");
+
+	ret = vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to set DMA max segment size\n");
+
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
 	core->platform = of_id->data;
 
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
