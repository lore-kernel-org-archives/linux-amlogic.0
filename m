Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763AEC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jan 2022 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sr2PnQZ2zEAknyYT7kcaEYrNgyFVkazGKJzi87NmIL8=; b=CEqHWXAB5Uu+wX83j2JJAFeH/R
	RZFlJFXhHR0hF65/qMuMwwK2oJM93D6GEByGeHF6sdeP4fdDaXjD2dU9J4MdGYV9eHcufgb6WcPMz
	8doZ8sfxYkkN4FSUy/S41OIiykz+Ts94GJw0cCDozyQPAyfZkMQcuGr7VV9HzwmVbVqmSzNNSQ9Dx
	7wo0yr6KLZQA34SB2J454jM3khw7N45NdyQxEW5Gw+sGOa92YfLaCjJsocdvfEXlwTamhxiauG7y8
	3pqiO9cogyA9giMrO7sHcEp2fhTpqxvEU78Tv3BapKh1WFyqljFIW1bjSfo7qtomhRoB4gKpV6WMt
	OhTtvDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5O09-00H1fV-2C; Thu, 06 Jan 2022 08:20:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5NzN-00H1RL-9m
 for linux-amlogic@lists.infradead.org; Thu, 06 Jan 2022 08:19:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id o3so3200967wrh.10
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jan 2022 00:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AZChhdnX0YuKY0BMypmerxkK3KtsyiUpb0QZT6UqENA=;
 b=VO4dzc4B7SZ56DYc9RsQVTj2YckoUNgNXNrRsx4OkCuI/KuXWV+dp+csUeOh1kIuqY
 1XRVZP8bcTHhKQUtDa9CeWcNQLkDQyXdDxXkPSJST08TdqNpAIzFHqZQjaL19M8NQvRI
 L7WR9n0BIe5SL9RjNMwz/33GiN5rBYBFdK8//vmgCiBSA8u35OsllG+sLZ8vQKAxavhC
 qJ44+7WIzUwFNcn/xX8BkfUg2c2rfAAmjI5uum2vpBDldc+iI881IlsRnxKJQtaPsfqK
 os5Ke6OFwQwVK99lfeyzZ+wpdONSLvhlYqNHzaE+LvzAH5It03zyog0UOEPRoRF58Z+P
 bWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=AZChhdnX0YuKY0BMypmerxkK3KtsyiUpb0QZT6UqENA=;
 b=EcClk4qWlK0t3qifH3RqsIg5xaCjhkAZ60Fu6uQ1eTYjwjnffsxlNDjIUHtAbuln/P
 HWY3hL8U/7txQTtjHnSgYAQke+1ly1GqWgIr0SKrhntq7ytClncpYOnnvNNuRHU8t9Jj
 I5Zjuhe6wC0FsBUY8K/ReshPwBBORZKat87BCLPk0jNZzYw42pmhtl5BemLI29Hutyx9
 wv6KaJIWb5z1iNjezi10TGsm5lrTA7EZdZHKOCEu208B0OHkeUmiPRPalab/hmG0At9b
 mU0M+YR+Lrq9vs0hksK+Td5OUQkt3BWLxMUhYyOxWQkRG6BhgKY+S+01Ez726nzOCwFj
 J9JQ==
X-Gm-Message-State: AOAM530uSi9zDI8T6Dc8fgVHsvuMOKeJk6eivmxenKHIFA799N3FOeDB
 M+L+lllMwYKG2DYY6/ATuJDxfw==
X-Google-Smtp-Source: ABdhPJzmX3i843FH+Y7JbfwGB3nwKMKHvBSNhesub5FRG/49dtrtvh7mg/lJ29NWeNYkdzWqNa1ljQ==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr51143400wrd.179.1641457150469; 
 Thu, 06 Jan 2022 00:19:10 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:cf72:3b19:5d45:871d?
 ([2001:861:44c0:66c0:cf72:3b19:5d45:871d])
 by smtp.gmail.com with ESMTPSA id y8sm1472208wrd.10.2022.01.06.00.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 00:19:10 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: nand: meson: fix controller clock
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu
 <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20220106033130.37623-1-liang.yang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <8439ec98-694e-0391-2a00-89e856024823@baylibre.com>
Date: Thu, 6 Jan 2022 09:19:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106033130.37623-1-liang.yang@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_001913_500244_F7526C90 
X-CRM114-Status: GOOD (  16.66  )
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

On 06/01/2022 04:31, Liang Yang wrote:
> Change-Id: I1425b491d8b95061e1ce358ef33143433fc94d24
> ---
>  .../bindings/mtd/amlogic,meson-nand.txt        | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
> index 5794ab1147c1..37f16fe4fe66 100644
> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
> @@ -14,11 +14,6 @@ Required properties:
>  - clock-names: Should contain the following:
>  	"core" - NFC module gate clock
>  	"device" - device clock from eMMC sub clock controller
> -	"rx" - rx clock phase
> -	"tx" - tx clock phase
> -
> -- amlogic,mmc-syscon	: Required for NAND clocks, it's shared with SD/eMMC
> -				controller port C
>  
>  Optional children nodes:
>  Children nodes represent the available nand chips.
> @@ -28,11 +23,6 @@ see Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindi
>  
>  Example demonstrate on AXG SoC:
>  
> -	sd_emmc_c_clkc: mmc@7000 {
> -		compatible = "amlogic,meson-axg-mmc-clkc", "syscon";
> -		reg = <0x0 0x7000 0x0 0x800>;
> -	};
> -
>  	nand-controller@7800 {
>  		compatible = "amlogic,meson-axg-nfc";
>  		reg = <0x0 0x7800 0x0 0x100>;
> @@ -41,11 +31,9 @@ Example demonstrate on AXG SoC:
>  		interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>  
>  		clocks = <&clkc CLKID_SD_EMMC_C>,
> -			<&sd_emmc_c_clkc CLKID_MMC_DIV>,
> -			<&sd_emmc_c_clkc CLKID_MMC_PHASE_RX>,
> -			<&sd_emmc_c_clkc CLKID_MMC_PHASE_TX>;
> -		clock-names = "core", "device", "rx", "tx";
> -		amlogic,mmc-syscon = <&sd_emmc_c_clkc>;
> +			<&clkc CLKID_FCLK_DIV2>;
> +		clock-names = "core", "device";
> +		sd_emmc_c_clkc = <0xffe07000>;


sd_emmc_c_clkc should be documented, but it should be either:
- a syscon
- in reg

but since 0xffe07000 is part of the emmc memory space, you can't simply
put this address like that and pass it to a random undocumented property.

Adding "syscon" to the sd_emmc_c compatibles, and passing the sd_emmc_c node as syscon
could actually work.

Neil

>  
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&nand_pins>;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
