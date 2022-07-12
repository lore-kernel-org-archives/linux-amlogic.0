Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B668C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jul 2022 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpkuH4UgoFgONesTFNWnol6cAaVC3sNl8YyOsvmuKkk=; b=z/DopDPhD+Is73
	sxFpjjaRugcX1aL6cpzHmSwaU4nmiOwzoRNKJqLuQHwS9A1/huZUpivWW5aS9MOp2qwV2vCQaGN1G
	gTkynBnxXisP6foKV//mGPUwaq8oEsB6XXtsw51f3wW91YkPXciPXRi682RzzrJrzaKvgLzAwL5j/
	J9nKV45pePSKvuusESt6UicHmUbZt5ec7/C5LevZFSgXjBXDggqyX/6IXPt1zSw49oFVYxwmGW2B4
	GfEriIvaXbx8A2jlbO4RKgn9Hj6WO1JT0uIVlwKQFKhlL/pX4Fj6v45C+z/DvWJaE4TwlHUoW5WYG
	dXHp9UU7JHbh876jnhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBCNx-009MUe-AW; Tue, 12 Jul 2022 09:40:53 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBCNk-009MEJ-Av
	for linux-amlogic@lists.infradead.org; Tue, 12 Jul 2022 09:40:41 +0000
Received: by mail-lj1-x22c.google.com with SMTP id u14so9225725ljh.2
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Jul 2022 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=+qkfPlCxqbG9qhgmJwcaiOZdFi09fLFwfAcMTyA0/dc=;
        b=Cp5V6ic8+iXNW0gpQPXNWkZGKPNpR5qcuZWGSQTQpjHWgYR97zHZ4yVixyEO+8AqQY
         BDRKCgnwhou+j14dllE0e8aTfqWfIMX3ByM/nPHClWbPuvEVBb+vvbf4bNN/WFVf9jgq
         BfbkQCwUOQnSqoTOt7haVyJSIk7cmSeZ63IZ7mXWMLW3z25y16QmiSHuGLuUz+TNSWMb
         KYNTr0AtYJFiH/kacbYcE4AUaFGedq/jnl6CQiXk5jMdoGHrSPOnBKj6q8Q+VcFjjTOZ
         STQcWjh6ehL3VBN1Fp2Gi2eIBk8fHO2FVMvOLmmiuTMxir8Aotb8v1ki3073Imwk0V8+
         ICaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+qkfPlCxqbG9qhgmJwcaiOZdFi09fLFwfAcMTyA0/dc=;
        b=zlChce1mkdCHVxfeI8GTwU9AOmhYSK1Arcn3CwxG6yrBWwiuew6U7ni2+P1f3R1hCy
         B/rDZIzAUiJqJP8yNSWZ4vgywAubyqvE+h0kBPKodHmwQAM3BZkCmXvYrvr5pbwVrfY+
         DojfR8v37LrhMxfHFBMLOYR4einYpr9QZFAwISqzBd7SHBZMPjPG7pv7LSttMgAAip+X
         aoK2e013pT4FWsBFjPCSH+S58w6iHdbrzd+bi8Yo2WQtlCwRLwIkzVwBt8FO3e9gHu25
         NnLzlEk65qx56b2ZoZm9aEacxzpelrGDebUcI7SowaO0SGGjSOet5kNKNKoqWvJLpWpW
         8f1g==
X-Gm-Message-State: AJIora9OmM9tpn+GmXXe6T8ynGQSMOdKRhdLNWsng+GeApL7NaqfWSNH
	Vc/44CrwgNucpNiuAyAAeFOBkw==
X-Google-Smtp-Source: AGRyM1vv/Ki6opySk8sYVUy+JwlZPDRRGxZPc2h0jjpQjs8Nsi3a3cth7n+hXa8lU5/cRpQhhKPg4A==
X-Received: by 2002:a2e:aa8e:0:b0:25d:5ac8:854d with SMTP id bj14-20020a2eaa8e000000b0025d5ac8854dmr11740857ljb.324.1657618836591;
        Tue, 12 Jul 2022 02:40:36 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id v14-20020ac2560e000000b0047fae90bfb4sm2083581lfd.56.2022.07.12.02.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 02:40:36 -0700 (PDT)
Message-ID: <b7a33482-9bce-7ab1-43cb-3c93a5282490@linaro.org>
Date: Tue, 12 Jul 2022 11:40:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: clk: meson: add S4 SoC clock controller
 bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220708062757.3662-1-yu.tu@amlogic.com>
 <20220708062757.3662-2-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220708062757.3662-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_024040_426094_4F2A9532 
X-CRM114-Status: GOOD (  18.17  )
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

On 08/07/2022 08:27, Yu Tu wrote:
> Add new clock controller compatible and dt-bindings header for the
> Everything-Else domain of the S4 SoC.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>  MAINTAINERS                                   |   1 +
>  include/dt-bindings/clock/s4-clkc.h           | 354 ++++++++++++++++++
>  3 files changed, 356 insertions(+)
>  create mode 100644 include/dt-bindings/clock/s4-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> index 7ccecd5c02c1..301b43dea912 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> @@ -12,6 +12,7 @@ Required Properties:
>  		"amlogic,g12a-clkc" for G12A SoC.
>  		"amlogic,g12b-clkc" for G12B SoC.
>  		"amlogic,sm1-clkc" for SM1 SoC.
> +		"amlogic,s4-clkc" for S4 SoC.
>  - clocks : list of clock phandle, one for each entry clock-names.
>  - clock-names : should contain the following:
>    * "xtal": the platform xtal
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c1abc53f9e91..e4ca46c5c8a1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1775,6 +1775,7 @@ F:	Documentation/devicetree/bindings/clock/amlogic*
>  F:	drivers/clk/meson/
>  F:	include/dt-bindings/clock/gxbb*
>  F:	include/dt-bindings/clock/meson*
> +F:	include/dt-bindings/clock/s*
>  
>  ARM/Amlogic Meson SoC Crypto Drivers
>  M:	Corentin Labbe <clabbe@baylibre.com>
> diff --git a/include/dt-bindings/clock/s4-clkc.h b/include/dt-bindings/clock/s4-clkc.h
> new file mode 100644
> index 000000000000..8b46d54d79fe
> --- /dev/null
> +++ b/include/dt-bindings/clock/s4-clkc.h
> @@ -0,0 +1,354 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + * Author: Yu Tu <yu.tu@amlogic.com>
> + */
> +
> +#ifndef __S4_CLKC_H
> +#define __S4_CLKC_H

Use header guards mathcing paths. See other files for examples.

> +
> +/*
> + * CLKID index values
> + */
> +
> +#define CLKID_PLL_BASE			0
> +#define CLKID_FIXED_PLL_DCO		(CLKID_PLL_BASE + 0)

Drop CLKID_PLL_BASE

> +#define CLKID_FIXED_PLL			(CLKID_PLL_BASE + 1)

ditto... and so on.


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
