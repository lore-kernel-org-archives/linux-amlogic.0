Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F6FCD4F3C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 05:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QLwvMvgZ29taMXpxiT2ast9eCdHOaj/SyeVlbw5dmyY=; b=iRvBZw7ZczPlKV
	DhwbIP9DP7wmpJBtdDbAq7/wL8PbT3fRL7HezqH4YIN5rsiKV2ccWisU90KPaULmpytG1iBKzuyew
	JAFPjiEn8oYk9yKksHoOy5RAUZczZdDo0s7vfApcjn+040xvV0VIDQ7CZ3Mf1I0Vazra593Gu6jhZ
	FBaxdiR0DvXmTs96fnBvVaO6k7MWZSwogwzK9lDo8ngmg+BnYX0j1ex8MinaNEQRB8rRXTBsfj0rY
	cH26jY0r0Z57ya1E3aP/usH0sEcbZboCToWXfa+i1aw8+VxqJMRQKcupklTEWJyZMK8XLwo6X6H/O
	Bcy+jbbyil5bFf0OjhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqoE-0000000ELk0-3fTH;
	Mon, 18 May 2026 05:46:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqoD-0000000ELjd-27Cj
	for linux-amlogic@bombadil.infradead.org;
	Mon, 18 May 2026 05:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=; b=XHbHeJeBn8pms2S+TbMb6Gd6dY
	GrAcJq50h/5HDx4HV2kavwsOW7FQ6Lo3nrqhy0jJle7lzyaAKmS9LV0G/gzfsDPvF7/RMhfNFFLIA
	Y6B59L8/pvykKmJ97KVyVkx2k3L7ufU3e/m0kw/CUyvWWiAEcAumL8nfSuIvp2y4MsMdqCUYHlG2w
	sX4Es2ZS1ygoIhnKc/V3dGFDq4wPuzxp0OLoyBIWutt+g1bXkz35X36C43rV0dvnbR4mYeCMSiZL6
	/vypC58E2odm8aTejhCXWSh3N8Dtkw9YNtkwXt9T/BjTWCA/m+fl11YWP/W52KhJeEUrB4hAVk8AM
	eZcvdLnw==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqoA-00000009xRc-11Zv
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 05:46:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82748257f5fso1718909b3a.1
        for <linux-amlogic@lists.infradead.org>; Sun, 17 May 2026 22:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779083188; x=1779687988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=;
        b=AM9ueDH26bDQyCIxUWaH+5efEomHnH3PetkSkc/x0ATB5BPpjIkbfnX6002oASRnaO
         3h0e6VUK90CI8xpYlBaz+6JGB0QQFVTlvKv6fkMGXD/3S4dnqbel1Onh5K7nnFZ31lGe
         FYFyzWnrJNWNjBQSZFhMZOSOr5Ulyvm+m0PcxvmpHB0cbTJWKfMbvJOYpzdsuYHTIwiq
         6DGJ9++Iae5V7T2FujtotEbB81a2WvLLHV3stUTxRpzlrmM269iQ1o+GroqkPZ8RhWHW
         LB2APQptfNnHbGS15Tgzn7/pmxIJzj12rxEaTdZFdgZw7vJPNm2kpuqea4Pf6nbqFAgh
         8C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779083188; x=1779687988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=;
        b=kzQonzw/7cIirHxUNKO7fBnBIHVzqAdFtQJv+r5d3xLEfiaam0X5wV/5soJ0blLYsj
         iNb3v9I2XzbmvtCNDDA5PhPsf9I8b7XcAZ09qJQReJALs1KjrG6/0KZGeBQJQkLwVZgW
         lnuR6ap0aRzuV+fBnRzoVXzB8OrwIcziTp9I4U2XU535EYjcoP2nadBSBZwTPTETNpPn
         bLl3frCWRHUZS5rb5cWyLf/DaIcKBDT0EPHbVL/p9z5A5Np4ohcbcdLT+98KHDK9zVO8
         LwCPpZhPriGKJ7fJWhsXp/WLl2GodQkd/NrOz1LPwrIJli+fTSO6DKx0Wwh26nIsbLE+
         alIg==
X-Forwarded-Encrypted: i=1; AFNElJ+jxXiYE9tYUIv80yAI7mDyLqhuAigtdRUHMn4c/PCQm0FjRXwdKz8qlzCwVQsyNwWkC4o1MjTIme/wPyHB@lists.infradead.org
X-Gm-Message-State: AOJu0YwA9zc5PpcuDE6afGKMH8LdlZGie0aDUkb//9sUvClgnZC2A6Ka
	/7YSinrPxtJo5yzy+h5cI3NL7MfbJACspXv5B0uvarL5//sfEBltgkg8
X-Gm-Gg: Acq92OFDmxsEptajnZGC8ON3KCdJxlsYEtUCUyOdB8s0UcdWwmapRUitI0Sq8ZZ4NQF
	Ksq86uL5aLIqrulDj6OnhARYccgl7QoyYNa1+pT7D8n6GdxluMG6MN6mNkRXJysWwAu0wuqAS5w
	9NalsqeDZqVhwxfYcyZt/bINaDFfNwVey+6YBb7bkSJxivGqBXBfjB2ylAwSmqpG0at0MPsTPcz
	qfn9+H3xhosfyrhkZg1qcejIkkHi0NUg97cz+8xbNAvKUKpGgR/AchrqmUib0/KjGFnPAoWMeV4
	JU5FgnDxwL3Bvfe9wIWlt0sKMdPACdjqOgKSDyA1Ines27Kh3v3KGRqq3Ooo4gOw1t66u7ijRPb
	CT6u4SmOVgDxyAiZu6FOiJ+AlYNH+aLRtjV6oPfxdZ2RxN8J7dq8MdGdzLaaUtcUP16+mPnYOQ6
	StmyFdR+h2zomYgCty
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr14563893b3a.16.1779083187983;
        Sun, 17 May 2026 22:46:27 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c020sm13344918b3a.30.2026.05.17.22.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:46:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: meson: vdec: avoid double free on video register failure
Date: Mon, 18 May 2026 13:43:18 +0800
Message-ID: <20260518054318.979147-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_064630_709286_19FBDBC8 
X-CRM114-Status: GOOD (  11.95  )
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

vdec_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vdev_release error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  vdec_probe()
    -> err_vdev_release
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vdev through vdev->release().
vdec_probe() then releases vdev exactly once from err_vdev_release.
Restore video_device_release() after successful registration so the
registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..2994e46cbc25 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1074,7 +1074,7 @@ static int vdec_probe(struct platform_device *pdev)
 	mutex_init(&core->lock);
 
 	strscpy(vdev->name, "meson-video-decoder", sizeof(vdev->name));
-	vdev->release = video_device_release;
+	vdev->release = video_device_release_empty;
 	vdev->fops = &vdec_fops;
 	vdev->ioctl_ops = &vdec_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
@@ -1089,6 +1089,7 @@ static int vdec_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed registering video device\n");
 		goto err_vdev_release;
 	}
+	vdev->release = video_device_release;
 
 	return 0;
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
