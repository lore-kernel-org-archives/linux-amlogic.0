Return-Path: <SRS0=3LcN=I4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04B1C433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 15:25:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B9B56187E
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 15:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B9B56187E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dlpf8OZx/nfuc9xI5uBl1hWHQTHmH2G30mpC03+xYSY=; b=Az9ilVV80419fa5B+gDnGm52G
	hjL3KT1nHDio2mxuiKUzN9jgzLG7275dIv3JHebttu0C5onQ/dZH8Ykxr4FA/D9jicb3fHnp9LR+2
	G55l1aGFKouzn7a1pJ7ka026fblkUoNTmT8dm6F/cjqMOUwR6e4EgAPsDT8nVfOiz1eTL7joLfXI1
	8QlJXzUCx4hG8o5TLyHD5DgNjZqTiOm6tXMPx+qm1MiJ+4Ezlluk/SEn9qcCw/dI7hAtHgB3urQK7
	/7IWMzcxMCwHuDGF+agwI4joJ3hH7WnppG2L5cuZRvVe6fdNL4woVXxbf++++DhhAm6bpqRzkngDw
	JyJ29Cmpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRGEo-004AGl-5E; Tue, 30 Mar 2021 15:25:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRGDn-0049rF-Sf
 for linux-amlogic@lists.infradead.org; Tue, 30 Mar 2021 15:24:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so8637369wmj.1
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Mar 2021 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NNUxPqkNr1lmvxqyx0hs3F7FCLgkigSCCO4LVWgev/Q=;
 b=Y7Uf5Fqg9/E30OhPZdjsxlEKO6CN4AgTZGfDF2oSiEb7ByYXyLsVE86CWSji0tgdDH
 gYBhPv8DtqlHgpext9peWvQn+7EBcgpn4CQ7zUm81c6letBVNOlY6wkuBkRLcGwDYNcG
 ibiC/d3uF0p9mT6LONuK+MaPp2o02mta2aKDDEjfyvzbe9JpRcI6G3J3uobEP0SEaIsy
 EDXs1goiATvQnaYwAeRqe2uBqxSGlNIK+tB/GE1ywn9KQCW1vsbhC1kZBgTZL7IHN7tV
 r+WEze5O2YQ/rXrpyhIi8Te0cqrYrnIepWEsj0ziQ9yAYeKFDSippsbJ/0NiYeAQaEfT
 I8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NNUxPqkNr1lmvxqyx0hs3F7FCLgkigSCCO4LVWgev/Q=;
 b=UBlxRd5bj5vTgkKrWm/0pxt77UUa5yHFjvgPV1ItaiR1zV0Jue8qJ9TElpaoz2Hsfa
 fipfISuukOUVmLh0s9PTWTQknGPeu1VbdWmclOfspMirXzrb3CqTkjiaprIteT5xtpr2
 eOc7Gg4Bq4fhVw+h3jVsneuIGi0li3cGUGkJ0ifeZbQN8V2lOyxRKMCUVPRHr4FeA+Tk
 41VmAYW5FEshx/PFfjw2Txzq3RmQqX46E5DWl2WyTRnHweCWerbVaIrm6AT9ejcL9Vcd
 CbvmPA8mUSYS0IF3Xa1Ima6LPzXa4iYWkHDFPzz2Az/DOEVu+q0//HqG4+ubOYghAfc3
 da4w==
X-Gm-Message-State: AOAM53359kOKOIypq+8PIQPxuboPRmxenq/j1NmfvFZQqrmmJ4x0Bia4
 WpLGLdHPhewHCrxdOgSfxQgXHQ==
X-Google-Smtp-Source: ABdhPJyijPfFnAIu2qD1IBDT+fbzIySc6SKDY4no3zWzEiXjmsQVOKwN/jMPzugjHbOFRlWYWEnThA==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr4656647wml.147.1617117839225; 
 Tue, 30 Mar 2021 08:23:59 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:2d11:7929:c1dd:292?
 ([2a01:e0a:90c:e290:2d11:7929:c1dd:292])
 by smtp.gmail.com with ESMTPSA id o8sm4151578wmr.28.2021.03.30.08.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:23:58 -0700 (PDT)
Subject: Re: [PATCH 3/3] arm64: dts: meson: add GPIO line names to ODROID
 N2/N2+
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Hyeonki Hong <hhk7734@gmail.com>
References: <20210329161256.31171-1-christianshewitt@gmail.com>
 <20210329161256.31171-4-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9ebc18d0-247d-ff54-5045-8df382620181@baylibre.com>
Date: Tue, 30 Mar 2021 17:23:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329161256.31171-4-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_162400_838757_E1D506A3 
X-CRM114-Status: GOOD (  18.34  )
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
> From: Hyeonki Hong <hhk7734@gmail.com>
> 
> Add GPIO line-name identifiers to the ODROID N2/N2+ common dtsi.
> 
> Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
> ---
>  .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 139c12cf9f66..4489715fc4f3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -446,6 +446,51 @@
>  };
>  
>  &gpio {
> +	gpio-line-names =
> +		/* GPIOZ */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* GPIOH */
> +		"", "", "", "", "", "", "", "",
> +		"",
> +		/* BOOT */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* GPIOC */
> +		"", "", "", "", "", "", "", "",
> +		/* GPIOA */
> +		"PIN_44", /* GPIOA_0 */
> +		"PIN_46", /* GPIOA_1 */
> +		"PIN_45", /* GPIOA_2 */
> +		"PIN_47", /* GPIOA_3 */
> +		"PIN_26", /* GPIOA_4 */
> +		"", "", "", "", "", "",
> +		"PIN_42", /* GPIOA_11 */
> +		"PIN_32", /* GPIOA_12 */
> +		"PIN_7",  /* GPIOA_13 */
> +		"PIN_27", /* GPIOA_14 */
> +		"PIN_28", /* GPIOA_15 */
> +		/* GPIOX */
> +		"PIN_16", /* GPIOX_0 */
> +		"PIN_18", /* GPIOX_1 */
> +		"PIN_22", /* GPIOX_2 */
> +		"PIN_11", /* GPIOX_3 */
> +		"PIN_13", /* GPIOX_4 */
> +		"PIN_33", /* GPIOX_5 */
> +		"PIN_35", /* GPIOX_6 */
> +		"PIN_15", /* GPIOX_7 */
> +		"PIN_19", /* GPIOX_8 */
> +		"PIN_21", /* GPIOX_9 */
> +		"PIN_24", /* GPIOX_10 */
> +		"PIN_23", /* GPIOX_11 */
> +		"PIN_8",  /* GPIOX_12 */
> +		"PIN_10", /* GPIOX_13 */
> +		"PIN_29", /* GPIOX_14 */
> +		"PIN_31", /* GPIOX_15 */
> +		"PIN_12", /* GPIOX_16 */
> +		"PIN_3",  /* GPIOX_17 */
> +		"PIN_5",  /* GPIOX_18 */
> +		"PIN_36"; /* GPIOX_19 */
>  	/*
>  	 * WARNING: The USB Hub on the Odroid-N2 needs a reset signal
>  	 * to be turned high in order to be detected by the USB Controller
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
