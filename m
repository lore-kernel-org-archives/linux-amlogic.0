Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28013C02192
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Feb 2025 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ubmg4ZxkrbzWC9AusvmSS13du+WRQ9uwqgTqrnM/KVY=; b=n04zXGuXtRRu0H
	ZwAZoavC/ag1Vq5Hl2LCqTyqQqmxMn14x9nUe23BLHoNNg6zEOegNYgESTCzoR+c1mwUJ0/xuV5a9
	5rY7pWL8q7mbHB8WykTU+jbwfrgBidtCj2uWifnfM0YUe2rIw4IdiZy86I2tjX0TL/RsUL1jpUvEd
	rONa9SLUX9RCeMuahe+kuO+uYfozO4Kx/PNzW1enTFd18Gc6q8CyqG/MuZuHzQcUWPvKHqZKooCt3
	U/nzwCvXQgd2MFL84XDrTVNF/0m95ob5pQlaG+3jZeODobcr0ufr4Sm1+TWxR/qBjbn+70q2Dc7Tj
	I1pPiqs3w+bpjc1GYW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgxZ-00000003h6e-2LLL;
	Wed, 05 Feb 2025 15:05:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgsj-00000003gPG-2F4z
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Feb 2025 15:00:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436281c8a38so48837365e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Feb 2025 07:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738767599; x=1739372399; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXKQZYwIMRdWb1WTyhDach9eNkGuIVB94zg4DR+3xaU=;
        b=yWLB0SuA4W6OS6jABkJqM5GfoVeCRoIQlS9vcd5GynM3UaoU9rphTSpe0hsc8xu17H
         T2yqlY2BJEFPmziYrlmmy7UKHmELaOAsIRm3JpeMG3tvqn6vz706hEN7JbulAsWN0Ysi
         WeMBM8XeiAa+f1WBdHk8uqfOhBIjLBE6MJCeOlAPTc2tHSjCE3KoYDsO/Ww4JbHa4rIN
         pzJMTbLnTbtJ/FJ7PHBXh1hy1moCWTxGt0AKTiN3KG4dB5TDhqJ9jQWLpjakJiC2abKH
         olx8eJkPDQrTBSj4DqmabtnzSFTIlP4OVSxlpWmKmj9FrUhMspjFWgWTZv08ztNSeEbE
         sRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738767599; x=1739372399;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXKQZYwIMRdWb1WTyhDach9eNkGuIVB94zg4DR+3xaU=;
        b=DUcihyHOr2fvqMWVkrcxvY+vLeqjDxCm3gBxcP4lmDw9Kj1U5099Rr8KtkyN8bpKuR
         5duSgw3I8n07GzUwWOmYfmUE5AhhU83/ahyax9MeLtwLkDMn7pGhbO9n3fxhI5aZcQx0
         LQ8OkhCeBDy734pydt55BwStX6gUtlf01yRCfbYNCGKEDIop6pPCk4SvnBQqhcQ1Bhkm
         ckkWskDjQr13/QVC747Hd0EF/Qn2hVS1nkRwUspbJvo1Mdxw1wgA2Q0aH3KIUPdl5vMK
         ZEAhSsBQPbgCRYWydsmR/TDnc6yJk/KxNoI3cVwCWu1BpPApBne0w9BBIEeijSvh4snI
         Oekg==
X-Forwarded-Encrypted: i=1; AJvYcCWhDk7hrzjhJ9UDEUV7byMZkmIMIya8UyrgALRKXjl8VmkC1bBpubxBXoOI9Gii+jMPCtFqDIYMmzkasc0r@lists.infradead.org
X-Gm-Message-State: AOJu0YwZAp8TkZMYYlFl4n5AWHLqoXWp3fNgQOgrW1+9h2Gfuf6ffdI8
	ZTF9R2lKoqo44sFPiKd5SzQgY8Mp2XMdPd5zLg4qL8Q+fXwKQXoOnVsgYAKitnQ=
X-Gm-Gg: ASbGncvQTb3B2zFdy+AWKEi8mkpfAnRGhv3t145JdGLbJdIChTEUCvQvVmm2s294/C/
	I9WKZWas0eDf5d+AKGvHdAdepkO3ZV6OMLcHHzASfyt0EbrQT8Loqn4OSAf7tnO8Ikx1U+i5RzJ
	1/WRgctsQl7wBnMfXTOk8xbukOOBKJhpXVHmFi40huUw/WTxaxgjASyQfQzeFzV5KXevBPuoBBv
	KSLmLvLJku+2VkSobJnl/Ea8LA5zRqhRSMxyBLA4tX/BGNQ3RcypMrNYNcHLicnso7CMhG1S8Id
	GYlUMsItiB4Qud4=
