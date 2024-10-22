Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBE7D1CDCB
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Oct 2024 10:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrILKTzbk7MNs809/Ob9+0KKVzW1tpg/CRU+yXCHrVg=; b=EnND8fN8NIWxmy
	b4SvFjwe/tcrHvnvqQ8sTt6ritLzjPSjV4DUEDZZ4YU6CMYuPVpdgJDwPkX/oNqb9dtqLrPISdx3G
	zR7Rl7qPRKK00BpE1DAOA2xOqXbkjWpOY47iQLVpHIkvO4sPuj5+4PRjfpC/cbFrw8e2Sng0qdf30
	rAo0FWa0nY44X8cQdvCVMGZ3oeMjdvoVo3vqzeoausygKmMvaBHICBdPMHm15kmJf14XwJ97dGH8j
	B+UQT2BEF9uaEPjGuJWrY9LT1qksCpNvXfXnyzQOu9vDyw20Wmlyai/dhG4AhJcbqiWh6OFoXleXk
	pf4IACChuCelL312dcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BuB-0000000AUZb-3Izg;
	Tue, 22 Oct 2024 10:14:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3BXy-0000000AQpS-3lHK
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Oct 2024 09:51:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso54143855e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Oct 2024 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729590685; x=1730195485; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O9uhSsPjuLDUWqYOIT4n8318oMtxdXxpij17XIrTsXE=;
        b=IBLsnWKGciUmNJn1qtxqhwsIhgk2LA5qPA7ESyDHjlocARVRMBUfB58uFPLytY6B/4
         BjroekuQo83zcMhAxIjOdGpPfGefyL+LGNq9ZsfButFCLgNL1/lSsjrHFvma7SVMZpSi
         pFWCK8ojRa+ibR6sEb4qAjWKo3MHA71fCQNjVFmKYLsAdwA6CTp+TelfuEb6Ey+JluBi
         Jh7FeyvYxZp4vgiMAvKHJZFR5ZPthVATNddnLz2KkcbRTEanB9Wgb+vE8hRWx5mKcvmn
         en2tlwUVh2FKOjsMd1RNXQCc9gl8Swz3ONtO685UZzSzQyiOB3+gRSNN272Ul/lqb171
         oinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590685; x=1730195485;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9uhSsPjuLDUWqYOIT4n8318oMtxdXxpij17XIrTsXE=;
        b=hew8xnQQ5UrB0AMILJYzRCG/embWVKUh0i+lMJoHk3xTz6ULvrqsHmEDOaOKZ7Vjc4
         Quji5HoGUcax93g2EJKh+hQ0en4rr7ahP26ciru0mlFuVDbLxyT18bYv4z0LWEIE7zAW
         N/yAyVHZ3dtOg4O4SnSNej6MZoAlhTlBy5Y7IZZHgDnvnmKZeLUwWyIQwy2l7eEl12Fu
         cH8bh0VxE7ic8WPkjEVD+dQukMdWWKCUU/XR0/EpqkP0r+VMEZ3e4Fe+F/G13t63b8Sg
         H1WHB1+lNdw6qb1EzNy8Xdfmy+jTBc200jGJud+AB0lmTGAWslfqceS/cZG6OhWzZy6o
         OPFA==
X-Forwarded-Encrypted: i=1; AJvYcCXmy5o7gXiGb8T/jI4cJQW8LQl2kra0rwOQdVYmZ2ZbFZaRh6qe+ulcLvsR93tU+7dfwYv1u1jqiEr4qtIj@lists.infradead.org
X-Gm-Message-State: AOJu0YyMesFFCYaM6rNi7Rx0IME8psBUnxyfaG+FrZhMK70+AJTZvvb1
	FuHYjexFSCtOZEWNcEmZ4EQb+VnMnJUSrshTTm9gFg7PgGm+JU+eOMD6rm1rDw4=
