Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B7FD6ACFC
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Nov 2024 18:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MpwVRBsE9abgKCWx1N+etBICRSLjDsF7ufL9/uGvjh4=; b=2k3eiHi/0raFPb
	LW32W8f7u4i6V+I/8Oios6rlMoAHrPISHNPt4TfZA6ea09JbJdvUokoZ23DIRmF9roDmsxihLJS4K
	SRCOBULCwvEYvkL3/axiyQlAxdYO5SfT2KViHBkHFCLkMmRrYzgewtETatQ+Gl7b56D/Lc4JTgeh+
	o25nZxSkRoP2ArpfYfvi7wOiSczwJPEICecuI9vRA1G8o3gCH9UhQm9e/qE9il+U8EFpXFDP7vr/b
	RxFa8oERZLWM1lDAj96W10TFHfs756U8ibVUVTR6cWG/QdAYZ4hhujViWEAQiSsp6CNP8r855TFuO
	Lx8Fl9TC4Nczr6Z3ixyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGN54-0000000Drem-0GZV;
	Wed, 27 Nov 2024 18:48:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGN50-0000000Drdu-2FmL
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Nov 2024 18:48:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so25419715e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Nov 2024 10:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732733280; x=1733338080; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jcpw02mhb64jdwB+dNNvFHOzRMCWmmfGsK3Mw00EgFs=;
        b=Ig2tuhVUACbC4igURDGObdJJZU4REr6AvJhMRN7uzsS0ArD8gOCaY3/XaUK10CZvrJ
         Z4aQhHrrgZSO7cZFdscdVMG3X4mSLnV8ekODq9PI88FTcpvIAu558FKXvATc5kmh6V+3
         3EdsAdFHgXZZcz8Nq1Z+RrTVFuwvYeyeR9+8HlMwkfQBzrNyzQhbLZhd9BAGmmwDx6DY
         VZ+jTrbF+k2ew9GMWq4UO60u+dk+dMs/0nY3hwkS3i2RZlLlq013iQ5ChdR/V/gpamuJ
         dmfVwUGW4QepNBGFpFRDP/MQ4Bo0td1spHz2H18eglX4+FrdlpA37Z4RQcHQs5Ri259M
         I3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733280; x=1733338080;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jcpw02mhb64jdwB+dNNvFHOzRMCWmmfGsK3Mw00EgFs=;
        b=cnC4zAaFbX7USty8TszjbNAWBsdIQbS16/htu+4kUYoe3/FrRPA9ahagbaMLIGV3gY
         /rq0i6ccTkWzX1rsVzWe5kGr+uXqpupPtzRnGvWd7QOKP9b7tr1O7qcuJ1rBdMkiEbVn
         ZMnRUA9+L9wnzl6otiHgHrk3Oo063Fn6fBE3LY4WAgkH6ekD9nFvN66xShxyop0E1hXf
         ACG2PwDKUGtdzs6hoyK+1kBschZ+KMISGQJz3FJ4Pi1MNB0UHedo+a7U1DuzujPxn3/j
         VvAsbwr9aWkfgh6pPr4c6L1ui5ywZFxkSDT91iIW3g/SLQF5Sq9Bsgkjt08YgquH/7n0
         Y/KA==
X-Gm-Message-State: AOJu0YyL03+meG2XGiqxBxQi8qjXbvx8pFC4dLXsWJTRZzHvLH/jiJzo
	jL9XYwx0nUD9+eqGc5NpnaOYETxQSKL6QacK26x5EPRg0g7NGeGhAiWKzDT0MXk=
X-Gm-Gg: ASbGncsQ0nDOH7WG0LhEIKCMxEyW3VZMNtMtYZvRUsNxupLdeB+KcvTdgfQzgyjG1w7
	waZ/O1FwTvPm+5arC45sREJBFQSsFQii9X6Hkl3mlkPu63vUtfFfwtWVUButc9UqJ3nROo5X0TT
	QzVtjT3XJo5wEgdShXF4VhbvcV0l7ZrsUvwondxe6CbBlF60NQbkyXiW8m/KCGoTQma67rHA4JV
	nviVHCG/mPChNuqrbiZ1Ch4FrAP1giY0l4CzCQsmfR5dm0ixCBhgjexHCu0fM//
