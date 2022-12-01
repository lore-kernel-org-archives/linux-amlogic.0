Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BA7C47088
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cBU6JNehkZrr3YS+hyjNcx5U+F4tku11eHZ6PrqSMYs=; b=Kn2fct+1J9IEOm
	qFlsyndRQc33xYpp3TMSC+0g/2WAhNXzkHmVXwMWYaidZ6ABi4nklHJVhHpW7TqbXdgdobXKwIL3L
	7W0OkIId13owkRSw6Hz2/XKvWNsA+OUMV8ccZeCew1z89EO/dAK1Snq0Cswp+oyPS7SURjc/0PYE9
	6KHqo7AbGrctq00FxBeU2k0nxf8DdW8ycJmBNi0K9ct/Ya9yjoy4oLILPF7WAWdLL3+i8EggU5rnN
	jAoXVrVMA84zOrfsYOt33mtfRH5YjXfj6ToYWhzhGsSF0e86PsR+2z+nD3VOq68P0c8cOMBEVGH8s
	hq/hwYHg6wZ3d7TloaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0flc-006IiD-CD; Thu, 01 Dec 2022 09:22:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0flZ-006IgK-F3; Thu, 01 Dec 2022 09:22:03 +0000
Received: by mail-ej1-x635.google.com with SMTP id gu23so2687014ejb.10;
        Thu, 01 Dec 2022 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=D4GMG59V6FeZymcJDpr/Ed9DLLQeE59Ry2O920ck0QI=;
        b=HSmShfYANbJDMjl8pkqcdgD+IxVD2GxDxg+y3Ge4ZK1rg9vO/pdbZeZOZaiFMKkY8O
         BG1ax4x2uVfk2bcfv0HXXgKiaRThvqzYv5tLa2Tl3vSQR11ZIMwg/0ehIQUB4AISF4sV
         vc1KJjb4O3Tr98nvcTXzuxr90rYQvX5Iv4MO604v2wjCkIYP9yLtOE7Nomx2klxuT2Pc
         VDh4Y/s+Si0rd0BVsLXaRHPNc/QMAcZPxwB34bdgfuJaMQbvx8sKk66W4JJpUoc+Drpw
         4ubmTbp7/WwT3ESDIUix7rIMNeCm9VqH2jvu7je3HYaPaLVMHOt4h8UgTh3b9i1Ozz4g
         4B5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4GMG59V6FeZymcJDpr/Ed9DLLQeE59Ry2O920ck0QI=;
        b=3m0t1IA7+5DmUDDFmLExjzRwmM94WbuglnsKPymKwnbGSuK7VUQAwJ8941VHyD/dW5
         s+SeIDiySoEHCc12q4yL+Z0OdmtvBe4y/6etTdjI44nmjYT+be6yKkJkoRgDc7Owf2bD
         +T8PtSGg0hp1I2IJkyXhzRRUisP/pvN4HQdbTInmo67/g9mhM+b2CSIWBxj+O2D9wz1O
         0yh/3SPD+P0E7ZZu4mbrhogVvGunsR5sJ4aAtyKjeMwv5XEUbxgvyXGHLSg0CjkD3wW1
         R8JogbFn+hK6/EDfaoqsJaGfdkurEC1w1IB4FQ6Q+eSYv1efuQlQbrHMwUgw1sb9n0Wz
         NgKg==
X-Gm-Message-State: ANoB5pnNgb7Dib0UXEEet2ZJ8SboqeambkV7VV2g1vQS7B2LsnFz3HLu
	1dbiOfVcd+9EOqOnkotyKDs=
X-Google-Smtp-Source: AA0mqf6f4lVGT4CKfMKN/i+FgTMcHP2+I0vW+kDXBs6t4YjojlLCLzJcqhVgDVLzAPZAQR/1g2HNZg==
X-Received: by 2002:a17:906:4cc1:b0:7ae:50c6:fd0a with SMTP id q1-20020a1709064cc100b007ae50c6fd0amr21346768ejt.184.1669886518206;
        Thu, 01 Dec 2022 01:21:58 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906211200b007b29eb8a4dbsm1587879ejt.13.2022.12.01.01.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 01:21:57 -0800 (PST)
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
Subject: [PATCH v4 0/7] Support for the NPU in Vim3
Date: Thu,  1 Dec 2022 10:21:21 +0100
Message-Id: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_012201_523487_E476E061 
X-CRM114-Status: GOOD (  11.05  )
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
v4: Add warning when etnaviv probes on a NPU

Regards,

Tomeu

Tomeu Vizoso (7):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add G12A NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055
  drm/etnaviv: Add nn_core_count to chip feature struct
  drm/etnaviv: Warn when probing on NPUs

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 11 ++++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h         |  3 ++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 36 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 +++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 8 files changed, 79 insertions(+), 1 deletion(-)

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
