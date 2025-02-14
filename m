Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9421C021A6
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2025 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBRNphlD7rcjIxLpYIUeFL1sP2etVbP9VpOxi2Sa1o4=; b=TvYFHPJV081pfg
	gi0kYATk73lfob+okLlGYxcvEE/7kfpYFCobJ5U/nSwMaAQcTCJKE+6U8AC4kpaFdav/CwrRJMWjS
	K/+CdIN/eqrpBXuFiHUwsTY32E9zOxBWmH/+7gNYPZnKSa30BcWSg9lW14XuhazFEwwpadE7GrCt8
	hfpyXvUhyIQ0uI3dse1egDbvvvtkN/9q6dEn0pHtUk463oK0Tfecq1CGPdCJff9kMMBuzDm3bErtA
	LrrtkC75BiCRWPZu8478PYRJE5lUhtTfzwoDswogDGofet51V1J5WOBT3JJdyMq2LzFTiMwNuUnWA
	ARu5tt2bD98iUsWEdn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirmV-0000000EHQK-0Hrt;
	Fri, 14 Feb 2025 09:14:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirmS-0000000EHOa-1984
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Feb 2025 09:14:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4395578be70so18770845e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2025 01:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739524478; x=1740129278; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCiVioSjlTsnuen9fC0dPU4ykmMHB2aSm1F+9WlgMp0=;
        b=C9xFAGnXNtlNgogi+w6dlsidSDWI6a81TmdMR4vb6B2JoQo0QYZLAkktl9EPs75M0b
         JguqZtTnxt5TtJbfyAtMBcBc5t49JgaJY3fNJVWZI9qHaCScw+N6TmjjeDqdzxiJkKAA
         haR+kHAVvbwBnZv/BljaPTB10FKw+rKaNLwYYAGk4kWjRxf51YpPeB0w0+AFaFZOUBCZ
         OrlgIYP9MmGoFfeTgzroGgEXydUshRqoOyS9KErXq9ynObLfzhUPfqo8CwLORbhNSGS+
         +9G7zEeNdzdUS42lAUnnY91XOuw675CfL3K22maDIsKl4wem225Sc+EKKqBsMaZ4EU7H
         oY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524478; x=1740129278;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCiVioSjlTsnuen9fC0dPU4ykmMHB2aSm1F+9WlgMp0=;
        b=I+ai8385QfNcn45Jmg9PMORdxMTINuMtWQPjrrGAFZdnz9MqPJsrhR/YbmnIQMz0XG
         52WTpspOIie2PHnuJIXIK22VhbLhnB+yoGE5pyqHnbdGRv5BeT/wVZBwrNDTIMlDdXMd
         4Szn+0oEysWPkSV1SRNOGFd1wI6GEOCg5K5gys6cL9E5xk/rAVRrbq4/5nA7MF1EEhBq
         uaPB8vLcH/2zavsHFYId+tWyRDDYlUodm8Xd0v4cC+Ct6SxWz+/tN3rAv65s6en0z8SE
         lAyyzWLx/w+JoMjuP7iuh9U+rvCneA39JkpVfT0fmriOo6NLs67NEJ31MoTKfHYWjgxb
         KuXw==
X-Forwarded-Encrypted: i=1; AJvYcCUWk5uE1Mr9kFfXn396U0OlU50Xog5rCnkJDeMDhLRdNkVhOjLizQjPm3HBRKRAzAn1Go4bLZVvhENCus4S@lists.infradead.org
X-Gm-Message-State: AOJu0YzfD1bkKRmGfa8Qe2iePtZLybBaMyoMUvwQR+jyBlxeK5Z65CNi
	fWCR7h3tlHooCWpijYalRs+0f4u5v5Ex3XoadicepgeA8Lwz7IO/Yszmm/zmEKs=
X-Gm-Gg: ASbGnctZMlE4vrJOl4ZMKes20WxzqQFD/cz10Ubb5HTYzk593PjihKu0Zv8apPVIj4t
	vEJgWazqnujE4id3KdHQO/77beeBQmj+ESrwxaVshwklnMHUcxTLFMa1UN2WM48fbhveXnoUJ/Y
	dIx+3ReAQv3Q9oDJcFZlJfarVjCRS5f3LJRPZa6Z2zau8oqrWW3s+JeUrDdnK0fRU+7Q/C+g3VA
	SCfeQMQAGDqnoUmgIpKkSpAYeT4dFTYDe/sJtUN9exWXeaUpUVmuQo5k+GcfPeIqkIuBbPlcJYy
	5OuPs7NMNjcrDdc=
