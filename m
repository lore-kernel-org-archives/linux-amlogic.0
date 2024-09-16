Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51798C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 13:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xmVgWkBLJDsXcz1nVNj9xJdDMJSgfhw73JRMKduq2tA=; b=fH+c8ERrNK+rvU
	ps2+aJYA3gWG7+B+KLJ2QQRHsH2VDt//rr8fVE0gGWJx9E9UE945+pqxRoa9FLEIyOtN8XYhsDEh6
	ry6A4reo8N8piZNfdBnYzbN+e8GgLxSuoQEa8jnRlytkj6Sn513tg5zM5mFnFgLG2bIq8UATuP3Dx
	6OMw26Yry79xQ95zdb67hntDsbZYwfcou7wc9ca7n2HJo712mcgUhHPY1TYSXhnGsd1fIP5Ql01A9
	mxuOK8IMISlKWSf7vp3KdpZ1bKRgCPYmVEpqLf2hcDb+1qSaOjUfsmQnia04ADyU0gEHHYhpP7tqJ
	E93LQqCFv96V2TRpBh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBYS-000000043SV-34xj;
	Mon, 16 Sep 2024 13:14:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBYP-000000043QE-01JD
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 13:14:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so44189245e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 06:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726492447; x=1727097247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmMPJHVmcW5c8ZHNtkyqd/iLwJT7RVP8ngmFGL/HUsg=;
        b=B3wbTAtm3Gd5gmctkA07vK2kqSQDc5FNH7+LOq5LMJvJtPphDEV9Lv7qtMwtOiNMKo
         a0xwHP/7X0xFBGrYc2hQbJ5tV/4M13BprPdmbzlMvfsUCWWu0hHGbldo84ELIvUI6rbX
         Sf39b6qhPckoGT+pezM/j2AhTU6d4+PYCotiVf1lrI1PKUtN4X/rvcpyGdLJBsbHjLeV
         tJIzYGazO0fHlTr9eRhDhChTIQ7fQ3psfQ6hJDVTRhlNUhQPxApT1yZgZtvO1KNQ8r4d
         7CPzkuTyJj/aJd3ZqgZzvTHEAWSDLvlaZ7k+tfowU00iNf4bHwihZlGpp+36V3rOfM+V
         kMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726492447; x=1727097247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmMPJHVmcW5c8ZHNtkyqd/iLwJT7RVP8ngmFGL/HUsg=;
        b=nKxmtb9xr+f7XQ+bmXMXjH2y0QQgbBF+GN12OGFmu+l9mQVP2r5kzxnAxepQOyZ2v/
         +7PqUkISRbjlrHRexcno/HcWlv/+Vq+rJtmwwQSQTOJyNQlqH+7G0MuTORek6KRs6sKt
         Fe9IkBcaFhQ1keTispQ8Fu5XjHsSvO1G022QbcHUyBAo2EbxPqIYS+YLvCx5Gq8wv6vN
         CCs+lfRgpAgG+6rvVsmBCyEu5YWMoFMXPl+4Hwz/gX9/F0mB+SmQdmpdOGwHUVcPyKY/
         ruV2wGZHaK4no89ydyALJdXypje3ES13gxvuJh08QnTFs0WWCl2ahEeNHo6cQi2ooUnI
         9Jcg==
X-Gm-Message-State: AOJu0YxvjhnYSzG+48GWIPaNdzYW+FW0SHOBGtcb+uOC97eAiIDM8R7d
	nAZyRhUZmtO/N5buFLttyJ7GqZ+kEbrXN2BMdM0lZYr2JLeYSt65tylmbw==
X-Google-Smtp-Source: AGHT+IHJuBU+sRFOvkU2O3S1XVRw3EG6tm/fTZBLU9MGIKMqDp/yCwjAg5u9PUpDvYEmKQVzCdZzbg==
X-Received: by 2002:a05:600c:19c6:b0:426:5fe1:ec7a with SMTP id 5b1f17b1804b1-42cdb5913f2mr100290155e9.31.1726492445986;
        Mon, 16 Sep 2024 06:14:05 -0700 (PDT)
Received: from voyager.localdomain (178-118-65-79.access.telenet.be. [178.118.65.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b054c4csm112094465e9.2.2024.09.16.06.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 06:14:05 -0700 (PDT)
From: Theo Debrouwere <theo.debrouwere@gmail.com>
X-Google-Original-From: Theo Debrouwere <theo.debrouwere@faytech.de>
Received: from tdebrouw by voyager.localdomain with local (Exim 4.97)
	(envelope-from <theo.debrouwere@gmail.com>)
	id 1sqBYK-0000000063P-3p9x;
	Mon, 16 Sep 2024 15:14:04 +0200
To: linux-amlogic@lists.infradead.org
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
Subject: [PATCH] drm/meson: disable line encoder before programming the gamma table
Date: Mon, 16 Sep 2024 15:14:00 +0200
Message-ID: <20240916131400.23261-1-theo.debrouwere@faytech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_061409_099334_5C3EB02D 
X-CRM114-Status: GOOD (  12.40  )
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

There is a very rare bug, where the gamma table can't be written correctly.
It is possible to write some entries into the gamma data port, after which
the WR_RDY bit isn't set anymore. This causes a timeout in the code, and more
entries will be written into the table. (each having their own timeout)
There will be an image produced, but the colors will be completely off.
The number of entries that can be written seems random.

The issue seems to be solved if the line encoder is disabled before the table
is programmed.

Signed-off-by: Theo Debrouwere <theo.debrouwere@faytech.de>
---
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 7816902f59075..15fd9df58ae4e 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -66,10 +66,11 @@ static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
 	/* ENCL clock setup is handled by CCF */
 
 	meson_venc_mipi_dsi_mode_set(priv, &crtc_state->adjusted_mode);
-	meson_encl_load_gamma(priv);
 
 	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
 
+	meson_encl_load_gamma(priv);
+
 	writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
 			    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
 	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
