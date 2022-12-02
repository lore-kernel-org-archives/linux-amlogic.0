Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA2DC4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zsIl7K/F46e5iSFvuxhnS+d7me5od4zZdaYOMrZAA1s=; b=I0x4ojUMVkHICX
	WesfFt4OntDJm4m7vAmbixR8u7XvIy1pn8yo2JUUaCTNX+tEebuUncHww/ov0+SkpOJNXz5sQero1
	mLqOg03A2yYOehwFPE4ibatcf6l+Y2LWGmpzXe8UJn1PyH/89tAHx3OIiY9gNnuQT+Vk0fT+D0x4B
	xJ47Zu2brcJCuK4pCff63sX6mnQIoZVo2NNvvbi5WlnxlXlSnf5pwSulAj/IMuvUrF3rYoz86gZK0
	sQQLyYRAXMdVhAs0gsjGB+TCYcHsLqlcvZc3dipZ5ekoDwgbpXUAwrLE5wK16IEDU4gFRNKn0H8hY
	MvM0ZdqaDTbpfOBJcLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14au-00G6HN-G0; Fri, 02 Dec 2022 11:52:40 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14ar-00G6Gb-K1; Fri, 02 Dec 2022 11:52:39 +0000
Received: by mail-ed1-x534.google.com with SMTP id z92so6205270ede.1;
        Fri, 02 Dec 2022 03:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=V7DGE39pLfDtpE6nfiaaKVKzntw4VUS/Inc+Ohx4WpQ=;
        b=SwYGBT2S6+aQVfMDUC6h/9BMQR7Aa/rv/nZKofiHLvTU/0Q4vEdenr2xH0AK90Iu3N
         Q3c4Rzoy1RPYQPbuhxIHjA2D6XXPWzkdpKFqM8lSRvv9+Ts7pEVAbvC0ujDR3hSQ5ZxN
         vD3uurUCf7q8gTLZVVLJ+a+GBp5jmkXigxdaU6jT1DHYEUuZHb5oDdpzCP5CgF6Z7B5O
         u7NAxl3AwQzRLkzS/byhochh/uO28yZGlEcUMh6vQnzjLqxrytmc3WlVT4i235L7vWAd
         0gGeloQm/h47sHWQc73VFtu7SAPAB5bpqEY5keAo9pYSeCsiCSyH8qJzZFh0BdC5Wlh+
         A8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7DGE39pLfDtpE6nfiaaKVKzntw4VUS/Inc+Ohx4WpQ=;
        b=5AQi0XQsidWQSAOFgGKvxhKu7tcBfmQywPHDpg5vNRFxqe7xOT1kOo9c9aYko3BNBa
         Ni/EeqN83zBOaf4X0LuNOu3wsEsfSv2DK6oaFn/N7avoOtyXcjcdLfHmK6W6oYndSKBn
         WM+V6NBCN7otN+aWN19gohwfP0qX4bllL1tOCSrATJiEtbRiSi/mZTHZnJPxZIpiwP+U
         FeyKNxMlQKWNJBiSPtNHZ4GHpt1JlPVy75rKtXM/IZDyOScSMk4u5Ufse8Hk/A3iZMX3
         O0qrtS0i0+FC0qC0lbwBi88hfqX7N+HGjJPq9TQ7sceVEa0STyWRjNifEfMdvh6pHKe1
         480g==
X-Gm-Message-State: ANoB5pm5r0cCS4+aJgFLQwUenujkfxq4OMfk7hWx+eFo66LPFOTeaIOV
	0NrAUhfhmsjkuUntkjioUgA=
X-Google-Smtp-Source: AA0mqf4pKF+GIFOv0aOMCQp58IrKzGzJId6KW1UCp0ZSXlFh3tlc5fcL6ng1NZL1EdK19TM8zWr5uA==
X-Received: by 2002:a05:6402:24a0:b0:458:ad54:20d5 with SMTP id q32-20020a05640224a000b00458ad5420d5mr62176585eda.86.1669981954534;
        Fri, 02 Dec 2022 03:52:34 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id ha7-20020a170906a88700b007c0bb571da5sm1206762ejb.41.2022.12.02.03.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 03:52:33 -0800 (PST)
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
Subject: [PATCH v6 0/8] Support for the NPU in Vim3
Date: Fri,  2 Dec 2022 12:52:12 +0100
Message-Id: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_035237_693621_A5D2A59C 
X-CRM114-Status: GOOD (  11.84  )
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
v4: Add warning when etnaviv probes on a NPU (Lucas)
v5: Reorder HWDB commit to be the last (Lucas)
v6: Add patch to move the power domain to the SoC-specific dtsi (Neil)

Regards,

Tomeu

Tomeu Vizoso (8):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add G12A NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: Add nn_core_count to chip feature struct
  drm/etnaviv: Warn when probing on NPUs
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055
  arm64: dts: Fix NPU power domain references in Amlogic G12-based SoCs

 .../boot/dts/amlogic/meson-g12-common.dtsi    |  9 +++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  4 +++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h         |  3 ++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 35 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 +++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 10 files changed, 84 insertions(+), 1 deletion(-)

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
