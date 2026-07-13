Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A32CC43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8fVpX1o5THbWErG6lgv/OWahGyNnDLqPSAFuwLFK0c=; b=UQ2N2/WpoWTo+z
	zcMTrYho9ZlDhMLk2ZrjEjq9uXnOcJYb2uBASZST0XT9Ea8L7dycQUdPtN/De1gW6rgSRuLfpyOud
	PUL6j5XU7TixqbQL+HEiiwF6FkhKtjF/kQOai1M+tKXV2ZdVIA0JWqSiwdBq4v3+7EJcyaeBdKlGr
	9ZL/Dqh6EBlyBJuzv2rdJ/FJXwTOv4eWKYbNTCnwdFLSRlSTPvqryY2tv/GcBQYUxuMh8m9b11P3S
	+JJtueSFfGC4zDk2LrD1cFrp8n+22AdJalexDCZgM9mTsxCeq3ZUiQdhj2VHqPvOTWbv3SySBAFo1
	FfNshPhdX6dCXuJ2rCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFWF-00000009A7G-0ZZX;
	Mon, 13 Jul 2026 12:12:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFWB-00000009A47-2EPt
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:12:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cc6dd436c6so37429805ad.2
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944734; x=1784549534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCvZS+UotNJvFZgti0pR+2qbKuDNmgfw3z2iv69lpMk=;
        b=XkuzMpKbOd2/r9W1u1JoB4UohlcvD2l1o11qYeJgbSh+IPzqohkEOflOV7h5tyO1aM
         BaPE6cqGog2im3Spe1ccsjCzV8lE4umah/2GQ5jP5cGd78OOC/J7QZq9uhW4Quc/3hf5
         b4C5tpaJarL83LMtYa/3cBV7rveKWz93vq9WZthg856EHBD7p46jHLQ+clmoNQ0OCNF0
         kKxzegxv1pDMhQi3j0qE/zQVCnDRS0H/7/c+WMFeBVm0w//KGN4SI9MBGk4ahlisW5+v
         xxu+9ulbYNYTvA81YJz/kBOhci2SWszgDdd4mrKJ0XxkTMSnLtouuF9SnhhiNurAxFCu
         Ix4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944734; x=1784549534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCvZS+UotNJvFZgti0pR+2qbKuDNmgfw3z2iv69lpMk=;
        b=VS3NqXuqhrZcwUuyOutUWzokybnadrCi+ExfCa9GQV+pdMOoka5lgWqvZ2LDvQJmzF
         dd7sDhE6A84tMFfkwwpfIZAnpzc0ZecM/+sZCSRaYC1VA1jhEP8jPWTgYsGUKLjfiBWM
         TZgJeImDisXtRr9v4COvpb0FTCCB5BkJAgVgEPkcLMP+JRWE07mpgo5NXoMNfzbz7CaQ
         usUYskbK2xgwMOLcAHIHqzCWuUycd4uqz7d+zJC078f/F++zQy32Da9DE7TMSulxA4sY
         c/eD0oWi1GUBFXgtN0JZybTmTKjLUoMFn8EwhRGQZu0OQo8KUISnWJmk7xrHnbRBpyJD
         HI6g==
X-Forwarded-Encrypted: i=1; AHgh+Rq4JEXXkf04vyP51y3LMW9u/qTt9VL5F9rx53B2faGFy/v5hYd3AEzgCQsdKicAP6a248sg6O8xjbJWhYgH@lists.infradead.org
X-Gm-Message-State: AOJu0YxqH3aMXA6DcSqG1E5nka7UkEawN7F4rhZdqIa+M6+waaq15Fl/
	6mI0Q24zPaDUxehwWCdrXhp6K6BSW//co5dmdlrjxxbTwti7R18FAszQ
X-Gm-Gg: AfdE7clDiQCCIg6k7WjCCj5/6mHDhWJ8Y+8IdacSHpzZJD4tvPzfR//251U0E4NiFYG
	fIT2WmYJfvAFj/bbqFVUqE6KLn+081SAVfYmParTDaa7iwsodBolPMKxwOqiQgASg3vbP7Ko8yV
	Ohd7OQxVENQmebOYZKuecwVAY4KA9w228HDVJ5eV/rv7RsdVzb1uBAIJFzdn0/gJpRJccBSH4Lb
	H7PPqxOg590rA+7zG6wh+BoROuKW7nMTeo3B6qOLohrRNRSVoHdZ5tTycSMORvs4gtAqqqW0pZB
	d37vxi7ASPJ2HQHb8FgYe56UF3Z5et1lFUGBjvPsBXErSUOK9jvDE3YLigAxFBBu+JdYmOwtU6r
	puBMPOU8MQSmx6mlckj5C5qC6+5aTB+JjayR9btV86LfmAYSXXKtRMah/OS6oKB1iNaTK65sGcQ
	ym4/EN1GQr7g==
X-Received: by 2002:a05:6a21:6817:b0:3bf:80b8:9c8a with SMTP id adf61e73a8af0-3c1102d7cf9mr9542534637.6.1783944734620;
        Mon, 13 Jul 2026 05:12:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:12:13 -0700 (PDT)
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
Subject: [PATCH v7 19/19] gpu: drm: meson: Fix DMA segment size limits and maximize allocation boundaries
Date: Mon, 13 Jul 2026 17:37:14 +0530
Message-ID: <20260713120840.17427-20-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051215_613464_A9A476A5 
X-CRM114-Status: GOOD (  13.16  )
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

When importing DMABUFs exported by the Amlogic video decoder driver
(meson_vdec) for hardware-accelerated rendering paths, the DMA core
subsystem throws constraint validation warnings. This occurs because the
display controller master device lacks explicit DMA layout configuration,
causing it to fall back to a default 64KB maximum segment size limit.

Address these architectural constraints during the master bind sequence:

1. Initialize and validate a 32-bit coherent DMA allocation window by
   invoking dma_set_mask_and_coherent() with a DMA_BIT_MASK(32) argument.
2. Maximize the contiguous scatter-gather allocation segment boundary
   check constraint to UINT_MAX using the dma_set_max_seg_size() helper.

This guarantees that large video bitstream frame buffers can be imported
and scanned out across sub-driver domains without triggering allocation
warnings or page boundary splits.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d32..899e70bca4ce2 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -202,6 +202,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto free_drm;
+
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		ret = -ENOMEM;
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
