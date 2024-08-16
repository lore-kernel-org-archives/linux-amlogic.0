Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4C7C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2024 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EsTFMsrXCoKjvRkQAkLJ3K/QUC9f2ilvIfusI83Vif8=; b=mOG5t9rH5dhH0l
	CE8blpRaf1T34NMtkwr0WmyaUCAaFAaDMeasa1Zi87mUAyTbpZ6xI4MT/88jqcNstAZrBw5UsOQVt
	0HlUNQ8Tz7bxbVUTDJtJhOM2sIxYpUz1NdJ5z1TDHKUcfpJMg5dycVsx5fx2U1QwzQdRgsgsC/uNs
	fwG8e+gJ5PqcGEXJzH8X2raOyynsQglRhefT7S+fv8sOvRrXAZIdTMUpAH+qhd8+uA7Csuztyn0KZ
	EEh/w000BMyxf6Ks8xyfCv2FS8r5cCReH7v+pdO5VyrZlLv3Q/NoEUM/aSsYblyHxe3bYOBLtep50
	bndzYmEB1g9qdAjFN+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sexHS-0000000D5J6-2QFz;
	Fri, 16 Aug 2024 13:46:14 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew7h-0000000Csd9-1aqc
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Aug 2024 12:32:06 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6bb84ac8facso9416516d6.1
        for <linux-amlogic@lists.infradead.org>; Fri, 16 Aug 2024 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811523; x=1724416323; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CCFoApgC3NvMeXYvVFjfg1wg+6p9sI3vxSueR9OSw4I=;
        b=B9O59yiKGKfDVyALyYH+SAUIr3MIeTJxxPjvuwJgKqXVmrqE6ZS/GQ7cmaBCayhHBe
         JKAOeELW/YQzBx8eOqwaFMCmBAFVqOm8yCkEf9HxW+J8oVhx6yMqaDBglK5gsBU3OBr+
         cAgqe7nSD6hGBnJGvqY/+PxULYc+xgAbHzMXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811523; x=1724416323;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCFoApgC3NvMeXYvVFjfg1wg+6p9sI3vxSueR9OSw4I=;
        b=Eilds/+S8m6cL3RICMSo3M3xif3+RbMmQv82qZWQAsuAEpoP7aEMUWCPoQKL0sIa+I
         cQv7Uq7ISbjo23k5ejztTTZ5cJBnl+UYKAdS6R1z+LaSWCiwOkId90fWTTKPeipPUYB0
         4I6wYczWuHtVLLpYye/HuLvC7hK2GNFnljIdjrU4alJAeN6NUQv+NjRLdjjTRa+ioUWg
         JmaCdvi48rY0Cb5Yk66JNYnywRlU+mfeKB3oINFsWr2mYs80y7XNo6j1T41fsP6qB+H9
         N0NXhZLCLtb4hDwLMFr0DGmlfNxPXrbFqC2Ef+F2FG18XkwWkNejb4SfrOBC5rVvdAUR
         lwtw==
X-Forwarded-Encrypted: i=1; AJvYcCWPkCyIbbOqY3O+EYLhnUNdCnOn7FyDHrCJGTHvEu/HzPo/GRLBVP+ej2kL/tkt1h5MXH3IXKk0PGn9Idjmf2lf/rAI3mXsg8RE47KQitkSYSM=
X-Gm-Message-State: AOJu0YxjFZ3sQAJ872g5BHSh7bdJLraqWUgrsjvC2Yl/0vIb0W+ZQqmx
	E51elHUE+ylCDmGZs/sgysm80bhctnhPo803510sP9uHIujKK+HQvz5yLaSFJw==
X-Google-Smtp-Source: AGHT+IFoKdLi76sGKTYFPYZCioyONlAB3ifLSzlc/E/kHAkYIvV8qgOxuFvA3vnNFKsn84Rla7Ntqg==
X-Received: by 2002:a05:6214:4a93:b0:6bf:75f8:250b with SMTP id 6a1803df08f44-6bf7cd799b3mr33366816d6.10.1723811522620;
        Fri, 16 Aug 2024 05:32:02 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: Fix last smatch warnings
Date: Fri, 16 Aug 2024 12:31:58 +0000
Message-Id: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL9Gv2YC/3XMQQ7CIBCF4as0sxYDlLboynuYLuhIy0RbDFSia
 bi72L3L/yXv2yDaQDbCudog2ESR/FJCHipAZ5bJMrqVBsml4lrULM5mRcfw4fHO5GjqQYhO6aa
 DcnkGO9J75659aUdx9eGz60n81j9QEoyztlWolTw1g8ALuuBnes1HHyboc85fp/U9f6sAAAA=
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
X-CRM114-CacheID: sfid-20240816_053205_461080_EB57F4F1 
X-CRM114-Status: UNSURE (   6.33  )
X-CRM114-Notice: Please train this message.
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

This series completes the smatch warning cleanout.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Fix double free in ar0251 patch. Thanks Dan!
- Link to v1: https://lore.kernel.org/r/20240813-smatch-clock-v1-0-664c84295b1c@chromium.org

---
Ricardo Ribalda (6):
      media: ar0521: Refactor ar0521_power_off()
      media: i2c: ov5645: Refactor ov5645_set_power_off()
      media: i2c: s5c73m3: Move clk_prepare to its own function
      media: tc358746: Move clk_prepare to its own function
      media: meson: vdec_1: Refactor vdec_1_stop()
      media: meson: vdec: hevc: Refactor vdec_hevc_start and vdec_hevc_stop

 drivers/media/i2c/ar0521.c                   | 17 ++++++++---
 drivers/media/i2c/ov5645.c                   | 15 ++++++++--
 drivers/media/i2c/s5c73m3/s5c73m3-core.c     | 13 ++++++++-
 drivers/media/i2c/tc358746.c                 | 12 +++++++-
 drivers/staging/media/meson/vdec/vdec_1.c    | 16 ++++++++---
 drivers/staging/media/meson/vdec/vdec_hevc.c | 43 +++++++++++++++++++++-------
 6 files changed, 92 insertions(+), 24 deletions(-)
---
base-commit: c80bfa4f9e0ebfce6ac909488d412347acbcb4f9
change-id: 20240813-smatch-clock-2fa3b1174857

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
