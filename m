Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864F4C48BC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pAHR2HmXJUCsmgwZmXrJa4z59k9yrXEvAfdCRqWqgZo=; b=EFY
	iGjg9l2htNXD8YnsULZiX20M7mIZmyJoENJ4uaf4e+8G8EMZ8chBSm0PMXrH9NP7pM1NeB4Z4OfV7
	jVnHmlvVhf6Lm0C/KNrwBOuopAVe+qjEhBZT/Q5hRKpLrECERB562TdOeYmxatsIt/DvpWOCLX3HP
	QvCRQIDUzz+Pvs/GXtmSgKtrUNtgbVrp9XjHJ/BAPsF7cTkTbpyEZUtszuhxFT6BJSxRRw2jGoIUR
	LqT6u3PIP+RZ/Et8kox0j33hPl4ZMKb/km+91UXwMD5dGUF8ptVjAq5N3PmdP16FW+S72QVb2Etrb
	89laBFcbfzQOnh9Yo2UfxOCPGdPAvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc1sm-0000000AD9u-0P9i;
	Mon, 19 Feb 2024 11:32:24 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc1sh-0000000AD4y-0Uij
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 11:32:21 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dcc58cddb50so6833412276.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708342337; x=1708947137; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F9Y8XdXv1kzTQtopo89RJ5Qe87rOsaXFYORvSusUYec=;
        b=dOygqeFl5qoSIWNBZjvv/A8Qro7706ryzeu2DZj8oLNNBBiBTsYBZGxi4zPopndOjo
         ysEQPvNBH126hH6Tkl21PJtD+gb5cOgr6BEyLwbbA5wXVDFwMVryByZbAI/1ytb2PKG4
         zeEG3b6xH/UtpjfucVPoQ02Jv19zLAg4UJBgTqrrOcCmWeRm2RszsV/vt3GURx+stj29
         jz2ZlGchhD/p8q77/PSqWEHW7MV2659MhdWItMWXk1ERODckCatEWLBIWLf7PLGtjbQ1
         vBGGAP6/XlNGFMst/2bneK7CSZ5ZdtQlqZraKB5phRsiUsc4ksFdmaW29x3WW5hRs3uN
         lz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708342337; x=1708947137;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9Y8XdXv1kzTQtopo89RJ5Qe87rOsaXFYORvSusUYec=;
        b=m/pHGBsr7Y2Tq5zg5cHWDigIiUZM4YAcPDcqX9/+8iXIP1EgiPQEbDbkHPq4AHM4Pf
         lkdsaIIpvxZYkUUeoosv7RKklPGy9JkGFt9XzVOIacbtb+za/20hqd3s0JDpcPb+6N6E
         7yfnU7RCGFp9GuiTai0FmLP4+VolLIWh/sAJE3O/r0gTDU3TVvKBwyyvE0+2KqTKhB44
         +LZ/AxWf6TL/jYa7Tgwrq4uZjAV75ftnPtb2mLGYwiCgNg5CMV+zP6KawM3ZH3GMRDow
         yysQtU5rdbFNeT9Ome9vD8rST8C0/nCY1maHuNUpyKbNESyQwQ4GhwvNF4/om84R9mJr
         NU/g==
X-Forwarded-Encrypted: i=1; AJvYcCUkTOX/Gks0XL5q7UMDQFIL7zvYFwZw6L+AMQYXQoUBq7Z0VJ6YqKsL9z73HYYi9lmU9+pGHwQGyJ1vtb0tkugyCfVMvKLNMz4Dwk5ZADgXgM4=
X-Gm-Message-State: AOJu0YxuPk0icdtam0Rui2gvJ9wG1Zm8oFbnAWins4/+XEr5VKXSF2F/
	d7BaJi0Oe2izcj2wOA1qO5Sw7i1ChDcmoI3yiFqHFTwE/7VhQYfS74+P2aKBI+4Z7mrFVBTB1j/
	JYfUL2C67Aw==
X-Google-Smtp-Source: AGHT+IFrFQSwNuSWu6/Y6yp6TLKb1ES+/eMj+OGcS+zU6Jh3xmGly/67ECjCQIexHldo+hDW4MAPEIU45QbnUA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:ced3:0:b0:dc2:3441:897f with SMTP id
 x202-20020a25ced3000000b00dc23441897fmr3248186ybe.6.1708342337288; Mon, 19
 Feb 2024 03:32:17 -0800 (PST)