X-Google-Smtp-Source: AGHT+IHwhmaSRrFFNWvkKMkvBDoo/mSQ2n4IGzbyDDbD6YkLJZIfCEMLSF3RcPUjOCdhwhP+nUxtfQ==
X-Received: by 2002:a5d:4cca:0:b0:38d:af8b:6d73 with SMTP id ffacd0b85a97d-38db4889c49mr1918537f8f.26.1738767599221;
        Wed, 05 Feb 2025 06:59:59 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a66c:715c:b646:6f06])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dae1a1e4bsm4765667f8f.55.2025.02.05.06.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:59:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/4] clk: amlogic: drop clk_regmap tables
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
	(Jerome Brunet's message of "Mon, 20 Jan 2025 18:15:29 +0100")
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 15:59:57 +0100
Message-ID: <1jlduksahe.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_070001_839666_17600194 
X-CRM114-Status: GOOD (  17.45  )
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

On Mon 20 Jan 2025 at 18:15, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset removes the need for clk_regmap tables in each clock
> controller driver. These were used to populate regmap with in the regmap
> based clocks.
>
> This saves memory and is the 1st step in a series of rework of Amlogic
> clocks, to clean-up, increase code re-use and ease future maintenance.

Hey Stephen,

Are you ok with clock core part of this patchset ?

I have more clean-ups on amlogic clock queued after this. If possible,
I'd like to be able share these in this cycle.

Thanks
Jerome

>
> Changes in v3:
> - Fix some typos
> - Link to v2: https://lore.kernel.org/r/20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com
>
> Changes in v2:
> - Add clk_hw_get_of_node and kunit tests for the new helpers
> - Split patch adding the .init() and the dropping the table
> - Drop devres based solution and something temporary but simple
>   while a more generic solution to hook controller init is discussed.
> - Link to v1: https://lore.kernel.org/r/20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Jerome Brunet (4):
>       clk: add a clk_hw helpers to get the clock device or device_node
>       clk: amlogic: get regmap with clk_regmap_init
>       clk: amlogic: drop clk_regmap tables
>       clk: amlogic: s4: remove unused data
>
>  drivers/clk/Makefile                    |   1 +
>  drivers/clk/clk.c                       |  33 +++
>  drivers/clk/clk_test.c                  | 116 +++++++--
>  drivers/clk/kunit_clk_dummy_device.dtso |  10 +
>  drivers/clk/meson/Kconfig               |   1 +
>  drivers/clk/meson/a1-peripherals.c      | 163 +-----------
>  drivers/clk/meson/a1-pll.c              |  16 +-
>  drivers/clk/meson/axg-aoclk.c           |  22 --
>  drivers/clk/meson/axg-audio.c           | 433 --------------------------------
>  drivers/clk/meson/axg.c                 | 131 ----------
>  drivers/clk/meson/c3-peripherals.c      | 210 +---------------
>  drivers/clk/meson/c3-pll.c              |  32 +--
>  drivers/clk/meson/clk-cpu-dyndiv.c      |   1 +
>  drivers/clk/meson/clk-dualdiv.c         |   2 +
>  drivers/clk/meson/clk-mpll.c            |   6 +
>  drivers/clk/meson/clk-phase.c           |  11 +
>  drivers/clk/meson/clk-pll.c             |   7 +
>  drivers/clk/meson/clk-regmap.c          |  49 ++++
>  drivers/clk/meson/clk-regmap.h          |   4 +
>  drivers/clk/meson/g12a-aoclk.c          |  34 ---
>  drivers/clk/meson/g12a.c                | 261 -------------------
>  drivers/clk/meson/gxbb-aoclk.c          |  19 --
>  drivers/clk/meson/gxbb.c                | 393 -----------------------------
>  drivers/clk/meson/meson-aoclk.c         |   5 +-
>  drivers/clk/meson/meson-aoclk.h         |   2 -
>  drivers/clk/meson/meson-eeclk.c         |   4 -
>  drivers/clk/meson/meson-eeclk.h         |   2 -
>  drivers/clk/meson/meson8-ddr.c          |   9 -
>  drivers/clk/meson/meson8b.c             | 200 ---------------
>  drivers/clk/meson/s4-peripherals.c      | 341 -------------------------
>  drivers/clk/meson/s4-pll.c              |  31 ---
>  drivers/clk/meson/sclk-div.c            |   5 +
>  drivers/clk/meson/vclk.c                |   2 +
>  drivers/clk/meson/vid-pll-div.c         |   1 +
>  include/linux/clk-provider.h            |   2 +
>  35 files changed, 239 insertions(+), 2320 deletions(-)
> ---
> base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
> change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