X-Google-Smtp-Source: AGHT+IG4BjZjQ2Z2dqGHg8e13po3OOXPlOkZEZh2gmQz0kEl9ezHR/+UkwbK17+DbKxR73ieabZKcw==
X-Received: by 2002:a05:600c:6747:b0:430:5356:ac92 with SMTP id 5b1f17b1804b1-4316161fb1dmr109088635e9.7.1729590685185;
        Tue, 22 Oct 2024 02:51:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ef1c:ae40:1300:20c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f570de0sm83095085e9.6.2024.10.22.02.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:51:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>,
  Kevin Hilman <khilman@baylibre.com>,  "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Philipp Zabel <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>,
  Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH v4 0/5] Add A1 Soc audio clock controller driver
In-Reply-To: <20240913121152.817575-1-jan.dakinevich@salutedevices.com> (Jan
	Dakinevich's message of "Fri, 13 Sep 2024 15:11:47 +0300")
References: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
Date: Tue, 22 Oct 2024 11:51:24 +0200
Message-ID: <1jplnsjwir.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_025126_959869_450041F3 
X-CRM114-Status: GOOD (  16.32  )
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

On Fri 13 Sep 2024 at 15:11, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> This series adds support for audio clock and reset controllers on A1 SoC family.
>

Split the reset part out of the series (I'd suggest adding VAD reset
support while at it). Also remove the DT patch, since it will depends on
both patchset.

Drop the RFC tag, at v4 I think that phase is over.

> Dependency: [4]
>
> Changes v3 [3] -> v4
>  - Use auxiliary reset device implemented in [4]
>  - Split the driver into files
>  - Use common with axg-audio yaml schema
>  - Unify clock-names with axg-audio
>
> Changes v2 [2] -> v3
>  - reset:
>    * added auxiliary device
>  - yaml:
>    * added declaration of optional clocks
>    * fixed names in example and another cosmetics
>  - clocks:
>    * reworked naming
>    * stop using of "core" clock name
>    * fixed wrong parenting
>
> Changes v1 [1] -> v2:
>  - Detached from v1's series (patch 2, 3, 4, 25).
>  - Reuse some of defines from axg-audio;
>  - Split the controller into two memory regions.
>
> Links:
>  [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
>  [2] https://lore.kernel.org/lkml/20240328010831.884487-1-jan.dakinevich@salutedevices.com/
>  [3] https://lore.kernel.org/lkml/20240419125812.983409-1-jan.dakinevich@salutedevices.com/
>  [4] https://lore.kernel.org/lkml/9a4377fe27d8eb940399e452b68fb5a6d678929f.camel@pengutronix.de/
>
> Jan Dakinevich (5):
>   reset: amlogic: add support for A1 SoC in auxiliary reset driver
>   clk: meson: axg: share the set of audio helper macro
>   dt-bindings: clock: axg-audio: document A1 SoC audio clock controller
>     driver
>   clk: meson: a1: add the audio clock controller driver
>   arm64: dts: meson: a1: add the audio clock controller
>
>  .../clock/amlogic,axg-audio-clkc.yaml         |   3 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  48 +++
>  drivers/clk/meson/Kconfig                     |  14 +
>  drivers/clk/meson/Makefile                    |   3 +
>  drivers/clk/meson/a1-audio-clkc.c             | 359 ++++++++++++++++++
>  drivers/clk/meson/a1-audio-drv.c              | 104 +++++
>  drivers/clk/meson/a1-audio-vad-clkc.c         |  85 +++++
>  drivers/clk/meson/a1-audio.h                  | 131 +++++++
>  drivers/clk/meson/axg-audio.c                 | 138 +------
>  drivers/clk/meson/meson-audio.h               | 143 +++++++
>  drivers/reset/amlogic/reset-meson-aux.c       |   9 +
>  .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++++
>  .../reset/amlogic,meson-a1-audio-reset.h      |  29 ++
>  13 files changed, 1051 insertions(+), 137 deletions(-)
>  create mode 100644 drivers/clk/meson/a1-audio-clkc.c
>  create mode 100644 drivers/clk/meson/a1-audio-drv.c
>  create mode 100644 drivers/clk/meson/a1-audio-vad-clkc.c
>  create mode 100644 drivers/clk/meson/a1-audio.h
>  create mode 100644 drivers/clk/meson/meson-audio.h
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
