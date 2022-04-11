Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E93C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q4Q9iGyXWpjO/wh/cBUoMzL1l5GVeE4xGICmUe6nXc=; b=zIf4tEl3+cXer6RIELJdSVlfmH
	TdB7gVXuo5G2EaDmuD6D/M1Do8HEp/Kxf7XjZ1yAVRRGBeePUi8DZjSAm225ycUiJvrXSVqW4rdtk
	bqZ3HctMUu8HMeoY2yzkieOovF2Ip7ovviLJG9RDBEsN3x+ClsAqFQ8j+62eyDrAToaq6xCE/qgSk
	89u17aM5Oqo+Coij5zv7NTvUM9AeDLHn8e5aDjlwfyjq3dgraW0SMqYi29NYAZZTXTXmnSOqTY7fs
	JhKlbXut9WmbL+u6X1AzRAvNE5i015nQwJsFgyYFtlt3uSUv37DRUTjXwP30JUdw63WSEKAcmbfPk
	w9+XDyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndplm-007e1v-1c; Mon, 11 Apr 2022 08:51:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndplj-007e0j-Il
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 08:51:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id c10so803427wrb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=iwxtSATT8Mt7edJ1xwuhC6r8z0Io/WpcsfMVAIxwU04=;
 b=F9B3f7gF3tj+7DPUhhL8A0azIYdKhygw7xQvHI+hlQSkPx/ZjU173naKk0BEWrqbnl
 VSeuawys/XW0POS4dioHfGmfxq6mHHUztXrrvhDxW2e3y8txi71DWxAgiwNYXAoHgbJH
 K9txrMNeOkMakENz3pWnUlWX1BaWUZgcg5+gRChO8G/wkCUdgs6XUyFfpEBLdU0x3KJM
 MPEfcxkqrBJLLAkIfcx5l9k8VekmPfuQvSuFB/99qspUa7LOGLse4FfLPWpaeFpILER0
 Io5DCZ16PJJRKA41+VFNblwECaLmRELhRLM/1QIfZ+/ngkm6mePtV8ggC5xJxk+vS6br
 WeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iwxtSATT8Mt7edJ1xwuhC6r8z0Io/WpcsfMVAIxwU04=;
 b=CDFV50B3n9Jp0akgGrxuG2IBe3lR4tHjrwEJ6uSYhg1jssGTq2Ni535uiKL5pQnhSi
 F/M9vSRXzTIuL9jWlLKC7X4yS20zO/J3b4w1zxoVZH5Q7+iZpkgATi+CuJgafWBIZkwU
 793+x61M2RzOISFvG87Ox1/IHRHcp51zZ/dE4yoPqK96qZg+WchsfCD53Ivr9beOu+4b
 YMAgfG5wxKTvkTq/zr4G4Aqn87Vnx12m0+7Ak6iE+T/jGf2Hp8h37nrLh7N5KSqh1ale
 uuYsMtlF8+xbbJ2xqknr9OgVwDYWAjnMxlI8IQAudIn7CHp3bo3eLjrKd7wl4Omjaigc
 0EMQ==
X-Gm-Message-State: AOAM530mDrv8+qukRJOYjgdXHLl+6b0m42uKLoDGHGzdVj0EaRtegGyf
 3VwKvXJtnkQT8iunfGZ6c7wPXA==
X-Google-Smtp-Source: ABdhPJxXTlCwkuNoO7NPZnS7ndGLa8yhRWNh//8Fb0sGJhDVMVy8ksQaFtdK8v2VUpknv/mNM5F+kQ==
X-Received: by 2002:a05:6000:1888:b0:204:1a8b:2999 with SMTP id
 a8-20020a056000188800b002041a8b2999mr24474226wri.221.1649667089907; 
 Mon, 11 Apr 2022 01:51:29 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5?
 ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b0038cbdf5221dsm18300212wmq.41.2022.04.11.01.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 01:51:29 -0700 (PDT)
Message-ID: <cb196470-ec96-3a87-e5c8-3ae813a45b24@baylibre.com>
Date: Mon, 11 Apr 2022 10:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: meson: alpa sort the board Makefile
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220409064257.24453-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220409064257.24453-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_015131_668808_33DDF367 
X-CRM114-Status: GOOD (  11.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/04/2022 08:42, Christian Hewitt wrote:
> Let's alpha-sort the board Makefile to keep things organised.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile | 38 ++++++++++++++--------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 0eec18678311..8773211df50e 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -1,17 +1,18 @@
>   # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-radxa-zero.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
> @@ -19,29 +20,29 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-p200.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-p201.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-meta.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-telos.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-hub.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-play2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-libretech-ac.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-hwacom-amazetv.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-khadas-vim.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-mecool-kii-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-sml5442tw.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-vero4k-plus.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-jethome-jethub-j80.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-jethome-jethub-j80.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-hwacom-amazetv.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-khadas-vim.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
> @@ -52,15 +53,14 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m5.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-h96-max.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb

Thanks for the cleanup !

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
