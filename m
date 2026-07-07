Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B4EC44500
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 07:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KmqVtWxm2Aiah/6mNOhh/XNEbnHRADdjQQA2uWgnl7I=; b=I+IPpVpR88fje7iN9yhV7BbV7J
	1W2TAoyAb7+0sIrmhjWsqQbyG5eTkFIot9pK4FsKyUoBc6adPIavNGjf4tXtSTqkwy5zy3vA9xeNM
	OJ+epnovpqV9m6tS4FbH14XSjvgmWVJEZ5EGYekdIsSBbrK2F4WMr4+wmid/X3e/mqgkHhoxwjmaY
	YLYQjTHUImtNGpvJTk4kWtIetAoTVGHhsgshCmei1N3MFIC6Fo5Jt528WPWP148mnxQobSlC+dU36
	bKnUpIORPJtjt3gLJ7F51xH8qTimKmRKObf3eEIeOMKI5lY1F0zCTP6yLJYr4nSdFW7/AuGNaBMNT
	GzBLF4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0XG-0000000EM3O-2Jlh;
	Tue, 07 Jul 2026 07:48:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0XE-0000000EM2c-3eTU
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 07:48:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B9BE42E46
	for <linux-amlogic@lists.infradead.org>; Tue,  7 Jul 2026 07:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFF31F000E9
	for <linux-amlogic@lists.infradead.org>; Tue,  7 Jul 2026 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783410483;
	bh=fTELVgDPDDa/adOsZAcvFwbR5ckIe3CM0pZ25SuNlOs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Qr8xIagyx3ZvdFRwQDOyaVjrunJxWrC6+trHzfCOrWDL4efKaTczCRhRnaWpZPL9w
	 RlUUxoJX5bqH139t7TLcLBoqc2GKzxuzwhHJIEl09v/QjIpaAkmmmKdbFyETt/dHKA
	 gvh3wZot9pWH++z5987HPaaFNzkZJ4lkd4JLq7TiSHOUUoirbXRrp7XXl2kVq6Lxpg
	 JyBnnOCcxFfH296ICfguEed3znxsoqaQ5HS31bHn6YhmIJ5dPJkjTUSAbnssxnJ32I
	 bELdOIGLBvKV3GRyM67aheIoorsOD0CvmP7Bu2cqvOeRWhaVIA8tz8a7HpKWZ9LECP
	 CWIaVzf0v0JTA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39b237fb695so33928691fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 00:48:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrnN/LDtdivKLHLT/fIWYnJAreC+jgAjQ49xlvTev1wZ9zujlnHAWIbXdaIH/BKU+znCUvBYK0GPqIT+zoh@lists.infradead.org
X-Gm-Message-State: AOJu0YzsJYVRxHYffQwTvFfe8VraX5hSL0sa0JnoYFAAS4F+B8XCzIym
	VfVFJLHiO/X3lBzFH3tmjHGVdeCteVoE32/4bpSGTT7p/zisR8+KTe4a/M39Nx4X9fI2gAaVAYa
	fE1G40GHD8FC427Ke3/8NVTGQZR0nrU0btEJe3EkWPQ==
X-Received: by 2002:a2e:8a84:0:b0:399:7aad:889f with SMTP id
 38308e7fff4ca-39c60016efdmr6273461fa.27.1783410481786; Tue, 07 Jul 2026
 00:48:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:48:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:48:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 00:48:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeZ=9Oy9rCfugiivuTWNeZc6o5RBm3T_8_Q70RsbVyjkg@mail.gmail.com>
X-Gm-Features: AVVi8CdfTk0d0MBtBeXEYxHV0em1KoWufQbF_cpMl07Jy03GCTI7kHjFfQ2Uf_Y
Message-ID: <CAMRc=MeZ=9Oy9rCfugiivuTWNeZc6o5RBm3T_8_Q70RsbVyjkg@mail.gmail.com>
Subject: Re: [PATCH net-next v12 0/7] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
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

On Mon, 6 Jul 2026 15:20:15 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
>
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
>
> The DTS changes will go in separately.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

There's one more comment to address by Uwe so there'll be a v13. For merging
strategy: there are no build-time dependencies between the PHY and MAC parts.
Vinod, Jakub: do you prefer me to split the series next time into its PHY and
MAC parts for integration?

Bart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
