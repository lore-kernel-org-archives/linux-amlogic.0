Return-Path: <SRS0=y5YC=UX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC313C43613
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 14:52:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE382063F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 14:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fwu9NoH5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mnrc7AJR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE382063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	References:Date:Subject:To:From:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=qSVlD+QDojMMaPShgK8+tFwIAD7S5/oYcDRU0Y3gvb8=; b=fwu9NoH5qMlVmt
	POnSGf3cGHZtHUG+/1f8qp/TObgQPckvaK8R1znP0rfbYGC/G9PpWurwfk/S6ipYAh+jhQSCy8HaF
	VoyS5q4csDtkMNU0m3ld5UFOtPioJ0JCx9CFFgesORuJ/ccsIp8NVqSbcg6UcRg+YP9K6NWRyiUht
	Hm2Lq1NSIPWVUaP7bvWff+hf5r5YFdESfZ0q0EnaMy6Pb4Yu84a+X1F4wQoIfi3tjY4ffDUC+kjJY
	mDeMaRJPd5L2NXp8hgCvD9lvPkjeWPdAoK7pVo9Td51uUE6IcFRtZhPXrCEZG8nTHSyGGa58Lzmra
	l0kffQ98nhRzrV+WzdKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfQK6-0003Tr-Tk; Mon, 24 Jun 2019 14:51:58 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfQHZ-0008TX-7n
 for linux-amlogic@lists.infradead.org; Mon, 24 Jun 2019 14:49:22 +0000
Received: by mail-wm1-x341.google.com with SMTP id s15so13669518wmj.3
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2019 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:references:reply-to:message-id:mime-version;
 bh=qICt3tvrDEjsshgOgeqB9NCEtKIKhDes2GEOtGUCIpo=;
 b=mnrc7AJREizTtyko4LB8qv6Cg5B7WxC4INlkHs9Ks4iSd2+apictmURS40KuI0t5Tn
 IB2Vnf/t+LVnP+tv1JvqK0FMsszntab9bsBVDhaq6iH/5dr9u7y6ngMLni2/8v8/KD3I
 1RNcMErB5MGZrpdrKROpddh54ZDHRNg8rOMycQTJexvvjS09bSP+7duvAXFZuxYnmwGn
 Wpgf31NfM9CwuosNa95m1z+0d2TNHFTO5beH//s/fat/KCaC+gG8C9eFd8v7zvt8OC3u
 asoDvcItzT1/rBmW1y+Ab6G7mIjNAxdR7PXNNpiCVmsN1jFfPqU98sGJajv6Icl+rVEt
 2jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:references:reply-to
 :message-id:mime-version;
 bh=qICt3tvrDEjsshgOgeqB9NCEtKIKhDes2GEOtGUCIpo=;
 b=tBp4FIBayR91NoG61npEDBatikZdm1BsQhAPVlYx/88Dya6IClhqMJaXJkOElr0Zz0
 AmLvgciUj4zPPTSZcHSuKqkiUb5zqs2pbXzUXpVMjZSuhJvT7kN/XjJ8dEY7Rg4+TD8l
 ZOkPFPtAN6rvAwIZTG3BNtxFvgR7qSloPUxPt94r1KI+fTtVrSrFrKxim0CwmarZXnJB
 8OgCgf1mYdZjeWQ+Ea8KNB6rn7AnvrZFD/Rnlk7BhnL4uVhp1SrcvBvBV+C7dizDy1CL
 qYyX2uLt2XpAQhEAA3PjIGOy0P23mgHWpCS+gwj8OuIu+wg8Gbx9BJd8Vsq2jUWFkFnw
 naxA==
X-Gm-Message-State: APjAAAUCGiV0csNlm3PyYiIRsHHcTYnRSwXhdB5qU6KUi361YQuZ2sZm
 qwURlG8qmmnjzmTp50a29+abdg==
X-Google-Smtp-Source: APXvYqyo+n4FXVEBememSCgVf3nyfXvEm0+s6OodWbZ0mTPQMuiNLuOddy70bQx8iLDOUizpxuJGKg==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr15799778wmb.119.1561387759831; 
 Mon, 24 Jun 2019 07:49:19 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t63sm11204083wmt.6.2019.06.24.07.49.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 07:49:19 -0700 (PDT)
From: Julien Masson <jmasson@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 9/9] drm: meson: venc: set the correct macrovision max
 amplitude value
Date: Mon, 24 Jun 2019 16:49:12 +0200
References: <86zhm782g5.fsf@baylibre.com>
Message-ID: <86mui782dt.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_074921_311818_67AD751D 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: 86zhm782g5.fsf@baylibre.com
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

According to the register description of ENCI_MACV_MAX_AMP, the
macrovision max amplitude value should be:
- hdmi 480i => 0xb
- hdmi 576i => 0x7

The max value is 0x7ff (10 bits).

Signed-off-by: Julien Masson <jmasson@baylibre.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 2835133ab676..acad16ff7371 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -192,7 +192,7 @@ union meson_hdmi_venc_mode meson_hdmi_enci_mode_480i = {
 		.hso_end = 129,
 		.vso_even = 3,
 		.vso_odd = 260,
-		.macv_max_amp = 0x810b,
+		.macv_max_amp = 0xb,
 		.video_prog_mode = 0xf0,
 		.video_mode = 0x8,
 		.sch_adjust = 0x20,
@@ -212,7 +212,7 @@ union meson_hdmi_venc_mode meson_hdmi_enci_mode_576i = {
 		.hso_end = 129,
 		.vso_even = 3,
 		.vso_odd = 260,
-		.macv_max_amp = 8107,
+		.macv_max_amp = 0x7,
 		.video_prog_mode = 0xff,
 		.video_mode = 0x13,
 		.sch_adjust = 0x28,
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
