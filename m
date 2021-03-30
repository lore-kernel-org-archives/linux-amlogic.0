Return-Path: <SRS0=3LcN=I4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA630C433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 15:23:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E87261957
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 15:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E87261957
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jOivUV6eOTHF9WA+l30k7L8TLy5p0qsjB5dsCXZBH/0=; b=MmOX43anm/lUBeNzOLZ6Q/z5Z
	HtKf/1JYhQXyZxk4JBOH7sRmii74k881GeMV4vbA36QK3lSAvSWAvQl/qRP66AHfGnA0nsokyb4bu
	RMGwC8EovLWJDt/LouXdma9/kmPy77klKY0izUGoDSwGWd1S7dWINVD2Nn60DxUmZqI+3YwvcGXWh
	xhMRViEQCT5kKFHAGUJsEG/HR07h+Ks0WQfKiDyR2LdnVwi+UKGdvb7V+bjErJgvdrOfJKxs48Ctm
	VUPQKADNvZuTRLVjRXs37w3bNG6SWYwmK+5O4XUpcQ6whSHcWd2GJVL5hUwCqNHGPGHjwa/elAKx3
	D2hE4fw1g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRGDZ-0049lz-NB; Tue, 30 Mar 2021 15:23:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRGDT-0049jB-KT
 for linux-amlogic@lists.infradead.org; Tue, 30 Mar 2021 15:23:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so10544687wml.2
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Mar 2021 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Amo0CjIod/3nZW+Fivc6j6ZuIk/uID3Z1EgHGr+VW0I=;
 b=Dj3+PMH8gySOY8WCvX+EJGbMwFjwagH9iYfuJJKBPiLzVyqgxt4MJlgqtA+uUPmJ2S
 xTRZ8Q7TWQSNoZlLrDwJIdbnXjCHMh5ABR53hZcUezXBQmISi47zkVM3rva4qPk5MRQ3
 u6oFKtpxKwiqCZteVdl+TVkAc3Z96Fd8y2ksZufva0jTbM/+UlWSGh90UugnW2H8iy9r
 CjcJPkbC/7AWvS13svxK+VmD27U6yazigtWby0MKWv4xrO7GwyJmNYTJztpMUyqHGw+k
 mejMFzM2a17b0a0wQULPY6MleVmyqYqHy4iz1WsrD97qqXDGWHPfj1f0T7e9HtuA4hWW
 Vmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Amo0CjIod/3nZW+Fivc6j6ZuIk/uID3Z1EgHGr+VW0I=;
 b=t7/ND7ijylVTT7rqxeUV3PS5JUs88f5ZvePz4rvbkxuBRSduWFacrDMsaXwv7Kp4Gm
 eCGLLz/VwktFsJyx0+cMfzS6F+sBqXTuspYgwglAm1iWsS/WEkV8ckrf6TpCKwkW4niZ
 5pcqVtGqxNV411D8Gw/HnI8ceaf7qGULAi2SOPeYnKT3E6mAdkfZhGSHRqB+7tYNXoUB
 5yj+4pJCjWYNsg6CfBTwJmzORnDiFKknTvrIdD9IKVFkeeN9w23eYsfIjTgS0SXiqeCs
 A8ZQ+ajnOGwC7aCQTIdqHPoLBvxy12p/lA+ivBYWBCl5pPk0/9VAXisNjnvzRLGukDhg
 MIIw==
X-Gm-Message-State: AOAM532xzmNcf02YLgJG+lJXUDYEoeQIqGGnNbVnT63QRtA7YI/1lvdj
 nF0qejWCrRTjwUbeOhK0HBrlRg==
X-Google-Smtp-Source: ABdhPJyHyjk1MlCCVtUroZ6z6Nq6EKCHEfiXpJZjOlXKBCwLGx/H5fL0c40xiOAQWr4LFFaxMopyhQ==
X-Received: by 2002:a1c:a916:: with SMTP id s22mr4713674wme.82.1617117818884; 
 Tue, 30 Mar 2021 08:23:38 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:2d11:7929:c1dd:292?
 ([2a01:e0a:90c:e290:2d11:7929:c1dd:292])
 by smtp.gmail.com with ESMTPSA id k24sm4130955wmr.48.2021.03.30.08.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:23:38 -0700 (PDT)
Subject: Re: [PATCH 2/3] arm64: dts: meson: add saradc node to ODROID N2/N2+
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Hyeonki Hong <hhk7734@gmail.com>
References: <20210329161256.31171-1-christianshewitt@gmail.com>
 <20210329161256.31171-3-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <94a092ba-78b6-4aa8-9bea-d3bb1f1a9d69@baylibre.com>
Date: Tue, 30 Mar 2021 17:23:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329161256.31171-3-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_162341_731492_393F0E5C 
X-CRM114-Status: GOOD (  17.75  )
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

On 29/03/2021 18:12, Christian Hewitt wrote:
> From: Hyeonki Hong <hhk7734@gmail.com>
> 
> Add the meson saradc node to the ODROID N2/N2+ common dtsi.

Not sure why this is needed, does it fix something ?

Neil

> 
> Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 2f8d574c30c0..139c12cf9f66 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -508,6 +508,10 @@
>  	status = "okay";
>  };
>  
> +&saradc {
> +	status = "okay";
> +};
> +
>  /* SD card */
>  &sd_emmc_b {
>  	status = "okay";
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
