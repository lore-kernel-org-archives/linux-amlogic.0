Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724B1CD4F21
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 May 2026 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=chFrWMy2n47F3Rzu4pQB7IeLHNC2LXKWHR45C8sO7iQ=; b=Vx3+D94tkCTrZh
	87lHDDCwFiudfNK7DWXu0qpfSi3v35XAyL1K2LA8elsywjnTh6iDP2KRNT+ksw1TpK4e1qHRoBTXm
	wJoBwpdVheHon56/18othJH1l68CTQmDaGnB6ee5GSUdXF1lBX9yEd2G1/i7B2fK0bKF9WxmYZnwk
	/UmJpO/4RuJXkJF3gAzzDUJ4Z0kKEBJw9/h+cNGel0uoBio+aTt/Mo037P6kLHusXVG43wWQpKlJ9
	iO0jZ6w9m5oGdBb+rQhJ84Z7NqAi8vkZDOj/NG5Pi9Mujp5CsJFzopf+CWT/XmCScd+WT53Iu0COD
	PuSjjIiNTK103wfSzYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOa4H-0000000CeNv-2o5h;
	Sun, 17 May 2026 11:54:01 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOa4F-0000000CeMx-0SHa
	for linux-amlogic@lists.infradead.org;
	Sun, 17 May 2026 11:54:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ba6485d219so8715185ad.3
        for <linux-amlogic@lists.infradead.org>; Sun, 17 May 2026 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779018838; x=1779623638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVgsGf4Z/8axsFXoaM/enuI2zsZhhgsgIIwSowsD/SY=;
        b=RNDNlCBtRPQFIWoXog3kSh/LKHc5IQ4VxZ8o2W+niuvXgOrWczHwK71Xv7HDLxB7ci
         4DMMXz/Kh6QGo7EehUu0MbfpcVveCyEu0UKGw10+r7A+OiyrcjZ9e240KzLOzze80dy/
         vkEHnVxAsbNsZrsTPZgw3Pl5wxrTugKhMC7xprbQsNQ7pU17BDFEH8BarzriqOJcfaNI
         AChhvHq7Itb9xVoFZrvyBeke/zXkMR3TB72UfXhySGykBdgj6fiNxZ2MX80AnHHqLyQS
         Wt4Jt++SH3KvMq1yu6VC0hDri00Lxu9xVVDvc79xYtEqnhdJJSfKPKCKf4+1Q5+7ZGEh
         eEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779018838; x=1779623638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVgsGf4Z/8axsFXoaM/enuI2zsZhhgsgIIwSowsD/SY=;
        b=I0s5vVfeJ9Xiy3+H7z4nHu/r51qCdsYSclB9vr9VKeSzbR5NwJKBC2Vu6s3qowu/qX
         Ngu4Tp8mF2GQYS75POUumrskFZYmsokqTnj85tWliUjguW6DgXWIiWXSx2TZwfmZwcvs
         N6GyvidZRR/oRGebaeiQOhTYdG5J47oOQNW+wv4WGJR/UE4gNx39FCEJIWOxHIvwfeQn
         TMp/lKu9nZw/BcY+LuCpg8wJWm87WRXHFrKGpaQJ/6p93jyUM+51AJDHTGftJsSiNp5D
         469b+AynYo6xhqqawTsA3hPqWkFnw6qp/2nxrp/C9SmUAfwR42QRDBsrnOlPGnp3SrhA
         FFRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oVx6juElrdqXLSYZEyzloZG7Vu+NX7z/HWQ2HkvCv3Soud96UiJuVko8ofym2kV+/G+XrAmpIZ4s6QW9O@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/XQ7u/3cxqDcID87vsiU+BN3Jr9dVRaEhjHWeysa6vHc53zDS
	dj/5uRxaYpAD5CRKvLd2yfw61QG67191DW7rcpuyv8jNweaC6deRxbQv
X-Gm-Gg: Acq92OET57v8ky4CWngik0Zaax2Fh23ZwbWaxPJVN1GNLKjMTErN6Q03ozyeF5kylyN
	sNtaMfr+m4+9YQCCHCAeJa/uaooYt+fLgQUNzxNmuaRpVyv+TfPiNl9OkWfr9L8OxgyjWnIPIQ9
	tzLqqwZgfEJeL/c5GUmJWLfcyYNLAbKbOYxPr0E3GXRGYZQxNBnRlwTblcxJhTo5Ycv0cvweEWm
	3HEx+kx1GzV2QvyoAKX2u/sM/C6FHmODbulzzGGOvAShL6SmF6T3j/fOJo2hOdWO7C/oLwQJbFJ
	HI4Ppk+OEMCN+JFXeBZLD903XmJQIi3IYVf8fsCQHIj1v6f7H6k4LkV4jQrx/ZxWRw7md2bkkCN
	gU6mqAVZhioXC9Io5IqbFqKWUSmZqV/+/w5kUDYI8Twz3dHf628rAZN3uv8Egub4gtshqp403Xb
	Q3ONKbP0fQ75aOtXNGLp89
X-Received: by 2002:a17:902:ebc3:b0:2b0:6e6a:8504 with SMTP id d9443c01a7336-2bd7e973c40mr125388885ad.27.1779018838177;
        Sun, 17 May 2026 04:53:58 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm118282215ad.66.2026.05.17.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:53:57 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: meson: ge2d: avoid double free on video register failure
Date: Sun, 17 May 2026 19:53:43 +0800
Message-ID: <20260517115343.955015-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_045359_149951_DCE30827 
X-CRM114-Status: GOOD (  11.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

ge2d_probe() allocates a video_device with video_device_alloc() and
releases it from the rel_vdev error path if video_register_device()
fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  ge2d_probe()
    -> rel_vdev
       -> video_device_release(ge2d->vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free ge2d->vfd through vdev->release().
ge2d_probe() then releases ge2d->vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index c5dc03905ce0..b367169e6ad8 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -983,6 +983,7 @@ static int ge2d_probe(struct platform_device *pdev)
 	}
 
 	*vfd = ge2d_videodev;
+	vfd->release = video_device_release_empty;
 	vfd->lock = &ge2d->mutex;
 	vfd->v4l2_dev = &ge2d->v4l2_dev;
 
@@ -1005,6 +1006,7 @@ static int ge2d_probe(struct platform_device *pdev)
 
 	v4l2_info(&ge2d->v4l2_dev, "Registered %s as /dev/%s\n",
 		  vfd->name, video_device_node_name(vfd));
+	vfd->release = video_device_release;
 
 	return 0;
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
