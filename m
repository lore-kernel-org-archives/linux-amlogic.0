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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1873DC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 15:43:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8977C6124B
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 15:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8977C6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cH9fJg79uwOFehyGw+Nq3syGcnr9h5+zIAt8NqPCglg=; b=LTfd+wvaoUUyYMjnO7MBIowbLI
	btCC2WekpIL9yhufgBif+CTz+3dqjx4+yhyIkoWTve0V0n4/YQElGTyQC1fhy6I1O9VjjRL1Vsk5j
	YANVXqtUM8ek10aPSnNKg99O1ZfsgXWZz/YcqcXeRSF4O61U/FHklCYFW3PS7riFO4DDfbJQp0uLw
	7Mf7/GjVZ5vmVS7U8hsDeaVPP3rVi0CP0iV49PxaljDdz2XHDcKtflvtLgWoOv7UiHs6Aw0zvUMEB
	gShqUiRAmliwRNdc58eFc+f/Z2bh3i3IX4XqcabUQz6CiGL9RVcdV96SGVRvGc+I1h9QE7qpN3og3
	iZiZfOCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLCL-009h1F-6X; Tue, 13 Apr 2021 15:43:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLCF-009h0H-D1
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 15:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=8Muu/9WdfBgf9XGzBb/oUnmSPxJfSkGD9Nopu5TItCA=; b=swTui1+3ERR/elC4PotS31F2cj
 XR5/D6116xj4XvT09QhaaTB8P1sg7xa8NMyvYvy4w1seRVfc85p+e+MSLDYbegpCx3T64z299QO0z
 65U5gn3K7NDUJwI9KzHPYwCayFZo1ydjV6oCOQp4IQ5ai1ybo6N0iMBbkqnxKJtgD76GGQdOO2Xc3
 m2DAQsnS2gt98g61l3W3qUkQWzORV72jzyr12rBiWrH+2sv4o8sTG9CdaNsg0sT8WUgj9QEK7wu1k
 UIB5AqDD9+bcnIEmbh9AvARcZlVnRR21WrPVb/nuEXHPj42HzcxIQA+651syxUjJtqyFOsiViUjAV
 toJcRsyg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLCA-0079T5-1z
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 15:43:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id k21so2455198pll.10
 for <linux-amlogic@lists.infradead.org>; Tue, 13 Apr 2021 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=8Muu/9WdfBgf9XGzBb/oUnmSPxJfSkGD9Nopu5TItCA=;
 b=t3Ri2SNL5+EIJHCO7rV0ZBDAuEnogEiAwxV5x0DtpbyJocT6i2WoGDYeINTw4XNjNY
 CoGAhswVk2+FCbxNGJLJAbLbWVNO+z9TFj9Szwr5W8fb4oJ5vrFn4Alm/cIijGbfJ6dN
 Lo0kgHFnheU8pDkOg5hHZc1WPmMq/6uU9ypeCur2JSeaZoiV3JBIADdYzJ48u46YSuJz
 QERBXv537o/d9RPTE4svky7HLqPMY8tev5/ngiOtvWIrzk/rLyTrWJ8Wrp3pOIpPY7YG
 Tz9cAPfWi4OzuuAQCTSe9magjw5EwyOP5Mh858MfiqYke60Sm1YFx+cLQ5jf73BWpHMP
 1/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=8Muu/9WdfBgf9XGzBb/oUnmSPxJfSkGD9Nopu5TItCA=;
 b=nJvcAyAUmXp1PL+vx8TjdqN4NryWhEkLZw8latriWflcbzN6DVqveGiLZ1HtKzS10V
 BGuApGbfezM8AonrLmz8e/MRggg9LFVJBwFTBfSYmQFJPpid2+84LwlPb53lFJCb2Ymd
 lnnF/IIZoCcY737RmGtEsRJl/sWq5OuSTY/ks6jMGgNNUA01YzW2x2kalpLk0tJFqbC4
 zN9xALG0Od6PJCD4ySM9E+W+ZoGFepQlXVIiZ0t/TutE35H8duF4/0CvqnxiK9RUf9xj
 99WYvOMXFUPM8IRndNxZ4tSZ8CxJVHKkOyBW2SyY02/q6Uhk6owZ0pYAd9R1tksMbrh7
 484g==
X-Gm-Message-State: AOAM533grwJGVJNwEK6347A67bUtZpaaqNSVdsuyXc3yKyKFiyqS2fn3
 KInG/wA0STMiQNADVDQmuiM=
X-Google-Smtp-Source: ABdhPJz/c8JF8Y0C2ZrFun4nbKLfAk7fOQL/bMOCYWVt3pDXLg0kd7q1MYv+v6audMkS+3vUsB62nQ==
X-Received: by 2002:a17:90b:e0d:: with SMTP id
 ge13mr614712pjb.189.1618328597240; 
 Tue, 13 Apr 2021 08:43:17 -0700 (PDT)
Received: from kali ([103.141.87.253])
 by smtp.gmail.com with ESMTPSA id k3sm14555276pgq.57.2021.04.13.08.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 08:43:16 -0700 (PDT)
Date: Tue, 13 Apr 2021 21:13:09 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: [PATCH v4] staging: media: meson: vdec: declare u32 as static const
Message-ID: <YHW8DWNUAmp4mXm3@kali>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_084318_121709_C466BA19 
X-CRM114-Status: GOOD (  10.25  )
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

Declared 32 bit unsigned int as static constant inside a function and
replaced u32[] {x,y} as canvas3, canvas4 in codec_h264.c
This indicates the value of canvas indexes will remain constant
throughout execution.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v3:- Made commit message under 75 characters per line.
Changes from v2:- Rebased this patch and made changes against mainline code
Changes from v1:- Rectified mistake by declaring u32 as static const
properly as static const u32 canvas'x'[]

 drivers/staging/media/meson/vdec/codec_h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index c61128fc4bb9..80141b89a9f6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -287,10 +287,10 @@ static void codec_h264_resume(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_h264 *h264 = sess->priv;
 	u32 mb_width, mb_height, mb_total;
+	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
+	static const u32 canvas4[] = { 24, 0 };
 
-	amvdec_set_canvases(sess,
-			    (u32[]){ ANC0_CANVAS_ADDR, 0 },
-			    (u32[]){ 24, 0 });
+	amvdec_set_canvases(sess, canvas3, canvas4);
 
 	dev_dbg(core->dev, "max_refs = %u; actual_dpb_size = %u\n",
 		h264->max_refs, sess->num_dst_bufs);
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
