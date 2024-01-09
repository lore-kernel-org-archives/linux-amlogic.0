Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2667C4706C
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jan 2024 23:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vvfFvnfnizrhoXtbfj/aWQ+dCrwXDjJLIHCe52BzNeA=; b=NZ5b//1DFQJfhf
	t4ieGCPJxtPpwBkLIZakoz8VeO5c6oBAZZgxX66XeuAd3KkDXPYGx84oMTgat5p+tWeT2S7z1DY0X
	SXTk2lopixLVDkzcY5Nm4q6xIZHtnzAzAebvaek36ed0/2bxDRaa6M9zSO4SMBbsEYrwdzXaHNkC/
	UAB0fcsv4oZ9mlHuoMyStLBRFoVECOFVu56OrURCYsCcIFGT5ZYOlCq5l5pua4UfOd+WYuA3Ej1NH
	gpkvI2EUplSSCVTw/kdEO/xIlAMHMtn/N3mYNcRH9IMn08QsaRSuQ6vveHAi9ujwagKhMMBf+q4h6
	giaY330DbC36EclhsSrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNLBl-009mfv-27;
	Tue, 09 Jan 2024 23:07:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNLBj-009mdK-0v;
	Tue, 09 Jan 2024 23:07:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40d4f5d902dso37459515e9.2;
        Tue, 09 Jan 2024 15:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704841630; x=1705446430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SB32//xbcW4q0bnp0pdqAtTjcsxtx9ia49ME4uFhsuI=;
        b=V1OU3yIOX7wCpUIJLEzd7l+bYSvfQ1qNvphoIrOL5MrFwDc4FS3q/+vRgMDELSBeaw
         CzHcpxt7UklkNPz2lueV5tUCqNqzWOcThLyIa1Ff/NpjK1SNjx1cFRvr7J+HnM8I3x9l
         qhBhR6SqcriupkVL4eS+v6bCDhP4jJ/TGZwFHmaG4D8cPYpB2en2QuU5YcHvTBKQXDw+
         R1e4ZXdxpsYF69XMPQw+HIQ324BzCfRhVs9Z9vsJTAUcSirCfzDP7DknOwh7AmZ4vZQv
         5U0jGx10Iq2nAFvwPnwYRcSyvBF8JLOgo2QiASk9U+Xg5/f2jCl5lbYbxPkKpMR46kYe
         y9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704841630; x=1705446430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SB32//xbcW4q0bnp0pdqAtTjcsxtx9ia49ME4uFhsuI=;
        b=Z60qjeNxLkoOCNoJN+JlBVmrNO2ylazOLZOad3R7IHrpC4wk5Vtxd10ZHsqdT859oL
         LREGDFoQgkJc8Jhr1F/bR67hjlnvxzHDqFB4nWQX9s6LrCoV3Yt3fIcYBngcNFf0q7yf
         28pKsQXrMnCHaAtB9zI9Ixk92+hrjasvOkZ6P5lcSDQMymK651dWNeAf2HcoogxNe1at
         rGEXxSRTYU/4iIETwuyIzatQC/X/m9GkQxqdAGCumxnvWqBgxUi2fxAkbEU/tIpBxlDT
         ukJA59Pll1FBNPU9hTuybY4ymvHIJrBgT3ch9oSCX1EyzLgM4mT7yQrf3Ea2xl+tFLX1
         kZsA==
X-Gm-Message-State: AOJu0Yxm4/F6fMyrLjlOQKJTX2UZBqaok50+ghyaRFQe7LQOEeOhCBRf
	5sgSItYC6u3xFw2V4lCl+jI=
X-Google-Smtp-Source: AGHT+IE2PVEJT8mDhWzJ6iSvWvAbhYiuY5i/hdgn30vebpKJwshevCMFqAjmPMAfHgMekvj9Muzm+A==
X-Received: by 2002:a05:600c:3c8b:b0:40e:53f4:f979 with SMTP id bg11-20020a05600c3c8b00b0040e53f4f979mr22910wmb.164.1704841629893;
        Tue, 09 Jan 2024 15:07:09 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c0a0a00b0040e486bc0dfsm54021wmp.27.2024.01.09.15.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 15:07:09 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/meson: vclk: fix calculation of 59.94 fractional rates
Date: Tue,  9 Jan 2024 23:07:04 +0000
Message-Id: <20240109230704.4120561-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_150715_363293_A5684F9E 
X-CRM114-Status: GOOD (  13.05  )
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

Playing 4K media with 59.94 fractional rate (typically VP9) causes the screen to lose
sync with the following error reported in the system log:

[   89.610280] Fatal Error, invalid HDMI vclk freq 593406

Modetest shows the following:

3840x2160 59.94 3840 4016 4104 4400 2160 2168 2178 2250 593407 flags: xxxx, xxxx,
drm calculated value -------------------------------------^

Change the fractional rate calculation to stop DIV_ROUND_CLOSEST rounding down which
results in vclk freq failing to match correctly.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
I'm unable to give a better mathematical description of the fix as I can barely read
code. The change was inspired by [0] which I chanced upon while looking at how other
dw-hdmi drivers handle fractional rates.

[0] https://github.com/torvalds/linux/commit/4f510aa10468954b1da4e94689c38ac6ea8d3627

 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a82119eb58e..2a942dc6a6dc 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -790,13 +790,13 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
 				 FREQ_1000_1001(params[i].pixel_freq));
 		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
 				 i, params[i].phy_freq,
-				 FREQ_1000_1001(params[i].phy_freq/10)*10);
+				 FREQ_1000_1001(params[i].phy_freq/1000)*1000);
 		/* Match strict frequency */
 		if (phy_freq == params[i].phy_freq &&
 		    vclk_freq == params[i].vclk_freq)
 			return MODE_OK;
 		/* Match 1000/1001 variant */
-		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
+		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/1000)*1000) &&
 		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
 			return MODE_OK;
 	}
@@ -1070,7 +1070,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
 		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
+		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/1000)*1000) &&
 		    (vclk_freq == params[freq].vclk_freq ||
 		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
 			if (vclk_freq != params[freq].vclk_freq)
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
