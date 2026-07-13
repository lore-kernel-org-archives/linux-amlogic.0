Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139C4C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1yjNtMR/fNZJktUj/y4zih50Gd5wDwzE1sep+oYEDE=; b=Q48aJVXwuybvs2
	gmmVuIJZ9qcv3MaeaGvJTFFF+xgw9dqflgAd4OZFaG3q06sq69bC1faNnnGz13uqxA+jOIfxxSFI/
	8pQgWCYqw3RWwmAgqisS73LPoz+CS3k5IpIlH1Z9gXx8EPJKwZ7ICS20pEcF38fRyQjUeBRqVa3Ru
	I6diOMq4U03B6tjkQY2H8SyaMDt+GGPgqC3joshU4dshQr4FRr1+l53e6Md+CqBH1sd+J/nVlTJML
	HVi5W+XESuji1iL+pCSuM6eXMOGdBe7vQKvttNe7U80rqeh+CHK/hrQijxK7kRYeE7Oqav3GxBHki
	0tYDd/pfz0MGd7DVT3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVt-000000099qW-0Ec5;
	Mon, 13 Jul 2026 12:11:57 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVq-000000099nI-1yBw
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:55 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1491842a91.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944714; x=1784549514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8Fc1y4+RwjniJfgwRtIk0X9ABaeOzCopsCGLc1zspc=;
        b=rvNokHJ8Bz7eQ9RmUjwI8b5USuvEtLGZnHLUEPixzAt6/3GFiC+iHkshbz4T4DIahw
         yePW1F3D3vAMcW2bE+52HOgHvCBxSxOceaQ8fEX2+l7rG2ZO6DnHtGRKQaSV4aYyifHx
         0YeXxtxjQowHvsimXx5Jze4/R/2mHuIo1TOaTUtJsQ5Mla2zvNw1JfFyh5nqfwNyP2LT
         H1fBCjNNGfuPItpevk30KwzBH7tfxllRI7VRMc22Q3mPFC//e6FyCFF6dbkhXLfw1l5F
         Q6ouwCMux4+rv5FNTnrLizvQT5nBFJa2K12nKEyPMN/YquXkyCxOPsqDpAdoYqho1fdR
         CcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944714; x=1784549514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8Fc1y4+RwjniJfgwRtIk0X9ABaeOzCopsCGLc1zspc=;
        b=LafeVe9HYudn0mJwY6xY2KGub69f6um+DXBMFd6e1bkX00WJtOUXrJWoi1tJj7osT/
         sH+NDzCywMMjH/E22fhDRu9URHtKx/yvvM4WAo223uU82YnC7F7MnpUU40ItyQDfErH7
         UId4fH0Q5J5z7wSpd49Qs1l409LGDkcO2giFPYv0yJVKsAXEwDTg+ZanM10MWKFqAtgU
         JhgnIZgu/aMIc3uD5u6kazBP9QB0ITmXTN8/2SiwgLYy9tpQzxY7QTLa9QRKTMuA9YEJ
         yJ0V+DirzR8Jn/QPhUhFZCLECq3CHFS/Zwa8/ToGij7uAx3EWgMPESHYc6X5U1PzERlx
         T1OQ==
X-Forwarded-Encrypted: i=1; AHgh+RpO71YqvREgH2vDT3EqhHg9E9iWC1tQqYRxnG7Gm2ZG16KCPFv/GEkMT5/cI+McQuF9ZfmdcMSYtsBAgh7i@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfryq+IfHxAqDMop2VjZFrqKG5f/RklxSWB4sRP/5C+3rPkMgn
	1zD4+lx8LIF4QSLDI7x/0OqT9jR6UG7Ppa/T3f9XZl91v40sV+bxxoS7
X-Gm-Gg: AfdE7cki5frOsXoSPLiy/StRnnfv0o/oLngEEi9lPMKztRzqLJPKA6Uw5N5LCp1IfOx
	w9dL6gx4co0AFNvdSxDinBP9IoCnrnmQJpu/E7Xzco8t30gSJ87ShYGtBEtgMVbKUt90fHZppIo
	dJJpHIaWyVduOlVRIf7upzGw2HRA60jdpDctuNKe1UW3CRbEPyscCSEDWbe9vXa+eTMsIgoUwVB
	HBp4wBWUSIM5cny7myMryKNsHoQZNC3Pdcb77lumNGxOGh5Bm4gWTGVpiFh4UibyA561U6W/wnI
	w07XaU/nEr69hIX6dmwc2DsmUtYQc0TC6jwJpKCmhpeEJbimg+mMqSJufTe7PsnGuHaRyOD+T9k
	IysjFZL6uoIElR3iF+wJ+P1FMlUH21w4A7L1lDxHoBPKj0h925okwVqrdZqASFXvFDZvH82Dqn6
	AYAmmZ7gyS2A==
X-Received: by 2002:a17:90b:4c51:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-38dc7607589mr7644160a91.0.1783944713757;
        Mon, 13 Jul 2026 05:11:53 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:53 -0700 (PDT)
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
Subject: [PATCH v7 17/19] media: meson: canvas: Fix Use-After-Free by linking canvas provider device
Date: Mon, 13 Jul 2026 17:37:12 +0530
Message-ID: <20260713120840.17427-18-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051154_518900_6CF00437 
X-CRM114-Status: GOOD (  16.04  )
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

The vdec driver retrieves a canvas instance using meson_canvas_get() and
stores the raw pointer in core->canvas. However, the helper drops the
provider device reference via put_device() right before returning. Because
no formal device relationship is established, an unbind of the canvas
provider driver triggers a Use-After-Free (UAF) bug when the video decoder
subsequently attempts to access that memory block.

Fix this lifecycle hazard by enhancing meson_canvas_get() to establish a
formal managed device link between the consumer device and the underlying
canvas platform device. Using DL_FLAG_AUTOREMOVE_CONSUMER ensures the
dependency link is automatically torn down when the consumer driver
unbinds.

Additionally, handle missing link conditions using dev_err_probe() to
clean up upstream error diagnostics, and ensure the canvas platform device
reference count is dropped safely along the uninitialized driver data
path.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260530111022.9C6D71F00893@smtp.kernel.org
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/soc/amlogic/meson-canvas.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index 79681afea8c61..5102a491bf778 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -54,6 +54,7 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 	struct device_node *canvas_node;
 	struct platform_device *canvas_pdev;
 	struct meson_canvas *canvas;
+	struct device_link *link;
 
 	canvas_node = of_parse_phandle(dev->of_node, "amlogic,canvas", 0);
 	if (!canvas_node)
@@ -70,9 +71,18 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 	 * current state, this driver probe cannot return -EPROBE_DEFER
 	 */
 	canvas = dev_get_drvdata(&canvas_pdev->dev);
-	put_device(&canvas_pdev->dev);
-	if (!canvas)
+	if (!canvas) {
+		put_device(&canvas_pdev->dev);
 		return ERR_PTR(-EINVAL);
+	}
+
+	/* Establish device link to prevent Use-After-Free */
+	link = device_link_add(dev, &canvas_pdev->dev,
+			       DL_FLAG_AUTOREMOVE_CONSUMER);
+	put_device(&canvas_pdev->dev);
+	if (!link)
+		return ERR_PTR(dev_err_probe(dev, -EINVAL,
+				     "Failed to create device link canvas\n"));
 
 	return canvas;
 }
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
