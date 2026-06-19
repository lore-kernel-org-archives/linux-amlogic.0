Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D37BCD4F26
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jun 2026 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHcmH/bwP9xHJxJRh1rqNXzf/NMVfPLQ49+2Vr9Cp9g=; b=O8T6QifjsLdXmd
	ERPuvO7BzCpM13ZYln3EB0YEXztqdhUfpZq1pznuVh60e2XwXWWP4kB8MsyyMltwjbLxgLnvqJBc5
	cduVjY2SgSV+AuU/zuFmHx+dTH7b1K/niVM+t+vfx64GkX5c7GngNY4wl1gIS08X8mzkxcuERNSUv
	MvMZbiICWzWimSKunxlkZHRKeOdf1l0Kze2/FrRqrQDSnEAe2hDIqRE9mDYo9VcPYtqmh67a79+un
	jDVapm4l9Pekso74rN/eqKry4JupiJXlK1qGeiNLxoOrzxivf19lJSv7MJKLkmLVZWpjnJoPETw6W
	xEs+TcKLufBu1eAtMaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTpy-000000027KO-2y72;
	Fri, 19 Jun 2026 07:40:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTpr-000000027Ia-2dof
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jun 2026 07:40:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so21703275e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jun 2026 00:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781854818; x=1782459618; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4qbPpfXKjwWf+Dt6pjhae0Fsogba7Qsk/94yaXvhXg=;
        b=g7+hK+DVpMabaZwo/NnHqq7PfeuMfpOhkcZ4M+Yqvswg3Mu/dHWmX3nDImd9+FkCLY
         /TdEdOsMb5od59fhzMypg2GvOLKNAjNQ5rlb9kSopd3U+vgzjK9y714vqgavM/dbvYpO
         SKrlz6gD6t07ABsjHsk5c8HkqRrKzqIx72RTo5/z72Bp3OKIoyYoGQ4jyCgnoGBvj0a9
         vE4clcFLMf7A5zKETmm56QsCOmtPa0JpTT2jbXl+jW4wiEfHXnkQw4/DLCY4u/ht76Y3
         sJMYG2NbvwkQbZpFmq8AXEL3gnUgKXl9E6a7vr+XakC3fzqER3Nggjtdv7AaRPEPHWjc
         L0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854818; x=1782459618;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q4qbPpfXKjwWf+Dt6pjhae0Fsogba7Qsk/94yaXvhXg=;
        b=AheWsZiGYmW4Nxjab1s47FJjLqGXkaqogGwEDPsyLoKa7fRkUWIyLr2QufzNIYSDON
         pxpTfY/uOWx6yNjS3lSepP+qufbe5joNfxHy+RTUQjB7gBdRnuRi9ZrNS1RZqL38z1+f
         7UQKpFWb7kfiOsRsUJQtJL/qN/l24+Qon4YJQ8w/L/hAN+LFTXJRZZuG04GfHa13S4gq
         lUhaZv1o1Zy+FW4NZTVCItHtGwoidE6baLTHtM5VKqKhAtLw8e9HqpR+hiT3NQvi9i7b
         WkMS53TaGDz5hiJiB1lHsDNkdCIQyLWoGV/0qXZs3QRVbTHehFZIvhnkReQjgJOuzXfU
         S+LA==
X-Forwarded-Encrypted: i=1; AFNElJ+CCMu+QENqv5dOEQxKFYFoAUIqlRYFQgENQVVdhhC32XdI5Hq8gp51fOf08AVUjCNTLCM4czOZ/I3zqwxT@lists.infradead.org
X-Gm-Message-State: AOJu0YwMhXml6CVYyfAu7A6tNATDZVS6qdZkRNCvOJg3A13EzKzkO3Uz
	Km/WRTtedAhd6oMM1dEiXxLEgJ5blnSLQ+bbOHc0wY4UXWLwQjlk7en1Obtdr25OPIs=
X-Gm-Gg: AfdE7cnE99TUYyKF1DbhXB0P2MutHx4v2O3MwVxGwrmPG41qIln6tL72Khd8Q7K6ddj
	uQSPSELRQaHqQgtIvNefKfigqQZQHPVVd+Pu9dveuEBio2EuAIWn4sD9qu/ozG1Uc1YtkZcGBHR
	EUZEOJtpyNqusIZI+9XEPwhkfPraBRezcT1zTqaSrt93XiWNhD3NO4I7qFYDI9lJl+JF/BTfBDl
	L1jRUw1YY6C+0tYd316UuCBUNGp6QAyZuiLGerjwlWZojC5Ad6b2akNpAqbz/QTprzTXh/2GG2X
	M3hK1UZYLQaynBl7p90CmDDcnTTIRHR6VETq4w1OId2D1nQQBjesMB4acjojnuPwplyuXw1q6si
	QbiyOnbChgm4fNxD8P9nHCQ+isyqEIdRkg3ATmVG0NrsdHRGTFPr/dWnKTA48KIY6eM7dOf+Tw6
	idAC3mO9w3fvouxADbWXILOg==
X-Received: by 2002:a05:600d:4448:20b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-49240a09f71mr22313395e9.6.1781854817768;
        Fri, 19 Jun 2026 00:40:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650bc422c0sm5324812f8f.26.2026.06.19.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:40:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] clk: amlogic: Add A9 AO clock controller
In-Reply-To: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com> (Jian Hu via's
	message of "Thu, 18 Jun 2026 17:49:10 +0800")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 09:40:15 +0200
Message-ID: <1jwlvvasgw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_004019_687212_C60B8D2A 
X-CRM114-Status: GOOD (  13.22  )
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

On jeu. 18 juin 2026 at 17:49, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> This series adds Amlogic A9 AO clock support, including dt-binding and AO clock driver.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

A part from the 2 minor problems found by sashiko, This looks good.

> ---
> Changes in v4:
> - Drop CLK_IS_CRITICAL for ao_xtal_in clock.
> - Drop CLK_HW_INIT* and revert to explicit clock declarations.
> - Link to v3: https://lore.kernel.org/r/20260610-a9_aoclk-v3-0-b7592d6c31e2@amlogic.com
>
> Changes in v3:
> - Move COMPILE_TEST after 'depends on ARM64' reported by sashiko-bot.
> - Rename i2c3 to i3c reported by sashiko-bot.
> - Reword the comment describing ao_xtal_in's flags.
> - Use struct clk_init_data to describe ao_xtal_in's hw.init.
> - Link to v2: https://lore.kernel.org/r/20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com
>
> Changes in v2:
> - Split the A9 clock driver and send the AO clock separately.
> - Rename aobus to soc.
> - Use CLK_HW_INIT_FW_NAME to describe clk_init_data.
> - Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data.
> - Use a9_ao prefix for MESON_COMP_SEL.
> - Correct duandiv name.
> - Fix pwm b reg.
> - Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/
>
> ---
> Jian Hu (2):
>       dt-bindings: clock: Add Amlogic A9 AO clock controller
>       clk: amlogic: Add A9 AO clock controller driver
>
>  .../bindings/clock/amlogic,a9-aoclkc.yaml          |  76 ++++
>  drivers/clk/meson/Kconfig                          |  13 +
>  drivers/clk/meson/Makefile                         |   1 +
>  drivers/clk/meson/a9-aoclk.c                       | 488 +++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,a9-aoclkc.h      |  76 ++++
>  5 files changed, 654 insertions(+)
> ---
> base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
> change-id: 20260603-a9_aoclk-bbf531badc63
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
