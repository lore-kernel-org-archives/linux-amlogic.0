Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24C6C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2024 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfXRHgNmVomF9ZOj5rGnL1PNCAiK/HlLYM4UnbqEBXs=; b=Unmk2XDkLnqICB
	XO7o2t9nGM+vx//NfMJ4SfcvU2sU5lHXs9IwhH4JtTaooDky5/hAj3TbL6olJLttAyQz1w6Lcd6mr
	IN3AHS3ugkLqUwaZrjgaBKLSnGgrKWaKQLti7zwjZvrs7yKJmV5fX6mJVbRUqXJa9zT7uGvKZWkN+
	o3o5GyiL+rMw+ySIGTIqqbjWkwrfH0s10AOLiXC+mTwNzWx+LxbwFNhKuADFfNBQ/DAyTzv3eNK5G
	hoUib1bCnIOzd1xU201Fg44AqP16otiupFzp+z9iFu5TujEQvyVaCESJrhrw4/2HCJZDHZegxEQtc
	OExKoZ2k2orq+Zw3YRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewBX-0000000CtbX-3Pwm;
	Fri, 16 Aug 2024 12:36:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew7r-0000000Csj9-1SST
	for linux-amlogic@bombadil.infradead.org;
	Fri, 16 Aug 2024 12:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=M3LNSQjxs6knu07oTqqXD2vtqpOl0khzecMqHctA770=; b=JE8E3X0HX8uKAd7yx5/qFGHOdX
	mTk6dWV27uW+lbbMdd8iSRneKUJlMs0AmXlC/ad8rZ9LvkyRXG9ZIJjDGB+vrRVftlnD//4Uac75D
	1g+njBuy1QMGZULw7C7VD94cpsHmSHCfb0kBOe2hyG7PGHtB41iHe8ZjnQnZZ9eo4EA8LwK1C+Ti2
	fnshO7WBpUO/CfO8vAVr4qf0wY/5FZiH11t9qevIFdUFolfRcjSwt2jTl9i4oTaNSmC6xUalliewF
	emgyyEeCdD7AofNbvA9BEsjgsNLJQrWLaTJubdDfaS2ZrLguaqy06JYbfXdC3MREXH1Nd7Xp872eY
	6Y97MoLw==;
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew7m-00000008eGs-2DHj
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Aug 2024 12:32:13 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6bf6ea1d34aso10385516d6.1
        for <linux-amlogic@lists.infradead.org>; Fri, 16 Aug 2024 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811527; x=1724416327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3LNSQjxs6knu07oTqqXD2vtqpOl0khzecMqHctA770=;
        b=RB3mXAzWStMJvAojlIVaK/I8l7uWB7lfAEB5efGGoRcyF0x3REPD9fFlyaI5siGziW
         Ja9fbeXvIdICEmwzAFeBICtsKE7SFb94I/A8R4cKM8Z6ZtDeukHTjVm75KFnmfnmp971
         rMwR237TxnYC0j6z7QhkE2DpiEHEB3VOdl7MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811527; x=1724416327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3LNSQjxs6knu07oTqqXD2vtqpOl0khzecMqHctA770=;
        b=tx55q0zVsltsCUvTw82Dbq/Uy6708yKOM1LgQVm2eP2v9avzzLxrYGu3O0pQSw2GC/
         IRu/RFyXQDPK0HI6I7avelA2pq1PWjUpsNh0/x1yyAR6PzFEhv7uPjvBe0Z3nPPNTWb0
         6h/lcSYWKqjdUJtndQNhNYDB9pSVwaOJd14cBc3Eyg7xUx8i3l8oCZFSHyHam/JxLJ5d
         laypM74Hj1RXz5DTg0GSGHjITxlzKksyuY1pAuoL9sZV+J4Ym83wsUBDZWiq9JaOXfkK
         9GZeF78hzmdmjabUyJzDGPpkrenoY/ATk64i62hcfSuwBp8ziQ8j4ZosmCWbgp5HD/N1
         rOkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWclQt/+S9KvTMJZxqTfp7ykAthYAmjKt4l2SRmROcspvUvkl9GK6VqtXsqqzGwj2ew1NXnJNz6xIVbIUh97VrP9i4MeZawlYSojas325/7ccQ=
X-Gm-Message-State: AOJu0YwDXaWGE9h4/lZ9aIyHWLDHkv5c8xZ0DrvlKG7E+ywMbMwZyuG7
	V43czIDFot3SX6r1MoSs5s9CUR20KVAeJK4zEUQuZ7LQ3a/9hgRNwGvjOWfWvA==
X-Google-Smtp-Source: AGHT+IHYD7aRmKGXgp+t/Ifehq3d65H0DR+M710hdZy/In2eSfy3ZYdXCjNDHAYDxXFnFLaObLyDlQ==
X-Received: by 2002:a05:6214:3d9c:b0:6bd:83cb:1b8f with SMTP id 6a1803df08f44-6bf7ce5a411mr36042536d6.36.1723811527255;
        Fri, 16 Aug 2024 05:32:07 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:03 +0000
Subject: [PATCH v2 5/6] media: meson: vdec_1: Refactor vdec_1_stop()
MIME-Version: 1.0
Message-Id: <20240816-smatch-clock-v2-5-c63105db07e8@chromium.org>
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
X-CRM114-CacheID: sfid-20240816_133211_200539_B3971FC1 
X-CRM114-Status: GOOD (  11.17  )
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
2.46.0.184.g6999bdac58-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
