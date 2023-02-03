Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A782C636D6
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECZmFtZT5UtPLxlF1q8ldikGQhZObvYImDRH1JmTYBc=; b=wCVNhKH2dWXBRT+FjB3ASYijvb
	sWv8FcDxIsQ5HrfUxN3KzRZ5l6MKTYXWS9etj+dBKrULNVspZc72Lvds3oVOk7uzMuOATUGufo7UL
	Al7+F7TIxV2EOQvmiKvlCQDVOI7vTPKyGmWvndCiBQZsAvB3jBqC9gYj4/84r3QT2gExfuNVf5eqJ
	wyTdxg5GhMO6Cc6dSYqBbGVardXjBv6STXjU0fT61E8VV64k7gwnE+TmMxpFhkb/JdK8Lg6hq9auo
	O/Lkgu9OvckoXXOl0XmLZtVLtHM1FWmmHVBS+pzxKcuQqwNQdVCphp2/ig9li8Iz2kO9w23nHVVuS
	veSkxGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr4r-000wCc-52; Fri, 03 Feb 2023 08:05:45 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr4l-000w9R-Uu
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 08:05:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id m14so3848134wrg.13
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 00:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv17eaJFCI/w5Z3xek3QoJZ92Bm1fO3+e35K6LedY2Y=;
        b=jq4WMr89+a3LJs6QVU01tpxjfScM//lo2OEWbtPxzvN2uv2MGVaLwCrfjvRmaMHS1F
         /54JqjyzVFWlhc/0mnNfsNSLHqLOs2EO5bq+VxhiZ8/OgfDwxlRm5JFc5uEAHlbn6CBc
         GuWa+ZJUDbFSKTUBHCnjOmYkk/c/Gpraq6QsD7uBPKXlytiSib5OHMW7jV2X6ROd6Ld4
         YTVgcfUJE2jGT9MtT0PeZ5aiIZOdYkNesNx5Px5e8JiST0ACi1ld5GLuWT7oQm/4qMlX
         V/eOjBw/nKRnlbEYTJExB6+cxZv34u1S+0Bct76h979ZgPWxzpLuZDY/AN12/TjSe3Rs
         KRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv17eaJFCI/w5Z3xek3QoJZ92Bm1fO3+e35K6LedY2Y=;
        b=NYb9f/Q17XJmtAdxPZfPvhLR6LwZwomamo4PzxQjAH2hDrh7iyMjoVeP4P5asKSkBH
         prWDeTyC2OEQ6RoSeqNAOiNAI3orlW5OhjjnT4Pc1B/9LrMvvEYSa1Za3X51adBzk5Ho
         9Yiqe0bZnXPMgA5k0knJFHd6XT0iz/nNfarALcgd/s7GbQWf1itCtxo2YlloepVoQhdk
         CCcVvcqISiRhkQr639Ty1H/u4mxbtNFeWygzikKaMBk/6dpV81U7r5CrTLl4jI3HI+UT
         EkFf6W0LEB1Ej8tFiFvz08H60V9BzNPCzV47zHaz1Us6X8aHPi247rExDIsgddEyx286
         dAEA==
X-Gm-Message-State: AO0yUKWgnaAV1X3DzpqOD9gaY0XR4MgzQOYiTs9Lx+NlvUmR1XCLDdAG
	cktTtwL9X2rGPUbwQsBITZZsTQ==
X-Google-Smtp-Source: AK7set/TiiQhfEWBSxtDxQuC1mikiRX+6Zo9nA6ypZA5geunkb+DGH0j7NUGqgG82UrhrwUXLJb7Nw==
X-Received: by 2002:a5d:4e02:0:b0:2bf:e1f8:c4b6 with SMTP id p2-20020a5d4e02000000b002bfe1f8c4b6mr7969162wrt.52.1675411537589;
        Fri, 03 Feb 2023 00:05:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7407:d8b9:ec7a:537? ([2a01:e0a:982:cbb0:7407:d8b9:ec7a:537])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600002a200b002bfd687a96dsm1467430wry.16.2023.02.03.00.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:05:36 -0800 (PST)
Message-ID: <204f71e1-d98d-9aa7-4848-663e22332c69@linaro.org>
Date: Fri, 3 Feb 2023 09:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] arm: dts: meson: adjust order of some compatibles
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
 <66f77c32-2678-3e31-fb00-1294ccaa6045@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <66f77c32-2678-3e31-fb00-1294ccaa6045@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_000540_099342_9174BBEF 
X-CRM114-Status: GOOD (  14.40  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/02/2023 20:58, Heiner Kallweit wrote:
> During review of a new yaml binding, affecting these dts, it turned out
> that some compatibles aren't ordered as they should be. Order should be
> most specific to least specific.
> 
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   arch/arm/boot/dts/meson8b.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index d5a3fe21e..5979209fe 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -580,8 +580,8 @@ &ethmac {
>   };
>   
>   &gpio_intc {
> -	compatible = "amlogic,meson-gpio-intc",
> -		     "amlogic,meson8b-gpio-intc";
> +	compatible = "amlogic,meson8b-gpio-intc",
> +		     "amlogic,meson-gpio-intc";
>   	status = "okay";
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
