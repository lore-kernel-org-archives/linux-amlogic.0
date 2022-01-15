Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3389C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jan 2022 00:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJbQOKkHITkwOk4Eu+D1NXMe8clKaK2uOKW0DdBPZBo=; b=476Ni45Os4AMMo
	xugc8YmvW1MOPW8khXoRAC37Anxn3Qa6mHDxLl/LcAXkHRR76PaM7yMH9lDHjgH6XnKf2xiMeYoct
	qw2nAgHEJMM3pQCmFEI71xEKF7tQEOw4ymNPclnl4ToSEokuPUXknGpIhGryAdCQmpbB/FZ3c11zQ
	pugQrsw9mOeF3NMjutPcxRI2BLfqD21YC+ozglp0qVqeAlPqVeFvQoVM2ZwmEftDzEt5IxuKTItf6
	JrfXFfJmNuRgGxhX43XVF1Sj3pVJhVuNUf4lmgjwJEJGlp4Osfwq5QO6prgvTvB9T6+x6X+NIPsy0
	viQHVggwQT6HhuJYw1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8WdZ-00ATxS-7i; Sat, 15 Jan 2022 00:09:41 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8WdN-00ATvw-Ra; Sat, 15 Jan 2022 00:09:31 +0000
Received: by mail-ed1-x532.google.com with SMTP id o6so39801423edc.4;
 Fri, 14 Jan 2022 16:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6WxgRspTa9pdiuAuq6uLhSBKFJubCNNBfbR5oS90b7o=;
 b=KGoHG6HXMM7jvUx9Y8QNcz74un6IlPxstlSzzYzk0AqnYszuBg3SIHArvidcgByuHl
 hAq5pioMPEYm8hHK3OkUNrVgG0pm8sGjWfg4+VRLWkL22CmDLbZPWnED0dd5FDFDdI/M
 wiWRzLFfCT+1vc/fOjXgPAMczpnR8Z7JA/ml8GBsi+eqQlnCIYxoqvujlXRF2L1g3b0s
 dyMJn2Ua7jG4GkPUjeqJLLqoaPw/w8m3d7BvIcxznrNayIyytxDYkbFTjAnXnBJP01D9
 UbPe/sN7t+prvljMu/y+9zm3SYsNtDddNe4E60G4q5dvVKSY2WiaZDJZlqLICyyOKAID
 wKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6WxgRspTa9pdiuAuq6uLhSBKFJubCNNBfbR5oS90b7o=;
 b=RPhC9QWUhyxGEBPolIJTDi8E4gPJD50BDmGmgZlbgTyfiwh9wYnFGtlJ43bCdj+M2O
 xkppxij2HHMNlk3I6dBFO+oXAYeFNXvoAtTs9WCJtLUg4mVnzcts2spO1G6oI/L4fLU3
 7UvjFIbTnuJlbUPSMuguFSp//mXND/5iVOZw811xDgtQ8fxwiHnRA30ZNBr5UaCncCFQ
 N8jC5AJpZ63+DMwRnByg50EcSZjjMy9hLzDmKIXizMcNBy3g13+J3ric9D0NIKsFSlck
 3kbrsmxRAJ1Z5H+HAgn5VKM6jCyf1J3ssjBCf/b6qK3t7LIiBZjwTWVTIOCuLLldRGhW
 U2jA==
X-Gm-Message-State: AOAM5302JfVNKWe5uOS1GSM+cIRGoduuiuHymzzOEKYuvQBatqF/DNyu
 VTMZ4OKkir2aVbEdLOhLMCkUxuFaKJne0XDuJS0=
X-Google-Smtp-Source: ABdhPJz9ZyGviTxwAhE2hO5kJPWpzDkAuJFLi1AhPe5xXLp16SMB9TUcenUz5Eb6OensaynZMbCWU9gUo24uUxm9Qws=
X-Received: by 2002:a05:6402:518a:: with SMTP id
 q10mr10857118edd.29.1642205362382; 
 Fri, 14 Jan 2022 16:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-4-liang.yang@amlogic.com>
 <20220113212957.768FFC36AE3@smtp.kernel.org>
 <5d99ac02-a246-5bcc-2ecb-371b0d193537@amlogic.com>
In-Reply-To: <5d99ac02-a246-5bcc-2ecb-371b0d193537@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 15 Jan 2022 01:09:11 +0100
Message-ID: <CAFBinCDkNk+Ba340vshhL2rE76U9qb_dZ5ZsgWnMgFYpL6i1jA@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] clk: meson: add DT documentation for emmc clock
 controller
To: Liang Yang <liang.yang@amlogic.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, 
 XianWei Zhao <xianwei.zhao@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>, 
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_160929_923103_1FCCFAC9 
X-CRM114-Status: GOOD (  13.72  )
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

Hi Liang,

On Fri, Jan 14, 2022 at 4:06 AM Liang Yang <liang.yang@amlogic.com> wrote:
[...]
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - "amlogic,axg-mmc-clkc", "syscon"
> >
> > Why is it a syscon?
>
> The register documented by reg is shared with SD/eMMC controller port C,
> and it need to be ops on NFC driver.
Can you please share an example how the .dts would look like in the
end for two example cases:
1) using the sd_emmc_c MMC interface
2) not using the MMC interface of sd_emmc_c but only using it's clocks
for the NFC

Initially I wanted to suggest the usage of a sub-node with compatible
= "mmc-slot" (see
Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt for an
example) to decide whether the MMC controller is registered or whether
just the clock controller is registered.
However, the mmc-slot compatible string is not documented in
Documentation/devicetree/bindings/mmc/mmc-controller.yaml currently.
Maybe the MMC maintainers have any suggestions if other IPs have
similar requirements (for IPs with shared parts).


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
