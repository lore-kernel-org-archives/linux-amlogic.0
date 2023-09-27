Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A6AE810B1
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMaPV3P5FbwsrE+r2mwXuocKV9MLOQVd4q5ZDooHiTo=; b=zxVePgHyzzHxWT
	UyDCjqz8FfMa38r7WbPIdiR4h05/fbOBs6rKd5GwSCKGDqnCgAS4VHn/dCBs6ZccHM5STo2jwbFoa
	gwk+eypJubHjEeGlJfAROPrbhvvPvi70AEYDEE8iH+ja/WXGl1otztUDMMbbLIwWOWDRFgcE/+V3D
	F9q0DVWxya3GiYIPJ5AgncVRIZN1u0x/PH6z6NOsWg+2YkKh3jD+lwk/qToe8q3jHPDUhRflx1eX+
	ocxJNTp/76naTGLc12StOvFluIEro4A9ZfkthTrqw3SoCpsU8yU09cIsFAXHgrdeKm/bRrICOZ+qw
	eeMqY8p7b32CkcHDjB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQcS-000S0W-2u;
	Wed, 27 Sep 2023 09:14:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQcO-000Rza-0j
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Sep 2023 09:14:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4063e3ce085so25042655e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Sep 2023 02:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695806042; x=1696410842; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=RsG+xQ5K7+BJbzhMgY+2l7hI3HJGu/U8Llgo7kKe+d0=;
        b=MPhmti/gY/2jRNjSgG4XhXFvDSJQofAZ2O1hw4DcOKBQDGFqhaosZ7eD1H34qhnpgb
         +ZlzaTOpcS5ppJ9SGSCogCAZCodUIdDbUUpcGMqcukUxFgnQoBhPkM2kU3mSGuVIl00T
         JKRpizI7vFwmCfc7pWtRUNNRUmFpArf0SxMUyacL0iR+7yxHZKmwWQ/4Ojwsywne4xHd
         7HtSL7hjALNjkFytXmTONM221Vk1MIDPkVhMUdCpwp29FvaEkgSrn5Jo2vLrXnV9fqzW
         YLAl/7awestI+J2CRu5rBMJIYCqkoDUWBJzaWaqve8uBVBQcLfLQJhaVldG9yoP6aNCD
         mPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695806042; x=1696410842;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsG+xQ5K7+BJbzhMgY+2l7hI3HJGu/U8Llgo7kKe+d0=;
        b=v0mpnLR8iM+6oNu86YXqCZMI7nSmRba3tIXKlaHHCZ+1oTwhQj7MD7xUw+5Pw07F9X
         5V/PTWRjUZDeBXnHKQBRpgkBQQUfB2djVPckZZ8rGDHf3GgE0eGAM7Iau9aWgOZWZGbs
         TIQtucIkEyD7mzyr6iLrCYuCwlax7idHMLp0HTbSi9pLSsXjDZqPbTPQh0NMN4n4dc8O
         wfAM6kWEIUYJpK2LsZ2KO0IUFP/PDfUyybw355cdKWEAuWKO2bCTJERmejRU0/1XCB4p
         Vur/2rSWndBs9noVLhVHhr89Y7MY/pn6wJGjNFUMMH8Sqh0JFLMJ35OGr1+wC2lq4yUw
         0HpA==
X-Gm-Message-State: AOJu0YyB9fdSOwwbXETma9vokBbTE42dsuhJXxOcX0FPmooZ8QKQiOXV
	MIAkdfEmitq1mubCTtKErlZbjQ==
X-Google-Smtp-Source: AGHT+IE/QudZMKsR1NKWpqHhMWhm3ezMdiqFVqImn30dFuRULpbJwjQjX4JFMweOsN/FbuuxDCxHsg==
X-Received: by 2002:adf:e9c1:0:b0:31f:fa61:961b with SMTP id l1-20020adfe9c1000000b0031ffa61961bmr1201054wrn.66.1695806041834;
        Wed, 27 Sep 2023 02:14:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:99be:56aa:a730:ad2d])
        by smtp.gmail.com with ESMTPSA id c17-20020adfe751000000b00317909f9985sm16482378wrn.113.2023.09.27.02.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:14:01 -0700 (PDT)
