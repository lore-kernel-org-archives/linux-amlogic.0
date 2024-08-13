Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887E6C52D7B
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hj11bpDVjymtR7NtE9Tt5h41keuFqpF7mpLs0zF11us=; b=Ajs7aXs1CFsJc9
	r7A9fC0eEXhCP2D94M9fmSohvALn4t2YGAmBbTyclIg+5bJJg0URStL1/os/iJkR//lgjOD0iXqrJ
	fWkd8Z7aTmWjYqyCibQaT5F2h0ZlvQAghkpNMKgISRHtLfOqQeowyg2m3NntoGOkS3QdJqTSarApc
	jcMD2yW97JAJfyXTL4mCrExJUSqmovaWYij8XsGDN8RWq5yhyCg1GhDHCxYkHAFrzELeoMRaTuk5B
	kittimVDg3fOE++xCEv+865JaLsggRuJuBU8qscUSWu+WEMiuMbp5Iy+UxJfPqxslA4SCi6oJ4TEr
	edhlWjSlIId+aaBI1NCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqT5-00000003fBq-3btK;
	Tue, 13 Aug 2024 12:17:39 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqPV-00000003e2A-3GUm
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 12:13:59 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5d5bf833de7so2973977eaf.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 05:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551236; x=1724156036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbox2ZoitlY78mZ2yFdlFoyXWXf8v8pDSpmA621vz/E=;
        b=MJ+6WUUq+1vn8hJ6O+W428j8Zsnjd0ikvhqRQOd9LFTNraa6Q+yZHD9Q4uO6TXgUsT
         oDRCpVUMJYY3OFkKd4CjhEOa3xRBbEb/BsAbB9rZWvETfZWtJAEZHbhF2MRGNVxenmBs
         4oPqQNZTXVdZxzepi3UcQdf1EEca1v2FPk1dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551236; x=1724156036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbox2ZoitlY78mZ2yFdlFoyXWXf8v8pDSpmA621vz/E=;
        b=IRmRmCUX5UhBsymNeK8C6Ati+4FpMMuvNf4tb4NWyvnDIApw7jVry49t4eKSAKe1uF
         MsEa4XriR+Gk/lgrs5v4nQDq9BC70BHsA42CgMb8waOx/H2BLxXkGunAnN/KcB8w8A/W
         1MuRJbXke0DWPK4TdHHJLifTQAf1juBBlpmlEtY2xmZ1jW9BDI4yf1WYITyRmyQhf1We
         BGecg/1BhkQpftBYS5f40KIQMG6iUe5DEAStoKBwkX9lGIWlRHel+zzAQr9UPdRcGjBd
         qNt7hyz1R9bt5DVjueWo1XaVKNRxeI7dwEOvUTPJ2Inl8MrHdeLQ/7QqaU/nU+ohP64k
         1d4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdrR0/xApHOxsU2PNlHmBkEwnsWOr1Bi0aaugO4nyJB7evT2KGql9e2UnAN5OMq1U3Pa8faCVd4q/DECWW4GvX759iASdwFfkO+xHNBK9UXtU=
X-Gm-Message-State: AOJu0YyOi5VgPzyzHz4xxpD69LNLAIExn5X1jbOCclvukERIoTBf/erc
	xsqpn43VKEIlxvSIXv53anbrcSZtP1PuguyQJLZcWhEBg9ubaShdrt7wCoW3Vw==
X-Google-Smtp-Source: AGHT+IGgXIJUCN4cjOUkGFgon+WiB2P8zLnuNtMLuoWTLxNw2YXdYtwoDqVO1oPdH1blkel8OnEpNw==
X-Received: by 2002:a05:6358:e4a4:b0:1af:1105:49b7 with SMTP id e5c5f4694b2df-1b19d2f4c8fmr402139355d.30.1723551236049;
        Tue, 13 Aug 2024 05:13:56 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:53 +0000
Subject: [PATCH 6/6] media: meson: vdec: hevc: Refactor vdec_hevc_start and
 vdec_hevc_stop
MIME-Version: 1.0
Message-Id: <20240813-smatch-clock-v1-6-664c84295b1c@chromium.org>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
In-Reply-To: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
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
X-CRM114-CacheID: sfid-20240813_051358_073570_4CEE1136 
X-CRM114-Status: GOOD (  13.99  )
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
2.46.0.76.ge559c4bf1a-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
