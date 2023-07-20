Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59CAEB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jul 2023 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCgDw7otoK2SO9qjAgxkx1LZzeuWzNiowWr71krRSjY=; b=gh+62dpkHXU+BD
	BYW3zfgwPAeaXKUMjmLsCo7z/4onc8rqZnJuZPZUqYBGqJkkHp8JBPdahDlK6y9fgLG+g7kJ29xJa
	SEVtOGdmSMeCfmVgO6bNK46cTwv0pb60bs83Qy3rAt8g0ulpIVNZ8WCxiXDIdky50P8liKywPgxNA
	Kv6Pd5/36Mz+p7vf6phf4FRBSiPLYkdefT2SaAlE7WEMjt7gO6kcAnWux00S6IR4YKzYqZKXqE7nr
	1E0J2x6NWG10fGOurjemyY4d6tgwrx3gu2mGbmPNQBGG0rOeNUJFbbwB/vroBksKd6OsWsmlXe7YH
	T7K5uE7MUqUlbSN0BOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQ1H-00AXYW-2K;
	Thu, 20 Jul 2023 09:32:23 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQ1A-00AXHi-1l
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Jul 2023 09:32:21 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb5bcb9a28so880250e87.3
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Jul 2023 02:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689845515; x=1692437515;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=hSMhk6i6GINps38sHFzPosUE097n1Jty6srL/iyzn6U=;
        b=VAvi3G0e6XqAXgvnsCqHpV3v17qyegAzastUBATMH203E4CDtXSc4aa5SgTTtiThRq
         IX1hWELxyMcDVVeN4CSCV6b3JGRslNeXngmS4wQa33d8j094FAbI8D2345veVTMh2p+E
         LK2J8k7YuNm0Fa9aWEghtPyZvQov0XyBL4KKpmPXlAGz7H/NP+6dfnyfj7mxGhoM6PlJ
         y2NC/fz6fdzo6jZOdnc6UsL5T5sUCEr+yu6bIw9EBDT4U+qa8YJqlAgBvem2L2SOU4rz
         tvK7h+i52ajcKhfcCdq3or2eUgUWG/M9N6qjnPUG8zhPVXBqJ7ac098PLYw1uIYI+Bfq
         mSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689845515; x=1692437515;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSMhk6i6GINps38sHFzPosUE097n1Jty6srL/iyzn6U=;
        b=RtHiYWOGUKZpfg7mpBkrkgLB7L+enOZw+0s4CrfodjVDM6CE2pXgthSg1O3Wz/Umig
         2Us2smEbznHCt6ILj91R5cRUCgATdJdEKJMaQb99OL2dWynRPACF0XzYehwY2EC8kKor
         j55kKVz8pHo5NDQgG/Od1MRS+oBFedMe6qzvwhSO3irHtlOXuIlDvhEu9SIC/DWynRNN
         23KSLpNM/zVejjmTfLGMxITNLuIK2XImDE2vVQZs8YXXn30c/JdWZwd9G/1SHW28zPyG
         ZtHepRlZWWpTlkpL53iqsBymbNeWqRR68tZPcF6MbK7MKtEtP1r6pybelqMIdrnF5D48
         TsiQ==
X-Gm-Message-State: ABy/qLY76A6SGNznmDCHvvu7fXXuoYUIR2PBdZdDDk5yFktuSnOLw73V
	vLRDN4suSjTT4uyqs0+Qa4Ro0w==
X-Google-Smtp-Source: APBJJlG1yCJEdqs7h0O+DVyITCi83c8k8QFShbwRseN1eoFH/pKOHb2MlKdI4eCohhrZQvoW3aJkLw==
X-Received: by 2002:a05:6512:3e21:b0:4f8:5af4:73f1 with SMTP id i33-20020a0565123e2100b004f85af473f1mr2422936lfv.32.1689845515449;
        Thu, 20 Jul 2023 02:31:55 -0700 (PDT)
