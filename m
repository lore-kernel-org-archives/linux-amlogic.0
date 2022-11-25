Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A28C47089
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 11:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tKRzcwmaNJYrqp6Xh0BZwH4pd+OimHvNfLkGskrD0b4=; b=qzbVg5/FTx0exj
	Ykd8bBznEpInTtUwIu1WAhHTaXgDTNVrpoT0dylCd8PAgcugnGh/5cPpaAcKWrb89rq7eeaxMta4l
	dYdF/ZtUEjeyuUa7ZWHBHbQh/ETDRXq7SszpuzagsWm6eesu7epPcfDP3qMtamPbcfD1f3VZ1uuRh
	TiWzBuUOTlqv2S3c6KVO4Li2or1QCKtc8NWDW4fAK3WITH2Fuon+Aein6YqFwtSW1uCXh40dcZEtj
	9ZxeBkUyj1D7SqDNj4AbtSbGlNOpiqbfLUgR8LLkKjZY9nx1LKdVVjobTmZwnNouVh1UZW/ygOssn
	ytzoDZLUh3B7eHpYJ8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWkC-00G1YZ-1r; Fri, 25 Nov 2022 11:19:44 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWk9-00G1TA-EY; Fri, 25 Nov 2022 11:19:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id n3so6291061wrp.5;
        Fri, 25 Nov 2022 03:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vJ/Ad4hSKfagSWXJgtJNFFKqplgksfsr8uetGe6EuYA=;
        b=dHZmajYnzz4u1jEo2HZja6kVm1mWJREW0f3tbiQn1KmezmC7S0VAc6VWFkNXA0eZaB
         EHAjzMMhncEiD+gratUs0iJRq+ZhBY42zlYNrV5JoLQBB8uwcLZ0+WwGDWnaGwb7ri1M
         K6GyCqwCqr5XqpnGJSimkapXZVnWD5QyBb2f/qj4qHGWuyO5Y4unUXkQo7REY0Ab4yUY
         nxWMqqzpHIsz6tjDAc5sBBUlhB4NUi5XSwz8w829yZycYO3+0kutXTTuEeEdxGEp3BvT
         y3u4079+nY36PXhoFse7cqNF4oRZ164FJtNjnISILNNq24uLevUhZMAluMl6TXhjp1EB
         5RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJ/Ad4hSKfagSWXJgtJNFFKqplgksfsr8uetGe6EuYA=;
        b=tUvKoKZp2ucifODqMMn5IU3Pg9kwbJ166iuada6wDmVwCqWqbZu5CBbjKh8TfBIg0o
         CGiwq8sklaOxDiyHc93qdfL9lIdYwPsFqe5Aiu6foB3AuYCqwkyYw+pR1i83FcKvaw2u
         Khl1eD3doiLXnLbUsuGwyxhIv7+T0L6/J/09RTXowjCloKNN4UqzeBEmrjgaGwOccwUa
         UIQiRsly271SXUVluKGGyyaOKFLPFL6G92c85dzmehD8GnFYadMG8A6pIheknmq7NIUp
         xK1fB7uUZedE12Zx6kMVyAESUHnTo5j9mRBeu7p+jKqfkEdT6nXJOIHJsK7NWH/tdlCI
         AUMQ==
X-Gm-Message-State: ANoB5pn1dr28tnYZ68JAcsCHdVMoNidkKX85fg/dXECm6ayIcqwrFf+M
	7t1pQ17RZQ+41DTtueOJEOU=
X-Google-Smtp-Source: AA0mqf7qcwBF0kX1Tp8rgnVWvydougD+PQOYjSSxRa5bPdGbWmiAjgx6M/qac3U1VJJkyI9gVdzcdg==
X-Received: by 2002:a5d:6b45:0:b0:236:7a1c:c41a with SMTP id x5-20020a5d6b45000000b002367a1cc41amr11849573wrw.680.1669375177118;
        Fri, 25 Nov 2022 03:19:37 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d4b0b000000b002368f6b56desm4207406wrq.18.2022.11.25.03.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:19:36 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
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
Subject: [PATCH 0/6] Support for the NPU in Vim3
Date: Fri, 25 Nov 2022 12:19:13 +0100
Message-Id: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_031941_538202_25898A89 
X-CRM114-Status: GOOD (  10.53  )
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

The IP is very closeley based on previous Vivante GPUs, so the etnaviv
driver works basically unchanged.

Regards,

Tomeu

Tomeu Vizoso (6):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: meson-g12-common: Add reference to NNA reset to pwrc
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 15 +++++++--
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 31 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 ++++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 6 files changed, 69 insertions(+), 3 deletions(-)

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
