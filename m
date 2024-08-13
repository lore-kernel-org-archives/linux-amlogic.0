Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98480C52D7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWFoajyj1eeKvnA8EwUXqA4q1aeOGn5bY6UDnXCyowM=; b=NehGcrOOMAGnVE
	RlTTXEaYfI0P4v+qgtGwoQrfjnSB122pbIw1QvmWMytuF0hu/UKbhjE7FCTFgmyc+bEq+CKROZWXY
	cm7HO0dCof1LQ5xY4tfIJXvGpCs0f7HMQziGPps8syw50NqPjRqDJkX6BPRI5RCLEgvvVGMIJBq47
	Tzo4SWSZ1J4FxdJiSZvBWgDwjJEnZ7Cb+EA+sQSUUxmMoCTM8WFzU2nykFG721KMVXNzx8m2R9j/s
	QjNa8YWS4TKg+kzA8hLdQwdXaw3xi1CrDiPeqmNv/2FtDhFUua1eVU/I9rVjoXKn8krBRGqWMwXMY
	0PuMFYnFfchpoRA29TBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqSV-00000003f4H-1kQA;
	Tue, 13 Aug 2024 12:17:03 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqPU-00000003e0k-0J6p
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 12:13:58 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7a1dd2004e1so337973985a.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 05:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551235; x=1724156035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryvSTyFRHLyFB4VqqsDZg/Laqqf7RuuAiNN+vKB3Dic=;
        b=gWxc94lIw8HFHLT5PFd6I0+fkYjd1k81Kc9IgQGyscvMLyjts/P4TXgcl639Wmw5fT
         QpMNZR7UjRtuo/X2YI7lQetEF7J5FacZjMg+nkKy770b+ffX7znSMp3jiu8nZKQ8+A7V
         +BBJXOsY5oFFEm1oWdY3uXp7+e5/LehwPoJJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551235; x=1724156035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryvSTyFRHLyFB4VqqsDZg/Laqqf7RuuAiNN+vKB3Dic=;
        b=i4rpCMe41L6quRNCBD1A3bKmxz9sr6+FIrELZFcYGoSsOyjS8EWK6Q/4WjTO3xq78l
         Ci8u7f68CNhPywQGcwvKSpEPW/BhanpTvJjYhW+YKf7p0/GEQmEac8st8pDAOhUcmM25
         4uGg8ho0TzIpXNTcw8vvGEQSOJxGDBDRdgIFGy0F/yZOz2ILKt0TrKxYcUjNpsWg5aVX
         yxcvNwC6bsWOYNUjkISb8gLVTPQDJTxXSRqyJkxaRzYYD4h1RM5q0/Of9sdYixivmp96
         zd/chGl33+mUpz9KJMeHpaRbs9xRnSB+5PyVRHwK+pbz+ipHtIMzLbhZkBX1rq+VF1ob
         j2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV1Bvut86LLaDvp9aALMFO3K6RoIxN6hEAkjR4RvZwc24pntqFgST7bwXXoY4TH3hNIvb0fW1R3VmjSRj1C2IsP/5Ml3bXvI8PUV9O3zdZCzE=
X-Gm-Message-State: AOJu0YyCXZX/a2xnDqVaRV1XGwKBkiRdzCYwusl7LRQXgMmV28Xprsnd
	KgXHEHsNYMUeGFnlf5u17mQts9RmtwXnjdTydabWjNav0ByhTHXvP7FaBHYafw==
X-Google-Smtp-Source: AGHT+IEOX25WNCrWUaMxc3lkZuEvbZq3/dMLr0NrYO2cFstfRrmQqZhk/+W2xbcY25YibUai9xTEGw==
X-Received: by 2002:a05:620a:31a9:b0:7a1:6062:ed63 with SMTP id af79cd13be357-7a4e15a434dmr379872785a.29.1723551235139;
        Tue, 13 Aug 2024 05:13:55 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:52 +0000
Subject: [PATCH 5/6] media: meson: vdec_1: Refactor vdec_1_stop()
MIME-Version: 1.0
Message-Id: <20240813-smatch-clock-v1-5-664c84295b1c@chromium.org>
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
X-CRM114-CacheID: sfid-20240813_051356_310454_A037EE9F 
X-CRM114-Status: GOOD (  11.35  )
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

Factor out all the power off logic, except the clk_disable_unprepare(),
to a new function __vdec_1_stop().

This allows vdec_1_start() to explicitly clean-out the clock during the
error-path.

The following smatch warning is fixed:
drivers/staging/media/meson/vdec/vdec_1.c:239 vdec_1_start() warn: 'core->vdec_1_clk' from clk_prepare_enable() not released on lines: 239.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/meson/vdec/vdec_1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_1.c b/drivers/staging/media/meson/vdec/vdec_1.c
index 3fe2de0c9331..a65cb4959446 100644
--- a/drivers/staging/media/meson/vdec/vdec_1.c
+++ b/drivers/staging/media/meson/vdec/vdec_1.c
@@ -129,7 +129,7 @@ static u32 vdec_1_vififo_level(struct amvdec_session *sess)
 	return amvdec_read_dos(core, VLD_MEM_VIFIFO_LEVEL);
 }
 
-static int vdec_1_stop(struct amvdec_session *sess)
+static void __vdec_1_stop(struct amvdec_session *sess)
 {
 	struct amvdec_core *core = sess->core;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
@@ -158,10 +158,17 @@ static int vdec_1_stop(struct amvdec_session *sess)
 		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
 				   GEN_PWR_VDEC_1, GEN_PWR_VDEC_1);
 
-	clk_disable_unprepare(core->vdec_1_clk);
-
 	if (sess->priv)
 		codec_ops->stop(sess);
+}
+
+static int vdec_1_stop(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+
+	__vdec_1_stop(sess);
+
+	clk_disable_unprepare(core->vdec_1_clk);
 
 	return 0;
 }
@@ -235,7 +242,8 @@ static int vdec_1_start(struct amvdec_session *sess)
 	return 0;
 
 stop:
-	vdec_1_stop(sess);
+	__vdec_1_stop(sess);
+	clk_disable_unprepare(core->vdec_1_clk);
 	return ret;
 }
 

-- 
2.46.0.76.ge559c4bf1a-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
