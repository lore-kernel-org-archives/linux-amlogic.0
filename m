Return-Path: <SRS0=MQG/=KT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A173C2B9F7
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 23:29:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911FF61026
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 23:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911FF61026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GH9Y2Irjt88duDmSFDJs9xJhLffRrP5HQ97rBq8xoXA=; b=J5jDQwR+ZDJoCuBagMg4l+6nIA
	jk/g676Iufh8VSf8f0Dvfm3eqYHqELyFtfCjL1ajpWWjEqhfKLCOtcHBf92JlXJ0xMiEr7ECwZYR+
	kYhLd292JB9c+H+vuz8R80nu5rHg+PpJRA1VhKK33tOPnkMGVM9eJAPeEEpir+S+8UjUPAidxlywg
	HNzNvy4pTQoS/jbNcIvHfRYwxeMnkWw7SplpIA7tiow5ahZjqjuX/8TNHoVvQdNmshMKyT4TJQaPw
	3f2bXl0ndlHc6DBKwPrfvMMV34Ywu6atkLwXvNGET2CMYnS4WJmXuhfekQ96KqIY2h2DVjg4V7PLT
	aSJQ5Ihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llK0I-002LIP-ON; Mon, 24 May 2021 23:28:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll8HZ-000qbq-43
 for linux-amlogic@lists.infradead.org; Mon, 24 May 2021 10:58:03 +0000
Received: by mail-wr1-x42d.google.com with SMTP id x8so28060714wrq.9
 for <linux-amlogic@lists.infradead.org>; Mon, 24 May 2021 03:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=ca+wrM4nB27tPYpaZYyNnd8UcG3q9suStj34yK6Un7E=;
 b=p3yXEgVCpGPrz9zkR6Zzuc5sDlLkQsKfiO/YoCMpdgz/ppvHr3bBjfNdf6c8SO4Iy/
 3K4Me5eoSg1GfVsQ+vl+Y8h6tAZRQVkZywVQW5HfemqRb7oCD97DOP+vOIqdUH195DMh
 kdA+6kLyl0Tih2LJxM6s5zJ0PFppcWT8ZCKu4RkERu18521jybeh+W8iaxywnLDYA7ui
 drnCnPOOJbqicvtdRs4n8+qTlrAQj5mp9jvT586dbNovojbzqEXQOF4kctU7Wed5h2uz
 zFswvwM0itvuQUWyz8vMVw25IzZmSTm/CiT5BJh5J1x9E5xoOZ3QAvXkfqie/QFTIkDf
 R0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=ca+wrM4nB27tPYpaZYyNnd8UcG3q9suStj34yK6Un7E=;
 b=t1XEQGxrvbmv6SLa5u7UF+qykn5grle59/SU55a+ttrmjT8oU3iCGnsWX/2gc4rq6q
 cRME1ecdS2w0BEbXcPSZCYwJJlxon2GJslC+BFFIFL+07v4nMDEts6UhUIvVNfncg2f+
 CDy0c4AWTRNKXkZ1+llNz2MkdJlEcly5WuXe+0KTYzheUhTgAr/pmzHk4ixG+tGg/wYr
 s/dHZ2VJ8WqfxtQxt1EQ28Tvj9frjOBP3j1+1RhYqx9c3NaeYjfIj5SIKKTVqpcpQzqW
 Nv5u824XvyDAf4xXgHbEDETZMTF9oLQKNWB3HCszH2FpJ+96GxSL3BcRw0lTGHhmdtaD
 vn8w==
X-Gm-Message-State: AOAM532N6HLHuKShoCBxsPYjG2B4t6IQ9SndWwcHdpaamRoYP/2VP5uL
 ePDWgFoTim04/fcuLQU15ikIUA==
X-Google-Smtp-Source: ABdhPJwnA1Tof4wfbC4fiInMwYqNaO7wHn6JjxWaZbqPVDjThgdzOsS0GgofwNSeJB8C0OKQ3zGdGg==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr21626617wrn.156.1621853879397; 
 Mon, 24 May 2021 03:57:59 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id o15sm7636877wmh.36.2021.05.24.03.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 03:57:58 -0700 (PDT)
References: <20210524104533.555953-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 khilman@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: meson8b: Don't use MPLL1 as parent of
 vclk_in_sel
In-reply-to: <20210524104533.555953-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jsg2cbdqh.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 24 May 2021 12:57:58 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_035801_170056_569D11A3 
X-CRM114-Status: GOOD (  17.82  )
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


On Mon 24 May 2021 at 12:45, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> MPLL1 is needed for audio output. Drop it from the vclk_in_sel parent
> list so we only use the (mutable) vid_pll_final_div tree or one of the
> (fixed) FCLK_DIV{3,4,5} clocks.

Are the fixed ones actually needed ?

If the consumer actually lives on the vid_pll only, I'd prefer if you
could add CLK_SET_RATE_NOREPARENT and assign the proper parent in DT with
`assigned-clock-parents`

>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index a844d35b553a..f8bd211db720 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1154,6 +1154,10 @@ static struct clk_regmap meson8b_vid_pll_final_div = {
>  	},
>  };
>  
> +/*
> + * parent 0x6 is meson8b_mpll1 but we don't use it here because it's reserved
> + * for the audio outputs.
> + */
>  static const struct clk_hw *meson8b_vclk_mux_parent_hws[] = {
>  	&meson8b_vid_pll_final_div.hw,
>  	&meson8b_fclk_div4.hw,
> @@ -1161,7 +1165,6 @@ static const struct clk_hw *meson8b_vclk_mux_parent_hws[] = {
>  	&meson8b_fclk_div5.hw,
>  	&meson8b_vid_pll_final_div.hw,
>  	&meson8b_fclk_div7.hw,
> -	&meson8b_mpll1.hw,
>  };
>  
>  static struct clk_regmap meson8b_vclk_in_sel = {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
