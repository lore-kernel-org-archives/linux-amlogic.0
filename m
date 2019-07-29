Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611FCC7618B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:05:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37732206DD
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rowpe6qj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FhI0DC5D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37732206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4zjsZka9j6DOxc7SpMRuXTQh8eWMxoaa8yO5crK9SU=; b=Rowpe6qjrP5u9u
	JL8mwPHfekMd6f899YJuXaYIAy8Y6c/AKUERwAXoZO/+3CtvoQJnma/xY9fNOkddNA+nGA/K2dkCD
	SHkhpa8EzuA0DKxACAWg4YOA58WH7gigpnxELC0xThI6p7ZFZwWLUk+qI5jEQOHHP1CfRKkE+j7k1
	ucY0N2FtBrFN+QD3Dxq/vA7HaJN0r4IlCO34SFaMENpEgzXy8cj7JnV5tY4B348LxVdxMTYl578wp
	U8C/2KTB4ZpZvzonwiGo3bhjUl6xvh5jR9ivpiTGWIaFem/GnpzgBzYmtPNFypgKxYKBnVrEroRSP
	sJsanxcAPVM9XfKsElRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs5LY-0002Yg-Ao; Mon, 29 Jul 2019 13:05:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs5LM-0002Je-Je
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 13:05:38 +0000
Received: by mail-wr1-x444.google.com with SMTP id n9so61877205wru.0
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7W7NAPTLBQYZPI0wvBRAlGZjV0LGMc5vvrYwHFtU02I=;
 b=FhI0DC5DEwZ+Dr0AN3Umx9BKX7yNEMmmPJ2ChjPvztfE5VIwl+ze+ldJr9J6FtIBJo
 KGyufXNJOJp5wzOKiVdrxNGJEa9hwBlKaUnb3p4IPIUPy3fAut6Rvfb2hFBpZmnAIllV
 TkyANr/M7Cri3yCNZd2f4lK4pahG1MWwcuKnHM1xEK30IQ6NIY4dkX1u+CiP/wM4PhJv
 YkrqdU7mHaVT5YA9lHVFXaSM8NLssMOqxdbMmaXnoTUgcppkTdJTejVwBLReHVRZT+mV
 y7RTdXWI6XICeJg9lbZAzIpIAqbIzJ3H1UNde+4Z6ZuLlfW+Mg6wwp0EgdVUYi8wnt7e
 OVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7W7NAPTLBQYZPI0wvBRAlGZjV0LGMc5vvrYwHFtU02I=;
 b=UV/tlDGpQq3lpWA3IEaJ4M17kKy6PrlOBgm8b0J+INOXz34nKcDG57TsfzLQuixnTg
 Od6YCYbC1+qFeJiQttu/cOb/ZU76wqL/3poh+17pw5tClUCELE1wqBBP83iPiCEetpk5
 GF3p48kouaLg+6lB/jrwt09GzHaWukdGUNs6PdLudD4DMW31TcSVylIaPArQ3Me2CrFQ
 S5oAv3DbkYxNWPlBpD9Vtzvbtq7vJW1biKSfPprCLBvcSzUH6TqTuh1ITQeRn0rSmdMj
 hu/CQQlmz3s0XAWE+mlFa9ubBSfvc5W7OmPjm/9NC6v9FwvRe5KZxclLuDzZEAUVn63K
 4fAw==
X-Gm-Message-State: APjAAAXbtZB69PugaVQCaTuq6XS2zad8Q+cp1uArCGZKM1iPYmwVo6u2
 JZrq5vhrTJRwulLqtnjP3nOC5Q==
X-Google-Smtp-Source: APXvYqzWHJQv+MDKrfVT0E7PtAgKxHjocwHgZzo2ob/4JQCa36tOMcgLqfanffm5ec0yAE1SazJtVQ==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr82663829wrw.96.1564405534826; 
 Mon, 29 Jul 2019 06:05:34 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i13sm54311179wrr.73.2019.07.29.06.05.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 06:05:34 -0700 (PDT)
Subject: Re: [PATCH 3/3] arm64: dts: meson: add video decoder entries
To: Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
References: <20190726124639.7713-1-mjourdan@baylibre.com>
 <20190726124639.7713-4-mjourdan@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <77240589-1e86-6e35-0d7b-25f349057a79@baylibre.com>
Date: Mon, 29 Jul 2019 15:05:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726124639.7713-4-mjourdan@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_060536_675767_456F101E 
X-CRM114-Status: GOOD (  15.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 26/07/2019 14:46, Maxime Jourdan wrote:
> This enables the video decoder for GXBB, GXL and GXM chips
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 11 +++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 11 +++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi  |  4 ++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index f734faaf7b78..0cb40326b0d3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -845,3 +845,14 @@
>  	compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
>  	power-domains = <&pwrc_vpu>;
>  };
> +
> +&vdec {
> +	compatible = "amlogic,gxbb-vdec", "amlogic,gx-vdec";
> +	clocks = <&clkc CLKID_DOS_PARSER>,
> +		 <&clkc CLKID_DOS>,
> +		 <&clkc CLKID_VDEC_1>,
> +		 <&clkc CLKID_VDEC_HEVC>;
> +	clock-names = "dos_parser", "dos", "vdec_1", "vdec_hevc";
> +	resets = <&reset RESET_PARSER>;
> +	reset-names = "esparser";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index c959456bacc6..a09c53aaa0e8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -848,3 +848,14 @@
>  	compatible = "amlogic,meson-gxl-vpu", "amlogic,meson-gx-vpu";
>  	power-domains = <&pwrc_vpu>;
>  };
> +
> +&vdec {
> +	compatible = "amlogic,gxl-vdec", "amlogic,gx-vdec";
> +	clocks = <&clkc CLKID_DOS_PARSER>,
> +		 <&clkc CLKID_DOS>,
> +		 <&clkc CLKID_VDEC_1>,
> +		 <&clkc CLKID_VDEC_HEVC>;
> +	clock-names = "dos_parser", "dos", "vdec_1", "vdec_hevc";
> +	resets = <&reset RESET_PARSER>;
> +	reset-names = "esparser";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
> index 7a85a82bf65d..a0e677d5a8f7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
> @@ -144,3 +144,7 @@
>  &dwc3 {
>  	phys = <&usb3_phy>, <&usb2_phy0>, <&usb2_phy1>, <&usb2_phy2>;
>  };
> +
> +&vdec {
> +	compatible = "amlogic,gxm-vdec", "amlogic,gx-vdec";
> +};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