X-Google-Smtp-Source: AGHT+IGHp8VoTWvOB7xxf1XXYIaIH2dN5v9dHr6Pikizi4YgoxX6DsqFmRMd9QaFFkRsdvI3Ep2yug==
X-Received: by 2002:a5d:6da8:0:b0:38f:217f:b225 with SMTP id ffacd0b85a97d-38f217fb2a4mr10299895f8f.29.1739524478501;
        Fri, 14 Feb 2025 01:14:38 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:baa6:bc65:b9db:3759])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f258ccd2csm4204851f8f.30.2025.02.14.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:14:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v2 3/5] ASoC: meson: s4:support the audio clk
In-Reply-To: <20250214-audio_drvier-v2-3-37881fa37c9e@amlogic.com> (jiebing
	chen via's message of "Fri, 14 Feb 2025 10:13:42 +0800")
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
	<20250214-audio_drvier-v2-3-37881fa37c9e@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 10:14:37 +0100
Message-ID: <1jed00zy4i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_011440_316902_5C98A415 
X-CRM114-Status: GOOD (  19.03  )
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

On Fri 14 Feb 2025 at 10:13, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> Add the audio clk tree for s4, add new mclk, sclk and lrclk pad.
>

This disregard previous feedback about the compatibility with the
axg/g12 platform.

Is what follows really the only difference between the 2 ?
You previous reported the difference would be significant and now this ?
I don't get it.

> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  drivers/clk/meson/axg-audio.c | 410 +++++++++++++++++++++++++++++++++++++++++-
>  drivers/clk/meson/axg-audio.h |   4 +
>  2 files changed, 412 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 9df627b142f89788966ede0262aaaf39e13f0b49..e70559ee0fd8deaf9858b0592e839fdf49d05886 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -323,6 +323,16 @@ static const struct clk_parent_data lrclk_pad_ctrl_parent_data[] = {
>  	AUD_MUX(_name, _reg, 0x7, _shift, 0, _parents,		\
>  		CLK_SET_RATE_NO_REPARENT)
>  
> +#define AUD_MCLK_PAD_MUX(_name, _reg, _shift)					\
> +	AUD_MUX(_name##_sel, _reg, 0x7, _shift, CLK_MUX_ROUND_CLOSEST,			\
> +		mclk_pad_ctrl_parent_data, 0)
> +#define AUD_MCLK_PAD_DIV(_name, _reg, _shift)					\
> +	AUD_DIV(_name##_div, _reg, _shift, 8, CLK_DIVIDER_ROUND_CLOSEST,			\
> +		aud_##_name##_sel, CLK_SET_RATE_PARENT)
> +#define AUD_MCLK_PAD_GATE(_name, _reg, _shift)					\
> +	AUD_GATE(_name, _reg, _shift, aud_##_name##_div,			\
> +		 CLK_SET_RATE_PARENT)
> +
>  /* Common Clocks */
>  static struct clk_regmap ddr_arb =
>  	AUD_PCLK_GATE(ddr_arb, AUDIO_CLK_GATE_EN, 0);
> @@ -826,6 +836,49 @@ static struct clk_regmap sm1_tdm_sclk_pad_1 = AUD_TDM_PAD_CTRL(
>  static struct clk_regmap sm1_tdm_sclk_pad_2 = AUD_TDM_PAD_CTRL(
>  	tdm_sclk_pad_2, AUDIO_SM1_MST_PAD_CTRL1, 8, sclk_pad_ctrl_parent_data);
>  
> +static struct clk_regmap s4_tdm_mclk_pad0_sel =
> +	AUD_MCLK_PAD_MUX(mclk_pad0, AUDIO_S4_MCLK_PAD_CTRL0, 8);
> +static struct clk_regmap s4_tdm_mclk_pad1_sel =
> +	AUD_MCLK_PAD_MUX(mclk_pad1, AUDIO_S4_MCLK_PAD_CTRL0, 24);
> +static struct clk_regmap s4_tdm_mclk_pad2_sel =
> +	AUD_MCLK_PAD_MUX(mclk_pad2, AUDIO_S4_MCLK_PAD_CTRL1, 8);
> +
> +static struct clk_regmap s4_tdm_mclk_pad0_div =
> +	AUD_MCLK_PAD_DIV(mclk_pad0, AUDIO_S4_MCLK_PAD_CTRL0, 0);
> +static struct clk_regmap s4_tdm_mclk_pad1_div =
> +	AUD_MCLK_PAD_DIV(mclk_pad1, AUDIO_S4_MCLK_PAD_CTRL0, 16);
> +static struct clk_regmap s4_tdm_mclk_pad2_div =
> +	AUD_MCLK_PAD_DIV(mclk_pad2, AUDIO_S4_MCLK_PAD_CTRL1, 0);
> +
> +static struct clk_regmap s4_tdm_mclk_pad_0 =
> +	AUD_MCLK_PAD_GATE(mclk_pad0, AUDIO_S4_MCLK_PAD_CTRL0, 15);
> +static struct clk_regmap s4_tdm_mclk_pad_1 =
> +	AUD_MCLK_PAD_GATE(mclk_pad1, AUDIO_S4_MCLK_PAD_CTRL0, 31);
> +static struct clk_regmap s4_tdm_mclk_pad_2 =
> +	AUD_MCLK_PAD_GATE(mclk_pad2, AUDIO_S4_MCLK_PAD_CTRL1, 15);
> +
> +static struct clk_regmap s4_tdm_sclk_pad_0 =
> +	AUD_TDM_PAD_CTRL(tdm_sclk_pad_0, AUDIO_S4_SCLK_PAD_CTRL0, 0, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_sclk_pad_1 =
> +	AUD_TDM_PAD_CTRL(tdm_sclk_pad_1, AUDIO_S4_SCLK_PAD_CTRL0, 4, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_sclk_pad_2 =
> +	AUD_TDM_PAD_CTRL(tdm_sclk_pad_2, AUDIO_S4_SCLK_PAD_CTRL0, 8, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_sclk_pad_3 =
> +	AUD_TDM_PAD_CTRL(tdm_sclk_pad_3, AUDIO_S4_SCLK_PAD_CTRL0, 16, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_sclk_pad_4 =
> +	AUD_TDM_PAD_CTRL(tdm_sclk_pad_4, AUDIO_S4_SCLK_PAD_CTRL0, 20, lrclk_pad_ctrl_parent_data);
> +
> +static struct clk_regmap s4_tdm_lrclk_pad_0 =
> +	AUD_TDM_PAD_CTRL(tdm_lrclk_pad_0, AUDIO_S4_SCLK_PAD_CTRL1, 0, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_lrclk_pad_1 =
> +	AUD_TDM_PAD_CTRL(tdm_lrclk_pad_1, AUDIO_S4_SCLK_PAD_CTRL1, 4, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_lrclk_pad_2 =
> +	AUD_TDM_PAD_CTRL(tdm_lrclk_pad_2, AUDIO_S4_SCLK_PAD_CTRL1, 8, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_lrclk_pad_3 =
> +	AUD_TDM_PAD_CTRL(tdm_lrclk_pad_3, AUDIO_S4_SCLK_PAD_CTRL1, 16, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_lrclk_pad_4 =
> +	AUD_TDM_PAD_CTRL(tdm_lrclk_pad_4, AUDIO_S4_SCLK_PAD_CTRL1, 20, lrclk_pad_ctrl_parent_data);
> +
>  /*
>   * Array of all clocks provided by this provider
>   * The input clocks of the controller will be populated at runtime
> @@ -1257,6 +1310,177 @@ static struct clk_hw *sm1_audio_hw_clks[] = {
>  	[AUD_CLKID_EARCRX_DMAC]		= &sm1_earcrx_dmac_clk.hw,
>  };
>  
> +/*
> + * Array of all S4 clocks provided by this provider
> + * The input clocks of the controller will be populated at runtime
> + */
> +static struct clk_hw *s4_audio_hw_clks[] = {
> +	[AUD_CLKID_DDR_ARB]		= &ddr_arb.hw,
> +	[AUD_CLKID_PDM]			= &pdm.hw,
> +	[AUD_CLKID_TDMIN_A]		= &tdmin_a.hw,
> +	[AUD_CLKID_TDMIN_B]		= &tdmin_b.hw,
> +	[AUD_CLKID_TDMIN_C]		= &tdmin_c.hw,
> +	[AUD_CLKID_TDMIN_LB]		= &tdmin_lb.hw,
> +	[AUD_CLKID_TDMOUT_A]		= &tdmout_a.hw,
> +	[AUD_CLKID_TDMOUT_B]		= &tdmout_b.hw,
> +	[AUD_CLKID_TDMOUT_C]		= &tdmout_c.hw,
> +	[AUD_CLKID_FRDDR_A]		= &frddr_a.hw,
> +	[AUD_CLKID_FRDDR_B]		= &frddr_b.hw,
> +	[AUD_CLKID_FRDDR_C]		= &frddr_c.hw,
> +	[AUD_CLKID_TODDR_A]		= &toddr_a.hw,
> +	[AUD_CLKID_TODDR_B]		= &toddr_b.hw,
> +	[AUD_CLKID_TODDR_C]		= &toddr_c.hw,
> +	[AUD_CLKID_LOOPBACK]		= &loopback.hw,
> +	[AUD_CLKID_SPDIFIN]		= &spdifin.hw,
> +	[AUD_CLKID_SPDIFOUT]		= &spdifout.hw,
> +	[AUD_CLKID_RESAMPLE]		= &resample.hw,
> +	[AUD_CLKID_SPDIFOUT_B]		= &spdifout_b.hw,
> +	[AUD_CLKID_MST_A_MCLK_SEL]	= &sm1_mst_a_mclk_sel.hw,
> +	[AUD_CLKID_MST_B_MCLK_SEL]	= &sm1_mst_b_mclk_sel.hw,
> +	[AUD_CLKID_MST_C_MCLK_SEL]	= &sm1_mst_c_mclk_sel.hw,
> +	[AUD_CLKID_MST_D_MCLK_SEL]	= &sm1_mst_d_mclk_sel.hw,
> +	[AUD_CLKID_MST_E_MCLK_SEL]	= &sm1_mst_e_mclk_sel.hw,
> +	[AUD_CLKID_MST_F_MCLK_SEL]	= &sm1_mst_f_mclk_sel.hw,
> +	[AUD_CLKID_MST_A_MCLK_DIV]	= &sm1_mst_a_mclk_div.hw,
> +	[AUD_CLKID_MST_B_MCLK_DIV]	= &sm1_mst_b_mclk_div.hw,
> +	[AUD_CLKID_MST_C_MCLK_DIV]	= &sm1_mst_c_mclk_div.hw,
> +	[AUD_CLKID_MST_D_MCLK_DIV]	= &sm1_mst_d_mclk_div.hw,
> +	[AUD_CLKID_MST_E_MCLK_DIV]	= &sm1_mst_e_mclk_div.hw,
> +	[AUD_CLKID_MST_F_MCLK_DIV]	= &sm1_mst_f_mclk_div.hw,
> +	[AUD_CLKID_MST_A_MCLK]		= &sm1_mst_a_mclk.hw,
> +	[AUD_CLKID_MST_B_MCLK]		= &sm1_mst_b_mclk.hw,
> +	[AUD_CLKID_MST_C_MCLK]		= &sm1_mst_c_mclk.hw,
> +	[AUD_CLKID_MST_D_MCLK]		= &sm1_mst_d_mclk.hw,
> +	[AUD_CLKID_MST_E_MCLK]		= &sm1_mst_e_mclk.hw,
> +	[AUD_CLKID_MST_F_MCLK]		= &sm1_mst_f_mclk.hw,
> +	[AUD_CLKID_SPDIFOUT_CLK_SEL]	= &spdifout_clk_sel.hw,
> +	[AUD_CLKID_SPDIFOUT_CLK_DIV]	= &spdifout_clk_div.hw,
> +	[AUD_CLKID_SPDIFOUT_CLK]	= &spdifout_clk.hw,
> +	[AUD_CLKID_SPDIFOUT_B_CLK_SEL]	= &spdifout_b_clk_sel.hw,
> +	[AUD_CLKID_SPDIFOUT_B_CLK_DIV]	= &spdifout_b_clk_div.hw,
> +	[AUD_CLKID_SPDIFOUT_B_CLK]	= &spdifout_b_clk.hw,
> +	[AUD_CLKID_SPDIFIN_CLK_SEL]	= &spdifin_clk_sel.hw,
> +	[AUD_CLKID_SPDIFIN_CLK_DIV]	= &spdifin_clk_div.hw,
> +	[AUD_CLKID_SPDIFIN_CLK]		= &spdifin_clk.hw,
> +	[AUD_CLKID_PDM_DCLK_SEL]	= &pdm_dclk_sel.hw,
> +	[AUD_CLKID_PDM_DCLK_DIV]	= &pdm_dclk_div.hw,
> +	[AUD_CLKID_PDM_DCLK]		= &pdm_dclk.hw,
> +	[AUD_CLKID_PDM_SYSCLK_SEL]	= &pdm_sysclk_sel.hw,
> +	[AUD_CLKID_PDM_SYSCLK_DIV]	= &pdm_sysclk_div.hw,
> +	[AUD_CLKID_PDM_SYSCLK]		= &pdm_sysclk.hw,
> +	[AUD_CLKID_MST_A_SCLK_PRE_EN]	= &mst_a_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_B_SCLK_PRE_EN]	= &mst_b_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_C_SCLK_PRE_EN]	= &mst_c_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_D_SCLK_PRE_EN]	= &mst_d_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_E_SCLK_PRE_EN]	= &mst_e_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_F_SCLK_PRE_EN]	= &mst_f_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_A_SCLK_DIV]	= &mst_a_sclk_div.hw,
> +	[AUD_CLKID_MST_B_SCLK_DIV]	= &mst_b_sclk_div.hw,
> +	[AUD_CLKID_MST_C_SCLK_DIV]	= &mst_c_sclk_div.hw,
> +	[AUD_CLKID_MST_D_SCLK_DIV]	= &mst_d_sclk_div.hw,
> +	[AUD_CLKID_MST_E_SCLK_DIV]	= &mst_e_sclk_div.hw,
> +	[AUD_CLKID_MST_F_SCLK_DIV]	= &mst_f_sclk_div.hw,
> +	[AUD_CLKID_MST_A_SCLK_POST_EN]	= &mst_a_sclk_post_en.hw,
> +	[AUD_CLKID_MST_B_SCLK_POST_EN]	= &mst_b_sclk_post_en.hw,
> +	[AUD_CLKID_MST_C_SCLK_POST_EN]	= &mst_c_sclk_post_en.hw,
> +	[AUD_CLKID_MST_D_SCLK_POST_EN]	= &mst_d_sclk_post_en.hw,
> +	[AUD_CLKID_MST_E_SCLK_POST_EN]	= &mst_e_sclk_post_en.hw,
> +	[AUD_CLKID_MST_F_SCLK_POST_EN]	= &mst_f_sclk_post_en.hw,
> +	[AUD_CLKID_MST_A_SCLK]		= &mst_a_sclk.hw,
> +	[AUD_CLKID_MST_B_SCLK]		= &mst_b_sclk.hw,
> +	[AUD_CLKID_MST_C_SCLK]		= &mst_c_sclk.hw,
> +	[AUD_CLKID_MST_D_SCLK]		= &mst_d_sclk.hw,
> +	[AUD_CLKID_MST_E_SCLK]		= &mst_e_sclk.hw,
> +	[AUD_CLKID_MST_F_SCLK]		= &mst_f_sclk.hw,
> +	[AUD_CLKID_MST_A_LRCLK_DIV]	= &mst_a_lrclk_div.hw,
> +	[AUD_CLKID_MST_B_LRCLK_DIV]	= &mst_b_lrclk_div.hw,
> +	[AUD_CLKID_MST_C_LRCLK_DIV]	= &mst_c_lrclk_div.hw,
> +	[AUD_CLKID_MST_D_LRCLK_DIV]	= &mst_d_lrclk_div.hw,
> +	[AUD_CLKID_MST_E_LRCLK_DIV]	= &mst_e_lrclk_div.hw,
> +	[AUD_CLKID_MST_F_LRCLK_DIV]	= &mst_f_lrclk_div.hw,
> +	[AUD_CLKID_MST_A_LRCLK]		= &mst_a_lrclk.hw,
> +	[AUD_CLKID_MST_B_LRCLK]		= &mst_b_lrclk.hw,
> +	[AUD_CLKID_MST_C_LRCLK]		= &mst_c_lrclk.hw,
> +	[AUD_CLKID_MST_D_LRCLK]		= &mst_d_lrclk.hw,
> +	[AUD_CLKID_MST_E_LRCLK]		= &mst_e_lrclk.hw,
> +	[AUD_CLKID_MST_F_LRCLK]		= &mst_f_lrclk.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK_SEL]	= &tdmin_a_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK_SEL]	= &tdmin_b_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_C_SCLK_SEL]	= &tdmin_c_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK_SEL]	= &tdmin_lb_sclk_sel.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK_SEL]	= &tdmout_a_sclk_sel.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK_SEL]	= &tdmout_b_sclk_sel.hw,
> +	[AUD_CLKID_TDMOUT_C_SCLK_SEL]	= &tdmout_c_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK_PRE_EN]	= &tdmin_a_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK_PRE_EN]	= &tdmin_b_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_C_SCLK_PRE_EN]	= &tdmin_c_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK_PRE_EN] = &tdmin_lb_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK_PRE_EN] = &tdmout_a_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK_PRE_EN] = &tdmout_b_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMOUT_C_SCLK_PRE_EN] = &tdmout_c_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK_POST_EN] = &tdmin_a_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK_POST_EN] = &tdmin_b_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_C_SCLK_POST_EN] = &tdmin_c_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK_POST_EN] = &tdmin_lb_sclk_post_en.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK_POST_EN] = &tdmout_a_sclk_post_en.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK_POST_EN] = &tdmout_b_sclk_post_en.hw,
> +	[AUD_CLKID_TDMOUT_C_SCLK_POST_EN] = &tdmout_c_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK]	= &tdmin_a_sclk.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK]	= &tdmin_b_sclk.hw,
> +	[AUD_CLKID_TDMIN_C_SCLK]	= &tdmin_c_sclk.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK]	= &tdmin_lb_sclk.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK]	= &g12a_tdmout_a_sclk.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK]	= &g12a_tdmout_b_sclk.hw,
> +	[AUD_CLKID_TDMOUT_C_SCLK]	= &g12a_tdmout_c_sclk.hw,
> +	[AUD_CLKID_TDMIN_A_LRCLK]	= &tdmin_a_lrclk.hw,
> +	[AUD_CLKID_TDMIN_B_LRCLK]	= &tdmin_b_lrclk.hw,
> +	[AUD_CLKID_TDMIN_C_LRCLK]	= &tdmin_c_lrclk.hw,
> +	[AUD_CLKID_TDMIN_LB_LRCLK]	= &tdmin_lb_lrclk.hw,
> +	[AUD_CLKID_TDMOUT_A_LRCLK]	= &tdmout_a_lrclk.hw,
> +	[AUD_CLKID_TDMOUT_B_LRCLK]	= &tdmout_b_lrclk.hw,
> +	[AUD_CLKID_TDMOUT_C_LRCLK]	= &tdmout_c_lrclk.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD0]	= &s4_tdm_mclk_pad_0.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD1]	= &s4_tdm_mclk_pad_1.hw,
> +	[AUD_CLKID_TDM_LRCLK_PAD0]	= &s4_tdm_lrclk_pad_0.hw,
> +	[AUD_CLKID_TDM_LRCLK_PAD1]	= &s4_tdm_lrclk_pad_1.hw,
> +	[AUD_CLKID_TDM_LRCLK_PAD2]	= &s4_tdm_lrclk_pad_2.hw,
> +	[AUD_CLKID_TDM_SCLK_PAD0]	= &s4_tdm_sclk_pad_0.hw,
> +	[AUD_CLKID_TDM_SCLK_PAD1]	= &s4_tdm_sclk_pad_1.hw,
> +	[AUD_CLKID_TDM_SCLK_PAD2]	= &s4_tdm_sclk_pad_2.hw,
> +	[AUD_CLKID_TOP]			= &sm1_aud_top.hw,
> +	[AUD_CLKID_TORAM]		= &toram.hw,
> +	[AUD_CLKID_EQDRC]		= &eqdrc.hw,
> +	[AUD_CLKID_RESAMPLE_B]		= &resample_b.hw,
> +	[AUD_CLKID_TOVAD]		= &tovad.hw,
> +	[AUD_CLKID_LOCKER]		= &locker.hw,
> +	[AUD_CLKID_SPDIFIN_LB]		= &spdifin_lb.hw,
> +	[AUD_CLKID_FRDDR_D]		= &frddr_d.hw,
> +	[AUD_CLKID_TODDR_D]		= &toddr_d.hw,
> +	[AUD_CLKID_LOOPBACK_B]		= &loopback_b.hw,
> +	[AUD_CLKID_CLK81_EN]		= &sm1_clk81_en.hw,
> +	[AUD_CLKID_SYSCLK_A_DIV]	= &sm1_sysclk_a_div.hw,
> +	[AUD_CLKID_SYSCLK_A_EN]		= &sm1_sysclk_a_en.hw,
> +	[AUD_CLKID_SYSCLK_B_DIV]	= &sm1_sysclk_b_div.hw,
> +	[AUD_CLKID_SYSCLK_B_EN]		= &sm1_sysclk_b_en.hw,
> +	[AUD_CLKID_EARCRX]		= &earcrx.hw,
> +	[AUD_CLKID_EARCRX_CMDC_SEL]	= &sm1_earcrx_cmdc_clk_sel.hw,
> +	[AUD_CLKID_EARCRX_CMDC_DIV]	= &sm1_earcrx_cmdc_clk_div.hw,
> +	[AUD_CLKID_EARCRX_CMDC]		= &sm1_earcrx_cmdc_clk.hw,
> +	[AUD_CLKID_EARCRX_DMAC_SEL]	= &sm1_earcrx_dmac_clk_sel.hw,
> +	[AUD_CLKID_EARCRX_DMAC_DIV]	= &sm1_earcrx_dmac_clk_div.hw,
> +	[AUD_CLKID_EARCRX_DMAC]		= &sm1_earcrx_dmac_clk.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD0_SEL]		= &s4_tdm_mclk_pad0_sel.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD1_SEL]       = &s4_tdm_mclk_pad1_sel.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD0_DIV]		= &s4_tdm_mclk_pad0_div.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD1_DIV]       = &s4_tdm_mclk_pad1_div.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD2]	        = &s4_tdm_mclk_pad_2.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD2_SEL]		= &s4_tdm_mclk_pad2_sel.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD2_DIV]       = &s4_tdm_mclk_pad2_div.hw,
> +	[AUD_CLKID_TDM_SCLK_PAD3]	= &s4_tdm_sclk_pad_3.hw,
> +	[AUD_CLKID_TDM_SCLK_PAD4]	= &s4_tdm_sclk_pad_4.hw,
> +	[AUD_CLKID_TDM_LRCLK_PAD3]	= &s4_tdm_lrclk_pad_3.hw,
> +	[AUD_CLKID_TDM_LRCLK_PAD4]	= &s4_tdm_lrclk_pad_4.hw,
> +};
>  
>  /* Convenience table to populate regmap in .probe(). */
>  static struct clk_regmap *const axg_clk_regmaps[] = {
> @@ -1678,6 +1902,174 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
>  	&sm1_earcrx_dmac_clk,
>  };
>  
> +static struct clk_regmap *const s4_clk_regmaps[] = {
> +	&ddr_arb,
> +	&pdm,
> +	&tdmin_a,
> +	&tdmin_b,
> +	&tdmin_c,
> +	&tdmin_lb,
> +	&tdmout_a,
> +	&tdmout_b,
> +	&tdmout_c,
> +	&frddr_a,
> +	&frddr_b,
> +	&frddr_c,
> +	&toddr_a,
> +	&toddr_b,
> +	&toddr_c,
> +	&loopback,
> +	&spdifin,
> +	&spdifout,
> +	&resample,
> +	&spdifout_b,
> +	&sm1_mst_a_mclk_sel,
> +	&sm1_mst_b_mclk_sel,
> +	&sm1_mst_c_mclk_sel,
> +	&sm1_mst_d_mclk_sel,
> +	&sm1_mst_e_mclk_sel,
> +	&sm1_mst_f_mclk_sel,
> +	&sm1_mst_a_mclk_div,
> +	&sm1_mst_b_mclk_div,
> +	&sm1_mst_c_mclk_div,
> +	&sm1_mst_d_mclk_div,
> +	&sm1_mst_e_mclk_div,
> +	&sm1_mst_f_mclk_div,
> +	&sm1_mst_a_mclk,
> +	&sm1_mst_b_mclk,
> +	&sm1_mst_c_mclk,
> +	&sm1_mst_d_mclk,
> +	&sm1_mst_e_mclk,
> +	&sm1_mst_f_mclk,
> +	&spdifout_clk_sel,
> +	&spdifout_clk_div,
> +	&spdifout_clk,
> +	&spdifin_clk_sel,
> +	&spdifin_clk_div,
> +	&spdifin_clk,
> +	&pdm_dclk_sel,
> +	&pdm_dclk_div,
> +	&pdm_dclk,
> +	&pdm_sysclk_sel,
> +	&pdm_sysclk_div,
> +	&pdm_sysclk,
> +	&mst_a_sclk_pre_en,
> +	&mst_b_sclk_pre_en,
> +	&mst_c_sclk_pre_en,
> +	&mst_d_sclk_pre_en,
> +	&mst_e_sclk_pre_en,
> +	&mst_f_sclk_pre_en,
> +	&mst_a_sclk_div,
> +	&mst_b_sclk_div,
> +	&mst_c_sclk_div,
> +	&mst_d_sclk_div,
> +	&mst_e_sclk_div,
> +	&mst_f_sclk_div,
> +	&mst_a_sclk_post_en,
> +	&mst_b_sclk_post_en,
> +	&mst_c_sclk_post_en,
> +	&mst_d_sclk_post_en,
> +	&mst_e_sclk_post_en,
> +	&mst_f_sclk_post_en,
> +	&mst_a_sclk,
> +	&mst_b_sclk,
> +	&mst_c_sclk,
> +	&mst_d_sclk,
> +	&mst_e_sclk,
> +	&mst_f_sclk,
> +	&mst_a_lrclk_div,
> +	&mst_b_lrclk_div,
> +	&mst_c_lrclk_div,
> +	&mst_d_lrclk_div,
> +	&mst_e_lrclk_div,
> +	&mst_f_lrclk_div,
> +	&mst_a_lrclk,
> +	&mst_b_lrclk,
> +	&mst_c_lrclk,
> +	&mst_d_lrclk,
> +	&mst_e_lrclk,
> +	&mst_f_lrclk,
> +	&tdmin_a_sclk_sel,
> +	&tdmin_b_sclk_sel,
> +	&tdmin_c_sclk_sel,
> +	&tdmin_lb_sclk_sel,
> +	&tdmout_a_sclk_sel,
> +	&tdmout_b_sclk_sel,
> +	&tdmout_c_sclk_sel,
> +	&tdmin_a_sclk_pre_en,
> +	&tdmin_b_sclk_pre_en,
> +	&tdmin_c_sclk_pre_en,
> +	&tdmin_lb_sclk_pre_en,
> +	&tdmout_a_sclk_pre_en,
> +	&tdmout_b_sclk_pre_en,
> +	&tdmout_c_sclk_pre_en,
> +	&tdmin_a_sclk_post_en,
> +	&tdmin_b_sclk_post_en,
> +	&tdmin_c_sclk_post_en,
> +	&tdmin_lb_sclk_post_en,
> +	&tdmout_a_sclk_post_en,
> +	&tdmout_b_sclk_post_en,
> +	&tdmout_c_sclk_post_en,
> +	&tdmin_a_sclk,
> +	&tdmin_b_sclk,
> +	&tdmin_c_sclk,
> +	&tdmin_lb_sclk,
> +	&g12a_tdmout_a_sclk,
> +	&g12a_tdmout_b_sclk,
> +	&g12a_tdmout_c_sclk,
> +	&tdmin_a_lrclk,
> +	&tdmin_b_lrclk,
> +	&tdmin_c_lrclk,
> +	&tdmin_lb_lrclk,
> +	&tdmout_a_lrclk,
> +	&tdmout_b_lrclk,
> +	&tdmout_c_lrclk,
> +	&spdifout_b_clk_sel,
> +	&spdifout_b_clk_div,
> +	&spdifout_b_clk,
> +	&s4_tdm_mclk_pad_0,
> +	&s4_tdm_mclk_pad_1,
> +	&s4_tdm_lrclk_pad_0,
> +	&s4_tdm_lrclk_pad_1,
> +	&s4_tdm_lrclk_pad_2,
> +	&s4_tdm_sclk_pad_0,
> +	&s4_tdm_sclk_pad_1,
> +	&s4_tdm_sclk_pad_2,
> +	&sm1_aud_top,
> +	&toram,
> +	&eqdrc,
> +	&resample_b,
> +	&tovad,
> +	&locker,
> +	&spdifin_lb,
> +	&frddr_d,
> +	&toddr_d,
> +	&loopback_b,
> +	&sm1_clk81_en,
> +	&sm1_sysclk_a_div,
> +	&sm1_sysclk_a_en,
> +	&sm1_sysclk_b_div,
> +	&sm1_sysclk_b_en,
> +	&earcrx,
> +	&sm1_earcrx_cmdc_clk_sel,
> +	&sm1_earcrx_cmdc_clk_div,
> +	&sm1_earcrx_cmdc_clk,
> +	&sm1_earcrx_dmac_clk_sel,
> +	&sm1_earcrx_dmac_clk_div,
> +	&sm1_earcrx_dmac_clk,
> +	&s4_tdm_mclk_pad0_sel,
> +	&s4_tdm_mclk_pad1_sel,
> +	&s4_tdm_mclk_pad0_div,
> +	&s4_tdm_mclk_pad1_div,
> +	&s4_tdm_mclk_pad_2,
> +	&s4_tdm_mclk_pad2_sel,
> +	&s4_tdm_mclk_pad2_div,
> +	&s4_tdm_sclk_pad_3,
> +	&s4_tdm_sclk_pad_4,
> +	&s4_tdm_lrclk_pad_3,
> +	&s4_tdm_lrclk_pad_4,
> +};
> +
>  struct axg_audio_reset_data {
>  	struct reset_controller_dev rstc;
>  	struct regmap *map;
> @@ -1822,7 +2214,6 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  			continue;
>  
>  		name = hw->init->name;
> -
>  		ret = devm_clk_hw_register(dev, hw);
>  		if (ret) {
>  			dev_err(dev, "failed to register clock %s\n", name);
> @@ -1886,6 +2277,18 @@ static const struct audioclk_data sm1_audioclk_data = {
>  	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
>  };
>  
> +static const struct audioclk_data s4_audioclk_data = {
> +	.regmap_clks = s4_clk_regmaps,
> +	.regmap_clk_num = ARRAY_SIZE(s4_clk_regmaps),
> +	.hw_clks = {
> +		.hws = s4_audio_hw_clks,
> +		.num = ARRAY_SIZE(s4_audio_hw_clks),
> +	},
> +	.reset_offset = AUDIO_SM1_SW_RESET0,
> +	.reset_num = 39,
> +	.max_register = AUDIO_S4_SCLK_PAD_CTRL1,
> +};
> +
>  static const struct of_device_id clkc_match_table[] = {
>  	{
>  		.compatible = "amlogic,axg-audio-clkc",
> @@ -1896,7 +2299,10 @@ static const struct of_device_id clkc_match_table[] = {
>  	}, {
>  		.compatible = "amlogic,sm1-audio-clkc",
>  		.data = &sm1_audioclk_data
> -	}, {}
> +	}, {
> +		.compatible = "amlogic,s4-audio-clkc",
> +		.data = &s4_audioclk_data
> +	}, { }
>  };
>  MODULE_DEVICE_TABLE(of, clkc_match_table);
>  
> diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
> index 9e7765b630c96a8029140539ffda789b7db5277a..2dd1c41d775da8f91ed281470d06e9c970cfc92c 100644
> --- a/drivers/clk/meson/axg-audio.h
> +++ b/drivers/clk/meson/axg-audio.h
> @@ -66,5 +66,9 @@
>  #define AUDIO_CLK81_EN		0x034
>  #define AUDIO_EARCRX_CMDC_CLK_CTRL	0x0D0
>  #define AUDIO_EARCRX_DMAC_CLK_CTRL	0x0D4
> +#define AUDIO_S4_MCLK_PAD_CTRL0 0xE80
> +#define AUDIO_S4_MCLK_PAD_CTRL1 0xE84
> +#define AUDIO_S4_SCLK_PAD_CTRL0 0xE88
> +#define AUDIO_S4_SCLK_PAD_CTRL1 0xE8C
>  
>  #endif /*__AXG_AUDIO_CLKC_H */

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
