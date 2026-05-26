Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA00CD5BCF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 07:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iq5ryn7F4XY+gO+/PGlQTRU8R74RznP6O/nMjjqcSqM=; b=Vpzrwf7qLrhC2O
	pb3smvFVifrN/y/eQsEP75Q6DLWLt9KRj7ypD4RBN+z/CWzL+AAKeCdqAjaFjB3lgcUaF8kW5neaI
	HalonFBgTBg96+fMXBunDgCel7mX94QSHuEXueciCimfhOAAKw9/o7yGrAMmUjWgH9GzqmTgmxllV
	fb75P4m5pTFFfZZ3TXlvbA6ZaiBWJWlPtlenxRzFlO4z9okulk4RBF9gkAbToGCZKbkdNmTcm6NyW
	rGKVyoGxKKomGX6SuQzlvarCv0myYRqLoGFe5MD0aT0qFmBnskML8ZQ2hd80CgPDNSOybyDtzh6TC
	9pVNQint4OZTDbQ1+TPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmHz-00000001Gtb-1QCk;
	Tue, 26 May 2026 07:33:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmHu-00000001GsC-0wCo
	for linux-amlogic@lists.infradead.org;
	Tue, 26 May 2026 07:33:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49041e84237so31068425e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2026 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779780796; x=1780385596; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WXRNNHPyXQvvYNRb7UDQ2d4k6RO8dKZjGyn0hWbK7M=;
        b=U9XkM6s8pk2Dq0Wc6O/ZKweQwYx5sLHJ5m0QlqOJYv3w2sBe4I3zbgSxb/DnN98A1y
         n6vCd5tShRFP3PF9im2GgRLx5wkVnoFmJ20P3vyd/Oh3zzgQVH0OqKaaSHpGwY6gBnhc
         ikq4mEpjyU7P44jLQsEzdXZRXevLNA0OeI/2yrIeaDg+pNuXvmWpu/NvPGWxFL2d65T4
         MWvk4B9hnKndLmccJn/cCJmJPRrjbUbshpv/UvwHqyb3zBigvjqR0hVdvEqKJpRI9aKs
         fyXI+apculKayNzlff6TnjpAYdNCQI0Qp1ppSygaeSrH8XFNFRYqbGHnKEQFOcy8xThi
         u7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779780796; x=1780385596;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5WXRNNHPyXQvvYNRb7UDQ2d4k6RO8dKZjGyn0hWbK7M=;
        b=IFWw6WCZWFQ42YPAwGK4tldPO4pXTaCMHp8Akwyw3EARm4yMjlztXzVD8wRxFwX6SE
         lRSwDWUyAHVHdqB3z0t03a9StvmRdD2HbISlpuTlhYDf6p3Ltrn3LltqGuziBIGPVAPM
         fXWQHhrPA6rbopMDy/oS+zohj5MeRLZZ6pJYMIZAYmutdQfrNqMzHgBQAvkq35D42jI6
         j7ZQqRioD7yHUcl/8WU6b5BTwqZcoD87Fb6yM5WH7tyiUW9tGyse66HF9aFus/Nh7yDw
         NEBO/+jtxemxet8jBMm3fWUtrwK7S4daI7sqoCeWaWSBYhiY47N7zGGGgTYgkik16eQx
         QhFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RjWJ80RhN1jyGs3h5nryBRFrfWzIzYsXFiQ//EG/e8D9a1cFCKNDUQn24pdP+iIfy7SP3NdvM8JurvmP/@lists.infradead.org
X-Gm-Message-State: AOJu0YwWYewv8oP8gWQb9AhbIKMCOp8PSsYG4xr9nURfPWP9ZystGn6g
	KnptpEzi68BE3AnQwbN8c+aLwIngFbIBVn+FjqGYspdG2P1kyyyPoWe8q7/czrsd8d4=
X-Gm-Gg: Acq92OFoDcJgR+Hax3ELMLrMNRmDkXaEfr84+7mBEPZPUKSwDvuuOGnRC16moi3dOpE
	EOCBdyGwFkd5ULsLPvgIjDcLo2i6YhcfApnK3HLN/zZC1TEQmCml2zkAeBcNFVFU8QV8RCoc/9s
	+gwWpWimPsMaIXDBdXmUKjnGkHShE7twtBG8J9vlTLcW+1kAbF+EmgyBqyvQJAdyB3HQu0XItqf
	byhX9Sd99VkhfsLIqW7gRX0/o9mXrj0xQRNDUjH5YOGeoZpCBSrCrsmsLZ+rE8vSJNe5tOzuUo2
	iOsNo4Fy0W+F54ujIqbvnVyJq3Y/xyH6J9GHv7Nvpt2Q2wSsJxkaZ5BHw/OJNda5InbQZHo78IV
	Uj9eI+zBKIUjOhn2S4zFV1VGAMTtNcLqQG6G5yj+O03XpI7b6KlhH5BeiYCqw3j7B5Q9VfYUmzH
	+nb3+7LJgL+cU1qwQsRIjqjQ==