References: <20230904075504.23263-1-yu.tu@amlogic.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen  Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof  Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin  Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
Subject: Re: [PATCH V11 0/4] Add S4 SoC PLLs and Peripheral clock
Date: Wed, 27 Sep 2023 11:13:32 +0200
In-reply-to: <20230904075504.23263-1-yu.tu@amlogic.com>
Message-ID: <1jmsx8kmg7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_021404_264257_CF5257D3 
X-CRM114-Status: GOOD (  11.57  )
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


On Mon 04 Sep 2023 at 15:55, Yu Tu <yu.tu@amlogic.com> wrote:

> 1. Add S4 SoC PLLs and Peripheral clock controller dt-bindings.
> 2. Add PLLs and Peripheral clock controller driver for S4 SOC.
>
> Yu Tu (4):
>   dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
>   dt-bindings: clock: document Amlogic S4 SoC peripherals clock
>     controller
>   clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
>   clk: meson: S4: add support for Amlogic S4 SoC peripheral clock
>     controller
>
> V10 -> V11:
> 1. Change patch 0001/0002 dt-bindings tag. Suggested by Krzysztof.
> 2. Change patch 0002 dt-bindings added minItems. Suggested by Jerome.
> 3. Change patch 0004 added clock ".flags = 0" and comment. Suggested by Jerome.
>
> V9 -> V10:
> 1. Change the relevant S4 CLK patch based on Neil's recently modified
> patch.
> 2. Change patch 0003/0004 clocks comment, format and clock flags suggested
> by Jerome.
>
> V8 -> V9: Add patch 0001/0002 dt-bindings tag. Suggested by Krzysztof.
> V7 -> V8:
> 1. Change patch 0001/0002 dt-bindings title description, remove "meson".
> Suggested by Dmitry, Neil.
> 2. Change patch 0003/0004 clocks comment, format and clock flags suggested by
> Dmitry, Neil, Jerome.
>
> V6 -> V7: Change send patch series as well change format and clock flags
> suggested by Jerome. Change dt-bindings suggested by Krzysztof.
> V5 -> V6: Change send patch series, as well change format and clock flags.
> V4 -> V5: change format and clock flags and adjust the patch series
> as suggested by Jerome.
> V3 -> V4: change format and clock flags.
> V2 -> V3: Use two clock controller.
> V1 -> V2: Change format as discussed in the email.
>
> Link:https://lore.kernel.org/linux-amlogic/20230822082750.27633-1-yu.tu@amlogic.com/
>
>  .../clock/amlogic,s4-peripherals-clkc.yaml    |   96 +
>  .../bindings/clock/amlogic,s4-pll-clkc.yaml   |   49 +
>  drivers/clk/meson/Kconfig                     |   23 +
>  drivers/clk/meson/Makefile                    |    2 +
>  drivers/clk/meson/s4-peripherals.c            | 3813 +++++++++++++++++
>  drivers/clk/meson/s4-peripherals.h            |   57 +
>  drivers/clk/meson/s4-pll.c                    |  867 ++++
>  drivers/clk/meson/s4-pll.h                    |   38 +
>  .../clock/amlogic,s4-peripherals-clkc.h       |  236 +
>  .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |   43 +
>  10 files changed, 5224 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>  create mode 100644 drivers/clk/meson/s4-peripherals.c
>  create mode 100644 drivers/clk/meson/s4-peripherals.h
>  create mode 100644 drivers/clk/meson/s4-pll.c
>  create mode 100644 drivers/clk/meson/s4-pll.h
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>
>
> base-commit: 41680df0975e04b959a28bf6ab85fd6a307ae0ea

Applied.
Thx.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
