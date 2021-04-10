Return-Path: <SRS0=aoaH=JH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E053C433B4
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Apr 2021 20:00:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B54D161027
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Apr 2021 20:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B54D161027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=46gTkryeIKgl6bx4xSGU4NDuxEkI6U5jy0VIzYvmy9U=; b=Ivr/yyNmDD0fv7oGrZdBEggU1j
	ITzXf6vyu91W6vZslVZecA56q78MfDL3MRson2ErmFyYwdOH9Ld6MRiWR2fmCniubqYZRYUWsApnR
	BWv7I2iNDvOK8G9vMAk2bLEGMoS/eDUIOYinbZ+aUlUpLYwDRVN2xzPkXvJOxeKreus/0DbQc8UO/
	2nktL3QAyJsxbJfRUo3uaKttvBFcEnaAbIsE0Ex2T2oNNzf6TxCTFHJCpiR2h9OYGKtK7XE181DXY
	G7jsZ4ey43VJpiQfqSiPPVNWqqXLY4gai1YFNQCl9ifN9xnsNiWKo7qklrTsnDH3BgjF7FtFK2nTO
	BYw9Ij9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVJm5-003N6y-3x; Sat, 10 Apr 2021 20:00:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVJm2-003N6c-Cn
 for linux-amlogic@desiato.infradead.org; Sat, 10 Apr 2021 20:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=8qqSBlwS3BjvcFhE+2QmiRSvqs5dG4808gdiJ8MHloc=; b=4ipjbpVFU7Z4sU1zInI9FRqE4T
 qXbsK5jHLZ3AYcacrDIpez7e3aR0vABqge3C631Z/xYAkfl7p0dosuNyu5SRkLZSQWy3xx+6yZWeK
 O1Qkgh4kWXJZl7O1EPsnRtVgIVwbj8sKREHch8c77kR5WX67rPqVKfF3wht6Oi+VNqnhI3rKOlK7R
 zYpvfE9cn1MPD9XCuY4ImfBLsHlUkEo/LW57+7KAnBW4oFhyuB2EMwGVqh5fo7qp/Mgo77X50qzu6
 2XahunEhQ/rWOKphUk9O5QckMNaho/0Ru/v6MsfYXWbpAZxfsIw+Q2VcSR1p++jdb5lnYuWASEMcO
 ASOhB2/g==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVJlz-005F2J-Sk
 for linux-amlogic@lists.infradead.org; Sat, 10 Apr 2021 20:00:05 +0000
Received: by mail-pg1-x535.google.com with SMTP id d10so6329835pgf.12
 for <linux-amlogic@lists.infradead.org>; Sat, 10 Apr 2021 13:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=8qqSBlwS3BjvcFhE+2QmiRSvqs5dG4808gdiJ8MHloc=;
 b=R9E0t8jbEk8pEznmH16EJC3SE9XWeFJKEto+B3bLUgFg/KNcTYMpQmo5lVhdsvQ85B
 tYNRDvqslfA/C8KzTBPg5ppe2T100rPX/fzVtEKTTDmbluutulvnr+kYmsSM/KVg2Dqz
 WT6997QdO0bElsR1Z4dCJoDOdV/sBmL2vWy81JUG5PfaOTSETIrrNPpQxpSLB8UVe0K0
 BoXFgK2YWsYC5TwHTeo1/IW7OKbza3zuFXSXYAtRUYbgsF2fmVaLFrzb+4mUfjXWG6fx
 m5R/v+TiDuw8t7Z8HazpEI26y5iwqnXYW3gYbDOfLVljMJiPWzvSup+4cn9EVLwMSUgn
 +xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=8qqSBlwS3BjvcFhE+2QmiRSvqs5dG4808gdiJ8MHloc=;
 b=Ed5J5w/VTY0xxiKcqn4mSXMCo2ihkdNyL4XHScidDiy6uKOG3EdoLvet7ki76CdK8J
 afXoP/8rFa3tJouaBAsRn7XP4Qw9cEINC/9osBWruv/kLPbEQ35U0TTQwLXfyZpRmk+S
 FBdmikjc3gZiVFOxcOwZFGthgLbKoYda4WZcg722VICBz15dOK5ZPJqLCJnWVBGr+0/C
 5ZtzGj3HmM3YytiGrcWgyucgniamCYSrI7xQWt8d+HmXrsxUYvo/MgxQYum7g4drM22X
 Yq9tabwOOOk6wW6VsPfctgB28heeaQtUgKH6sD8M4kwiFT9bu9GsFIji4QBa/ajq01JL
 RaTQ==
X-Gm-Message-State: AOAM531vWIlPhS7nDBH7gW+brV3Apk/645DhRFr0AaE38X2quiwxOiwP
 MX9bc5MnBp0fPgxEfy5sOa0=
X-Google-Smtp-Source: ABdhPJz9ZE6/H20EWXVj5VokMTn6CzyncVCxx+zAozO8FqPL4U15btcy878L9n+lVDVJjBz5lyZ5/g==
X-Received: by 2002:a63:c111:: with SMTP id w17mr1829524pgf.127.1618084801801; 
 Sat, 10 Apr 2021 13:00:01 -0700 (PDT)
Received: from kali ([103.141.87.254])
 by smtp.gmail.com with ESMTPSA id k69sm6554464pga.45.2021.04.10.12.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 13:00:01 -0700 (PDT)
Date: Sun, 11 Apr 2021 01:29:53 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as const and
 static const
Message-ID: <YHIDufKhTEeuxyl5@kali>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_130003_950793_483AD2BA 
X-CRM114-Status: GOOD (  10.94  )
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
replaced u32[] {x,y} as canvas1, canvas2 in codec_mpeg12.c
This indicates the value of canvas indexes will remain constant throughout execution.
Replaced u32 reg_base and u32 reg_name with const u32 reg_base and const
u32 reg_name as it will contain data/registry bases to write static
const indexes declared above and will keep track of of contiguos
registers after each reg_base.
This makes code look better, neater. It improves readability.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 5 +++--
 drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
 drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 21e93a13356c..861d8584f22f 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -65,6 +65,8 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_mpeg12 *mpeg12;
 	int ret;
+	static const u32 canvas1[] = { AV_SCRATCH_0, 0 };
+	static const u32 canvas2[] = { 8, 0 }
 
 	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
 	if (!mpeg12)
@@ -80,8 +82,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
 		goto free_mpeg12;
 	}
 
-	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
-				  (u32[]){ 8, 0 });
+	ret = amvdec_set_canvases(sess, canvas1, canvas2);
 	if (ret)
 		goto free_workspace;
 
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index 7f07a9175815..df5c27266c44 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -177,7 +177,7 @@ static int set_canvas_nv12m(struct amvdec_session *sess,
 }
 
 int amvdec_set_canvases(struct amvdec_session *sess,
-			u32 reg_base[], u32 reg_num[])
+			const u32 reg_base[], const u32 reg_num[])
 {
 	struct v4l2_m2m_buffer *buf;
 	u32 pixfmt = sess->pixfmt_cap;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
index cfaed52ab526..ace8897c34fe 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.h
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
@@ -17,7 +17,7 @@
  * @reg_num: number of contiguous registers after each reg_base (including it)
  */
 int amvdec_set_canvases(struct amvdec_session *sess,
-			u32 reg_base[], u32 reg_num[]);
+			const u32 reg_base[], const u32 reg_num[]);
 
 /* Helpers to read/write to the various IPs (DOS, PARSER) */
 u32 amvdec_read_dos(struct amvdec_core *core, u32 reg);
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
