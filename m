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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A8BC43462
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 14:11:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208AA60FF1
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 14:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 208AA60FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yc+gZf3aSOlzYVYiT5D4XmOovFehzwjXB1bvhnPmqCo=; b=R0erkOjcbovGfBnIP+aSfk9W1C
	DCqT2ownHcUDb8Mza5ebl2FMP6ulsWcacCr72fmF94AQULgWCvIMMRUh4GJWYLeQjGKsNDPK7ZwSU
	QQ+LhAwbS9MZtiQB4aAHYmpKnAdOjYAz4Gwj6hU/vRyfJeJV9ENeVF08gDAi6o8RkYL0hYbqcE1GX
	zZHckwgGoI8cH7jKl//XKiRG1IaFU2DXc9g2HyVt2sEcgEZWf/kufELLstbFB2+W5Hhl2Pjopxb2Y
	ohSa3jbwoOAbBR93TSdk7HH8THBbJiuE+TE0Qo6U2UwrLFSfDH8NRnTGsUG03CEO+k8yWoIiLtZAx
	WciHbhow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWJlT-009T7x-0y; Tue, 13 Apr 2021 14:11:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWJlP-009T7Z-Rk
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 14:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=29Kz76z7ZOP2iBx6/3DXnAWj3+GXDiiIznMC8bIFGsc=; b=zLNymPLnarfNdqoHwRpVjRtWSA
 isxbB8cgSd4ndlnCu2CUgEpROEv6jw3aO071zFrdRgbxdzQlN3JK/eNxG7+wryn7A5hIN1FLhFKpC
 CThI2Iup+gzLJ0+TKcdiAJPhoIEuDywtnuQif2RVTJRY070OdJvB8M0injQb28yVbZusc5aaDD8ZW
 rsgKxSJDw9flGbbKYMpszCK8s2+7tKhwmXX8yE6Z8h7bKAiiSacXsHKT3EEl1BmZ++WwO1gGa1hdB
 1TVgEUdLc5lLXArIgTRPyUG0KFVMhnSO14v3uFGTkE++M7jIlvw2NaujZSovC+O3axWkKMbFvxRVc
 Ox9Wdkvg==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWJlN-0075TD-Co
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 14:11:34 +0000
Received: by mail-pl1-x62f.google.com with SMTP id k21so2300460pll.10
 for <linux-amlogic@lists.infradead.org>; Tue, 13 Apr 2021 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=29Kz76z7ZOP2iBx6/3DXnAWj3+GXDiiIznMC8bIFGsc=;
 b=HCWAtwaBVQdx3DeevYRszuLqOubsNmDDTOTU+FUgQJHr5WOPHzKY87DtFvsPI+S/81
 QR2Gk6DnFiU7zXEedpL+oq4LOUtxyg/lImKv8ezFR7EdoMoVQSNQLHIRLdjVv7XqWJws
 YGI9DeOoohjqarltgk4Fx+sy2IJ3LcRCnH4OII2+i/AKfoulTZHV2ZsmzrWG968gDgD1
 mcyiN/l+u3pl6Kh3xjmOZuaFH/61ucMxERgSLrl2UZaLj66WFwAb4fvHbJog9pkbE7mU
 AH2yjEx19AvArSSuSmm6RoOsDYo7gsx1mHjrND7Q5oFIW2/VIk3+gaRsKRHNyarn1rmy
 TrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=29Kz76z7ZOP2iBx6/3DXnAWj3+GXDiiIznMC8bIFGsc=;
 b=l3ONd0yrd0LEd4h7ua7JxzzIaLWqPqk/Xu80W7GaGyvybhUQtTPY90fuoc1CKVU8Sv
 iDD/0ydYJwURWF3WPj0e7Jq+HvsOpkbE8F2OQ2sc8OYWAtVJEIFaEpnxR58N9x85vncu
 n0uyPmpJ1AGLHhc26FqHx6xljAWko10or5pyNZ+7ACMp7AiY0p9rSgOgKvHTcjg/SwIx
 Y/ZISwxj9KKWgMqbeNGr8SUhTIvJrMCp7Q+LFHNzS96zfsTBx9eTT6NgALDNBqlwTY0c
 lAY8gW3/YYQ7v+TRy+RA/N44tmQj90yZ8gAk9dv1XFcQONxH+8t/XncIzbu+RbnlOAk1
 kVsA==
X-Gm-Message-State: AOAM533NrwewlZ9QRfFmYpIyrvGMxEtp3AS17OzO+rHb85zT7bVCGY3u
 CWQod6jhZWXu26bU61nNg1M=
X-Google-Smtp-Source: ABdhPJxc6+6O8gxrJL3OrEMe9mC+xOVJwaNQrJLDCo+F68glOIdvGxDa5YlD1mPqJsydBllGi86BYA==
X-Received: by 2002:a17:90b:390f:: with SMTP id
 ob15mr244765pjb.100.1618323091571; 
 Tue, 13 Apr 2021 07:11:31 -0700 (PDT)
Received: from kali ([103.141.87.254])
 by smtp.gmail.com with ESMTPSA id ms8sm2519954pjb.57.2021.04.13.07.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 07:11:31 -0700 (PDT)
Date: Tue, 13 Apr 2021 19:41:20 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: [PATCH v3] staging: media: meson: vdec: declare u32 as static const
Message-ID: <YHWmiBYAbOUw5YrY@kali>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_071133_445314_9EF350FE 
X-CRM114-Status: GOOD (  10.46  )
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
This indicates the value of canvas indexes will remain constant throughout execution.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
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
