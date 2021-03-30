Return-Path: <SRS0=3LcN=I4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DCEC433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 15:23:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DD45619A7
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 15:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DD45619A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8vvmD2FDV1ZVWZg+B4Lhxpck1SeDIvGUrnXwmiz22F0=; b=irAVThaaau8UnQXuMQ7S7fy6l
	TkCMUl0on3Cx8RQPvyrKg66jd3Bo4XCgcH5HJGyKOfpkdJ7HJ27ib5EO7Ogv7YXUCC4/J4/sIwYJC
	80xIVQ3i6k4qapTeW5zO0xqOAQIwarjk/es4c/YsiVgRS+UjRAQ+CghY8Firfd7+NI1izijI5P5zA
	cGrp9gBhyXIWwSZ4tSHyasQcxqwiO6woG7FQc4J9GRA+cgHUe9w2+bYm477nHWCxvo8PeN2advC3O
	tvDpGrIbp6sZ3twy3OcSJj4Q1sBgbsKUN8mjlKNZ+aI71auj1ftiKWBJEZESZbxw1wdNjouaFS8Qm
	7YBSCxu1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRGCr-0049dW-Sm; Tue, 30 Mar 2021 15:23:01 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRGCk-0049cO-3i
 for linux-amlogic@lists.infradead.org; Tue, 30 Mar 2021 15:22:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id x16so16612250wrn.4
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Mar 2021 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w8V0w5GOQQHkISfgPJAfMdvO2kYy36iSMSCiKff1Avk=;
 b=UK1+56tkUkxiWzmRwystR96Cb2t9qheGXbUSyiN2dgeqKl5Hgl/wcbw7IfsGiBDN6a
 U/X2/vZNS1xLCZtaBdzuywfO6MS3gcIdI+NqD3jPhHlkc0ShXx/R6Bk3+Qi2tEZHXmMi
 pIyaaTYprHhpUG6PDxBTyGZn3RqSMEQ/uO5PCV2dgPMsToSNOiihQcQ33t25LjhK9gR9
 9CuqqUi6ddoINX/lxm6jpVa2CMUxoZkYKrh9zqh/fSd1qY/caYxdU/O/rg6p92bW5xe7
 quVMO5sraS/foEHHqu7cly5FmtbhWhQOA+XhrXcoxcE5laGESrX6+LDendnLlZ7twgLY
 pAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=w8V0w5GOQQHkISfgPJAfMdvO2kYy36iSMSCiKff1Avk=;
 b=UFnWnj7Npq0ft/ZXbKen5Z/OysMcm90BRSnYX4Mr+ti6jkTwmdf2OGVPTBPZeDx6Tn
 tCAKmhO+/hV46f+YkiI5ZBjPOtDXiiu9U+0caBn4UhWErY55euJSc0o6/uY9Q228geZv
 FcfvrpbWVa74nUiB5EmaV4uvl0HaWVX9ESzCPWY2Fnu1o3T3kRR+8ru42gpQeeVkYpjB
 5XEIO740EAU36w4eD5qJy+WtYQkE/zeUTuDBCnKMhkCtaD2j3k0bId2RdLF3TW40pghN
 FqYJ+wwd3EKDuvGcefdMByJ+Ffwau2n3EkKlpXg7YoTEj4YMM+qnkKeg+G5C2rxdw0MN
 MLdw==
X-Gm-Message-State: AOAM533oXewjLNNfwI6008SumtweyJOfR6YYIrfAYNLoO1f7dP3Xjuun
 ZAkAmp3OwNTxTJqujZVQG7TeoQ==
X-Google-Smtp-Source: ABdhPJxESZmSpSlE6klTTQAJEKlYJe9e6WfAFm2Og41KDME4F0sRQvY34G+x1BpznTP2tl29sfIHsg==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr34201127wrw.277.1617117772629; 
 Tue, 30 Mar 2021 08:22:52 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:2d11:7929:c1dd:292?
 ([2a01:e0a:90c:e290:2d11:7929:c1dd:292])
 by smtp.gmail.com with ESMTPSA id r206sm4463718wma.46.2021.03.30.08.22.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:22:52 -0700 (PDT)
Subject: Re: [PATCH 1/3] arm64: dts: meson: remove extra tab from ODROID
 N2/N2+ ext_mdio node
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210329161256.31171-1-christianshewitt@gmail.com>
 <20210329161256.31171-2-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <257db59f-fca6-ece4-f8c9-a2f4e1d95c49@baylibre.com>
Date: Tue, 30 Mar 2021 17:22:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329161256.31171-2-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_162254_326705_C27CA68A 
X-CRM114-Status: GOOD (  16.95  )
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

On 29/03/2021 18:12, Christian Hewitt wrote:
> Remove an extra tab from the ext_mdio node in the ODROID N2/N2+ common
> dtsi file.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 58ce569b2ace..2f8d574c30c0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -410,7 +410,7 @@
>  
>  &ext_mdio {
>  	external_phy: ethernet-phy@0 {
> -		/* Realtek RTL8211F (0x001cc916) */	
> +		/* Realtek RTL8211F (0x001cc916) */
>  		reg = <0>;
>  		max-speed = <1000>;
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
