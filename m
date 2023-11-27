Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE8DC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aik75PKjGtleeivb72xWVtDJPAy8UgDOst+ad0V3Il4=; b=dUsffqK3479gxv
	CoLKrvcxU0YjB73lY73o40VGYoIWf5U0xDsJvBrAmMZtHmbFTbJJeXsoyc3GiT7sPczmvbHhayy1Q
	9KMcM8sBGMZDvdMf86n6rdRukW5yHe3cM6aMEPoVqz0Q57H4NavNxPqqA+mY1cgQuc/8M+Jiq275Y
	Kq4m+ZCwhUplanpesiqDJEhhxyZK72BO8tfPia9FGjL3e9NEbjkbRi0M48dZZvlk+faE5wBJweiQs
	xVoCWZhdh3TPFRoWTrt9K1H1mseCZtw5Sw54cRHshCH0AsTXee+08/JeCEhSRjbPWBr8WpcJ9H3st
	piUTjVcgiS8KzS2D0QZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XkH-001x1G-25;
	Mon, 27 Nov 2023 09:17:37 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XkC-001wyL-1y
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 09:17:35 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so48290701fa.2
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 01:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701076649; x=1701681449; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=bEIoGh5O/BzqSyDdvmfvLEUiDH4K1xP/uQvVNiufgcU=;
        b=VPW8POsDcupfKptbXQR90kbleqlgwLsdgrgujMJy36DLn3dtRvFD8GswBPtLG7gBZQ
         RZUpRqo3tD9g4Y2cAEo62yYj1me422uGMVvtAdGJ3ceSsJGFoirvDnBb997UwbIMminG
         uoXwv5tiw+kCmqYvhaymoywHXjN3y8cu/2mH/OAJREhezepACLiddQ0J7F/4EpCdsQF1
         gJzWJdrB3E2pHxuMgITAlPuGFEBV/8Ai4ZAPekoCSh14SjAQCoCAFDxJzHODyc3CHxtx
         +o5JKgPqm3ebRIM/Zqkf/E3WQJvb+HYub0/W9++pZDTitWW4Rwyv3TSWQPF0OilEjvs9
         +Tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701076649; x=1701681449;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEIoGh5O/BzqSyDdvmfvLEUiDH4K1xP/uQvVNiufgcU=;
        b=GBOkXFiKnu31K+5pv8ReCN1DEaSYCUb+nCK+D/Hkwofu4Q5drCFiYIIgWdQcyvmzfq
         YfftyDulXF0OHofobV7TRQ6rI4d0D356o4+xQFDk5P/7lqKTHYi9ZkG/ZANAADys5omo
         zAZh2nZMm28jkFaMt8SD8QJcOopdu7QM9ppHXYoApXhG2C8CAAPQvxgkBnFYJZbWexyl
         Dgg9Jrnem+KqwyPTfRmNgNqBnlEDIC9LKFK+7gwcwbjTV+qMVJ+aeqtpNa8jjp/ce0Ii
         so8FLFwu2k8P0nYR5TjhMxPOkXwciPIRduJutbqv4vLedx2HuyNQJgr88LDPWk4XqwwB
         GyHw==
X-Gm-Message-State: AOJu0Yz+Qofpvk+fBzhki8JOdEhQXsrVTgF8rFJXBCmWAMxxrNz0W9TC
	DEBjZlCi8wTR5F5S6g5OnFAL+g==
X-Google-Smtp-Source: AGHT+IGy/JmtaB1RId0/b5RlEgolNkKFgTxdlq7MWzbR6GDUGon0doGnidwbBevghTckT6+7ygTSrA==
X-Received: by 2002:a2e:8387:0:b0:2c8:8745:8f0b with SMTP id x7-20020a2e8387000000b002c887458f0bmr6234114ljg.47.1701076648575;
        Mon, 27 Nov 2023 01:17:28 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:fd31:fff0:e26c:d593])
        by smtp.gmail.com with ESMTPSA id dm16-20020a0560000bd000b0032d09f7a713sm11439739wrb.18.2023.11.27.01.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 01:17:28 -0800 (PST)
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-8-95256ed139e6@linaro.org>
 <1jbkbjdxk8.fsf@starbuckisacylon.baylibre.com>
 <b23ddc3b-d995-4cd6-91f2-3efa59d345a5@linaro.org>
 <1j34wvdtux.fsf@starbuckisacylon.baylibre.com>
 <41a1246e-c885-460a-8208-16844e95e1ae@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>,
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Remi Pommarel <repk@triplefau.lt>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 08/12] clk: meson: g12a: make VCLK2 and ENCL clock
 path configurable by CCF
Date: Mon, 27 Nov 2023 09:38:28 +0100
In-reply-to: <41a1246e-c885-460a-8208-16844e95e1ae@linaro.org>
Message-ID: <1jjzq3zhaw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_011732_682081_9E23F613 
X-CRM114-Status: GOOD (  26.21  )
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


>> 
>>>
>>> I suspect mipi_dsi_pxclk_div was added to achieve fractional vclk/bitclk ratios,
>>> since it doesn't exist on AXG. Not sure we would ever need it... and none
>>> of the other upstream DSI drivers supports such setups.
>>>
>>> The main reasons I set only mipi_dsi_pxclk in DT is because :
>>> 1) the DSI controller requires a bitclk to respond, pclk is not enough
>>> 2) GP0 is disabled with an invalid config at cold boot, thus we cannot
>>> rely on a default/safe rate on an initial prepare_enable().
>>> This permits setting initial valid state for the DSI controller, while
>>> the actual bitclk and vclk are calculated dynamically with panel/bridge
>>> runtime parameters.
>> Nothing against setting rate in DT when it is static. Setting it then
>> overriding it is not easy to follow.
>
> Yup, would be simpler to only have parenting set in DT, since it must
> stay static, I'm fine trying to move rate setup to code.
>
>> To work around GP0 not being set, assuming you want to keep rate
>> propagation as it is, you could call clk_set_rate() on cts_encl (possibly w/o
>> enabling it) to force a setup on gp0 then clk_prepare_enable() on
>> pxclk. You'd get a your safe rate on GP0 and the clock you need on pxclk.
>> It is a bit hackish. Might be better to claim gp0 in your driver to
>> manage it directly, cutting rate propagation above it to control each
>> branch of the subtree as you need. It seems you need to have control over
>> that anyway and it would be clear GP0 is expected to belong to DSI.
>
> Controlling the PLL from the DSI controller seems violating too much layers,
> DSI controller driver is not feed directly by the PLL so it's a non-sense
> regarding DT properties.

Not sure what you mean by this. You have shown in your the commit
message that the DSI clocks make significant subtree. I don't see a
problem if you need to manage the root of that subtree. I'd be great if
you didn't need to, but it is what it is ...

>
> Setting a safe clock from the DSI controller probe is an idea, but again I
> don't know which value I should use...

You mentionned that the problem comes DSI bridges that needs to change
at runtime. I don't know much about those TBH, but is there
anyway you can come up with a static GP0 rate that would then be able to
divide to serve all the rates bridge would need in your use case ?

GP0 can go a lot higher than ~100MHz and there are dividers unused in the
tree it seems.

I suppose there is a finite number of required rate for each use case ?
If there are not too many and there is a common divider that allows a
common rate GP0 can do, it would solve your problem. It's a lot of if
but It is worth checking.

This is how audio works and DT assigned rate is a good match in this case.

>
> I'll review the clk parenting flags and try to hack something.
>
> Thanks,
> Neil
>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
