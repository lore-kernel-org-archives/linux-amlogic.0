Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54711C64ED6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QrtQu8646Hc6YOSc8/NWsYfZLGE+lV7Uq4hPpDQVpY=; b=e6cQTklx9aWMe93n0rmPxoqyzs
	Q7iVJQolM7XD2eDJ2nSf+yT34TDzAP2qPs1rjqlKXq9h9OxV4S0fbYyLh4O0kOttEx5WJtiNQ1Dnd
	lxluwMor5IgBup18gLpJKWhPHOArmttztIOEDTo0jZ/jLppGjL2V4w00TTxcLHo+rSiX2Hq8imFTH
	WAzRygHopnhIPL67ZiLhD8ncl84q1TMRIzSb+huA/BIKdmm1hoF+rt0cN3jAXYOXvFGgpZqTZBkAu
	l635gNOiuSs+/MPDSDBSbNQTo+LCW9/j6xzr6+K6LmLNMt/dVdYbi15XTGncRKGb+lh5A34vTKFxI
	dqjb1FiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYfA-008lB7-OV; Mon, 27 Feb 2023 08:15:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYf6-008l97-7z
	for linux-amlogic@lists.infradead.org; Mon, 27 Feb 2023 08:15:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso3022506wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Feb 2023 00:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ykQL+wemGByro2MkMCepozrEmOoZvr3Fpiqikx6KNvU=;
        b=XTuhesiLkfEkA+SGb398z9A6gEpdRaVwniIjjcWh/5zzOW2M8KIcI39ELkW0U7D98s
         KW8TofHUTUc76kbKnH7EJK0+qnMQmAF39k2TNmxXnwHYKCowEMvUjcuP8WNuf7mvpQyp
         /FOvD3kEsBNG7uj95+QCLm0ma5Lb5b/4V/O9/QPZWOsyhHOTF32DsCTCTMj7OOysy1l/
         t47MJWtPfOpNCZD5B7eA4kkMF76HlQHuKd30bue+N3stNmEPKkMlxGkg1DCboa/Jb7UE
         n0k1bEjiHz4+QhJEaWArE/pEZzI+PghfZf/wxlkUWimZgHSOM0cTpydArzEA7FyF7sK1
         puWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykQL+wemGByro2MkMCepozrEmOoZvr3Fpiqikx6KNvU=;
        b=D7sBTRQWv/ARSOiIE8MaJujj17viac6P19wWVmO/CB2ooCtxRZsYv/+gKI717ty2fE
         hQBw8VFJ4ks8zYo22RV6YI73rSIhl1DOuKRznJt4BWNCbzgXqDq2tEUEX8XhoDlt+trc
         4r9J4wGiV+IG4W/3CZc6CGZ2lzhO+Cg2KtGZyDoXkPHk9zs9R+CU3Z/wN+NJ+guGQNfJ
         CukpfQjnWVdkfQ3Zv/0t7/F4e2gfnTLpVA87Aty0TrPvp/ZfvPLj291GD0kavKsqqZwh
         n+aRKR3QSNqV/LDzK/trTqGWC4t2mYaBY817NVUe5e9NjmUyprHOSgxc2xoDNVBUVldn
         Tf9w==
X-Gm-Message-State: AO0yUKWxb3v9ZG9UrXNHpyKVnnXt7I32jR3ZmgP3cJLzM9OAtlzRfWph
	653UcjGsFKCqivzV3rwqjLyXYw==
X-Google-Smtp-Source: AK7set8ZGX2NnlEpE1CBg+Kmv2R0/WA3VAJQafJbNbYhmP4TslhboAqFxsukDkCv3SNGGwsiGWcIAw==
X-Received: by 2002:a05:600c:4d21:b0:3ea:e4bb:340c with SMTP id u33-20020a05600c4d2100b003eae4bb340cmr11811958wmp.18.1677485706224;
        Mon, 27 Feb 2023 00:15:06 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4b10000000b002c56013c07fsm6310120wrq.109.2023.02.27.00.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:15:05 -0800 (PST)
Message-ID: <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
Date: Mon, 27 Feb 2023 09:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
To: Alexey Romanov <avromanov@sberdevices.ru>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230222115020.55867-1-avromanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_001508_327997_3217E539 
X-CRM114-Status: GOOD (  14.26  )
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

On 22/02/2023 12:50, Alexey Romanov wrote:
> Hello!
> 
> This patchset adds support for 32-bit Meson A1 board.

Hi Alexev,

I'm aware Amlogic also runs their kernel as 32bit to gain a few kbytes
of memory, but those processors are ARMv8 and the arm64 arch code
has been designed for those CPUs.

So far I didn't find a single good reason to add 32bit support for
ARMv8 Amlogic based SoCs, if you have a solid reason please share.

And as Krzysztof stated, the support is incomplete and cannot work
without a dts file.

Neil

> We describe device tree with following components:
> CPU, GIC, IRQ, Timer, UART, PIN controller.
> It's capable of booting up into the serial console.
> 
> We have tested this DTS and used drivers at our
> 32-bit Meson A1 board and it works correctly.
> 
> Alexey Romanov (3):
>    meson: pinctrl: use CONFIG_PINCTRL_A1 with CONFIG_ARM
>    firmware: meson: use CONFIG_MESON_SM with CONFIG_ARM
>    arch/arm: dts: introduce meson-a1 device tree
> 
>   arch/arm/boot/dts/meson-a1.dtsi | 151 ++++++++++++++++++++++++++++++++
>   drivers/firmware/meson/Kconfig  |   2 +-
>   drivers/pinctrl/meson/Kconfig   |   2 +-
>   3 files changed, 153 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm/boot/dts/meson-a1.dtsi
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
