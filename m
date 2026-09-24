Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0EDC9830E
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIuIU0UWHijtwCPoeR/dIq+QLFBmWI3vde8KLeiQiP8=; b=zYPr4g49bADYzO
	07caQKSMkayMQWfQCy+4Fajemt+g/EDZBBzPOJIFeuW2aGFNvAEi2x5Dw/b5DgUyKB2F1IWB8zZ3B
	an+1NQlSRLLJ45joX2wJw7wZj43yTH9YY2LG779F+gRfsbZRBwhkvgVlCPPO20SeEooEgnEnuLdFi
	uw/1F4lhJF9L2dAWQGzpkQ/UKwqDksMlm1SQsDPAj22i7knPDi0DGZt9OftVOhR2VRN+ZDU7BkJ6H
	ojRJiNC/cM/W30Yd/Xw+lDuLYKAShLhEQrMaKTVwyhR6omeEtvynIWEwEvWPFEPJD2bEs5Zz1JIcd
	YK225uEktO3E9GcJCWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9frF-0000000Aapm-3yap;
	Thu, 24 Sep 2026 09:35:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9frE-0000000AapJ-2mlm
	for linux-amlogic@bombadil.infradead.org;
	Thu, 24 Sep 2026 09:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ntOIbWg0v6Y7sjUG+xdx4uPbi3N8TfY72tgKuI0bUbw=; b=fq0L5r53H7kpGq/JeeNxMa9J+c
	DnkqAAbggzMHdq6v+JrWhbD9ME5JoehzcW1b83tfuAvwpGYHMEaRAsO+7DIWYOcgyVhoxVDyIXbMO
	/2Uti5+bjlMgqbK32AxhGkymWhg4t8GpqWM/eFQ/UYhAQZRs6YT/7cvFPfnfTJ/5W2uEs2ZTuniEC
	xhZ6bTxmpndbSyGqfSLatCus7rGrZUIsnCGDzV4d4dFhz496F5zd8DlxY6xtSpcBkPSGfJPLfhPod
	wVITuiQKOgYyJUyPB5Ksr65Y09AiJ1QMG/0qXheOVUcghSdaXBinb302uffZW4Ug07BD2hYBpWSfq
	VEfYc0jw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9frB-0000000FnEv-1lO8
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 09:35:11 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e66390995so11581255e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Sep 2026 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790242508; x=1790847308; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntOIbWg0v6Y7sjUG+xdx4uPbi3N8TfY72tgKuI0bUbw=;
        b=aOltVigy41LGBAwgkfT3iwpw07Wkyq353Tzln56dz148SzcTF8wQh2iGATObdBSiCE
         otOjPrVieNC+9Q6he2ps70o7xYsiSG2WUt0MMCdDvf99hHyA03XwYfcMHLQ1Swh+DMcK
         TLBqTM7RNMLyQRaCj+UQncerYbqN/FWjm7BKruPnMlaIdDJKpNoPf1qG1vDqVarzFKTW
         mYwo0g1WF1OGIASwrBKH5OfgEiOrmkJfZqLxJjV1sO/JAIDbj3b1SpEtsl0U98hVoSkp
         +XWBexmwWVG220WXWqALYaZtjCTvawMQqiunmG2nk5IHVyPHXrKkD3gbhFbxTvZZ8GAX
         LyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242508; x=1790847308;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntOIbWg0v6Y7sjUG+xdx4uPbi3N8TfY72tgKuI0bUbw=;
        b=N78CFjDJDLIPRezYJOCN97M4BAcoxTCMYrMbFGlZpRLUUc9265uNh7Tzdt3uP0iWIw
         bPfyRzkzrl4AEvlTdgOK8YGUp8xHiot1JQCK8VDUS2RBIpppkqxX1TwwC9mExCF+FjaT
         7zKdyO5GagzJSQGYVHSlJhtJJAAbwN9XoFaZK1N1n5eF8yn9I54ff73b9c45HGpqKjao
         PZRlNkSd0mtDgyKN+MJdbFFmsW2b985s9UjBZPfIy/lE+sZg5Q4Z82DCaoT+jDbSVqi7
         kQwPwEnRiuzL7C0dxe35RTgW55aIJrAxvYxXE0wGIg74Eu0X/Sr/zUu0slxJgGCFtUi/
         HJlA==
X-Gm-Message-State: AFuF++l4ZrkjDQxqTbn3zEya6QjSNV6crn/fzo/KNRaomnVB+y1oxau/
	F3SCSK0yjp8p+SOlQ980Ys+FCn71BP6H/WNPD4TyPGAXdpdYsT+tnuDtdZHatZ/kOM/Q0SumwaZ
	64DvQ
