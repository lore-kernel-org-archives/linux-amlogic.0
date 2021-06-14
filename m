Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B64CC48BE6
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 07:56:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8930161352
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 07:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8930161352
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DtUKo5K2ykSV/AA3lf2aYJj7bus5fluVG3Qa0nMuY+Y=; b=voMtjdPvjQ8uZvu7Fny0pNoiu+
	1zap/VOcI7/BF3wewZIVvWTQGEL7sojJ/jbMc6Jkq8eM9eDV2i+po/3higImW1lzYfFMTlC0HUo+/
	9M/nh4wDSZTngZe+MniKBfzfvU/P9AR6h/efAEGpSD3tI8ymMfDqJ5xz1nIqXgbn9cu7TsQUjwwpj
	fJcxtSsJ8jCtUFkszA/kdowBLBuhvMCJDjWVwOW7TjEE5ODer+klKL+A/znuYnJwvuSFUeo/Fl7ah
	jdnjTAZCBHq+b46e2pU1RRIzZ/pCkUCcxpQFF5w/24mDtEU6hTuXX98Shr0VN4xi1iTk0YBns21gG
	afYbHgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lshS7-00D0bI-8p; Mon, 14 Jun 2021 07:56:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lshS3-00D0Zp-S6
 for linux-amlogic@lists.infradead.org; Mon, 14 Jun 2021 07:56:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id m3so6308350wms.4
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jun 2021 00:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YFtSuQv3LCHTkS9qZQYFvwMGwlgP6Ey1HHzA5wPOVqw=;
 b=XTJBTHThLVkVDyD9nRfrWfd6LXp2sdF+Q2BHknVacC7qynJjJkOy+iCkBlLSPJiJA6
 yqUMUho+a9imaUkHYDgA1B+c7pFGGbNrseZ1tdsz2sK1au8q4fWu5jyGFBKbABGQpcfF
 RYicjiaY1ykjV7hLClUIK0kJra547cBd+2SLZp/8YOZasMli+O/tSvqiTkmTVMHNafMp
 Xy+iDVKUalW7NNCYlFOzM2OfXaxxLRUlnnqWXRVuX9C0xde/I/Y01IhS2bE4SG1abamj
 tKQLuLXH5qaNYRjUlDoslz30z1V3SujV1R9K1bP3lKOzCn+5aiM0SJFFGZpAcqZE7+lq
 KAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YFtSuQv3LCHTkS9qZQYFvwMGwlgP6Ey1HHzA5wPOVqw=;
 b=Elsj7SpDS6CorMgNUHqxVfXSNtobjNe/jRYCKnsTXgAG/Rr3IlWBMVJTeEne5vBYYI
 a+cKPA6NXCw6/g/u7N1NCEXDpgNwWphzSaqxegWHg0z6/zT1okLzgdGl7qjQvGp4CI/h
 IzbKr8JGon03prZ9PTuFQegABRGK91R904SU4lclTXjtPTydjAVnBRNogW4fQnkAs6cb
 Zap6yHqqIPBcQwCIRIYD10phZKK9lX31B2Obq+R599n5quYkGGPSwztcIZhMDbj88c+U
 Qu/GNPGs40OsHGj1siXSseLYLUipaC8l4U6Bz0kWAJPGWodrOOIsxAHBA8H1W8nXszP+
 UTDg==
X-Gm-Message-State: AOAM531FbZh1RdzFMtC+zhFPpsoFLaH3L6Qpl3CG8AaYYW/8xdjysjCQ
 /djgNm4Jw7Q8X0ZqwGFuPwf7dQ==
X-Google-Smtp-Source: ABdhPJwXiCFSQ5nXOlDH3D+m1LZ6V9tiBVDzD62PR4ZSSay1CB+Y6o4yT9bRqZBZXyOCThu5gRjhKw==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr32297464wme.129.1623657362889; 
 Mon, 14 Jun 2021 00:56:02 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:71f0:4862:1742:37fd?
 ([2a01:e0a:90c:e290:71f0:4862:1742:37fd])
 by smtp.gmail.com with ESMTPSA id u12sm15793274wrr.40.2021.06.14.00.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 00:56:02 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: meson: Set the fifo-size of uart_A to 128 bytes
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com, khilman@baylibre.com
References: <20210604170844.2201229-1-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0e3b8d5b-756b-fefe-fbd3-8a786d7344ac@baylibre.com>
Date: Mon, 14 Jun 2021 09:56:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604170844.2201229-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_005608_013261_2A0368D2 
X-CRM114-Status: GOOD (  17.38  )
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

On 04/06/2021 19:08, Martin Blumenstingl wrote:
> The first UART controller in the "Everything-Else" power domain is
> called uart_A. Unlike all other UARTs (which use a 64 byte fifo-size in
> hardware) uart_A has a fifo-size of 128 bytes. This UART controller is
> typically used for Bluetooth HCI.
> The fifo-size of 128 bytes is valid from all SoCs from Meson6 (or
> possibly even earlier) all the way up to the latest 64-bit ones.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index 8bae6ed0abb2..bd0e864964e9 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -50,6 +50,7 @@ uart_A: serial@84c0 {
>  				compatible = "amlogic,meson6-uart", "amlogic,meson-uart";
>  				reg = <0x84c0 0x18>;
>  				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
> +				fifo-size = <128>;
>  				status = "disabled";
>  			};
>  
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
