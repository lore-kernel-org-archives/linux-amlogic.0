Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBD7C44501
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLQHNhCxL7FaJgcSsxvxqhGFwcvdk0Qb9LGWAC6ZmwE=; b=AON79pdSXO8Mxu
	c371g7BYYxdW785Zrnb4eEJEjMgsjRXRWgYq6mec+yrgCWVjMjQdZsgyQoG1ZKHizactAOSTLFD6W
	6jMa4bVuFe+DHMgNoPauEEzePuPV60j/ez3apEeqeLN5Z7pixOqpxaqI2nJrOEYfYpvoXQhvyhcGD
	XxH9aa7k2jQYB/ahfLXGsyp+m82J1gDTk7tJYrd2utYvcOWWf55YwZzrgVroAjXrsS+djlqYSGTYx
	82mfrYEAhAlEvJgPQgd74rNE7OWjUB5pfRznNqrjbnVeJRwThcqMvVfN2Iel6FfuMzjoWp7o5cLpy
	Iv4tU8fzJXBccdGPTNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVn-000000099ki-3ETc;
	Mon, 13 Jul 2026 12:11:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVk-000000099hU-01jS
	for linux-amlogic@bombadil.infradead.org;
	Mon, 13 Jul 2026 12:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xrLz/BgMOWZJw3Q53MMnd8sHfRljAQMBGTN2LAcpT4M=; b=YBUZ0P4+TQbw/VaGSuIQF3M1EK
	a0ZR+U21SgitRLP98vcIS8+qymIMBT35J8APNazjGJ33zqS8ZgHZXLYknlt8Vn3EdbbssMd5v9/JO
	E7imQmKSXd9zZA1NXAjskzpmd8S9LJIw3/MReNxGZswBU4ijELZ5rV1qe+xfMugEaHPUjGlaxOVSi
	0+mHx8a7MhC10+U2TDcjjQ1a/m1SVtXhLtAOm+KxcXnMunfiyOyV/SGYopaZh0Q60+3rhId+kO5/9
	bdOcPVpp1WIKikJe56dVIQ/y33kVPwoqcdOXD96oxNKDi3QVeAj4iO71q4hlVOD52U+teQBCjCWQP
	kXh4loAA==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjFVg-0000000Baan-4ARK
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:46 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-caf45fc5202so769909a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944703; x=1784549503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrLz/BgMOWZJw3Q53MMnd8sHfRljAQMBGTN2LAcpT4M=;
        b=LmrenXCs5d56nlLZkozg9Dskgo3tdDv6/0QUr6nwKKWmt2zvEUMghuFMDEyAiOUXff
         BDTU+0aMIIbB0dgk9yddKGI8O7vGmwtghTGFo3p7PLOlKZxoh8g4qab1HTpdtNzlsQr5
         ppgOKl6T7w2iIVD14BiLMIkQGpz5XDbI9sKfFDNEz+/iImnRoY7YL+V8L2zwNl7rNp9k
         37jWc4atMYWBx7GkhWR/zC5ClSt1k1BU3y/9rt2B69NJDhPAU8OBxY1yOkhkF8YiWl/d
         7r7r0Hn2+a7RiMzvnyIli2KT3CHqFEy867W4OZAawT2Ss9voqTu7hu+Z+G0FUWfMPuJ2
         zWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944703; x=1784549503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrLz/BgMOWZJw3Q53MMnd8sHfRljAQMBGTN2LAcpT4M=;
        b=ejYR5BoLfLmoCRAEvW0sbIUoJGlZAvH4bSiMe9N3dIZkz+R9ln8rWs+cLqj7lnAV1A
         29dS3d5nvgUGX8N+GKIO3Oa1JNkuwlZLSY768+p5h6JFrwD6ISybmakRO+dnGpMtZov/
         AqKxpI40PONDKieqWH1og/Es8kt4Xqq34pH+IKXND/N8uWoJGEzcjtqvfLJmpNDoeX28
         Pt8Lj/ZqOizmlQyLWdfqyw2qtQJrRQZ2okmYhaomYVoo9CL8hh1EFYzAnlQrKZHCGqC7
         RehcjWV1KPyrdkqZtH3pm7PwcUsk8X3x068Dmn5qWLeAhSmZq4619RVkIODdcZRsSUYz
         Y7JA==
