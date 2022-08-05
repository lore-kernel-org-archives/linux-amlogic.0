Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6602C25B07
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 08:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRu9hIEcOsSB10XCMiIkzIx9PN/b1R8VVv1E9SXWNyA=; b=Is7gEuHpiXxMnT
	knzCDxBbokz9qQXdf7LJyy1jsmKDooaVrFoJTipm4REfqyVZt8HV4HHHDVxo3zICYrylEEo4fyDCT
	a0iRTPunyAV+ZwXlbAcy8xQFYmENXSWTBwVm9GsOMQulaqUbARYq+oKk3dUvddc9a6TwISg4cvtvu
	a7FAmdvSnksbr/ZyYRjc44c+r5aArdA7uzMf4s6hSX7QkvBumHiihFupp7l5oN0WKGxU1DhcG08bF
	Krzm21wFebpIAYtOZU5bn5QIBsjv8kzCx9Xr836e0DnS0PR5Mv5P7fCskiw53ZWF9TjiKiYG3/p2a
	360HSCxTm+enkW06YhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJsPs-00D5ap-WA; Fri, 05 Aug 2022 08:10:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJsPg-00D5Xe-LE
	for linux-amlogic@lists.infradead.org; Fri, 05 Aug 2022 08:10:35 +0000
Received: by mail-wr1-x42d.google.com with SMTP id z16so2318286wrh.12
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Aug 2022 01:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc;
        bh=mIzmvdk7HOX9VETFYuqPj2UDBU0QS3AoESbRivQAHl8=;
        b=gcnZiSxD9R67ltN8OoA+C/zdBHeNV2JGZ5D4MFVRoggMTlWEXjC8QXvSX8eg1vcuRz
         Caj/+1bNiL5CnkIl7SBWYCr9W/qDpwY+nBgLfAYbsJq0Nxg1lVo2ClSi0+pA4tYGJGh9
         p0OvePOWRB+0GgRHpIecPgrhx8j3Hvr0eHVrYe0dqDG6HPsQWNcvbcMwX5vuGuGcdiib
         7fjEQr4gJSctW5r/8bXGXFZteM8+MRO07f9TbHyHjymC4i6/pGVyFjf4t+7UpPPwYbu6
         hk46+qZTaKh8A6Z/QRFCFgQxdgVoVxUN4GnJLrtji0mBS+4ezKV3qsSJs93wf8Wi1ns9
         W/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc;
        bh=mIzmvdk7HOX9VETFYuqPj2UDBU0QS3AoESbRivQAHl8=;
        b=pJfHxTjmPb4CxK6AZXbRb+bA3I2t7zTOLywjrB4kYA9uip1Vj+2SLXiznjmxh6d8RP
         EKF40WmMuSNXZhBOdp+aT2gA2CVEJNgdjrCe4WJnuf7ugqVf4FJ9QHNYtiwBsX8M39j8
         YKqAyELF6cyEPeGvYM5e+CeO+dvpbbzQXcnc/c2zjW5N9T9njczZQhvQvFQbal4lqDD2
         OaFJibbkLoRYi+0otT5RCGf4Lte2quz3F4wNap20R26tFJU72+VndwCofrE58bs3DpfZ
         gi1R7vHk/GsMqJ9IFX5QjR3f3hvlGQikuptIF7mV+qGcXyEFJAzWP9k7DnNgJpcQpdez
         9KrQ==
X-Gm-Message-State: ACgBeo0K5/lHQwP0bidVN0Ly1OqrYkts1SFsCSDSArFQ2LqXwFR6bRJW
	xVzNgVFSwYSgAQBhMIrTNqzMJA==
X-Google-Smtp-Source: AA6agR7qv51ZP9RGn/h1aDDrkZoeyDiQrc41IP88SLryVi0tdHoioq6EljJsFm41m24QUrNDBazkzA==
X-Received: by 2002:a5d:5403:0:b0:21e:ea93:234d with SMTP id g3-20020a5d5403000000b0021eea93234dmr3409730wrv.125.1659687029497;
        Fri, 05 Aug 2022 01:10:29 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o5-20020a056000010500b0021f0af83142sm3134358wrx.91.2022.08.05.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 01:10:28 -0700 (PDT)
References: <20220804165317.29086-1-ddrokosov@sberdevices.ru>
User-agent: mu4e 1.8.7; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <DDRokosov@sberdevices.ru>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "narmstrong@baylibre.com"
 <narmstrong@baylibre.com>, "khilman@baylibre.com" <khilman@baylibre.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel
 <kernel@sberdevices.ru>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: meson-axg: reserve memory region for
 Amlogic TrustOS
Date: Fri, 05 Aug 2022 10:03:34 +0200
In-reply-to: <20220804165317.29086-1-ddrokosov@sberdevices.ru>
Message-ID: <1jfsibqfez.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_011032_928799_027AF35D 
X-CRM114-Status: GOOD (  17.74  )
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


On Thu 04 Aug 2022 at 16:52, Dmitry Rokosov <DDRokosov@sberdevices.ru> wrote:

> For the all AXG SoC based boards, which run Amlogic vendor ATF and
> TrustOS this memory region 0x5300000-0x6300000 is reserved by BL32,
> so tag it as no-map in the kernel iomem.

This may be true for the boards you have seen so far but not all ship
with this specific AML TEE. Some don't have TEE at all, other may have
different TEE regions.

16 MB may be a significant part of the available memory on some AXG
devices. Reserving that memory on all AXG devices, regardless of what is
actually running does not seem appropriate.

I know the same has been done for other devices but I don't think we should
continue to do so. This should be set either
* per device if it is fixed
* dynamically by the bootloader depending on the ATF (which is probably better)

>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 3f5254eeb47b..1fa0d3805969 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -142,6 +142,12 @@ secmon_reserved: secmon@5000000 {
>  			reg = <0x0 0x05000000 0x0 0x300000>;
>  			no-map;
>  		};
> +
> +		/* 16 MiB reserved for Amlogic Trust OS (BL32) */
> +		secos_reserved: secos@5300000 {
> +			reg = <0x0 0x05300000 0x0 0x1000000>;
> +			no-map;
> +		};
>  	};
>  
>  	scpi {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
