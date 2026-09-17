Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB2FC88E72
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 21:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGWPkSRQBLrU8R0K42l71TsO5IyiTxqOwivnMa2x7KE=; b=B2+ZYhQIxTe1oP
	RWx3O8toAfa7RGFHsLemnx4D+c1nb1RN8lOdqwEwUs/RikwiedoZs/kUITIKKR9B+k94GrLCAA3xE
	bjHYYRAbHwtDhLRvTzZySZV6AXGGL1AiUfS1BEC1G0NF0sS/h436HhOMWA9DcxG+5NQjCdNL/iIJO
	Njytss4mABbeSGAR+KLBjwvEbkPWbZNA7s3Xv+A+m1ZeGS/dmtMStGegzhXWGWaaWeWVERttbEX7W
	XPodlTK6TSTvKLOmGJTAzKj1f3OxTIWAcdPKp+lBoGh4GZHsJzPW+Pp4NMnNy33c8ihGjvWWUDveJ
	sV7Ba5annFsfkdS1qENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JGZ-0000000CWQW-0aX0;
	Thu, 17 Sep 2026 21:03:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JGX-0000000CWPL-22QB
	for linux-amlogic@bombadil.infradead.org;
	Thu, 17 Sep 2026 21:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=; b=NXauHnkQsJPW5MQssDlrrDxhg9
	AIMbrB2Eg2Q7H2KERF8mO909Th0A7FOvKMqTPIw7tAl9xdDTM8Fs+h7/pdxhsAsctOKYUSEO+zH84
	czFz29ucuhGP9odJYPtQE52V5Lx/xHjsNN126unuPzHUi3N5fv/ln5rTksd2hn5khjUIsLArq8oC1
	RhmvEGUfVBvh2wB672XZH2lq0XG85lLHLYHREUT3uqTLKDsmj9nQrhb9b9FhsrKz2KI0nCx2bkG6x
	T+Mpkcd/MbNfYbN0bBUa9oVKCGSTwujpo01+0K4w3b4hhwDbFO9LcAUkn8Y46PobDOTnnBWEU45vK
	YRypRD/Q==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7JFs-00000009Gd4-1udS
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 21:03:28 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e8185e037so445675e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2026 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678961; x=1790283761; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=m2NnwhZl0OVm4xCbpS3kn0u/II7ZpKczzbIkOWsQMon4mGh03zO0pIVp/NF0anTZ8W
         IFiJHu83pyXg7vpMiJ3GQpM4lQ4oXWVHgqwvPPCefrVmnxRoxO5MOq41Chi1qu9xZQGr
         l7Rv4+BVVD/eDseKyHUyAdOPRar8BXbgsm9g86uuFgNcX+cGiFQwDul3QsWo01MCtcNw
         Xvy6EGQVkLG60yQBbwFX9CmRbwLLfoTvKzqE8+fb3+fNGanhToda4s/LbXVEXYvFktJM
         4rjloj8F+PwLegCMDV7prnSsWdGz2fItztO8T+aUlc/bU0dZ3ntExsUEz5zeyXhhbmQp
         TBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678961; x=1790283761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=p3mqL8omYaiQ2CjrTH3QF7YyrYI9b8VjmHaz0jes7Xw6VhnXdi3cUtMqVys49+w++O
         WopXFZBtLzwo09vL7Z8pTzTGfxrlESCA/VPkkY0bOhLpj84PZiY9kA5G+NqlLHBGfH+C
         MhQIZXY2wj5sy9tu4p4TMV/3B2gYpvmCxNjQUZ4XT1WrCImIbEI4yjZ73+fLFtzps46U
         tVlB44HGgjevXRMH00rWW0Tg9pkWQKu/uHe4QgonN2V/aJZf1dQ7JWgltIl/38eSo/zW
         zCB5Eae/DUusfUuVTBHdDgl/l1+I5RsRThxUme5OWvsdBsFIOnsBB+fAXFXFiMiJyhGb
         CzjQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+5FwtwGoSwxzpBj1zl6I3y0A9Uv3oMEMCMIAmNqsX2C926muMPspFIZixDvglk4DCxcvhw+P5VGRnqKVi@lists.infradead.org
X-Gm-Message-State: AFuF++l0gOMm3hFQ4iE1lie+B3830IoZAXb4ZtvlVbg6XM+C9SD0fLlf
	6ywTIFSt5g6AzPrP2dZ8UK7JMIAv5A4DPfWj8MD8OsO4OgNHSPlVLNi2mfQWeolE6rw=
X-Gm-Gg: AYBFou3VrsPNH7JGUTQdbR4BT/pXxGehSxZ7f7yPz7cnlRhlMJTT2lHyDSqKS7WmAGH
	6RFVv2gBnVE3G54CHAwc5jPpz/cDEv9HNyMRe/RloGBzOtBx2T69b743oU4GdSgxfXZtiwn0JMm
	GLzESVoCN4+ftGyYAYZnYLaEFuCy6Bw3dN+ayfJ6y4w6Lg5BacLOhG8hKQipS8oGnQdw8trzwv7
	sVelYudnII94WWoTyCKooQDLrJ7glx3Ec3gqsXrO+CYwx2AbiuSfZZRjYMAn7DfGB+dYaUBHc0+
	4J+UTU57jp+yo3FtZY++TLdmI3WIjLGx9+9Mwytv8yIACbMdiSVilTdiRseLV9/C4FfIUkzOxdm
	jdSyvpPv2gxmiV6kglS4Cd1brlD7XI29/1tTJnmDVc5pggS4YvkGwz6gRMikVPcZKYIO27iSt2h
	IB+WFUspeYREnsfOJS/d1/xDxDcchcBtZdn4fY9KtQB6QZX5gJbxycEMewEfppR2o+sg==
X-Received: by 2002:a05:600c:1382:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49fc5750e24mr1268555e9.22.1789678961573;
        Thu, 17 Sep 2026 14:02:41 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:41 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:32 +0200
Subject: [PATCH v2 2/6] ASoC: meson: build gx-formatter as a separate
 module
MIME-Version: 1.0
Message-Id: <20260917-audin-v2-2-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnO/ntzvH79Q1yg+wHDPzcDdgsyPt4S7+TmzcyTnS
 q6tPyjRUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgIlMjmVk2D3tWLfIEYmnStLP
 /m/gO1Gyv01q+5md1iVJinUf3L7fWMrwT/X1lLkaX47s9/Cy4d9UN/tG6+v8jQampY+YJrX/q7X
 p4AMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_220311_969170_65614D59 
X-CRM114-Status: UNSURE (   9.67  )
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
