Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6D0C52D7D
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2024 12:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYylkCD7rT3MCL4Z8VQq5JZc589Br2Sd6MdhGCRsbV8=; b=xdWsN/uBNiJd/U
	brLTN+eZizTO7xXJ2gsL1QOlcV3RpfZX140VCSbqXAg8x1Wiypbt2VsB27M2zHK+njldkIfKM4uCt
	FM+oJ+r12eiNGQ2lZO8w3YyxqkFAXsORPFfSW1We22M8O5Max+ots++ePOf9HAdvZ/znWJjEAniGK
	9WuwX9xs5CCDR/f0rZ+z0+AYzipjBqV40PF32kFLGzadwwSknYi9p5u6jjs07/5+dpJGspM7gXlVD
	5Wrz4hChQ3cBE0WOUI1N+fnM3OFekqwDl6VGV4hTdv9SJqFFyJTW6Su5cnKCIQi95McZs0vaxFNHG
	IJDt/+ZeoKLu0iUsJ3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewAJ-0000000CtOM-210Q;
	Fri, 16 Aug 2024 12:34:47 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew7l-0000000CsgF-0kNk
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Aug 2024 12:32:11 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6bf825d779eso1859036d6.0
        for <linux-amlogic@lists.infradead.org>; Fri, 16 Aug 2024 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811528; x=1724416328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVxZXuTJqaJ10E0yGjjv9nH2alidPK1Y4VYj7sM9de4=;
        b=FwBLhip8Yu+p2AgovlMOSnKoYxBZjV0DDmHC/JSvQF/ftyg23URYqZ6DEAM3TVJMYh
         +Nbxkbwh2Mt5yDhoFYYqZwJ6BUQqReD0F83bY4tgUc98TLjOJ4Rm15y1j6p5beeQU3ak
         FYwu2in/wG1Ebipsf83VtdaQ9GERqBpE1EMLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811528; x=1724416328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVxZXuTJqaJ10E0yGjjv9nH2alidPK1Y4VYj7sM9de4=;
        b=hyJBtiQid+d5ojgc2hgFUTiLZK/wq7zmT4+jXrao5jSgxx7J1YUcCAFavS/GV03zl4
         0ssAi99tCcL5vfq8tfElGGUdetis3bpxhfMR7L8wxGtxC2bULO0ncKw09xfir0D6Ce84
         RHw66DZhVW4Fl2qE13gpIzAkYOfybbAuLZ/GTI8BNHqskvenB3UBBZPIy9d0GWxP1kzw
         e8NJ4Ue2nGHWpPxVGEz9mNFsRokDT5ZuED4DTKz8vv/DZTG/ilzW9NGwsI3tGl44Ib2k
         7Ix/znA6mGxVzxDtOOc3AQ5t+7iVkXS1vKWyyDsZAbmBlEy7FMCcq+H6lXyvz9uZlnjL
         /lvA==
X-Forwarded-Encrypted: i=1; AJvYcCULCn0/UKLWg6eBZNBsaU4n5Fa+85IT02VSPRdW8auxRlD1BSuLgm2i9TLa3ghHn7HznzJsWq9dv/CgzotLOjqGD1F503PqJVIZoMKsqmMHBHs=
X-Gm-Message-State: AOJu0Yxd0CYqYKG0beqr5K1orr/A5b8t+/x5+lSdFXfjcLYFtGhCgG2K
	5zkzUmH6q/JghN4TLmJsmk/6k0GzGRGQ2a8yqAG3jFzMxAj429FPiwgBkEx6iQ==
X-Google-Smtp-Source: AGHT+IHxo1lFSQMX1cM/4MwpLU2TEtbVsyk63XfQG/g27+OnQuVnbh1zDXFyHf9x2ZFHVGoE5m/EQQ==
X-Received: by 2002:a05:6214:540a:b0:6bf:700f:a3b7 with SMTP id 6a1803df08f44-6bf7cd7ac78mr23067056d6.9.1723811528290;
        Fri, 16 Aug 2024 05:32:08 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:04 +0000