Date: Mon, 19 Feb 2024 11:31:48 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240219113149.2437990-1-joychakr@google.com>
Subject: [PATCH v1 0/1] nvmem: Handle actual amount of data read/written by suppliers
From: Joy Chakraborty <joychakr@google.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rafal Milecki <rafal@milecki.pl>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	Joy Chakraborty <joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_033219_252174_AC253BFA 
X-CRM114-Status: GOOD (  13.21  )
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

This Patch series stems from discussions in patchset,
"[PATCH v2] nvmem: rmem: Fix return value of rmem_read()"
(https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/).
Where we come across the fact that currently the nvmem suppliers do not
actually let the core know how much data has been actually read or written.
Instead they are expected to return 0 for success and the core assumes that
the amount of data written is equal to what the core has requested.

On addition this patchset will also add some guards and checks based on the
count of data returned by the nvmem supplier.
---
V1 Changes : Change read/write callback prototype to ssize_t and
supplier changes to accomodate the same with core checks and bounds.
---

Joy Chakraborty (1):
  nvmem: Change return type of reg read/write to ssize_t

 drivers/nvmem/apple-efuses.c        |  5 +-
 drivers/nvmem/bcm-ocotp.c           |  8 ++--
 drivers/nvmem/brcm_nvram.c          |  8 +++-
 drivers/nvmem/core.c                | 73 +++++++++++++----------------
 drivers/nvmem/imx-iim.c             |  4 +-
 drivers/nvmem/imx-ocotp-ele.c       |  4 +-
 drivers/nvmem/imx-ocotp-scu.c       |  8 ++--
 drivers/nvmem/imx-ocotp.c           |  6 +--
 drivers/nvmem/jz4780-efuse.c        |  5 +-
 drivers/nvmem/lan9662-otpc.c        |  8 ++--
 drivers/nvmem/layerscape-sfp.c      |  7 ++-
 drivers/nvmem/lpc18xx_eeprom.c      | 10 ++--
 drivers/nvmem/lpc18xx_otp.c         |  4 +-
 drivers/nvmem/meson-efuse.c         | 10 +++-
 drivers/nvmem/meson-mx-efuse.c      |  4 +-
 drivers/nvmem/microchip-otpc.c      |  4 +-
 drivers/nvmem/mtk-efuse.c           |  4 +-
 drivers/nvmem/mxs-ocotp.c           |  5 +-
 drivers/nvmem/nintendo-otp.c        |  4 +-
 drivers/nvmem/qcom-spmi-sdam.c      |  8 ++--
 drivers/nvmem/qfprom.c              | 10 ++--
 drivers/nvmem/qoriq-efuse.c         |  4 +-
 drivers/nvmem/rave-sp-eeprom.c      | 12 ++---
 drivers/nvmem/rmem.c                |  2 +-
 drivers/nvmem/rockchip-efuse.c      | 11 +++--
 drivers/nvmem/rockchip-otp.c        | 13 ++---
 drivers/nvmem/sc27xx-efuse.c        |  3 +-
 drivers/nvmem/sec-qfprom.c          |  4 +-
 drivers/nvmem/snvs_lpgpr.c          | 13 +++--
 drivers/nvmem/sprd-efuse.c          |  8 ++--
 drivers/nvmem/stm32-bsec-optee-ta.c |  8 ++--
 drivers/nvmem/stm32-bsec-optee-ta.h | 12 ++---
 drivers/nvmem/stm32-romem.c         | 16 +++----
 drivers/nvmem/sunplus-ocotp.c       |  4 +-
 drivers/nvmem/sunxi_sid.c           | 11 +++--
 drivers/nvmem/u-boot-env.c          |  4 +-
 drivers/nvmem/uniphier-efuse.c      |  4 +-
 drivers/nvmem/vf610-ocotp.c         |  5 +-
 drivers/nvmem/zynqmp_nvmem.c        |  2 +-
 include/linux/nvmem-provider.h      |  4 +-
 40 files changed, 180 insertions(+), 159 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
