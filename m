Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A6AC52D6F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2024 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbkY5SiNnJo7GA9pz4irFhGMOqxt2rl7qqHdhsOQa3k=; b=xZ6jX+JcqRHuL0
	I4YoKxgMoQnGBcJ+sNV0s86uiZC7lrUNoL9CKnCsoQJ//OLAkHWDj/og4Gp44GxpZ6DdVYu08B7Kl
	lDEHgREaIG8f726RNv8FUItJCv+B/rrOJSWCa4+kUdi1VyH9c/pzSD9HX4CMqpDjg8agbAaCVSTFF
	vXG0Vwzvbs22rgP4nnfkYNQetxkX0elx6YliwK/lTdtS0SeTU6GiOxFIBLB6YexiHavpmgYk5Dd1n
	GKFB7Hh2K9Q625aenkI5IejE/9a17Ylf0R5JX/mCKbjFFUlDnrGOvkwPZelExr6JQ6np86xmH9Bu0
	VzGfOQNkW65fP9/8mU+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJR-0000000FA0E-4A5V;
	Tue, 30 Jul 2024 12:50:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJM-0000000F9tr-0EMt
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jul 2024 12:50:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3683f56b9bdso2055529f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2024 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343838; x=1722948638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FpQIo3/nECT6BJG3YrzIm131E/DRxLPrAjjYNTEWJA=;
        b=PiBzlOhGBg9o3bRJqS+F7WAXWcdyF9gGDigiw4Xg4VCd7Zo9dPlhqg1ko2tk2eRZ1l
         fFy2B+0V3tjlHrKtQmvWYH7e8BOAn/nHpzc6Ztsn9VLqiHmrnIbe77LDbILM5dkBA2K3
         bl89GIsns88Dt1kdyiwuLT0b92/pnWDjjkoJh5ODK+EUoirJcDnuadYolpWFDfkZ/ggv
         0MSC0ieafZrK/+vqT7GibwZxhyaWwwfT7jPoEejuIKF+N5huc1a2EFWALEucvgGHGFau
         ftFnUwq4mAq5Bud+xIG1wJ8O1WfwXDgXymZcqjsGB8EOuJMtkJ/UucZG64iQuoSD+UhA
         iSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343838; x=1722948638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FpQIo3/nECT6BJG3YrzIm131E/DRxLPrAjjYNTEWJA=;
        b=ugWN16ds4uv3Nn1OLY4TdijlwCZgUMFSwMdulB2y+Dv7ZtzQfJhxuSE+vNXuol9tYY
         PGIsPZKjdaXVDUcq15P04QontKxvl3jAOQjPDkCwoHZEHhu76/owEci/ugH5qjjvTVdM
         f3Sk3isnq6AW4fjX9o+RjNZxIr/i6Sk+MeIK/jAoryahFrwCf5Tn2UPXl812yofVxzcU
         w/XaNtx3uZAbThhBobGUxT+7boASmn110UJEYPp+vVlin5v74RFDfp6Een3/c5MWsoIb
         RK42LZZZ5Ybi3FxPh681BD8eszUg6Prmx6YlvmH9i7HbjchVBkqZizVIHXyQNu5POKTp
         c7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlW/XO5XLFAphc6IyZ8OTTGlbfdokCBmSPKcpJbDqtgi8DcpqeM7+mEAjx/UbGOdy+ZypfuM5cepg5F7kLnPZC56dbgTXDN0MYonw9Sl01f0E=
X-Gm-Message-State: AOJu0Yy0M4oQwf5n5N9/a+QU5FInqO4KAGI+klYkoAIRgolsJQw6QiDf
	OQ5fBXotkGI++hVMkSz4kooiKamviRg8KG+UhqyRiAwCfvGf7N0lEi1lcdcipRM=
X-Google-Smtp-Source: AGHT+IFYKETa1maYsbR/lXJacP4Dulbw5t+LnfR9HzWYE5KbSp8mR/aHH1IRgvWxRpjGsQ/h6Ss4mQ==
X-Received: by 2002:a05:6000:4029:b0:36b:63b5:ed64 with SMTP id ffacd0b85a97d-36b63b5f8e9mr8234742f8f.40.1722343837924;
        Tue, 30 Jul 2024 05:50:37 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:50:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] drm/meson: dw-hdmi: fix incorrect comment in suspend
Date: Tue, 30 Jul 2024 14:50:14 +0200
Message-ID: <20240730125023.710237-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_055040_113861_058FCD6A 
X-CRM114-Status: GOOD (  13.06  )
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

Comment in suspend says TOP is put in suspend, but the register
poke following is actually de-asserting the reset, like in init.

It is doing the opposite of what the comment says.

Align the comment with what the code is doing for now and add
a FIXME note to sort this out later

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 2890796f9d49..5cd3264ab874 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -751,7 +751,7 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(struct device *dev)
 	if (!meson_dw_hdmi)
 		return 0;
 
-	/* Reset TOP */
+	/* FIXME: This actually bring top out reset on suspend, why ? */
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
 				       HDMITX_TOP_SW_RESET, 0);
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
