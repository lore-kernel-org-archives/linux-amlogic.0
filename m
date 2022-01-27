Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523EDC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 10:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f2MXJnRkl4PLzUtbZK9WsGMJ+Uq1Z47KBL29tBHYiOI=; b=H27aagioHoE6G8oh6wGrA/kOjO
	Q+WBWtY0uAORBDohlA+lkpJ2yFaF6rCGllVg4UfomGEm36l9pPqILNljmOJno3MKOn0dDDso34DuG
	clQLEf7A9pDJsmihsjZ3brdFoSDK2G5FgaRkIeTzeepHlRSF6HfWUaE+mG5M3OLKPwhILVHddVOXe
	Oxk2OrlTY7g197ouDxoskVDbglUD/p4faQg6Jy7sJiSZy1daAYfXRDhMB729Q7Ht+L1EQSuJB+2H0
	li0JAbJ8xZGcCYyJ4DPd07leg8/0BsF6/B5rPjpE3pzImgT5OEnkan6Stqman8i5bo98YJ+jNgPzU
	CJNZKOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2IZ-00FDHy-O1; Thu, 27 Jan 2022 10:46:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2IW-00FDFd-UH
 for linux-amlogic@lists.infradead.org; Thu, 27 Jan 2022 10:46:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h21so3916034wrb.8
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jan 2022 02:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=INQLM7jSRCzBoxfXW9jTTbSbm/ueqhtFo7lfbZC+OTA=;
 b=ubIxn1E+uNN1vDY8MebsAnQ7GuteGrFXwuGBUEKfvEdrfcixd8B/PL3c6z249JegoI
 UB+w1mUpFo7WRUInG4yAS/VwFV6a02sedrhPEFAhzYmlRMaRbmFYlHRqLksIa9PC7HNU
 hPoZrEllCxxNU4IdjpwWXJUM0TxbEwDARYj5b+g/SKG0IJRgrnbvGyJP8thtdHaEHjAw
 PMd7tq7fp7skgzU7VW3YLI0toF343PGWT33l/q8qGNRrghmUBOSZnQCac/vvAaIhPWu1
 hN4w138udbtDxqSo0bW8vhRWASaC8l5dbhwWAyEHr01HKVx8tiwWy8pC+W62A0IvyO5B
 zA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=INQLM7jSRCzBoxfXW9jTTbSbm/ueqhtFo7lfbZC+OTA=;
 b=wJbpyfBicsYW2R/iptIV57KnDTtdKk8z8tD72DraEnHD2diYvnlp/RBvoMXHqW5sKZ
 A6fCwvnJV27CppRdjMDdfqAF/vGF0rK8SNJM5t6DpaPg77zxz/jeCYiBUKaGzr8QDLbi
 6lPX3oWEP4Y41z3jgvPGKSxfsz/DT4INBr3sYIdRN9CurMXogbBQTOT1Hy3ka9iC4Tfk
 8tWJ5Yfh2m9ia88Hhps4DIMxKKdbZw+uQqnZm8mF8KUIZ2Qpmi+2qa8KdZqIxmCvi1wr
 eprd1GKxU9MFs6Z2gZEpb5ZqtLUCx0h6W0VHutzUVhY4+CQIxQpaWhnsT/OzZ51qzm+A
 P6sA==
X-Gm-Message-State: AOAM533Up3vT5E1Z5MTuFdKpfNVTi1CrJbIMyRU3x6AUAfEfP2pP6KaB
 hQ0tspi1NQ6Vh0EoaSM5ufchbw==
X-Google-Smtp-Source: ABdhPJyrYLuJIOBp3qeu8mqqbHMX/5mzQXLLyDocyJjjEBiYOnwetPI8LA9wboNZZFmrinmGUK2+mw==
X-Received: by 2002:adf:f90c:: with SMTP id b12mr2473052wrr.97.1643280394960; 
 Thu, 27 Jan 2022 02:46:34 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff?
 ([2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff])
 by smtp.gmail.com with ESMTPSA id h4sm2162389wre.0.2022.01.27.02.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 02:46:34 -0800 (PST)
Subject: Re: [PATCH 3/3] arm64: dts: meson-g12: drop BL32 region from
 SEI510/SEI610
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220126044954.19069-1-christianshewitt@gmail.com>
 <20220126044954.19069-4-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <cea820b0-5ca6-4a34-3d57-92e593785001@baylibre.com>
Date: Thu, 27 Jan 2022 11:46:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220126044954.19069-4-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_024637_029237_714E3BB5 
X-CRM114-Status: GOOD (  15.67  )
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
> The BL32/TEE reserved-memory region is now inherited from the common
> family dtsi (meson-g12-common) so we can drop it from board files.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 8 --------
>  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts  | 8 --------
>  2 files changed, 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index d8838dde0f0f..4fb31c2ba31c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -157,14 +157,6 @@
>  		regulator-always-on;
>  	};
>  
> -	reserved-memory {
> -		/* TEE Reserved Memory */
> -		bl32_reserved: bl32@5000000 {
> -			reg = <0x0 0x05300000 0x0 0x2000000>;
> -			no-map;
> -		};
> -	};
> -
>  	sdio_pwrseq: sdio-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> index 427475846fc7..a5d79f2f7c19 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> @@ -203,14 +203,6 @@
>  		regulator-always-on;
>  	};
>  
> -	reserved-memory {
> -		/* TEE Reserved Memory */
> -		bl32_reserved: bl32@5000000 {
> -			reg = <0x0 0x05300000 0x0 0x2000000>;
> -			no-map;
> -		};
> -	};
> -
>  	sdio_pwrseq: sdio-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
