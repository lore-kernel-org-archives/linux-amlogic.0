Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC659CAC5B0
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Sep 2025 13:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HQQ6lMj5WE2evgQRKNLDUg3Rk/nSmzt8sIpry8pFmqU=; b=dMm1V4D5Agd9qQ
	r/rUy2nznyqEP7rLGp6NYpHCOqlpoWd1nZOp7A2T45Zo4O6kN0aTtA52/sjID0wFSJKCCqludmdlK
	XV1HxvMyozUoFdZd13rjQ0Zgw7C8aY79dzS7mLeW5ZtyMr+kNijqpWc3qNErMuq7lJyMQRYkDuu+G
	JkFbEb5IALp+4EZVqrGX0qFogweDAUZ42jYA0T5rUTW99D4bF70VXU4EvrJrQ6uHnz4rQaBLueAr5
	mG9jcfvrrN60knwPjLC/S7WnxkNBrCipx0M8lcdPFyJI25mygYGnAlLhvX/OBEboLRt0O9vUcvGaG
	1qwH40CEPFyxANAP0WKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UZc-00000009rnD-1syN;
	Sat, 27 Sep 2025 13:02:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UZZ-00000009rkm-2LNj
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Sep 2025 13:02:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e414f90ceso13849705e9.0
        for <linux-amlogic@lists.infradead.org>; Sat, 27 Sep 2025 06:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758978164; x=1759582964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5S/zRBKTkSInAQ7R7zklKxxLF5akYgcZwi1P/3w8im8=;
        b=aH+Ue3QLx6bRDlrMqC4nUnWPcWcfC+ytw24vnjlMofhrsjdnOnJ6pnEqDr5JA84fyW
         fgO0RcIQETIs/1tjHUV/joxyS/c5bYUym960uat04wTV3RtR9wssX+e+7D41VIBB4z2S
         K1Fv3xiZqwzPWyAT31fk+QJNRYIyJXiNJoF+ZRVuc5bDSSupXNjvyFEqarjJCQAKlbPz
         dl1q4w6ZS4N3Nk1kTYEmuy6X5IJo8UQh0be6FYaMw5q3mjaMUNKpD2OQpdsTOlgfaNIP
         k9yzCsG66lKXjminhFOEn5zQQcBdPnAHz/mrmazN2LeVCA+xfgS6/q+IdrS2bxJqyJ3l
         eMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758978164; x=1759582964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5S/zRBKTkSInAQ7R7zklKxxLF5akYgcZwi1P/3w8im8=;
        b=d4+0XXNDUEMcUWQ+00Eb+Moo5WS/IfFng8R5wf0SUthqL9EI5ytnswJuOnPsPXo+Kb
         THoJPQzqJAKxzVkLBS0E/c2nyy+0Urly4rD0kxCLZHk2BhuTJCtt+eFNbmUvtVPomG8K
         cJ2jD+jD+hp7pofDiIZ5WiLo0I7ag/9srkoHk4CbqnP+UeKf5cQYHYJgfAvHCrJAIAks
         oerZ2j84HI9ru5zyXSylwlLMSytLyWZOWd3Ft3OJuAHgkNEzgDJLArDVTiWvJmkK3HMb
         m7dX6UIVCOHd7Pkc+jy+u49/lxr3bh33RDLE3BPGL8D5+/9C7yE0DkYs1JvoXlWAFILy
         5HpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeqUaPwNEMyk5doTkAzNoi0GouJDdZGxroHk5OHPedm9ioKTXM0uZFTtxzQHegSsnXv/JzIAN2s93qWgB3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Y8ViuG8k11nIxQaaAaScqOdHg2vPBNyKlRKJK1SXpVj2jt40
	R7mdxDXEThqq9QFkDiU5VHNQ7d7Az3Y8V7Vr1TbUFuM/f8tk1BbNlkOB
X-Gm-Gg: ASbGncvxhgm5+PllgjIg8zl2+dGzXppE03t0MOdLp2go4g/V813K7yhBzjsaGGfayuH
	JQZAAQUCTOnjQ1H4MZf5hTwEVb/YsVGOekB4J//jdK1E5n0YCmxmTK22ncfnxY373j4qJMCM10B
	WtRumIbQRkGPM9huQk26k8WoTRM85rdD8y5HA3aBc2YDAzFhGeIGLBSkvi/QpomYIQwdylKWQo9
	MFf5oHflicgnsFopHnTKqX+hRq2kT084CyDZ5saOKWftburn+bXMdtgExhfYbi2awr7ydkk3TO/
	oMruH+Xu1hIhEhGHhxBF+ULl0CgHqL2TUpWSx9FLagCdkGbv+2XN819xXCES48/fHtIPCAzwJjS
	u4ikIRcAGCGeepXVGjr5k12r2//3onxeRyL1mhw==
X-Google-Smtp-Source: AGHT+IEylPzuTSyMe4S/LKg6ZM9MgQ/hgdwD1nLSuiRnhYfLcu58MW722RoLbdkug9nm8AiwOWmzHg==
X-Received: by 2002:a05:600c:3105:b0:46e:1fb9:5497 with SMTP id 5b1f17b1804b1-46e329e4d87mr104992895e9.18.1758978163470;
        Sat, 27 Sep 2025 06:02:43 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac5basm177274005e9.7.2025.09.27.06.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 06:02:43 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Dongjin Kim <tobetter@gmail.com>
Subject: [PATCH] drm/meson: add support for 2560x1440 resolution output
Date: Sat, 27 Sep 2025 13:02:39 +0000
Message-Id: <20250927130239.825060-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_060245_617164_09BC5E58 
X-CRM114-Status: GOOD (  10.61  )
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

From: Dongjin Kim <tobetter@gmail.com>

Add support for Quad HD (QHD) 2560x1440 resolution output. Timings
have been adapted from the vendor kernel.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index dfe0c28a0f05..f5385b3e3796 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -357,6 +357,8 @@ enum {
 	MESON_VCLK_HDMI_594000,
 /* 2970 /1 /1 /1 /5 /1  => /1 /2 */
 	MESON_VCLK_HDMI_594000_YUV420,
+/* 4830 /2 /1 /2 /5 /1  => /1 /1 */
+	MESON_VCLK_HDMI_241500,
 };
 
 struct meson_vclk_params {
@@ -467,6 +469,18 @@ struct meson_vclk_params {
 		.vid_pll_div = VID_PLL_DIV_5,
 		.vclk_div = 1,
 	},
+	[MESON_VCLK_HDMI_241500] = {
+		.pll_freq = 4830000000,
+		.phy_freq = 2415000000,
+		.venc_freq = 241500000,
+		.vclk_freq = 241500000,
+		.pixel_freq = 241500000,
+		.pll_od1 = 2,
+		.pll_od2 = 1,
+		.pll_od3 = 2,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
 	{ /* sentinel */ },
 };
 
@@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm *priv,
 			m = 0xf7;
 			frac = vic_alternate_clock ? 0x8148 : 0x10000;
 			break;
+		case 4830000:
+			m = 0xc9;
+			frac = 0xd560;
+			break;
 		}
 
 		meson_hdmi_pll_set_params(priv, m, frac, od1, od2, od3);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
