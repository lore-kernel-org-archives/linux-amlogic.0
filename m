Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009DFC432BE
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFD0660525
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFD0660525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vwC7IfHLA6lVvAQXbx30Ac7x5/4JSr+2YTTvL2L5J8w=; b=Q9GhUAAa3ebXVwUBM75GYl83h9
	0cECA1Mo5A3YkJ6iI9iEilg8UtNWDUoKC/M5SiluAOpALlsqGrVYTzcVApsUwpl292m6ny/2uYa3g
	G54GWudS8gemzAmuAl91yh7MWb5nrchnBcWl0JIkrsG/uapvkl+ALHFY1xWFOHkKVSCE8oEDUNbxw
	T9Fclac+mvzASgFpD39XFRi/pVo/fREppkbeoSciuQy23EdK0MiWf/dIZRrLAZnoOkbL/OJMIa8JD
	viWMyrcO98zukmR+XPr+ILyNrlok4CTZpCy1pK4y+I7kntOjuH7LB/+HqQi6BY9bpBGxXHFEBnImG
	kzaJeAzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLmo6-009iDy-Cl; Thu, 02 Sep 2021 13:31:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLmo3-009iCs-FA
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 13:31:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id q11so2950516wrr.9
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n0klcoy5VB86GBCo6ovw09LEEA190St+8JgjCktZXyg=;
 b=Nm2sKFRgc19AZSbWMlfNGpn2GO7OzBeHhRab2mdYgOGjNL7jzChX6s0+5tMqd9MiqM
 I2uYdDlppCvhcxTl+Jd4vqqI/NyQyh5ibkkGMHMofx00rHofjRHpJSg3RkjoqPin4A0N
 CTkY7G9Cp8v5CJX+K7sSB41bzNats1NVUgY1V4vJJcxrJ5vkNN235FwhSqxErHKWSB36
 wTHylKGCtkyQVUqJy9Sr0jlFcfIVygJATZiWMyP+xlnIY6Pt0yDPXSCtPKEhUyH1VdjV
 QXO8+SWo9Se011tDFBWbIsE1fBNLljh/TuvncHhXQWG8WwNRmTl/O9fUiGpsKSGv4aP+
 jvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=n0klcoy5VB86GBCo6ovw09LEEA190St+8JgjCktZXyg=;
 b=mIt7wPvExyPpAxjdzm+lza6Tp8TCgw2FoAbSEqHhhvBxkn08oqpRKe+sFahkbcVefj
 P2WjHv/MzSBeigx1gjDp41YYNRnckL73b+mCCJ8uctDZt/25ek9X9UiXreaCfpHByiz/
 jgvG+lvfTNPyew9Q15IkV3D4iDP8GnqMkpgga7tkS6ax00hI3rlSC17fBIb+ySGY61M0
 fuEKQWWVD51LAdzJ1AtdnCkQXkETENxSosodpyKZdrpw3h+Pte7WPh2dtq2BeR5w+9vY
 6OOD3TqUadQbipi5sUVX3oKOwCqudVMZjqKW1T8LnLTPh9sRjxGbHzy2WKhCU0HVDk9R
 zPlA==
X-Gm-Message-State: AOAM531tm3Zhlvd77LGYq5/h84cdvCDFMCFVYcwcSDtkAwS690ZoxVYQ
 SkK8wY2YXoXMgbCRN+WofL4cwQ==
X-Google-Smtp-Source: ABdhPJxVkAODoZdK0YV812Ax+02FJZZFtxOsdh1Ky9ABLZ78x+taEK+4gT2cUQiffXDITf3pXqYMuQ==
X-Received: by 2002:a5d:40d1:: with SMTP id b17mr3735550wrq.47.1630589461939; 
 Thu, 02 Sep 2021 06:31:01 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:98:6312:3c8:6531?
 ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id o15sm1959424wra.3.2021.09.02.06.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:31:01 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
To: jbrunet@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, christianshewitt@gmail.com, art@khadas.com,
 nick@khadas.com, gouwa@khadas.com, Artem Lapkin <email2tema@gmail.com>
References: <20210811050941.398360-1-art@khadas.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <64a6a9e1-64de-4b31-9413-cdfd981862de@baylibre.com>
Date: Thu, 2 Sep 2021 15:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811050941.398360-1-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_063103_582352_9F71C2F9 
X-CRM114-Status: GOOD (  16.27  )
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

On 11/08/2021 07:09, Artem Lapkin wrote:
> Add spdifin spdifout spdifout_b nodes for Amlogic SM1 SoCs.
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 3d8b1f4f2..1efdbb61e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -356,6 +356,33 @@ tdmin_lb: audio-controller@3c0 {
>  			status = "disabled";
>  		};
>  
> +		spdifin: audio-controller@400 {
> +			compatible = "amlogic,g12a-spdifin",
> +			"amlogic,axg-spdifin";
> +			reg = <0x0 0x400 0x0 0x30>;
> +			#sound-dai-cells = <0>;
> +			sound-name-prefix = "SPDIFIN";
> +			interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
> +			<&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
> +			clock-names = "pclk", "refclk";
> +			resets = <&clkc_audio AUD_RESET_SPDIFIN>;
> +			status = "disabled";
> +		};
> +
> +		spdifout: audio-controller@480 {
> +			compatible = "amlogic,g12a-spdifout",
> +			"amlogic,axg-spdifout";
> +			reg = <0x0 0x480 0x0 0x50>;
> +			#sound-dai-cells = <0>;
> +			sound-name-prefix = "SPDIFOUT";
> +			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
> +			<&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
> +			clock-names = "pclk", "mclk";
> +			resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
> +			status = "disabled";
> +		};
> +
>  		tdmout_a: audio-controller@500 {
>  			compatible = "amlogic,sm1-tdmout";
>  			reg = <0x0 0x500 0x0 0x40>;
> @@ -401,6 +428,19 @@ tdmout_c: audio-controller@580 {
>  			status = "disabled";
>  		};
>  
> +		spdifout_b: audio-controller@680 {
> +			compatible = "amlogic,g12a-spdifout",
> +			"amlogic,axg-spdifout";
> +			reg = <0x0 0x680 0x0 0x50>;
> +			#sound-dai-cells = <0>;
> +			sound-name-prefix = "SPDIFOUT_B";
> +			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
> +			<&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
> +			clock-names = "pclk", "mclk";
> +			resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
> +			status = "disabled";
> +		};
> +
>  		toacodec: audio-controller@740 {
>  			compatible = "amlogic,sm1-toacodec",
>  				     "amlogic,g12a-toacodec";
> 

Jerome could you quickly review this ?

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
