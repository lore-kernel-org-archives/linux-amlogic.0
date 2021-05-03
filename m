Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DDDC433ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 14:58:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245A4611CB
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 14:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 245A4611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kFjVxw01/9PysM8segr583BhVybCyiKM91L1qupwBkg=; b=WIlvCXnaAFKQjGAckBKeTtNcZm
	ulcwprqUGWXlDKop1FgZuU1+cZc5TkbGyvh2oLm2YIPaG+oLu7OtSrcjRi4VKHhpqjEWUdORiXDyE
	oqLvnAGXu3yv1Ue3apKBuWI1lBpuurxxkGJA7XwR1l09pYMHyBsYwb+HDrs+vSKTn/dN54drvyGfQ
	iw529HB/Y0Ry16zmpsuDCdq7P2JPhGfEHGn4wCIlh9S2R109tX80mq+xyr3PO3eaivj4wkEyy3tYF
	aN6DZWY50yFjl8USicjD/z5/Is6/tandnBcYnW6IQGWx9A5AQc99EYbsjJlZUA4iHnTeVRIvYrjLf
	32ifs8UA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda1I-00E8qS-4V; Mon, 03 May 2021 14:58:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda0l-00E8lE-07; Mon, 03 May 2021 14:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Ik3wrzpwnYSSTSQFdegvdMidUhrImlyxHbi+NVAFZeQ=; b=zh6y+kaJac4IsLWQRzkWX9gxLf
 yhW5HR6+xHF3bp79OaGZhJLjZe/RU0v1pBWc9tCUWIk5l7vFgaLg4f6gei7BtJFLJb+Jmk2auKX+S
 rpBcu9ty/nPS5ipO9Xi76TVgJKceOcCF7bRaYRpUD/AXQ+NzxioxBf8twNZmby9yekTumHPCYg9NI
 ocREhtI/ZRpYJ7BNFqZK1GPV1ihOaD9C/Mu4vqypj71IbOGx3tAd6J/XIxLg5JnWT61ZVlh/ZtU/u
 q1UYET+6wTbWSmQRyDdD6FOAql5EWPaKKcT6sSr89xOyuGapYfttwz6Lp8xpWrQls7OLXAe4i5lVZ
 lcvcbBCA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda0i-0039EH-80; Mon, 03 May 2021 14:57:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id p17so2949699plf.12;
 Mon, 03 May 2021 07:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ik3wrzpwnYSSTSQFdegvdMidUhrImlyxHbi+NVAFZeQ=;
 b=ns82hHHVmswbQv/3kS/nuzUsBa5rE6zd8LmLEbZifQd9bSi3KrQ3kjSCjhierzMpzl
 otGRj+tNg6qFybAWjewmxAIJD7r0DZfjIUyFjG1byU34s9E4XMt2baDRJJbi1bb+jlnY
 fH/U9QiQ0mFK3D8XziD6FA6SefOhO5hGWZ5IlT+YMlGLgKQix9CsWlOHCDf7tVkAu7dh
 PO4wqHzHKyJUNa/UrKZc0nOIFIFjeD5jD43TIiJ4VMnkGc7idCf0EXo2u6oai72Y2Jrk
 h3CYHQ2DuMER1EqZfICCLBDURQuKxbMYgvJIT4GIN/lGITXCRbXZYoY0NcDH2jxRacrd
 U9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ik3wrzpwnYSSTSQFdegvdMidUhrImlyxHbi+NVAFZeQ=;
 b=bI/xQE2sGcCXW9p90ImeGIBJnv7zGtyiRUCVFxdzKLMofEsEpUtmSgRcnGQtYykKhW
 TpztLEH+GnKAxvYvcNIv5VEbgXcga9Sx3YQfPJvBg8OZr51EjZWoRreuGzw6Xy+LtYut
 qD466QCgrxdNnZ2PiZAZzcV1piEfVwoUJ/NdV3qXnBus4gLGLG+SBKT1YNP4HnbcDnd3
 wWE1tfQNcklaIuuX8rqOfGL/7SW3mwWm/7J+7TmDOa+QpK0lsWfQ8GGH4L3oPGQk2wgE
 w3ZUgd8SzSoj40bvuLVAIOjKNjaAqb1lemCn3KA76NsrHI3dvFHVHU98J8j2WxYujsbf
 NhgA==
X-Gm-Message-State: AOAM531LkU420vTX7//W8+naWh3QMYdo9AqFNoP1S1xLRDAfNmMyp2Ln
 K6qma9YGTvK9laMMveXiUF4easeTPnE=
X-Google-Smtp-Source: ABdhPJxx8FIdxq1RnQpNlYcMei/6iy1SFOPobT/FRMctCUBqtt8agD26AIUyd8SxUiJ/z05VmIdMBA==
X-Received: by 2002:a17:90a:6e45:: with SMTP id
 s5mr31851971pjm.125.1620053841612; 
 Mon, 03 May 2021 07:57:21 -0700 (PDT)
Received: from archl-on2.. ([103.51.75.154])
 by smtp.gmail.com with ESMTPSA id k38sm3593983pgi.73.2021.05.03.07.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 07:57:21 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCHv1 0/9] Added Audio and HDMI power domain for Amlogic SoC
Date: Mon,  3 May 2021 14:54:33 +0000
Message-Id: <20210503145503.1477-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_075724_304431_7DD3409D 
X-CRM114-Status: UNSURE (   8.01  )
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

Patch series add Audio and Hdmi power domain for Amlogic SoC.

Tested on GXBB - Odroid C2
          SM1  - Odroid C4
          G12B - Odroid N2
-Anand

Anand Moon (9):
  soc: amlogic: meson-ee-pwrc: Add audio power domain Meson g12a and
    g12b SoCs
  arm64: dts: amlogic: Add audio power domain for g12a and g12b
  soc: amlogic: meson-ee-pwrc: Add hdmi power domain Meson g12a SoCs
  arm64: dts: amlogic: Add hdmi power domain for g12a and g12b
  soc: amlogic: meson-ee-pwrc: Add hdmi power domain Meson sm1 SoCs
  arm64: dts: amlogic: Add audio power domain for sm1 SoC
  arm64: dts: amlogic: Add hdmi power domain for sm1 sbc
  soc: amlogic: meson-ee-pwrc: Add hdmi power domain Meson gxbb and gxl
    SoCs
  arm64: dts: amlogic: Add hdmi power domain for gxbb and gxl

 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts    |  2 ++
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts      |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts   |  2 ++
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts  |  1 +
 .../arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts    |  1 +
 .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi |  2 ++
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi     |  1 +
 .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi      |  1 +
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |  1 +
 .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts      |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts  |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi    |  1 +
 .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts     |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts |  1 +
 .../boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts  |  1 +
 .../dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts  |  1 +
 .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts     |  1 +
 .../boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts |  1 +
 .../arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts  |  1 +
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi    |  2 ++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts     |  2 ++
 drivers/soc/amlogic/meson-ee-pwrc.c                  | 12 ++++++++++++
 include/dt-bindings/power/meson-g12a-power.h         |  2 ++
 include/dt-bindings/power/meson-gxbb-power.h         |  1 +
 include/dt-bindings/power/meson-sm1-power.h          |  1 +
 33 files changed, 50 insertions(+)

-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
