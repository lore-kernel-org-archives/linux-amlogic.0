Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A83ACA5FA3
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2026 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QlGfuU1FIRz0ectDsBZtTLIHlDYmo5nppbfSxuoMZ1Q=; b=2fhhJt9uAELeGM
	o1nFs/k7WWW31k97jqFcvtzcVlLy6vJlzQNVbZEa7NN8ii4QKAZYyFMDzn7WMEZv9KMA33hbjlz+v
	frSrfRAtQMviWwYSEMGyIQIdxmFHkXr1esr8mhyPh3hpKl26anfk6ENM/XV/Ih8YUkEluAcDfSqb5
	ZVCoP4cfG/snHL011c0pFfuIdoUfQ2GERMSAop4cf4Ezgru0bgV6nMIWkdknFE5cRxhTRtL8040pg
	13YyQ/cQUnGO2e79qMnFhuO4qfJ6jGfj1JRhn1lE1xeIOQ/fwszCodinTICA6wrDTmXmpugifNtaU
	Rhe9D/DJoI67sNwZc4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEZ4-000000015AI-0u6I;
	Mon, 28 Sep 2026 16:50:54 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEZ1-0000000158p-0SDS
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Sep 2026 16:50:53 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so12326585e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2026 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790614249; x=1791219049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=;
        b=VszlLdW3VyPVMw+9bSQmvli4lJVX4OVPys1cqKfanfltQhihD6Mm10mgsstoWDxI9H
         o/rNeYM4LCiAxADE8X1V2iibjIkt3zlatqlMnbll/8n2BAaPg14ErhtYmnm6QNeyxSMD
         SD21aS/LVhS5BZOFTXGzBf/fTGay8OG77wbKERoP0wedbc8ZumCTncRWG5p/lYGYBj0J
         QKttHBNmZva64h9cGCVhRoSrdrTyzRpHhzSi2BIDbKTyNUv3SwvUyVADkdaQvlj1iFa4
         FnZDr1UdsWQGKMuKnnWB5nC9CH7hvt2+n1YLJFVRgcrrqIrqcLT8aO+NVj2xgsUotJ7a
         Dmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614249; x=1791219049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=;
        b=B2Cbqsdkrf7ypg73T8xkjVICkbky7vk2CZVl8gLmeE3cXo8GJCXRdo0PDQxzUGZeDZ
         qkl+1+gUv+3Fjc5VfHMHalkExpEb/+dz4xvQWllV57u9KxApoPgm8pNX66UM7RaTFyr/
         d6Q89uMhoeV8AnUrPWX9e+JubVIDyofCCAb5VsKW5b5WlxFpA/EW6kfl3d7ejElBp9de
         CAYO7SouYQviemMBoVfg3snBKqs5lxEZVNHPCCIRyrZUNbv2hoChp567H9M56hZrj+bd
         ab+GoMirQhN3IWfV/MY+nSEp/ZdCBotDvVkL6K6gMdbTROmkTnWM4EIFE3dG1Z5Ck8ri
         GWXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeYMIi3pML4d7YL9sZK2wo/d9CdnRWiEguoJU95qXOQzxJQNDGCF0OaQdkdwXs/21QwLUiOtcjODh+ZGJ8@lists.infradead.org
X-Gm-Message-State: AFuF++kPoOt+1EJansyQqxLK7gdABStv1tpBMKWairF4814KbujhJYjI
	7UOYz16NTEIGobvyxpywp4xY+sJqkc7n3/6kKijF49d2saI8hlcyVhsf
X-Gm-Gg: AYBFou3GVdZmP9aQECC/VuKPad3GAlnmE3h+EHwfXHGHU/UjsZ5/c/ZzrE9KKKt0NGV
	XuYF7x31d6qKbPBk+2OuA0WXaYYF1jCHup077SyWMTioaxA7F14ddFRZgqCIvfYnx1ukCqJPcOE
	iJZ5YnO5x6Y43Lo3Ml5Tcb979109oifYkNRvXB37CIpqp181BCRBrcrR20ws2wE8qZUeWfpCslc
	VyYpbmLhnnzLkMdxbCxtHMELXXS3S6jKZn5VOApOC8AuoC3zlBLCWGniYspkGrIxydCDj9os4/c
	Gq33fkz4rwUbxuOZD6wchmdF3k+7mAs4h1Ep85tjxUxszGfKEa0U9U1BmFgkzw+aEjsCBoMq6cK
	OGCTzlWk80eabxFZpRQOwZ93tD2bsIumKC+QzgUUeBGBUmlLzCtANiwJrglxUV8ADgyZfZzfA9m
	3dc5Q9w8DP+mGDEB0SuVkBBHqdOqCGGI9pT6SgVNGD5N1zDRKhJJ1SjziptxLw0IDIGS7Zb0boV
	5V7jDp9
X-Received: by 2002:a05:600c:530e:b0:49f:bc28:e8bc with SMTP id 5b1f17b1804b1-49fe7bab945mr244219495e9.17.1790614248631;
        Mon, 28 Sep 2026 09:50:48 -0700 (PDT)
Received: from localhost.localdomain ([62.56.221.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm27538220f8f.35.2026.09.28.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:50:48 -0700 (PDT)
From: Michael Freidkin <freidkin@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: size capture planes from the aligned canvas
Date: Mon, 28 Sep 2026 19:50:45 +0300
Message-ID: <20260928165045.642354-1-freidkin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_095051_158953_011311E5 
X-CRM114-Status: GOOD (  11.73  )
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

The decoder writes a whole canvas of ALIGN(width, 32) x ALIGN(height, 32)
(amvdec_set_canvases()) and reports bytesperline = ALIGN(width, 32), but
get_output_size() derives sizeimage from the raw width x height.

When the width is not a multiple of 32 the planes are too small for the
advertised stride: for 720x360 NV12M the luma plane is 262144 bytes while
736 * 360 = 264960 are needed (282624 for the canvas the firmware fills).
The decoder writes past the buffer, and importing the capture dma-buf
into DRM fails: drmModeAddFB2() returns -EINVAL, so e.g. Kodi plays the
sound over a black screen. 1280x720 and 1920x1080 are not affected.

Size the planes from the aligned canvas the hardware actually uses.

Tested on an S905X (GXL p212) board with LibreELEC 12 (6.16.0-rc3):
720x360 and 1920x1080 H.264 play through V4L2 m2m + DRM PRIME with no
AddFB2 errors.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Michael Freidkin <freidkin@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -34,7 +34,7 @@
 
 static u32 get_output_size(u32 width, u32 height)
 {
-	return ALIGN(width * height, SZ_64K);
+	return ALIGN(ALIGN(width, 32) * ALIGN(height, 32), SZ_64K);
 }
 
 u32 amvdec_get_output_size(struct amvdec_session *sess)
--

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
