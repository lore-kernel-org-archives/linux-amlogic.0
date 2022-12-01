Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6954BC4321E
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oRnIE5nvGDcBHKPFvR44TNNtDyJk3vGciFg87+5uHQI=; b=tGXjH8GORWCJu1
	yXFoJtKu3zlOC5ezlZGNSEUmsdxilInZPPnrR0a8bEAL8naPWSUp2wdbq5v0+PLIE3yVQafsjIOFu
	1qQSpzZxhJqbgoZVUPUNZx9Uwz+vEhBDH4ccZcIZW/GoHhCbyCVMz20zP7U4eYk58GyaHqxf4996X
	ifZHZL0UNijmWZVM1O619npXH/QQqMhthg2vDpcPYdRaSXvSB+eTCjxZTmAFOoIOFHTspaGrrgMAR
	cNuHGJ+hG2ANEcTPCKJP5yo2RGqL+TLsDFbQm5qIdUY0Sjg1CH4Mn7+7LgoVEwb98EYg+n1UlBEvO
	SbrDN1lLJe5pLXhOY41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gqJ-006ird-8W; Thu, 01 Dec 2022 10:30:59 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gqG-006ioy-5p; Thu, 01 Dec 2022 10:30:57 +0000
Received: by mail-ej1-x631.google.com with SMTP id e27so3066135ejc.12;
        Thu, 01 Dec 2022 02:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=b6S0scQh8yy8m15dX2Y4lOBnYQdGXad7fSn2qrpTdRk=;
        b=HFcyySkPqaTM7WBiMKlZeWgslSqeqpLPwySBhEvlh80264v7CzkSuBaMbhEX/C0Lv8
         759cQ5lN9Q4+zZd2pxh/WhTBAYMgx6J9bimo23yhBDYKWmCONcTeIZ3WkuPbp4mY68Rs
         jbyAqWPRz7DNe60YBJ6iIB+8no69TZvtEewnV525c2K70Y6iptETbQty4DLTChFHwo27
         H//Mgfh9Q8x2ZAmjS+wHf9NCHIQ2mn8kKGY1Sk3dYRAhn13VTEepvZ1v+uNrXVpLLQnC
         lYdfDjmtVVIoXL1K/Q9PpGeLwgDSjwS/rFhZW2iEzu2Rhg7uvq1TNSGK7v9pYDRMRs1I
         FjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6S0scQh8yy8m15dX2Y4lOBnYQdGXad7fSn2qrpTdRk=;
        b=4Q1cJU6r39GnVwk6sBiVQ00xII3+GFcH9sX0SBmvOKLW5fDT1XmwhazovoLtWoyp99
         EuWHHlKq6Ft2Kg39+aT1oaWL+ZtBs90PAN72MZ1dl6QDgdZfYluyt4YlppQjdnx1iwJg
         GQzn27FuDiQg6mJ6EORss6MJgMEqNMRNJ82+Z6RzDllWBaK1iY/1hIvCp1nt45fag4Yg
         7dUN59CEYGF7m+TTD8T8PpiS4vMcPlYAzvR7R6+vSX0TxMkA3akGeywskhzHmvrOwmJT
         U66ceT2WcWxGVzM/nOogXe/gfU0obmxWyeK7NZDX9a1GRAgP+mvQhqnLCr5+iMtAI+oJ
         urfg==
X-Gm-Message-State: ANoB5plUjqVl8VGg9cRndK6MxXatlOf1zMeqhDbCsagwDNfYxMRBL0bX
	VIQKVrTYhYZkcDtpPrAN5I4=
X-Google-Smtp-Source: AA0mqf6Ku5iWPl8X7VDR/8A9LQk+tuRf8R4xRAp9qx7nZWslQnUcAyrE5bu2txEmOsaNWiv265OUag==
X-Received: by 2002:a17:907:11cb:b0:7a6:598f:1fb1 with SMTP id va11-20020a17090711cb00b007a6598f1fb1mr56078222ejb.606.1669890653698;
        Thu, 01 Dec 2022 02:30:53 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id g1-20020a17090604c100b007c07b23a79bsm1592400eja.213.2022.12.01.02.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 02:30:53 -0800 (PST)
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
Subject: [PATCH v5 0/7] Support for the NPU in Vim3
Date: Thu,  1 Dec 2022 11:30:16 +0100
Message-Id: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_023056_240123_5016CD2E 
X-CRM114-Status: GOOD (  11.55  )
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

Regards,

Tomeu

Tomeu Vizoso (7):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add G12A NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: Add nn_core_count to chip feature struct
  drm/etnaviv: Warn when probing on NPUs
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 11 ++++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h         |  3 ++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 35 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 +++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 8 files changed, 78 insertions(+), 1 deletion(-)

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