X-Google-Smtp-Source: AGHT+IGr99n2pgmmmlqNTfnISk2hQpeyV5JpHyTyMj3WvVC6iQOTmJfEucqeLNOUYv2B6leOlv1B8A==
X-Received: by 2002:a05:600c:3b88:b0:434:a765:7f9c with SMTP id 5b1f17b1804b1-434a9db839emr37961625e9.6.1732733280392;
        Wed, 27 Nov 2024 10:48:00 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:e571:5afe:4e1b:8936])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa7cd343sm28854325e9.22.2024.11.27.10.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:47:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 27 Nov 2024 19:47:46 +0100
Subject: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
MIME-Version: 1.0
Message-Id: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAFFpR2cC/x2MWw5AMBAAryL7bZO2xOsq4gNdbFDSRSTi7hqfk
 8zMA0KeSaCKHvB0sfDmAug4gn5q3UjINjAYZVKtTY79MmN7Wt5w4Bu9HLiyCLsRVVeozBS2TNI
 OQr97Csr/rpv3/QB9Wvy8awAAAA==
X-Change-ID: 20241127-clk-audio-fix-rst-missing-0b80628d934b
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=NRkynitJcItte924uDQklomHInx09SX2d6xRgfzqXGA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnR2ldNqnF+hCENTkKMXcIyoeqe6vo64sANMP3G
 v8+TpjiOVeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ0dpXQAKCRDm/A8cN/La
 hSHeD/wMqPZGojSkTOSnh93vp6D1DDTdHNlEehKY7SxVGlFjp1RIE64G28ltFd5voZCdRTuaaRG
 E7Log9CTOmBf0nReg2WINO1FfRKR0AC929HkeUFdKngXVIBSieROtVjvz2cRJJ5AAVFs67a3g22
 cFaPyFy1rdmlP+rqcA2RyfjXtFohm2WsSKtUrColYXMr1FLcCwvjWrX/KFUQTeol+pAwtk0YjMr
 MGn6ucKC8BmGeLn/AIsUjy9JJJSAt8EcB8X0q0+6lgIpOIjm0R8Lcc9RnFdBbHVb/Sx87xHWoNV
 chtT31Nt7LScLqDuUJOOyZCUPhFQ1WuF/SzPK/l9AjXBW9S0s2tPEsG7AMV5Jl6rlEdKRTuhT+S
 MYRfsbw7uLbydPEDIY9g+NjUBdnpPOYqFqrcwb/pJKqAq4vu7bKaYrvZoeew/YFho1WMB9gZMCu
 DObmWT5CLGisIXCmqTfsI7oJM3n8RwRHjxXrkYGl3M/IMiItcT3pi4o7jEzko+wlO1MqplRrrPS
 NN64QqczvMiS90HpiHmFxyTEJshpkD3x2l0HXE5dmwkcRN/A8xczzcuTU54dL66wNZFXhwcJ5hI
 GkGP98Y/CD4Mb/BTFu/UZrpZ12QdJTqzWMaXWCjtE1BYTnHwGK/SarH7xJJht27F/rdqDsSY/Sg
 i5TH5EzTDzIOlWA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_104802_858341_A3C48EAE 
X-CRM114-Status: GOOD (  14.02  )
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

Depending on RESET_MESON_AUX result in axg-audio support being turned
off by default for the users of arm64 defconfig, which is kind of a
regression for them.

RESET_MESON_AUX is not in directly the defconfig, so depending on it turn
COMMON_CLK_AXG_AUDIO off. The clock provided by this module are
necessary for every axg audio devices. Those are now deferring.

Select RESET_MESON_AUX rather than just depending on it.
With this, the audio subsystem of the affected platform should probe
correctly again

Cc: Mark Brown <broonie@kernel.org>
Fixes: 681ed497d676 ("clk: amlogic: axg-audio: fix Kconfig dependency on RESET_MESON_AUX")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Hello Stephen,
This fixes a problem introduced in this merge window.
Could you please take it directly ?

Thanks
---
 drivers/clk/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index febb5d7348ff07c2da0cb5fd41d2ad2607e5bd5d..ea16bfde0df2d7bfebb041161f6b96bbb35003ed 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
-	depends on RESET_MESON_AUX
+	select RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.

---
base-commit: 6f3d2b5299b0a8bcb8a9405a8d3fceb24f79c4f0
change-id: 20241127-clk-audio-fix-rst-missing-0b80628d934b

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
