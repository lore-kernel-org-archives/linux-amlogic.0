Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF2AECAAD4
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 09:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0uFNHQDc6exzD7CQ7lPlZR0kvfHk51Zp2+x6s9bmtlM=; b=dMJQX6+coA/IDH
	A86dbDp6/cokabUsFnT5kk7gJcVdhG7PsUXx6+vDwyyuiMuHG255sHP3JV2AkwyDpHW194u982zbw
	0PAjRZ6Vws37O5mzOO+rYH9WoIIBhwpBk1521mCQ2gXA/zDvy9+nPfPFRmcw7SvuxL2cl9wYajmMJ
	LBUKSLNKd9U6svo1KKTsk4O+gi1wD7Ic8VuJLUFRzR6Sd8Vb5TlEZ2ClYIOushPBO+0DfMn5371Tk
	EIheMNA9hQBadcJ5CQPSvrGSRwOSYWeErbvdsxnIdgcCjy9MCrryYD/eCjp7pU+c7bTHX9F9dAtTF
	VZ13joRsu8NpsO26JjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbSs-006zVu-2A; Mon, 29 Aug 2022 09:53:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbSN-006z8e-EJ
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 09:53:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id m16so9443303wru.9
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc;
        bh=Lzh/Ve7Auc5u8oHwvardUiFGbITEcNzSdf/E6GOkK+c=;
        b=tqmgEwNXNLtJJzMDOXqOvHQ6b1z9DSKBg9Grb3dARLNdaKXjDaMlLfvXBp//Q3SwVI
         9ns3q2bhM+/HJz3IQu0fPl5zRShnbbtcwfNa9lts/tnTNtB8D1G2EnE/iEjam4oPyC/f
         XPLJPIUDgEUYkxgHtywLPeMIOs0dC2ZdJh6GJr/jWc1xsT34EqtzVaTIFyDTjk8WesuU
         TU6WgS4cM/yr0PCjK+aAKQRGBXgrTYGEiK6djsv5gYv9sfkJerrFFTeL80gLuENGRkFx
         vz06J1CMa9HV4kwA0QiCAidjQM47FjJoKJZFpJ5sLZX+ZXyAEIz/wTYWpSHFZgd63Cbt
         juzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc;
        bh=Lzh/Ve7Auc5u8oHwvardUiFGbITEcNzSdf/E6GOkK+c=;
        b=Q9Pz0THj+oHVUOEZD+4pcAvAy7CWNxEHVaVk5+cr2XZBAML4AlnajrIq2vNrTz35GV
         qtS2htuJ8Tg8C1NkzZ9sgY+1V5+9pRQyATCrapXh/9/CM6uxejQCsN/KZXzG3FHO4Da0
         CgXI4bA1T6W7dz1YdQKqFC/s+VNMgVTNPCBsXcdXXlglBwjJxYPWXmuFRefYA+DyyXj2
         Blo+EyGMuJBjWlM2/7FW+tot+eU+mVpRoI9N9U0xShy/rZevilNNi7DGuoFfZz8YlkW3
         cUArd6cPcQGEAAhC08X8owWP0RHzg3xqOAE3zUz0nmZQ6B6neGDgxmcEcQRMdWMxUdQP
         y1lw==
X-Gm-Message-State: ACgBeo3S0BzOA7Aozgl/DamqxItCzJAA4TwuJ7pyOawTNy71UDZuZwnJ
	2EQEAS/MbhTBsJMO64PRhEFRMA==
X-Google-Smtp-Source: AA6agR5QI/RlL+5E9EPzJxWVVMknB8GYGNT2HwSugiZa2lFsqRVLOS3WtEti45tEJAwRz+dl6Wqojg==
X-Received: by 2002:a5d:588d:0:b0:225:6e1a:8696 with SMTP id n13-20020a5d588d000000b002256e1a8696mr5827570wrf.512.1661766800954;
        Mon, 29 Aug 2022 02:53:20 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id ay41-20020a05600c1e2900b003a83ca67f73sm7700198wmb.3.2022.08.29.02.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:53:20 -0700 (PDT)
References: <22f1d799-a3bb-3d71-a3fd-f6128b205231@gmail.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
Date: Mon, 29 Aug 2022 11:52:16 +0200
In-reply-to: <22f1d799-a3bb-3d71-a3fd-f6128b205231@gmail.com>
Message-ID: <1jo7w3tlyo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_025323_618266_B98BDED0 
X-CRM114-Status: GOOD (  19.46  )
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


On Sun 14 Aug 2022 at 23:29, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Currently we loop over meson_parm_read() up to 24mln times.
> This results in a unpredictable timeout period. In my case
> it's over 5s on a S905X4-based system. Make the timeout
> period predictable and set it to 100ms.
>
> Whilst we're at it: All callers of this function return -EIO
> in case of failure, therefore we can return this value directly
> in the timeout case.

I'm okay with this change but I'd prefer if one change addressed a
single topic. Please split this out.

>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/clk/meson/clk-pll.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index daa025b6d..d70bee331 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -277,17 +277,17 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> -	int delay = 24000000;
> +	int delay = 5000;
>  
>  	do {
> -		/* Is the clock locked now ? */
> +		/* Is the clock locked now ? Time out after 100ms. */
>  		if (meson_parm_read(clk->map, &pll->l))
>  			return 0;
>  
> -		delay--;
> -	} while (delay > 0);
> +		udelay(20);
> +	} while (--delay);
>  
> -	return -ETIMEDOUT;
> +	return -EIO;
>  }
>  
>  static int meson_clk_pll_init(struct clk_hw *hw)
> @@ -350,10 +350,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	/* Take the pll out reset */
>  	meson_parm_write(clk->map, &pll->rst, 0);
>  
> -	if (meson_clk_pll_wait_lock(hw))
> -		return -EIO;
> -
> -	return 0;
> +	return meson_clk_pll_wait_lock(hw);
>  }
>  
>  static void meson_clk_pll_disable(struct clk_hw *hw)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