X-Gm-Gg: AYBFou1LdUTN9pee+IzRG1+YAWN9eabb0ys/5Dg3qF/uaWEWVtPJ2m1phmE5P92frRw
	zGOAgoSf6pUknT89mjcerxBd49tyvWHKFS7Z5HUVta21O2DYhiH4wP9g1cRBJIWaHWpHqv7gj1f
	gw6e5I36C76ylNeCS5rOkSFSDxVNCUzuMOxQUcD+Ecal8FM85uqZ6iFFkCJFclYs2OW/2hXW0G/
	noYinKAUtMVx+uS6But6a/BO6CjkrKzrYiBzJCnpzl/RdPihmQjzGQ2CrFJCWFNXkqAZpdBDUWm
	GsGPMGRzEr0ivVNQBLeK47VsOy5QmGo0aWPuvKJn4yoBS8yUAYZDi+5/u02mhLRnR21h5B9a7lJ
	3q1WM65wQKjtWfWWPrhJYwLq/Jo1N5ij3qrUK9XIGZXMJ0R6mLReiNEdPLRdLUaSWj20J/T6MPw
	qZjJCb+GFvgJuyYM5p7FVgXA1kIpP7Yaedve5wUUJdNB7xw72bISwl1x5HTjDZalVEIq6MJDls9
	W1emh5ZHSPC3dKydA==
X-Received: by 2002:a05:600c:4fcc:b0:49f:df99:ff1a with SMTP id 5b1f17b1804b1-49fe66f344dmr32157945e9.17.1790242507705;
        Thu, 24 Sep 2026 02:35:07 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd2bacsm50613795e9.13.2026.09.24.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:35:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH RFC 0/3] clk: meson: Refactor PLL pre-divider as a
 divider clock
In-Reply-To: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
Date: Thu, 24 Sep 2026 11:35:06 +0200
Message-ID: <1j1paj9elx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103509_620330_21A1F57E 
X-CRM114-Status: GOOD (  24.20  )
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

On mer. 23 sept. 2026 at 19:14, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> This series refactors the Meson PLL framework to remove the dedicated
> PLL pre-divider (N) parameter from the PLL implementation and model it
> as a separate divider clock.
>
> Currently, the Meson PLL framework models the PLL pre-divider using a
> dedicated n field in struct meson_clk_pll_data. This makes the
> pre-divider part of the PLL-specific implementation, although the
> Common Clock Framework already provides a generic divider clock.
>
> This series separates the pre-divider from the PLL and makes the PLL
> DCO take the pre-divider clock as its parent. This allows the
> pre-divider to be modeled using the standard CCF divider implementation
> and simplifies the PLL framework.
>
> The series currently covers T7 as an RFC to get feedback on the
> framework design before applying the same approach to other SoCs.
>
> Series:
> clk: meson: pll: Remove the dedicated n parameter
> dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
> clk: meson: t7: Model PLL pre-divider as a divider clock
>
> The other Meson SoCs will be converted separately after the T7 PLL
> framework refactoring has been reviewed and the overall approach is
> agreed upon.
>
> Any feedback on the proposed clock hierarchy and the separation of the
> PLL pre-divider from the PLL itself would be appreciated.

So if I summarize this RFC, you have simply taken the divider out of the
PLL, no futher addaptation. right ?

I'm happy with it on the general principle and fine with the change as
long as you test it on as much platform as you can, clearly flagging
those you have just compiled tested.

A change like this would likely need to land early in the cycle give as
much time as possible for testing.

However there a couple of thing I'm concerned about:

* You've drop the table support: are you sure this is not needed anymore
  ? don't you want to be able to restrict mutlipliers to specific values
  sometimes ? If not, then OK.

* the determine_rate() make no call to round the parent rate: Since the
  parent will be the divier, how do you progate the rate change so N
  moves and the best parent rate is found ? For sure this fractional
  multiplier clock will need CLK_SET_RATE_PARENT to adjust the
  pre-divider.

* Goes with the point above, but I'm not seeing anything that favors
  lower N for lower jitter, Or mention of a minimum input rate (which
  could be a property) ?
  Those are constraints I think I have understood from your explanation
  here [1] but maybe you've got new information to share ?

This is overall going in the right direction but determine_rate() and
constraints need work.

Note: you are more likely to get test feedback if you add g12 (sm1) as an
example. Those are still the most widely used amlogic platforms with
mainline.

[1]: https://lore.kernel.org/linux-clk/c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com/

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
> Jian Hu (3):
>       clk: meson: pll: Remove the dedicated n parameter
>       dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
>       clk: meson: t7: Model PLL pre-divider as a divider clock
>
>  drivers/clk/meson/clk-pll.c                     | 178 +++++------------------
>  drivers/clk/meson/clk-pll.h                     |  13 --
>  drivers/clk/meson/t7-pll.c                      | 183 ++++++++++++++++++------
>  include/dt-bindings/clock/amlogic,t7-pll-clkc.h |   6 +
>  4 files changed, 181 insertions(+), 199 deletions(-)
> ---
> base-commit: 43e1705ecab981c66baee89041e6f728c0436f19
> change-id: 20260923-meson_refactor_n-e7f25904e536
>
> Best regards,
> -- 
> Jian Hu <jian.hu@amlogic.com>
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
