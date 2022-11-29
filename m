Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3D5C4167B
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CVW9v9C1cumZfg2h3v2Uc2FQvQ9Rpu+l9QZ7sorb5Vw=; b=YMJ1+zsH6Nc5wY
	iMAbAWb6etk23O29mya6twhNIRqbJOCT1qD2Dsd9LVyEuc+IJPjm82SosDkWL91gCCwenOXpxysNy
	ucjQg9KAzEh0xfMdNn16uULEcS9L+rmwoMASXo3/LybGAduyK4Nazs3I5Fp9uSVUymqx304P937WK
	8eWaNOuM/FfsipuQnRTyd3C1G/21N8mSGO25okqZ2RCV8AlpCzojc29cGPV21s0H5Zgnn+4viJWdV
	+RvdTq4WBMWmA6csKOBfWOnL0Hj8wToZKDVAYgQ4R9N8H01UnLL15aRz7PvX11pJXlcSnFAPvS/Ik
	SmP5sPbh4NvEfBMWAQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwKh-007Xim-LI; Tue, 29 Nov 2022 08:51:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwKe-007Xh6-QW; Tue, 29 Nov 2022 08:51:14 +0000
Received: by mail-ed1-x52d.google.com with SMTP id m19so17578089edj.8;
        Tue, 29 Nov 2022 00:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EAwbcSycvljMKPe5ABsiy+cIxMkpLo2gUjI9R6uNdq4=;
        b=EFlFtRGjVY6hb45LYjfz4PKYSY8/eYXCDyH2jEWI+6o8+OWi5V8XhsyAL+pxN+iqwF
         JX1bgxltZTtg+XpbSCDvOeZ9WXsuJHdatr27JZRN9XqqmNcIAjk7Y0MZkVkLAyMQr8LA
         990qsOV9NVsjmRFs5iQ6x8HH6XoWFHWlztUXrFoLMrs3o8kIsHGcLIaaQan6E/Lputu1
         nKsNOWZNVdRTWH6cOJ5YJEjOtQQKqsZcp5spPCKfZvGqJQgZ4Bp9JVlhb4JMxvA2Ujnj
         eg3a1PIJZeRfxkP3OOgqMdAEQAkjUdnOtpkhIJ0aHSvxO8KweJtdH7BCbTxdX6X/iH0d
         Cjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAwbcSycvljMKPe5ABsiy+cIxMkpLo2gUjI9R6uNdq4=;
        b=3fALSOT/sS+3b3+cW1KUK+BlLhzDzRyIWdxr9ov5p1i6lpBGTPz1Rf8cu4djBmBwoT
         EeFgZeuYP9FrVpCiYI3SMsem9QIlb7FEotYCYs4R/PaC9cyH/dnJ3C/yFAFPClIo/oly
         4VFoRWFYJMHjAHer1UHe11ReaBMSsl++PW4q2FS6AhTCxCwGjWr6X7Tfv48B9Wwmiz6R
         gR7VOOWPYXVBdPw0WN6TQdN/kjeBMhv3Lpg5rzMUELd0gBiXhhk9U3iFDBh1n7sB85e7
         Yu/+gzaDIAlNP/kZJ/H+lJBppfwfQ1HoMMPE1KKfxPN5QWvGB9VUD97hvdAuIrNTdKDD
         5bFw==
X-Gm-Message-State: ANoB5plXVCP8BcNZKMYtjGfJbuEyDoR4fVWPkV0O/s5bEkiB1nt234Uh
	vkLwcKm8HDv30RzxXgBErMk=
X-Google-Smtp-Source: AA0mqf47u3/yt28Ofv/5FqQdI2MHkbIfMEKktXtQYWe+me4por6kkPGitzwX2sTe4moLj7hZE7ipRA==
X-Received: by 2002:a05:6402:ea8:b0:462:67bf:c64e with SMTP id h40-20020a0564020ea800b0046267bfc64emr37911025eda.20.1669711871270;
        Tue, 29 Nov 2022 00:51:11 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id kz1-20020a17090777c100b0078de26f66b9sm5873219ejc.114.2022.11.29.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 00:51:10 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR VIVANTE GPU IP),
	etnaviv@lists.freedesktop.org (moderated list:DRM DRIVERS FOR VIVANTE GPU IP),
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	Lucas Stach <l.stach@pengutronix.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux+etnaviv@armlinux.org.uk>
Subject: [PATCH v3 0/5] Support for the NPU in Vim3
Date: Tue, 29 Nov 2022 09:50:40 +0100
Message-Id: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_005112_879961_E0C59C7F 
X-CRM114-Status: GOOD (  11.33  )
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

Hi,

This series adds support for the Verisilicon VIPNano-QI NPU in the A311D
as in the VIM3 board.

The IP is very closely based on previous Vivante GPUs, so the etnaviv
kernel driver works basically unchanged.

The userspace part of the driver is being reviewed at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/18986

v2: Move reference to RESET_NNA to npu node (Neil)
v3: Fix indentation mistake (Neil)

Regards,

Tomeu

Tomeu Vizoso (5):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add G12A NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 11 +++++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 31 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 ++++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 6 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
