Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AB1C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 10:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EIdih73Z96ZqSxQ6lp88p34QL7HJ1R8IVqnaCzm+CZs=; b=WqKPQSZzYrmh1IfeL0zvc3fcJq
	vcjyn0E0akWogA6YdeBHQjCdzp6nhA3p1FPkhuHb2vOwqNtk89Laj8meFXnR0eT4iwpq5Oo0tI5T4
	kdtm1fPHGa+zN+Pwrhk5AU1TQSQU6KfdnwnspanoHak6YXYYGgEb2AJCHo27gMdd/w0y8wvrx3gz6
	8SIUg992AjUVA1i6HqUB/mv7+bu3p/BJIL6PClwxYTOEme59TeU4LZyGibxdFthksMk8UcZKOo4Ty
	liYYLEpWXo+8tae8H8H2orjwoP7TI70MqQ4vZ+R8TpvoqMoi5Pvh2kAKUVIPV+R0AHcWddv9SOVPm
	GteMNSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2IA-00FD8S-Jh; Thu, 27 Jan 2022 10:46:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2I8-00FD74-1V
 for linux-amlogic@lists.infradead.org; Thu, 27 Jan 2022 10:46:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso5605737wma.1
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jan 2022 02:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NkxIb+P+5+H76bh6f83+7pLlqmMSsgvAiVmWl5dkrqY=;
 b=SpMp+sRuCSmEpu3Ipx2TZyuKCfwRyDnM/JK0kN2/kolIcyDpWYisP4jcbMe3oTJ34x
 OMXSgxwl59uvQ3b7OZEuEyRoCLuzXgSocMh90+5l0n5qYXWoVyHmCEoGJ8f0PO+/lxiQ
 io7Bh4UdHajE07PIICHF6qzncOBVQkLtU3F/8ktxIQMcS6fFRNJKiOjjcllp4i/6a8RX
 WNK6m5kFgD54MFHenOjsN8D9NdNA+sumDh5KPA0nbZuH966z2PXseDdu+5d3Bx8rPD2w
 irZA1W9TSnO7N2z0TXS7jQV9RgLTK6HG/qfAFqOwzL+78w4ZLbP3twGCgJqgqqaIL4h5
 x3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NkxIb+P+5+H76bh6f83+7pLlqmMSsgvAiVmWl5dkrqY=;
 b=AKxkLSfLL8k/nxHYpAlLNKh1xz4pTcwUOHv1BEVFTHCgdXIdcoIzORJCMRfBk4uIXU
 c3fhbUhjwwU8DvTUWHrc9wUKlWm2hJ8a0qzdQ6cLPDsok6vwxPxuv0TtNUzRsRRoRGvg
 AjxjGOu4VwWgKbDQQUclMcZzGheUKB+dar+vRy/jZubWOAvyr3M/YU/BrQvarsKkdEYE
 nyBCbmp71HB5ILgISOZH9mB5ohF9BO9h54HeA6s/bjPrSg4LPIf14Ux58YceeMVTrnxx
 R7yrjfFoPUjoVShEWyqM3SMq0v5uSY5EFwE1Ot9imsRgUQsWf3628jM8ja5JW6B1qrR1
 2evA==
X-Gm-Message-State: AOAM531GEk8CeSl2R3YUsIL3XfZOdK5SsAlm7K+CUihp8Y6eJ/hSmt6M
 omsZUd/CvUFrGMhwkXTF4UjLZA==
X-Google-Smtp-Source: ABdhPJzo3DHV622CAx9cYAdqcbvj9NzeXAZjWl1L9efjh/UkXJP6ZQ+49u/zGuYitMDsi0zubeKw4Q==
X-Received: by 2002:a05:600c:4e0d:: with SMTP id
 b13mr11204582wmq.99.1643280370135; 
 Thu, 27 Jan 2022 02:46:10 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff?
 ([2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff])
 by smtp.gmail.com with ESMTPSA id o27sm5651453wms.4.2022.01.27.02.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 02:46:09 -0800 (PST)
Subject: Re: [PATCH 1/3] arm64: dts: meson-gx: add ATF BL32 reserved-memory
 region
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220126044954.19069-1-christianshewitt@gmail.com>
 <20220126044954.19069-2-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <517ef196-e622-7ed5-c3be-55ac3f054b74@baylibre.com>
Date: Thu, 27 Jan 2022 11:46:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220126044954.19069-2-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_024612_125991_2F9A57C5 
X-CRM114-Status: GOOD (  16.13  )
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

On 26/01/2022 05:49, Christian Hewitt wrote:
> Add an additional reserved memory region for the BL32 trusted firmware
> present in many devices that boot from Amlogic vendor u-boot.
> 
> Suggested-by: Mateusz Krzak <kszaquitto@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 6b457b2c30a4..aa14ea017a61 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -49,6 +49,12 @@
>  			no-map;
>  		};
>  
> +		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
> +		secmon_reserved_bl32: secmon@5300000 {
> +			reg = <0x0 0x05300000 0x0 0x2000000>;
> +			no-map;
> +		};
> +
>  		linux,cma {
>  			compatible = "shared-dma-pool";
>  			reusable;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
