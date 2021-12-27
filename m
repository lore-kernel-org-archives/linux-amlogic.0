Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9CDC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30z+LiW7RuaabqgKk2SUl/pXi5Io/8qC2qzAWX7Qu0c=; b=GpVE5JZVU8PqM8
	bTadncE6MPhJOGBa54bBl0txw4weK4BeBkixBiTDLwUgHMh5ybO4zeQ3lJaMeIptPV+p3xtQtYPIJ
	wG4ZHVnttGzcR4Db6oGskyfuJK4yM1vTUHqufg1MMCGOZic8zZcSYep3tdg1M3dwzzuRB/oJQsz7N
	VE6xooqK9+xFtMXuP0//HUrC+ZlNvu6VWULj/VLNqSfj0wXr9g/UsqLzJCtqGWZV5Bz6gteru6oT7
	OoauFBQxuy4UBfZQEu4z2qwBnBlIIBFqAaK6aHx1DzRz+zU4yTXBf15F8BT3M9z1wIXOrN1jsgtg5
	yGSKmhtJwwTsntf9mHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1s0X-00GtId-Hf; Mon, 27 Dec 2021 15:33:53 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1s0L-00GtFd-Eo; Mon, 27 Dec 2021 15:33:43 +0000
Received: by mail-qt1-f178.google.com with SMTP id bp39so13462070qtb.6;
 Mon, 27 Dec 2021 07:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=FwZQOWeqoj/A63XT5pEn9HZSQ3cY9sRkGGed0FATKDw=;
 b=PKrG7jWGwJ7MW1Tqi3jkAbH9YFtEXMBJAUyOyfph74jRYh41Jzuk4D3MzqFcxMuuid
 Qv0J7u2IEqOeHlMIIi7baRxiejHfmg32jOzSTvrf39o+1hoXa4tHhWHRG5tuI1KLqBxT
 ppQvH3eX3y3oxvG8Kg7RnEE+ZeLBPfA+jqzxvscEA+BHdGw7sA5XlyjU6rbnM0D8pGA6
 8539GG3T2I+RvesJujLAnuXUUmS9sLL/8/8o8INlBMPAiQkb5cnmNPQcjlOwM2gVvcTG
 yIpjYNM3Gnwlzi2QcpC/kvn6pyGsaoXqoaI6+6f57v2v9a/zsdCLtwHSGPpE+KAfZbSN
 O8Dw==
X-Gm-Message-State: AOAM532GxCkyieyBUW8f3+BV3HRDLRg2AjufXsp1/sMmhz8LxASrEO7C
 mvNLOpOT+EKnFyh//RHkaA==
X-Google-Smtp-Source: ABdhPJzgNNGYj4jnprOtCG45DZlKE+H4MQBRgoMU8JbLBWjvZgou8p1UtEXaB66csKcw5ySPQu6PmA==
X-Received: by 2002:ac8:47d3:: with SMTP id d19mr15325971qtr.72.1640619210381; 
 Mon, 27 Dec 2021 07:33:30 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id d20sm12473326qtg.73.2021.12.27.07.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 07:33:29 -0800 (PST)
Received: (nullmailer pid 519388 invoked by uid 1000);
 Mon, 27 Dec 2021 15:33:26 -0000
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 kelvin.zhang@amlogic.com, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-serial@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
In-Reply-To: <20211227054529.30586-1-xianwei.zhao@amlogic.com>
References: <20211227054529.30586-1-xianwei.zhao@amlogic.com>
Subject: Re: [PATCH V3] dt-bindings: serial: amlogic, meson-uart: support S4
Date: Mon, 27 Dec 2021 11:33:26 -0400
Message-Id: <1640619206.696540.519387.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_073341_528733_0DA04350 
X-CRM114-Status: UNSURE (   9.72  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 27 Dec 2021 13:45:29 +0800, Xianwei Zhao wrote:
> Add serial bindings support meson S4 SoC family.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> V2 -> V3 : fix the type menson->meson
> V1 -> V2 : update author name
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1573297


serial@23000: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dt.yaml

serial@24000: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dt.yaml

serial@4c0: clock-names:0: 'xtal' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@4c0: clock-names:1: 'pclk' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@4c0: clock-names:2: 'baud' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@4c0: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/meson6-atv1200.dt.yaml
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@4e0: 'uart-has-rtscts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dt.yaml

serial@84c0: 'bluetooth' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dt.yaml

serial@84c0: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dt.yaml

serial@84c0: clock-names:0: 'xtal' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@84c0: clock-names:1: 'pclk' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@84c0: clock-names:2: 'baud' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@84c0: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/meson6-atv1200.dt.yaml
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@84c0: 'uart-has-rtscts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dt.yaml
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml

serial@84dc: clock-names:0: 'xtal' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@84dc: clock-names:1: 'pclk' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@84dc: clock-names:2: 'baud' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@84dc: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/meson6-atv1200.dt.yaml
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@84dc: 'uart-has-rtscts' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/meson8b-ec100.dt.yaml

serial@8700: clock-names:0: 'xtal' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@8700: clock-names:1: 'pclk' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@8700: clock-names:2: 'baud' was expected
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml

serial@8700: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/meson6-atv1200.dt.yaml
	arch/arm/boot/dts/meson8b-ec100.dt.yaml
	arch/arm/boot/dts/meson8b-mxq.dt.yaml
	arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
	arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
	arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