X-Received: by 2002:a05:600c:8599:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490426ade02mr179110335e9.15.1779780796190;
        Tue, 26 May 2026 00:33:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4a0c:b15a:3467:f4ed])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490454ea134sm338481635e9.8.2026.05.26.00.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:33:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/10] Add support for A9 family clock controller
In-Reply-To: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:22 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 26 May 2026 09:33:14 +0200
Message-ID: <1jldd662x1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_003318_286229_5FEAF56F 
X-CRM114-Status: GOOD (  19.31  )
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

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> There are 4 clock controllers in A9 SoC:
> - SCMI clock controller: these clocks are managed by the
>   Trusted Firmware-A(TF-A) and handled through SCMI.
> - PLL clock controller.
> - peripheral clock controller.
> - AO clock controller.
>
> There are reserved register regions placed between individual PLLs, so a
> separate driver is implemented for each PLL, similar to T7.
>
> Compared to previous SoCs PLLs, the A9 PLL controller introduces 4 new features:
> 1.PLL l_detect signal supports active-high configuration.
>   Previous A7 and T7 l_detect signals are active-low.
> 2.PLL reset signal supports active-low configuration.
>   Previous reset signals are active-high.
> 3.Support POWER_OF_TWO for the PLL pre-divider N;
>   the N pre-divider follows the same calculation rule as OD.
> 4.The PLL input path includes an inherent divide-by-2 divider.
>
> Implement the first three features in clk-pll.c (verified on A9 and T7),
> with no impact to PLL logic on existing SoCs. Add a fixed divide-by-2 to
> A9 PLL driver for the fourth feature.
>  
> A9 PLL is composed as follows:
>  
>                        PLL
>           +---------------------------------+
>           |                                 |
>           |             +--+                |
>    in/2 >>---[ /2^N ]-->|  |      +-----+   |
>           |             |  |------| DCO |----->> out
>           |  +--------->|  |      +--v--+   |
>           |  |          +--+         |      |
>           |  |                       |      |
>           |  +--[ *(M + (F/Fmax) ]<--+      |
>           |                                 |
>           +---------------------------------+
>  
>   out = in / 2  * (m + frac / frac_max) / 2^n
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
> Jian Hu (10):
>       dt-bindings: clock: Add Amlogic A9 SCMI clock controller
>       dt-bindings: clock: Add Amlogic A9 PLL clock controller
>       dt-bindings: clock: Add Amlogic A9 peripherals clock controller
>       dt-bindings: clock: Add Amlogic A9 AO clock controller
>       clk: amlogic: PLL l_detect signal supports active-high configuration
>       clk: amlogic: PLL reset signal supports active-low configuration
>       clk: amlogic: Support POWER_OF_TWO for PLL pre-divider
>       clk: amlogic: Add A9 PLL clock controller driver
>       clk: amlogic: Add A9 peripherals clock controller driver
>       clk: amlogic: Add A9 AO clock controller driver
>
>  .../bindings/clock/amlogic,a9-aoclkc.yaml          |   76 +
>  .../clock/amlogic,a9-peripherals-clkc.yaml         |  150 ++
>  .../bindings/clock/amlogic,a9-pll-clkc.yaml        |  110 +
>  drivers/clk/meson/Kconfig                          |   28 +
>  drivers/clk/meson/Makefile                         |    2 +
>  drivers/clk/meson/a9-aoclk.c                       |  494 +++++
>  drivers/clk/meson/a9-peripherals.c                 | 2317 ++++++++++++++++++++
>  drivers/clk/meson/a9-pll.c                         |  831 +++++++
>  drivers/clk/meson/clk-pll.c                        |   79 +-
>  drivers/clk/meson/clk-pll.h                        |    6 +
>  include/dt-bindings/clock/amlogic,a9-aoclkc.h      |   76 +
>  .../clock/amlogic,a9-peripherals-clkc.h            |  352 +++
>  include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |   55 +
>  include/dt-bindings/clock/amlogic,a9-scmi-clkc.h   |   51 +
>  14 files changed, 4609 insertions(+), 18 deletions(-)

For the next version, please split things up.
There is no hard dependency between the different controllers. This will
ease the review.

The PLL controllers are bringing a new contraints in. The global/static
nature of the controllers is something that has been bothering me for a
while but there was no real reason to address it so far. Please give me
some time to think about. Feel free to re-post the other controllers in the
meantime. 

> ---
> base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
> change-id: 20260511-b4-a9_clk-67652c1ae56e
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
