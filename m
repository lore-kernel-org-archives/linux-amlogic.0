Return-Path: <SRS0=SZaW=RR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B0DC43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 18:09:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880ED2186A
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 18:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C411h0P6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Jcw1JdHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880ED2186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sl2vdR3WiCCJaPHM/xgM5ka6KrBRPjJUWA4Oj9ogBk=; b=C411h0P6DCJvLZ
	l/mhg8kxcSxhJSbpGY4YRDLZfs1V2+ZYSbyC/mr4q1xlxpNg6E+xmjbMX7NxgVFJqh+Lcbo4Nz57C
	GGYim+YVtxyScHQn/+TpFi0g8Rjav62Cc3bjlCp8WDYGbtpJGf6YFkZpSkUAa6FFAfWYovvcp9M/y
	ee7bA3qQOE8yZz5qVeQeSUs1rRvX1ncmO73f9yDRZQBIHMCqfnE5qV9x57h4jfKvZwtcS333FcAu3
	sqz+j86V9H6i5Gw8I8xYjbr198UWKtT7Vl/L8ubcG7CI/q4kYoo9KWuVlKSyG2Vxb1rneNCo3l8Vq
	G6xIwThT9/PDNdCxXyUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4Umm-0003cv-Aa; Thu, 14 Mar 2019 18:08:56 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4Umj-0003ca-41
 for linux-amlogic@lists.infradead.org; Thu, 14 Mar 2019 18:08:54 +0000
Received: by mail-pg1-x543.google.com with SMTP id a22so4493790pgg.13
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Mar 2019 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=U7BBK7vlWP/t8lFMd6v5xn5vdx3A6D9GtU1E9MvUOTA=;
 b=Jcw1JdHo6y4yboLPPnhZh47MtMHiT4Fqwj+FE9MGFoOdY887/gZsoUJI3jtA1fNT/8
 qK20DTQLIeqbgiOJzICXJ+IdyOH2LcDqEQKGKE8XAqLVaIIUbfLCBJGAyOs5l/nHYfvA
 qS7O4X/OFWIJJNmmcEeBcVdUFultNgaYcUoGWMD3iun3BxrM4/6/zWWLOeNUonJJ9c8K
 NNwotLKLTIHCaAC/2MbnWyhajFq3LH8R9nxvnfu6fkjuZ2HHiwXSxhCI2X0qTjmGK1Fm
 2KJShQEKsuwTdfCs92gc4YdzQ9tF1BmgYukP4LCz+2giV58bchmqPlmPdhmx6Q4BDvP7
 1xKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=U7BBK7vlWP/t8lFMd6v5xn5vdx3A6D9GtU1E9MvUOTA=;
 b=tx28eM3RV5IUT1TnzdyMtLsOqORimJ6eVaHs3NJ5/qMzcinOt0M43k8ne8QzxmsVsJ
 f+x83qSovWVbk4g6/myXe+4yUrvSjGX/OXJyo2LAhDg432eZatpkrLvGR5duqcr3msoD
 L7hH66So0JtDZtxewoEVdhHsTv95xyEuNphJp5h0RNoOYhHSnXn0v98swW1QdCIrHcnv
 e0LTdEdm+ckTh5iBoKiDv7hxxcwKZ0Zm32L41kEJEUsVcUjyN006qZHMskZIhMuzQbzC
 VFxIrpl3kAnWYTUsPq6/fc/pUYM2h7FP8IgDvKDTZMGsH3J0ydWPa1bF3gdcXsh/M5uY
 2vCA==
X-Gm-Message-State: APjAAAWtO01nXRkNBXHev4LdH9uLQac67uHzaNC/H8ef+6fI2agd0UOU
 GgAWisO8gWuqOETZQaIyHYdybA==
X-Google-Smtp-Source: APXvYqybvV6viQ3TJykIomrDJ8ksvexT9T3eKWTz4aia1ppNeY2NwqascFJHl9mQTXcQTRK3yxhfDQ==
X-Received: by 2002:a17:902:681:: with SMTP id
 1mr52755468plh.185.1552586931867; 
 Thu, 14 Mar 2019 11:08:51 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:a567:ae30:4f79:6ce5])
 by smtp.googlemail.com with ESMTPSA id p2sm32348009pfi.95.2019.03.14.11.08.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 Mar 2019 11:08:50 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Chuanhong Guo <gch981213@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-gxl-s905d-phicomm-n1: add status LED
In-Reply-To: <5c580f1b-1038-2c34-7047-e504eb4ac323@baylibre.com>
References: <20190312083326.18029-1-gch981213@gmail.com>
 <5c580f1b-1038-2c34-7047-e504eb4ac323@baylibre.com>
Date: Thu, 14 Mar 2019 11:08:50 -0700
Message-ID: <7hva0lwcp9.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_110853_210926_31E236AE 
X-CRM114-Status: GOOD (  11.22  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-amlogic@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi Chuanhong,
>
> On 12/03/2019 09:33, Chuanhong Guo wrote:
>> There is a white LED on the front panel behind the logo and the
>> manufacturer uses that LED to indicate network and USB drive status.
>> 
>> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
>> ---
>>  .../boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts    | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
>> index 9a8a8a7e4b53..b5667f1fb2c8 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
>> @@ -14,6 +14,16 @@
>>  	cvbs-connector {
>>  		status = "disabled";
>>  	};
>> +
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		status {
>> +			label = "n1:white:status";
>> +			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
>> +			default-state = "on";
>> +		};
>> +	};
>>  };
>>  
>>  &cvbs_vdac_port {
>> 
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.2 with Neil's tag (branch: v5.2/dt64)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
