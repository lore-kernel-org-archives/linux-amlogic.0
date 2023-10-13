Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547DFCDB47E
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Oct 2023 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1TWLXOdOsmNZNoYS/wL1RApPdeQ4V7fGuvXfwOKNSg=; b=TVsCq3t4kHXla9
	JrmuN4LIRuzayMxZgLlou7MQcp+YI4mrgqQ2mRQsxrCnWylJftSf8UQ4hSTcyjmFg64HBpvhxJpUH
	jWH3L+p2WvoNq70DPfCWHJ5Y0MkTqWDh1Jc2DhlUbOykS6z39/XwM6UI2+bcZrcMQkA2PQzV2W8FN
	LuMMVCB7tTdwYwo8hwfdaGVk5wY09bGw1Bha5yCPnH1NTKVad8H7/r1GZM6Q6i9RUPktqXVGsMzsn
	gUDWi8uU6znpUOiop0PXIGB3WICgTDdMiAYbrIX1r9gnEU0AQHkWpU7sIJcH+IKSn9gOv9kGgw8k/
	d9jdUj5HluUPekTIYWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCsT-002k0S-25;
	Fri, 13 Oct 2023 07:46:33 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCsQ-002jyl-2B
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Oct 2023 07:46:32 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50573e85ee0so2285365e87.3
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Oct 2023 00:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697183187; x=1697787987; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=wP8hZWh4qXyybXYLkSLcCZu/0fSSL+752WobzxTNboE=;
        b=tdPOCOAbIuJ5h8dF7M1MOsA9WjUx+vSBBAPD0WlANs3S+k9wzRvVTVmH8pYbCiMauQ
         9DAzCi+Dmv3E26hzqLphaMUHZj5Oo6iyy7F6r0H+NAq5rYV+zLk41+slFCcJB0SJefJj
         YPT3O9A2xpVwiVmIe8sVf7aIAe3pqUPFE+yZCG4o4OW7Q1bbI1snx7Yfmm29YNXgq9uA
         lERaCudr89XwNHkoyXRPvwZFjE4pCgAQpo6w03nGVyeUKk6doG8Eu7LRu0l8C7TMV7Yz
         7hvaITGPnl+Ev5LhRsqsfd2uKlOZJ8VBCCHgG7reAN4/oIyJoEKGXLn3a0r01f59CzTL
         3DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697183187; x=1697787987;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wP8hZWh4qXyybXYLkSLcCZu/0fSSL+752WobzxTNboE=;
        b=FXVeOHaTgd11dEOhER3MAfURtiaO3WljP/3tv8xKkcjndi1f8YNjnloEAsWK5e5zNW
         KgV/ro60kDi1RDhjhjv1iEO0XL3VGAiLJ4DbVQ89YBfL1N0LQEckm98myICNgFAR/GUb
         BL0nlBmo11COhWoiqSpN4m9Gfp6MA7vOiaOu4tC3bzNHOBhwnudThIkYPNyv5e/mxogr
         JWLla/ysVhQG3mxUkN1RWZ2qh8EMge5MNWReeOU7d2VXl3Iz6RbCyC+SJC+OseZ2VPjD
         UxOX94h9Sb6z0S/yGKLKCQ7KJbv/HPz2PIqSwiYobgkz6w3O+iZZF5+ztCHPkcw3aV42
         FL2g==
X-Gm-Message-State: AOJu0YwKF/GHEsf8Z6HzqdgDLi+QfCpjv327VTXs95rc0486J5jEZ0DK
	aNaVBky58jNksjp/cUeXFjK/zQ==
X-Google-Smtp-Source: AGHT+IEkyEN8zAQ5/dhZe4B9ajTP0EDEK/rSt7LjwGLHX2RHEZPT+iFlTiLC7YassaX2zhaMHUp92A==
X-Received: by 2002:a19:5f04:0:b0:4fb:94c6:fd63 with SMTP id t4-20020a195f04000000b004fb94c6fd63mr16394959lfb.17.1697183186650;
        Fri, 13 Oct 2023 00:46:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b50c:c5d5:8b1b:e06d])
        by smtp.gmail.com with ESMTPSA id r6-20020a5d4946000000b0032da022855fsm252248wrs.111.2023.10.13.00.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:46:26 -0700 (PDT)
References: <20231010062917.3624223-1-xianwei.zhao@amlogic.com>
 <20231010062917.3624223-5-xianwei.zhao@amlogic.com>
 <5e0bd4bba88701dd1a7a3e89d18412f0.sboyd@kernel.org>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH V2 4/4] clk: meson: c3: add c3 clock peripherals
 controller driver
Date: Fri, 13 Oct 2023 09:38:14 +0200
In-reply-to: <5e0bd4bba88701dd1a7a3e89d18412f0.sboyd@kernel.org>
Message-ID: <1jmswnvub2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_004630_714444_EDE5CC2C 
X-CRM114-Status: GOOD (  11.91  )
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


On Thu 12 Oct 2023 at 16:51, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Xianwei Zhao (2023-10-09 23:29:17)
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 76be4bbd2afb..c8d59d28c8ff 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -140,6 +140,19 @@ config COMMON_CLK_C3_PLL
>>           Say Y if you want the board to work, because PLLs are the parent of most
>>           peripherals.
>>  
>> +config COMMON_CLK_C3_PERIPHERALS
>> +       tristate "Amlogic C3 peripherals clock controller"
>> +       default y
>
> Why are these default y? They should depend on something like ARM64 and
> even then I don't see why we want to enable them by default if we're
> building the ARM64 kernel.

Should indeed depend on ARM64.

Those are the main clock controllers. Like for other AML SoC families,
they are necessary to boot the device which is why they use 'default y'

Is it a problem ?

The whole meson directory depends on ARCH_MESON, so the drivers will go
away if Amlogic support is removed on ARM64.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