Subject: [PATCH v2 6/6] media: meson: vdec: hevc: Refactor vdec_hevc_start
 and vdec_hevc_stop
MIME-Version: 1.0
Message-Id: <20240816-smatch-clock-v2-6-c63105db07e8@chromium.org>
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
In-Reply-To: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_053209_338332_027E4358 
X-CRM114-Status: GOOD (  13.76  )
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

Make a new function __vdec_hevc_start(), that does all the
initialization, except the clock initialization for G12A and SM1.

Factor out all the stop logic, except the clk_disable_unprepare(), to a
new function __vdec_hevc_stop. This allows vdec_hevc_start() to
explicitly celan-out the clock during the error-path.

The following smatch warnings are fixed:

drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevc_clk' from clk_prepare_enable() not released on lines: 227.
drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevcf_clk' from clk_prepare_enable() not released on lines: 227.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/meson/vdec/vdec_hevc.c | 43 +++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_hevc.c b/drivers/staging/media/meson/vdec/vdec_hevc.c
index afced435c907..1939c47def58 100644
--- a/drivers/staging/media/meson/vdec/vdec_hevc.c
+++ b/drivers/staging/media/meson/vdec/vdec_hevc.c
@@ -110,7 +110,7 @@ static u32 vdec_hevc_vififo_level(struct amvdec_session *sess)
 	return readl_relaxed(sess->core->dos_base + HEVC_STREAM_LEVEL);
 }
 
-static int vdec_hevc_stop(struct amvdec_session *sess)
+static void __vdec_hevc_stop(struct amvdec_session *sess)
 {
 	struct amvdec_core *core = sess->core;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
@@ -142,6 +142,13 @@ static int vdec_hevc_stop(struct amvdec_session *sess)
 	else
 		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
 				   GEN_PWR_VDEC_HEVC, GEN_PWR_VDEC_HEVC);
+}
+
+static int vdec_hevc_stop(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+
+	__vdec_hevc_stop(sess);
 
 	clk_disable_unprepare(core->vdec_hevc_clk);
 	if (core->platform->revision == VDEC_REVISION_G12A ||
@@ -151,20 +158,12 @@ static int vdec_hevc_stop(struct amvdec_session *sess)
 	return 0;
 }
 
-static int vdec_hevc_start(struct amvdec_session *sess)
+static int __vdec_hevc_start(struct amvdec_session *sess)
 {
 	int ret;
 	struct amvdec_core *core = sess->core;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 
-	if (core->platform->revision == VDEC_REVISION_G12A ||
-	    core->platform->revision == VDEC_REVISION_SM1) {
-		clk_set_rate(core->vdec_hevcf_clk, 666666666);
-		ret = clk_prepare_enable(core->vdec_hevcf_clk);
-		if (ret)
-			return ret;
-	}
-
 	clk_set_rate(core->vdec_hevc_clk, 666666666);
 	ret = clk_prepare_enable(core->vdec_hevc_clk);
 	if (ret) {
@@ -223,10 +222,32 @@ static int vdec_hevc_start(struct amvdec_session *sess)
 	return 0;
 
 stop:
-	vdec_hevc_stop(sess);
+	__vdec_hevc_stop(sess);
+	clk_disable_unprepare(core->vdec_hevc_clk);
 	return ret;
 }
 
+static int vdec_hevc_start(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+	int ret;
+
+	if (core->platform->revision == VDEC_REVISION_G12A ||
+	    core->platform->revision == VDEC_REVISION_SM1) {
+		clk_set_rate(core->vdec_hevcf_clk, 666666666);
+		ret = clk_prepare_enable(core->vdec_hevcf_clk);
+		if (ret)
+			return ret;
+
+		ret = __vdec_hevc_start(sess);
+		if (ret)
+			clk_disable_unprepare(core->vdec_hevcf_clk);
+		return ret;
+	}
+
+	return __vdec_hevc_start(sess);
+}
+
 struct amvdec_ops vdec_hevc_ops = {
 	.start = vdec_hevc_start,
 	.stop = vdec_hevc_stop,

-- 
2.46.0.184.g6999bdac58-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
