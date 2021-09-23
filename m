Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2CDC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Sep 2021 12:31:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF2560F4C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Sep 2021 12:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CF2560F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMuIHQ+YKEbsKWxSAVfKZ9OnywYla+1dm7Vgh0eYlRc=; b=q4tgm0a4bHQzrX
	OpcSGwdPF8FcFXJUq2Ft9hI1/NQgbr4dzh/TvBzwkGsE3qWJI/EG3Uta/GthH1pyhcOCYJmaeShfI
	AtPz5Rjr2pazm3iqQaw7niMA9sgCZPOQks6L4/SRhcjSM7o5WDEH8rcPd0qYuokFmswwfOtGM/TfZ
	Q6/td7ax7UWwaBX/11HeqICgqIvRBZus8rvJUuZmNY3SlzYbAZQhw0xqzl5NrN1hN5zG/viMw8lyI
	xUS8PVGmEEv8ABAoul3BVg2Ku9oI3wc6IPQ2H9H61ZsqG/5MC9JMdsn7QenbAuVWghbdZxANra3Y/
	wdJGroPMJmuqOIkJZu7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNt2-00BPNr-09; Thu, 23 Sep 2021 12:31:36 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNpe-00BNas-G2
 for linux-amlogic@lists.infradead.org; Thu, 23 Sep 2021 12:28:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u18so16716935wrg.5
 for <linux-amlogic@lists.infradead.org>; Thu, 23 Sep 2021 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=sAdDiXDZ/ozWki9RSCsBqvvHl/GawwV89+dUg68JVq8=;
 b=BDXZVCc2q3lUic06eI3A7pNDnf84wSyFsIdbpRH87Y1hocUMgNUr/65awHzxDmJZoY
 7qHQlEyKcr9x5XPCrFTDjw2HxK/neuaGQ7ikFVdBzhbqCfU4PeiNlwLNq3xdEWAtXMbc
 C76CU52Un+GJTwpTpncBNvcUZvt5D82xg96D5bm+LfylIPIUV+Xo/WxTkxiWPPGNl8Mw
 oe+dVo22saiCKJ49QVuhpK7O503tjNYNxkp3acDuF//Pn7Cz5i1Q2p2QE+kVVbH0Ebuw
 E/icgCdrONhpYBAE7aaeymF0FtGtkQFRrsvyCDSzkqko8hq3oT5fW7eSk3WuJoHstfJ9
 GlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=sAdDiXDZ/ozWki9RSCsBqvvHl/GawwV89+dUg68JVq8=;
 b=4P9spm7oecqO+DVQ1DPwOxU63qEQbwtASbw7xNAwg6WCKxR5psWd3fIl3ilyNJBUFi
 xQk7boxQkyymwhqpLhVqanA0UKtW69WTmKEc4CjTK9YCQZWchYaBzZkqZCsueluXbNkE
 6oGbHazvgL4POrwo0JHgNchGEYoa7nFgxxkqbZ03ocnZgEiDRp7limA1z6dPp+ht61en
 yAUnxL8nBSLGSgOONgPhzRNUODTjhn2djPiCa5Pd6yyFDQRWqzdpIcv2bxloWeO/C+3Z
 DyetOuUdf+348hUffYHrjA68dk9+UCDVG/a2q5BMjuGbltZjRXGa/OBO4sHyJDm7nWHV
 0DpQ==
X-Gm-Message-State: AOAM530jVhfWQo/CdpSShnSDTAN7q5RpFfYKEa9ZJk40g+hLiPwg2Twq
 k09ftYVkaRzjFJWAueGOLyYRNQ==
X-Google-Smtp-Source: ABdhPJySJCgEKUbETC/WzFrGyif34wRWks/YRffd0ZNtreRY1aDIrHVWc3NFuOItxOSkidyD/nRpDA==
X-Received: by 2002:a05:600c:4ba2:: with SMTP id
 e34mr16103109wmp.50.1632400082959; 
 Thu, 23 Sep 2021 05:28:02 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y18sm5113842wrq.6.2021.09.23.05.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:28:02 -0700 (PDT)
References: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
 <20210713232510.3057750-4-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, narmstrong@baylibre.com
Subject: Re: [PATCH 3/6] clk: meson: meson8b: Add the HDMI PLL M/N parameters
Date: Thu, 23 Sep 2021 14:22:37 +0200
In-reply-to: <20210713232510.3057750-4-martin.blumenstingl@googlemail.com>
Message-ID: <1jfstvschd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_052806_661288_D7D7FDDF 
X-CRM114-Status: GOOD (  18.94  )
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


On Wed 14 Jul 2021 at 01:25, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The 3.10 vendor kernel uses only specific HDMI PLL M/N parameter
> combinations. The PLL won't lock for values smaller than 50 if the
> internal doubling (which is yet unknown how to use it) is disabled.
> However, when this doubling is enabled then the values smaller than 50
> will lock just fine. The only restriction for values greater than 50 is
> that the resulting frequency must not exceed the 3.0GHz limit.

Hum, it's not the first time we have that type of issue.
I'm thinking that, instead of using mult_range, we should probably have
min and max output frequencies . The datasheet usually documents these
values for PLL DCO. Something to think about ...

>
> These values are taken from the endlessm 3.10 kernel which includes
> additional M/N combinations for some VESA and 75Hz display modes.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 9ccffbfe44e5..8f29d26ed726 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -118,6 +118,27 @@ static struct clk_regmap meson8b_fixed_pll = {
>  	},
>  };
>  
> +static const struct pll_params_table hdmi_pll_params_table[] = {
> +	PLL_PARAMS(40, 1),
> +	PLL_PARAMS(42, 1),
> +	PLL_PARAMS(44, 1),
> +	PLL_PARAMS(45, 1),
> +	PLL_PARAMS(49, 1),
> +	PLL_PARAMS(52, 1),
> +	PLL_PARAMS(54, 1),
> +	PLL_PARAMS(56, 1),
> +	PLL_PARAMS(59, 1),
> +	PLL_PARAMS(60, 1),
> +	PLL_PARAMS(61, 1),
> +	PLL_PARAMS(62, 1),
> +	PLL_PARAMS(64, 1),
> +	PLL_PARAMS(66, 1),
> +	PLL_PARAMS(68, 1),
> +	PLL_PARAMS(71, 1),
> +	PLL_PARAMS(82, 1),
> +	{ /* sentinel */ }
> +};
> +
>  static struct clk_regmap meson8b_hdmi_pll_dco = {
>  	.data = &(struct meson_clk_pll_data){
>  		.en = {
> @@ -150,6 +171,7 @@ static struct clk_regmap meson8b_hdmi_pll_dco = {
>  			.shift   = 29,
>  			.width   = 1,
>  		},
> +		.table = hdmi_pll_params_table,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		/* sometimes also called "HPLL" or "HPLL PLL" */


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
