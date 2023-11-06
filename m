Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69033C4167D
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Nov 2023 10:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z8s1nfXVCGKVwjNXe8lQ9LqPnf4DZHCchRCGavlEu3w=; b=P7+B5nYnhclmaj
	myebfAuHWgPqIYk2VMkcT4UcJwnrtVxdDlog8CnVCBFurVDCigjOQj2kiqSB4XC/e4zPudsNk/zmx
	+xL56FguNx3RkrqeHMfizxULh56OkFBlD5oCi43t9Hch7JDEWGy5c99UEOXOKh0TqVPd7xf+o9z0L
	eRUzcUSqHnDlZ40VgSJylQelKTOFJAtymdVMTD6S9nIOhg8PmRbbXvoNx5alcLjmSVoIDp9vVk/G2
	G0v6tkflwUVJfHXZTP041wP0rXcCDBkuSsBMaPkA20n/lOGmMlUgBOLfBnhf/IlQ1KAtILqOTnLF3
	a4C6FqgVqei085Z+IgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzwv9-00GFMK-01;
	Mon, 06 Nov 2023 10:33:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzwv4-00GFKe-3B
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Nov 2023 10:33:25 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32f78dcf036so3173292f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Nov 2023 02:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699266799; x=1699871599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jlw5HxIULTW6/Y+wZ7qEz5z78H/my/JnN6AqQuvllNo=;
        b=Ta6MNeNv98btgJ3zezXCIJ9GY44tYT0F+26irgX+oShyRdJkf6TkVEKoR2XWf7yE7B
         jjHtE5ohsoPnrlqd7b0q1hEAcTsK0O0QoMZbz9VAZDSfgjxOG8/QlZv7CfQXFHSEJO7m
         SKUb7/73qepMCNGb9M3MF5NV2wZSFtqeVkkgXM66/VU3usMkGG6UbVX4oyiILsGU4I0o
         uu2E/eaUk9PdhmY6/zKNxMgsPOmgta1QtYUH4lVb/1xtGP0uQnvR0JDou2Spu/VjHtZq
         HTOpP9peaGrCzPr7boShI+iH6d9D84IaXCG9eYjlMTZcREOi+GXSe0jqKO96izzqohcw
         9whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699266799; x=1699871599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlw5HxIULTW6/Y+wZ7qEz5z78H/my/JnN6AqQuvllNo=;
        b=OIw0gngAnU3ud8dJ+mwkWGHWf9WYax1mf1IR0IDYhotD6ti1u75wWAOaJ4j0MEYxEV
         qGCS/lvNNVQpKxjmFAKnm0R5QEVNWt0S/D5YSe/D68r5CsdsZ/R0s/sdoNmt+FzhE2Ed
         pGieDgqlTBTEEknrOkam5DMYapBmTYmmxckQtF0jjURS5j+nlLX9sREqQ3KUy4C6oUkE
         TWmZlK2FqKO7XwtnMMLyzIcaQ7O6G8WJBFg401Uq1L7jJW3TFwvdr8Bmn+bxQyztOlyl
         9+753brhAALejAAMXzzyFdDMdQRqfP38CPOY7ThX7GCbP64QixCR195yWkYbpLyZQC67
         RF9A==
X-Gm-Message-State: AOJu0YwPi1MUXCsFFKddXktczYkBHK3DdrqA5Iq5IObITDmQP/tacm4k
	PZSXV0nhlbuMM2yw/kWdgfqekw==
X-Google-Smtp-Source: AGHT+IHzv/E3x2UyZHstlPEHYl4kHcZKQvmPeHGYQ167btT+c+1bBfLcj35EW0Wc7pkdgodfZZ7zXw==
X-Received: by 2002:adf:ed4f:0:b0:32d:a366:7073 with SMTP id u15-20020adfed4f000000b0032da3667073mr9251507wro.14.1699266799485;
        Mon, 06 Nov 2023 02:33:19 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fabf:ec8c:b644:5d3])
        by smtp.googlemail.com with ESMTPSA id d1-20020a056000114100b0032415213a6fsm9033602wrx.87.2023.11.06.02.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:33:19 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH 0/6] pwm: meson: dt-bindings fixup
Date: Mon,  6 Nov 2023 11:32:47 +0100
Message-ID: <20231106103259.703417-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_023323_339275_589304E5 
X-CRM114-Status: UNSURE (   8.93  )
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

This patchset aims to:
* Fix the incorrect bindings for the s4 type of pwm that was introduced
  while converting the documentation from txt to yaml format.
* Introduce a new compatible for the existing PWMs to better describe the
  HW in DT, instead of describing settings.
* Make the introduction of a new pwm variant (s4) slightly easier.
* Migrate the supported SoCs to the new compatible.

Usually, I prefer to send to dts patches separately. This time it seemed
important to illustrate the change. I don't mind splitting this out and
re-spinning if this is annoying for the maintainers.

Jerome Brunet (6):
  dt-bindings: pwm: amlogic: fix s4 bindings
  dt-bindings: pwm: amlogic: add new compatible for meson8 pwm type
  pwm: meson: prepare addition of new compatible types
  pwm: meson: add generic compatible for meson8 to sm1
  arm: dts: amlogic: migrate pwms to new meson8 v2 binding
  arm64: dts: amlogic: migrate pwms to new meson8 v2 binding

 .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 101 +++++-
 arch/arm/boot/dts/amlogic/meson.dtsi          |   4 +-
 arch/arm/boot/dts/amlogic/meson8.dtsi         |  16 +-
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts   |   2 -
 arch/arm/boot/dts/amlogic/meson8b-mxq.dts     |   2 -
 .../arm/boot/dts/amlogic/meson8b-odroidc1.dts |   2 -
 arch/arm/boot/dts/amlogic/meson8b.dtsi        |  16 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  24 +-
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  28 +-
 .../dts/amlogic/meson-g12a-radxa-zero.dts     |   4 -
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |   4 -
 .../boot/dts/amlogic/meson-g12a-u200.dts      |   2 -
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |   4 -
 .../amlogic/meson-g12b-a311d-libretech-cc.dts |   2 -
 .../dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |   7 -
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi |   4 -
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   4 -
 .../boot/dts/amlogic/meson-g12b-odroid.dtsi   |   4 -
 .../dts/amlogic/meson-g12b-radxa-zero2.dts    |   8 -
 .../boot/dts/amlogic/meson-g12b-w400.dtsi     |   6 -
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    |   6 -
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |   2 -
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   8 +-
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |   2 -
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |   2 -
 .../boot/dts/amlogic/meson-gxbb-p20x.dtsi     |   2 -
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi |   2 -
 .../boot/dts/amlogic/meson-gxbb-wetek.dtsi    |   2 -
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   |  26 ++
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |   2 -
 .../meson-gxl-s905w-jethome-jethub-j80.dts    |   2 -
 .../meson-gxl-s905x-hwacom-amazetv.dts        |   2 -
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |   2 -
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |   2 -
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |   2 -
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  26 ++
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |   4 -
 .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   |   2 -
 .../amlogic/meson-libretech-cottonwood.dtsi   |   6 -
 .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     |   6 -
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |   2 -
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |   2 -
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |   6 -
 drivers/pwm/pwm-meson.c                       | 312 +++++++++++-------
 44 files changed, 407 insertions(+), 267 deletions(-)

-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