Received: from localhost ([82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 15-20020a05600c028f00b003fc06169ab3sm3467170wmk.20.2023.07.20.02.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 02:31:54 -0700 (PDT)
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>
Subject: Re: [PATCH v2 00/19] clk: meson: move all private clk IDs to public
 dt-bindings headers
Date: Thu, 20 Jul 2023 11:31:06 +0200
In-reply-to: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
Message-ID: <1jwmyvnd2t.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_023216_901699_B3F154EB 
X-CRM114-Status: GOOD (  15.40  )
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


On Mon 12 Jun 2023 at 11:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> After some complaints in the upstreaming of the A1 clock drivers,
> S4 clock driver and a tentative to use some of the private DSI
> clocks in [1], it has been decided to move out all the "private"
> clk IDs to public dt-bindings headers.
>
> For that we must get rid of the "NR_CLKS" define and use
> ARRAY_SIZE() to get the count of hw_clks, then we can move
> the IDs and do some cleanup.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Collect review tags
> - Move newly introduced helper and header into new meson-clkc-utils module
> - Link to v1: https://lore.kernel.org/r/20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org
>
> ---
> Neil Armstrong (19):
>       clk: meson: introduce meson-clkc-utils

Fixed MODULE_LICENSE

>       clk: meson: migrate meson-eeclk out of hw_onecell_data to drop NR_CLKS
>       clk: meson: migrate meson-aoclk out of hw_onecell_data to drop
>       NR_CLKS

Fixed whitespace warning

>       clk: meson: migrate a1 clock drivers out of hw_onecell_data to drop NR_CLKS
>       clk: meson: migrate meson8b out of hw_onecell_data to drop NR_CLKS
>       clk: meson: migrate axg-audio out of hw_onecell_data to drop NR_CLKS
>       dt-bindings: clk: gxbb-clkc: expose all clock ids
>       dt-bindings: clk: axg-clkc: expose all clock ids
>       dt-bindings: clk: g12a-clks: expose all clock ids
>       dt-bindings: clk: g12a-aoclkc: expose all clock ids
>       dt-bindings: clk: meson8b-clkc: expose all clock ids
>       dt-bindings: clk: amlogic,a1-peripherals-clkc: expose all clock ids
>       dt-bindings: clk: amlogic,a1-pll-clkc: expose all clock ids
>       dt-bindings: clk: axg-audio-clkc: expose all clock ids
>       clk: meson: aoclk: move bindings include to main driver
>       clk: meson: eeclk: move bindings include to main driver
>       clk: meson: a1: move bindings include to main driver
>       clk: meson: meson8b: move bindings include to main driver
>       clk: meson: axg-audio: move bindings include to main driver
>

Applied. Thx

>  drivers/clk/meson/Kconfig                          |    9 +
>  drivers/clk/meson/Makefile                         |    1 +
>  drivers/clk/meson/a1-peripherals.c                 |  325 ++---
>  drivers/clk/meson/a1-peripherals.h                 |   67 -
>  drivers/clk/meson/a1-pll.c                         |   38 +-
>  drivers/clk/meson/a1-pll.h                         |   19 -
>  drivers/clk/meson/axg-aoclk.c                      |   48 +-
>  drivers/clk/meson/axg-aoclk.h                      |   18 -
>  drivers/clk/meson/axg-audio.c                      |  851 ++++++-----
>  drivers/clk/meson/axg-audio.h                      |   75 -
>  drivers/clk/meson/axg.c                            |  285 ++--
>  drivers/clk/meson/axg.h                            |   63 -
>  drivers/clk/meson/g12a-aoclk.c                     |   72 +-
>  drivers/clk/meson/g12a-aoclk.h                     |   32 -
>  drivers/clk/meson/g12a.c                           | 1489 ++++++++++----------
>  drivers/clk/meson/g12a.h                           |  145 --
>  drivers/clk/meson/gxbb-aoclk.c                     |   14 +-
>  drivers/clk/meson/gxbb-aoclk.h                     |   15 -
>  drivers/clk/meson/gxbb.c                           |  848 +++++------
>  drivers/clk/meson/gxbb.h                           |   81 --
>  drivers/clk/meson/meson-aoclk.c                    |    9 +-
>  drivers/clk/meson/meson-aoclk.h                    |    3 +-
>  drivers/clk/meson/meson-clkc-utils.c               |   25 +
>  drivers/clk/meson/meson-clkc-utils.h               |   19 +
>  drivers/clk/meson/meson-eeclk.c                    |    9 +-
>  drivers/clk/meson/meson-eeclk.h                    |    3 +-
>  drivers/clk/meson/meson8b.c                        | 1318 ++++++++---------
>  drivers/clk/meson/meson8b.h                        |  117 --
>  .../clock/amlogic,a1-peripherals-clkc.h            |   53 +
>  include/dt-bindings/clock/amlogic,a1-pll-clkc.h    |    5 +
>  include/dt-bindings/clock/axg-audio-clkc.h         |   65 +
>  include/dt-bindings/clock/axg-clkc.h               |   48 +
>  include/dt-bindings/clock/g12a-aoclkc.h            |    7 +
>  include/dt-bindings/clock/g12a-clkc.h              |  130 ++
>  include/dt-bindings/clock/gxbb-clkc.h              |   65 +
>  include/dt-bindings/clock/meson8b-clkc.h           |   97 ++
>  36 files changed, 3189 insertions(+), 3279 deletions(-)
> ---
> base-commit: 84af914404dbc01f388c440cac72428784b8a161
> change-id: 20230607-topic-amlogic-upstream-clkid-public-migration-fc1c67c44858
>
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