X-Forwarded-Encrypted: i=1; AHgh+RoiwmTt9W4qTHlCW/7tFc+D7AJMKmMHRo83K3ATy8HtHBAoRP2NymvYxOJb3/gXOdz3ioqPtKdP7iKAYISk@lists.infradead.org
X-Gm-Message-State: AOJu0YyDZJON591d68yNEDoVrfATb1T0CausFjBO1AKdujv8EikgNTnN
	Vt3YIS5VRcyAkxcAZ0YM+TN97Y6wePSBlhyuagJGzLsjli+1ra3QbgJq
X-Gm-Gg: AfdE7cnwKrnGOZ4sgStcBIY7p+Lsqs7Fagxbe7rWmfCHmWmSzKTmyowEpXplY8ft6NC
	yGRyt5EbthM/mDfzAPrIrkTK0Siv4g6tVlR2pY2cNj6IWjDMFX8adkXYS3OIsp/wpdoDGAts0t1
	dqbXyMyd4+cvCIjIf+suN3RD8H1QaVtWF1P6teycVmFMmqk+KRjm8Bxxj5cPc7DXdp+uoI1U1Cs
	LnoYgMaF12KCrF/fcpRaZ+c1s9Y47fgiVN6fWGLUHss5JzVSuPZhdXasByG//+y6Q7AmVb3O7b5
	obObvdiLC/jgAI2Y8b6LwuWj7TqGVot3ALRO3EVb+yGujMnUg2xZne2V2zgdgzSMgD9L1cl5tyW
	YU9mQppSRWhC/FLFFqyyDHJMfVv45Zs9ugl2rjNsPkIlqQSW0KBHFbtw3FNHX4GyHWzKQSj8Z+d
	pCYVK8lTXlYQ==
X-Received: by 2002:a05:6a20:da1a:b0:3c0:9c18:d5a5 with SMTP id adf61e73a8af0-3c111073a84mr9971121637.66.1783944702870;
        Mon, 13 Jul 2026 05:11:42 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:42 -0700 (PDT)
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
Subject: [PATCH v7 16/19] media: meson: vdec: Configure DMA mask and segment size in probe
Date: Mon, 13 Jul 2026 17:37:11 +0530
Message-ID: <20260713120840.17427-17-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_131145_163913_8C059E81 
X-CRM114-Status: GOOD (  13.60  )
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

The vdec probe routine does not set explicit DMA constraints, leaving the
driver completely dependent on platform bus default values. This lack of
explicit layout initialization can lead to allocation failures, restricted
address space mappings, or broken contiguous buffer handling on
architectures with restrictive DMA layers.

Address these platform constraints with the following changes during driver
initialization:
1. Enforce a 32-bit coherent DMA allocation window by invoking
   dma_set_mask_and_coherent() with a DMA_BIT_MASK(32) argument.
2. Maximize the contiguous allocation segment boundary constraint to
   UINT_MAX using the vb2_dma_contig_set_max_seg_size() configuration
   helper.

This guarantees that large, contiguous video frame allocation requests
work reliably and explicitly aligns the memory management paths with
standard Linux kernel DMA management paradigms.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index ac86a9c4febff..d33cbebc4453b 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1186,6 +1186,16 @@ static int vdec_probe(struct platform_device *pdev)
 	if (IS_ERR(core->canvas))
 		return PTR_ERR(core->canvas);
 
+	/* Enforce strict 32-bit DMA limit to match hardware capabilities */
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set 32-bit DMA mask\n");
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
