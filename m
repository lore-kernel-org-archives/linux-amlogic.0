Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D8FC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 10:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XB7gn3Z4FobkXXZSZpRiMJw4t4VWF2Ru7zVpDjet6os=; b=GqRa+0S/dOoeBjmfd6mYn5N/zs
	iFnC5RtXP94pvBQITA/9tBZkODSQf9PzaE+Tv7+CaU+E08wMOVfZ5gsuUte4eaMz2OBF0CPvncccX
	0JMz0kZiH99FLkggZcyzZHRDMcHHLk8omVW5dtkyh9kKYhlR8TrXVUPYLv2tAOoeBRHkcNMxElzDd
	YGCDebuoBC1duoWrv8F91l7oHm9cahv8Th6z0oUz6shfNkQzRH9UY4xsbrfGDkAtNRFPTymjF6TgH
	tdQwbx+4aPtCuzFT5kLvOmM9vAdVy2L+Tu8GnL1JGpN7oU/rEVpOWGotllz1DzlnZ2hDg/A9YuSLQ
	0TDHW/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2IY-00FDHJ-In; Thu, 27 Jan 2022 10:46:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2II-00FDA9-HK
 for linux-amlogic@lists.infradead.org; Thu, 27 Jan 2022 10:46:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id l25so3878379wrb.13
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jan 2022 02:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jMJUQQRNGQfSVpTNxYkQjgWKQuRwp+63flTuqAq51FQ=;
 b=u3w9o4lfjlVkkkP5URbtPSU9Oll4DJlepTa3I2gW+BSrLpjzv6SpUTIEZcOIlpc3mR
 qsWEh9Q+4LE4txajrQgxHMdp6LJzBNn/X3SvwuNw6Ob/lHoslGVAavqUldTSltQHAFgu
 zwiPfza1RwmSSMSFqNICd4jjWGmXJd9xkp2v9otjYWZNqRrHtFwzjLqZs7OkQ4vAB9aj
 zRD4w/5dIyR1sPPw/AHH3izsEc5t92cj540nCrBfPuZ41pHlDUicM0cF67F/vOCvyUcA
 pOVWWrcwWT8GOXDvsPJ57BWjxBBowsqpnyzXbm7d0JPuj1waxw0NUIQxaPXFI8odqq4/
 jw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jMJUQQRNGQfSVpTNxYkQjgWKQuRwp+63flTuqAq51FQ=;
 b=qyxj7VPojETDDAyNIJIqwHo2IybLYAuRvGjPfFhucKjLzQqaMdwXR/4GMdJwPxQl3q
 LrfidEj0PcCH5ENiKjYAt278gLqkh0VEWg/Kp59GFemwEkaU3B225OcZ4/p+DDKPrKl3
 vdvHzIsSgU0RBaKsmu/azRvoroZSLeBbrIxpi2tPRZtWiVb3hfRRIXe8+GkGv5JSjv5Q
 ML88dXVvD54/q51diCYgzK6HtbmME2cpZkPM4UxqcQ6Puhn0iEB0E9omvDextPknJs89
 J0XUQPL0+3FfINL9M4ccx0YwWuDs5vHnALKy2ftn1JaMh2Hnx7pDwS0uEzWOloi/uHv4
 u1Lg==
X-Gm-Message-State: AOAM530ChzLhO/77lhuyvP8MMrfRENggGIqjNvz/xxO4gI7hykvhCe62
 bbE/KYDIkcZwWgFqu5wU1zL/l41YVFtzsA==
X-Google-Smtp-Source: ABdhPJzAXLovLm3w1LwAV/9nZMMIWduZnrezt5OZmEwVVa7+NgBjFiaSXlAQ6BzecVuIb5qQWnhN4A==
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr2537467wrq.536.1643280380592; 
 Thu, 27 Jan 2022 02:46:20 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff?
 ([2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff])
 by smtp.gmail.com with ESMTPSA id l13sm5830775wmq.22.2022.01.27.02.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 02:46:20 -0800 (PST)
Subject: Re: [PATCH 2/3] arm64: dts: meson-g12: add ATF BL32 reserved-memory
 region
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220126044954.19069-1-christianshewitt@gmail.com>
 <20220126044954.19069-3-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <af845f03-6bd4-cc78-2b7c-a32257f8773f@baylibre.com>
Date: Thu, 27 Jan 2022 11:46:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220126044954.19069-3-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_024622_586688_DCA0338B 
X-CRM114-Status: GOOD (  16.03  )
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
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 6d99c23261fb..45947c1031c4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -107,6 +107,12 @@
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
