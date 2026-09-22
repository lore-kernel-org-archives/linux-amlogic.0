Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17962C98308
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2026 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGWPkSRQBLrU8R0K42l71TsO5IyiTxqOwivnMa2x7KE=; b=Z0xEdGI3rkD5Rj
	z+Mf+oY1UaLJpyF9yak11xKSAnt4jG5KnzmJHV7DKAJr2pxNw+EsI2tLNcy/RaDFsHAoaJE149tgD
	pOQ2ksN38dLmQ0xIK0SXc2XF3Vo4SiuU6wGBGNKokx1BULSymF9vBaW3VPffybX2Vbu4eqoBrxlr6
	oxZqE2+gdkT9bY3hIclVL35ebqAjWUT+UiPxdlzSYoi1rR9MxQJeCRFlESMeqhNdznQ3N5lyxzZqf
	RotKrSomOQ6MhNoXZ7KLdysDVgHso21efxiqElVvClkTdyPN8hzE45Ze1jfYMvlYNLCO3XzBWG76d
	eC30JJnLNc3ke9wuj5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wM-00000005ydk-3X9S;
	Tue, 22 Sep 2026 16:01:54 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92w3-00000005yUm-3mpI
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:38 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so72189f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Sep 2026 09:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092894; x=1790697694; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=kR1/4N0DGlOcFTSF1gKyADLLONWFPJT5E3DIePEMKHAz6OZlu6Qbi+9V7DgAlMSSQo
         O8UQ1H2ZMISvRwQpzt9QTVnuZ1Gl0ESIMdOQw0g9aHfAI+4JqLEr5QAYgMR9lYUk9wnj
         4fZ/6Wx5kF6nSxzxNvx+7VuXJiUgsMCOLoXcXKbcs/cjW7cqTBxvgt5ivIg01SLH4xkF
         UK4HwXJXNfOsPkmEzSGOr4VObWA5Y3gSdIMWNdyp41N59F6Np65LxVSRTR1Gd/UQcPXm
         h87PuUQaeM3s/4SMqFLZzYHVWp78otdpq3mCDVeW7hWKuBYuPp9gdgT4+Uya2NOOlYgj
         IJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092894; x=1790697694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=eZDPxCweWFiKEaJTt04Ri7Rpvn18PTf48GmMDGiHZuVeaPOIq+bYyxsSebs0UE3aRl
         4dqP6Uk7WgQlAS5fB/wo8/XkbSY4yk054Lx9l1IW6W+uifuCQqyFjNGUeLLqeab4B9P9
         4NLn6dI5Tks2gn7gkcCDJCaoEhfXMl6tzAcz5qcv4vsBVW+mgHQcFeHCUNY4R81PfQ+k
         YwikN9Sv9rmgtgJ1er/dQZ/foMEEVUktODk6eEVmTDa3cbchWtDza0L/G2Pr+9LZRww5
         pDQgYbQtVCqBcpeIu9VQfPH6JuJFHFFlGaV6G5h7729dvLofmo9GtHw6Jqk9N1BhRTtz
         nbbA==
X-Forwarded-Encrypted: i=1; AKwUvBxVmUuwktKLqXvN22YBUgYsz0H/1AQo+5EopNEnnW/wjwPqwfUgmOkMIFAimCyNv+09LnZ3RT38Ue51n2Ea@lists.infradead.org
X-Gm-Message-State: AFuF++lcvh5+OVPp0aj4LhwdS3vkM5TLTKnkw/oeR7bjE0iSClYCQ+gl
	Go8EkmLQ3PITq48+QSN5xqJ3gu2vWcc4N8YYZw34K1n5A+K/b64L22aEiaUD1b0C3uE=
X-Gm-Gg: AYBFou3reVr7e/VbX9rclAM5DkiLUzy+76yg0515PjrSUIBicypUitQ7fXI+DykkyzT
	owTCZ+1a9zHInMjxjr+IGo1oXJ5YoQRlN6NixV+azRaswABxK4RD3zWpAQwHOnfwEDo1F/iadUq
	NJghNfBHTPyxzwn0IstN1u0CFFrWmdk5EdVQ+JHlmIwhDP0JiopW/EXEls/cGwglVmFROI/bKZ3
	8aXzcHnECz2CJkrKPMHpfDb87xZbujjIJ5jVJYYuM5BpTpYwjvDJXyaesnCWEmixfn2Cj3rM2xu
	FD9CN8NLyW91WJKsRfZ/1nmAeFKJwg7ACi39ZXfPcFIbzBs1nkClBGz3WR0Oc+tRjeRqr+24KJs
	sIVXZJ//3upLV2Ek7CfmPOBfTNYrEFOhmzkWqooJzIiSr9GbMQKwyEGJ/Bzj1oKGfWlLU5jf5IA
	GTHTVk0bKhysaCQo3aA0vadwmcxZbZrKgCFLG0aOtZOuvNtlPW3mV0uu6u5AiY1bzE+Q==
X-Received: by 2002:a5d:64e8:0:b0:487:40a:5ba8 with SMTP id ffacd0b85a97d-4886704c06dmr106703f8f.15.1790092893762;
        Tue, 22 Sep 2026 09:01:33 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:33 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:47 +0200
Subject: [PATCH v3 2/7] ASoC: meson: build gx-formatter as a separate
 module
MIME-Version: 1.0
Message-Id: <20260922-audin-v3-2-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=QQUrE+DwZ1KWpqLSQpoA8URn9azrBBw3jC33CI+5l4Q=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkXNVTA3EJ5w5MTt/YvSv399+NWkRVpNtr1IsiIit
 nLNRN4pHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZhIUCzDf/+Ebz4WizZvNz/g
 d3y1Orf2Uy8bxc47Lg4GVSLnmz9oGDAyXJrMeTWn/N2ZoKyQWY+/RTXLn40+avp9zo2YTT7bTta
 9YgMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090136_028063_B622823D 
X-CRM114-Status: GOOD (  10.32  )
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

Instead of including it in 'snd-soc-meson-aiu', create a separate module
for it. This way it can be independently selected by either AIU or the
(upcoming) AUDIN.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig  | 5 +++++
 sound/soc/meson/Makefile | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..4c40bf60dc4e 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -2,10 +2,15 @@
 menu "Amlogic"
 	depends on ARCH_MESON || (COMPILE_TEST && COMMON_CLK)
 
+config SND_MESON_GX_FORMATTER
+	tristate
+	select REGMAP_MMIO
+
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
 	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
+	select SND_MESON_GX_FORMATTER
 	imply SND_SOC_MESON_T9015
 	imply SND_SOC_HDMI_CODEC if DRM_MESON_DW_HDMI
 	help
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index f9ec0ebb01f0..1b1fbe8a0458 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -4,12 +4,12 @@ snd-soc-meson-aiu-y := aiu.o
 snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
-snd-soc-meson-aiu-y += gx-formatter.o
 snd-soc-meson-aiu-y += aiu-formatter-i2s.o
 snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
+snd-soc-meson-gx-formatter-y := gx-formatter.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -29,6 +29,7 @@ snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
 snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
+obj-$(CONFIG_SND_MESON_GX_FORMATTER) += snd-soc-meson-gx-formatter.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
