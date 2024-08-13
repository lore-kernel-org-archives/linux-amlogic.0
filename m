Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6559AC52D7B
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 12:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9KY/x/7JsJRPsE4RGbjRm12Uv6WQIup6z0K+aKMi5So=; b=Eq1xp/bLhQnYUp
	F6d1ly7NDarumjeh4V+jfoi2VL3scDuWjaUTSbjBS0FIxiv4bBPsRxZaN5Ffo6waHiMl0tVTX0nOh
	pBU1TdiZxZQ/+ZuqjCBTDYl1UpZdUXsZpdaukLymLkmGKmWxR+uq2vlJ/Fy1y5J5aMhSTlpx3INVh
	rHgH9JBFl9sk+wOsUOsdxTbSbFY8IHB+TRHgwFn+FxEoLriz2w2cNxhKl04jzbZ9cAgRQfJiGXj5K
	0KNdEH5HdIITVPcOH3QwIzlmzqJRKZNc4481ZXry9NfdHQKp427tPRdDTmtLN0rwSR96F+narJXpO
	DycGsBr0+oa92EB5NGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqPS-00000003dzZ-33yc;
	Tue, 13 Aug 2024 12:13:54 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqPP-00000003dx7-2TTE
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 12:13:52 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7a1d7a544e7so365187585a.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 05:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551230; x=1724156030; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=exEVIAJZd/rYdUXslfft3lBWpWIRwR1McJc3b9INl9w=;
        b=F9yOLmdJFW2qcKWUC3GwAcaZAqbUcTAVM+kjZb+mfCA3C5ecos0DV4WCG9IWjOpn3x
         TeT9OULArAmEUsWUDPGt2/BGc2lItKcEhmBDuBs7ydTb9P3hH1EFftXgCoqlRVdPiqfB
         HUI8GjVOjj+N7q7GCYN7f5rsDU+9Nwyb0tKGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551230; x=1724156030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exEVIAJZd/rYdUXslfft3lBWpWIRwR1McJc3b9INl9w=;
        b=fkl72+qLOKk+zHuuwELiBwnkQ0XFeHQVKyDPU7ZsIuWxuzUvTvGJSZ6W6tVVbBOXx2
         fPeHTVRiV32zCBgkbXVesIkaRGr4C/TdiOcnz7hhAvhiXBVICCikXakbRDbI7OGNVM2X
         KeIYEU9Pe78nqq4a2BUI+ZC4gDxAbp3w1xhpyPsKJWbmwRyTjGhImAnsi8pxLk8KxrsW
         jtM5uGdWashcqL6Ryv79u4Y0riyMh1X17KtUV93ddu71wg8cTzdRryHLjFGjiGK++WPz
         tnuIafWIzu4WMprbV7dZVKB06lfekKI0QdzTOTjdPP+7E+wIZAJuuu7PYcqstVTXUVqb
         MgJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4iqkd6GZpZFVdZGvkKzHuBHCM5ct+EfW9JnXgsdztptXn+4nldgFJ3BYhH/ZNoWu0sokQW1my9+RV8D+0Xrmrt2zmgh4YvA8bhHAkTFAK4t4=
X-Gm-Message-State: AOJu0Yzus6UwaR3Tw+jqS9q6o+wDN5HIvCY8JacX/O5Vgw3lVkFM/XIk
	RnJFmfcC332OpfzCvdFrmlmkbhzQ1wV7FKEJyk6YJENKJrO51tl8sYjQOSOW4A==
X-Google-Smtp-Source: AGHT+IHEAC5qNhYBF14RuyiMsQL8IDhPP6lbNZuwJIZWarWyGBLPSFdo+w5w+ficdZzhLBjRgODR3A==
X-Received: by 2002:a05:620a:460a:b0:7a2:db1:573d with SMTP id af79cd13be357-7a4e153e4femr367590785a.36.1723551229916;
        Tue, 13 Aug 2024 05:13:49 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/6] media: Fix last smatch warnings
Date: Tue, 13 Aug 2024 12:13:47 +0000
Message-Id: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPtNu2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0Nj3eLcxJLkDN3knPzkbF2jtETjJENDcxMLU3MloJaCotS0zAqwcdG
 xtbUAgffoXl4AAAA=
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
X-CRM114-CacheID: sfid-20240813_051351_681470_29754E36 
X-CRM114-Status: UNSURE (   6.30  )
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
Ricardo Ribalda (6):
      media: ar0521: Refactor ar0521_power_off()
      media: i2c: ov5645: Refactor ov5645_set_power_off()
      media: i2c: s5c73m3: Move clk_prepare to its own function
      media: tc358746: Move clk_prepare to its own function
      media: meson: vdec_1: Refactor vdec_1_stop()
      media: meson: vdec: hevc: Refactor vdec_hevc_start and vdec_hevc_stop

 drivers/media/i2c/ar0521.c                   | 15 ++++++++--
 drivers/media/i2c/ov5645.c                   | 15 ++++++++--
 drivers/media/i2c/s5c73m3/s5c73m3-core.c     | 13 ++++++++-
 drivers/media/i2c/tc358746.c                 | 12 +++++++-
 drivers/staging/media/meson/vdec/vdec_1.c    | 16 ++++++++---
 drivers/staging/media/meson/vdec/vdec_hevc.c | 43 +++++++++++++++++++++-------
 6 files changed, 92 insertions(+), 22 deletions(-)
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
