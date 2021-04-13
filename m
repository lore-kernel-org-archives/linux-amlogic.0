Return-Path: <SRS0=PL4p=JK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B48FC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 06:28:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 172B8613A9
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 06:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 172B8613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8OXgQ2WV9RxTxZrctB0V5bIS8knfgEsUgi26zhd3r6w=; b=A81VskhoMjBdbERPCtfRREuGiS
	Di3w+QecXQbXIRKy/FxkaQZ24DJozW0ksHg+UgniLdVjdpAueTgdRxf4a1RzMUuPmy6TCX3FiFkjD
	sM2v2OY5rG4750TnF/bU6ICeBgIJ3tkzs4gOfZAtS/xvtD0P9zaF3ioFVm3UB9apFI4HhFuYRtrbk
	GKYirxj6+8Lq11A8P1DCyA6SD73emY+7nQadvQgq8Hd8pq6JZjs3kwIMaEVBkzsFrWEwacSu63uCu
	5tEKFyRXRGn08pL8qrGPVZkHZ6jv9smHwItZ53NFavVGnQ8Glvi57PBVGiHFjn70Hc78aQ4FGzgWz
	nH+FDqkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWCWy-008OPs-Q5; Tue, 13 Apr 2021 06:28:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWCWq-008OOy-GE
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 06:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Nt0fDmT0/sSLx8SXvP12vsQxR8HIersO+xhC1jo5rA0=; b=2a+U9gaUz8amhH+P6wVvfrtkrA
 Hu5EqlR82PDuHpC49WbQnTqWQu1sLG7kvWFApqQ2Wyr0850fe88oYC7/7RmxKSNr6kzPnD5w6E/Nf
 RXeRDVyCmwUV17Dq2km/ITGR2Cm67mM9zpVMjfcWqJ3X0AhdPQVA02/0JiQYibCgrGN+qBWL6u5g9
 bE6tPok4DvnmGuYca43d6nFxa2diLHaVHe7S+uSq2xR4Zp7pD6IWbF/JGrXYFZFdsCdemvFin+BxT
 vx++VkRuZjjNKQOq2Aqrzyp3lqaC4BTcKf53+ts6ZO3urRz2DGrUIWws/GGGRTcoXu3sVpXghTXFR
 M0CIpMag==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWCWn-006lqg-Vv
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 06:28:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id n38so10791613pfv.2
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Apr 2021 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Nt0fDmT0/sSLx8SXvP12vsQxR8HIersO+xhC1jo5rA0=;
 b=sl3xokFPsQ3gEUalWsbT9Ivb31ReDXvXvicMwxDLicpI0mmNTLYl7/XtErj73GTIRf
 ch/dywOrBxbpxRaRBd9P1UBWjOOs8LgY8RNdAPGAx9aL/Fq5p8C2EDEu1+Z8Zbk64YoO
 cVNrscOHZLiO7J0NhQHadASxDipAD8+0tENdsS2eeTVBpBJRNzleWehCIgAA5JQU03xU
 drDdaJz+IGntTjxCD9arxBgTTgExiw/uQuSqlo2kf7l8BsRWYvtroYt+qHfMc8iEvEko
 RIEwaGxTFo0IPbdDIbHq3Q0tHsf3/K2nTpxzi3Jb0e8ZKKqgo2ELv6QDRFrPy39QK3iP
 soDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Nt0fDmT0/sSLx8SXvP12vsQxR8HIersO+xhC1jo5rA0=;
 b=jgyM5rX2iiBQM7gWU5YxTYXViy+ll9SfJmTjAnSD+oNILLHiFixiI5xte1gbxsjNon
 ZVVW8+2bZ8iaJbX/8gibZFeHKlN/Z/WWXzcX+a1vnX+7VNVaEcU2ziGHfNM2w24rqt98
 lY99mcglcpfxaferKVr2UjXlyRjgK4Vt48MBaK7+p391ZmePxJ5NV3WGv6JZuDfL63qN
 ol17n1NYQghxI/G/vNvKMlDPfsvz4jZ0wUmGzbaNwFr20KTnWJ5+BV8E7nAcLdWkRTGJ
 8FYZh6bD1+N7S4tVmuAJaIp8Wo/oCh8rokLQAbGUR+QTVEVeEXpjOgcG185q5eR4T48+
 W3Qw==
X-Gm-Message-State: AOAM5313W93DyIFZfargfC3nLJ4K+qK42xzlDVYNU/WWuikTSC0uteXq
 u3kRh44fs5X2TUPKm6Nk8/k=
X-Google-Smtp-Source: ABdhPJx7nKQA7Syr4pbl0BYerDHY/Ew6JmXr9E2pBqRz9YneKxZHhcBWtQAQpgxTg6nutjBJ2s/XSA==
X-Received: by 2002:a63:fe12:: with SMTP id p18mr30877410pgh.425.1618295280741; 
 Mon, 12 Apr 2021 23:28:00 -0700 (PDT)
Received: from kali ([103.141.87.253])
 by smtp.gmail.com with ESMTPSA id f65sm13461382pgc.19.2021.04.12.23.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 23:28:00 -0700 (PDT)
Date: Tue, 13 Apr 2021 11:57:52 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as
 static const appropriately
Message-ID: <YHU56OM+C2zY34VP@kali>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_232802_035384_7BA4395B 
X-CRM114-Status: GOOD (  10.21  )
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

Declared 32 bit unsigned int as static constant inside a function
appropriately.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- Rectified the mistake by declaring u32 as static const
properly.

 drivers/staging/media/meson/vdec/codec_h264.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index ea86e9e1c447..80141b89a9f6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -287,8 +287,8 @@ static void codec_h264_resume(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_h264 *h264 = sess->priv;
 	u32 mb_width, mb_height, mb_total;
-	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
-	static const u32[] canvas4 = { 24, 0 };
+	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
+	static const u32 canvas4[] = { 24, 0 };
 
 	amvdec_set_canvases(sess, canvas3, canvas4);
 
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
