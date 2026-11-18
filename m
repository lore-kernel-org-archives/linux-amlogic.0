Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CEB606A31C
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R52v6L0/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aJUXly80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ro595GyqaiJ790yiB5tvbT2HKiU8KQa/XJy7Ot76j3M=; b=R52v6L0/kK87PNu3ruMcarchan
	TjdLdTIK9LEsvaRH7CFWQJKNDewP2bJhk0lQH/InqHqHArxDxBW8tQwZpp2Mngm2QicCTvbFXrdOA
	dx6XpJcsRMCJSghtvgBRRnmMjhRmINLNZ8BI0xt0dQ+YZttFp1iZ0QfO6ECQMWIRu2gPkpoHXn6Cn
	LSzFcKF06EflkoMxGeapaedeqgUeLk/hJprI7d8BlhuzP5WxC48jeC/+cOHKcS0oMaiUxYuMt68rg
	GYb4wqr9axyzxGul648G8tml7Tjbg87wVlUAyqQetJJK/niS2OiMrYroHoAyCPZqIDk+sTduW498u
	llCIIbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkl7-0000000A2Ik-0Iem;
	Wed, 18 Nov 2026 18:51:53 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkl2-0000000A2Hv-250c
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 18:51:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e10a70540so882738f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2026 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795027905; x=1795632705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xr3ARsn3HSOBe/bAlEDhSRHDkU6XOfuvo4/af9LL+fg=;
        b=aJUXly80825iO7DMUIASpKWh90udCsEysDSnJhMBbc61ZVbzcKLWgsSwv4hqz1txhU
         JOceKWi7Dze3CWW0ULcJ4gdcC3n8lujHWC8ranUZFd1wE1n8qObmpUMD1lX+RsPLRbHX
         QqQdnoJH2IfXWagGgKonYyDlgwE+eYS+TsRn5Tz54esiIir+X0lChsTBiKtDaAX3R50q
         +l2qO21Vyf3tk8wpKaRqhYBGMlWaprex5jRVcy+5yemfYVO4uafACOodYS7QdXjJ+5Qi
         2vYwFNGttOGjj82+SN3ZBP3TB1Xzg7Z5t0mSdACqEUZPzPESQFCERYyEIrC5pxeDixm1
         FpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027905; x=1795632705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xr3ARsn3HSOBe/bAlEDhSRHDkU6XOfuvo4/af9LL+fg=;
        b=mQ/OohLOtrkxgbm+QB5nMYFYlKTymjc305KNznuFJDCFIJLGtoL6o5jFe7HiiNaTdL
         pxgLmNqPbofJtTWSvY5afM7hp8xAyaDcH+Ubf1eOpqXhEcl6eleMXu6BptWB4Tv/o9Mr
         PR3CnmVg+OFOem0d0mcGLXbTaPVI2KaFRq0HS82tLwyZ64/P8mAXymKKM4cFUB5VghSa
         s7PUnhWRXN+FnhpvKvMD6RWd7ig8I09KIipEpK9VweQx1T9zYtInbjeng6MWjUweC9gT
         ObGxovKh21gmU7f0LE65wkwXPEBP6HeVyhThGKnLGZ1kzuNIpsBUj/Wx0uXDM4Tpc8kw
         ngaA==
X-Forwarded-Encrypted: i=1; AL+hErF9NhUZ5/f1FJiv/hFPBMCWSriW0Gbjpr04BmbAUexSDBNxq925CaEC07ZcuGmoH+/IFtDFiaFq/tRqTmQy@lists.infradead.org
X-Gm-Message-State: APuU4Z8U+0LpZzMgYpwC0FVOSC0xnjSnJaK3u3JnG2ufkrPmM1N/GeCA
	+kwoIdZZ5kA2w1jR+YkmPrZ0gFKMP0PSCwDBRlyqsGawK3a1M3zqTOLbKCgPZjBBBc0=
X-Gm-Gg: AZFdTZdeT6dBIKKQbTm+unkp4o4yV35wpZJzqfF7dHSc0jRTQE2GB781BN/LvobdiUv
	EFf/m7ya1DmHQPlqSx3FZq1nJ6CuNW/J040a5s3k6Eug190XREMlseDE7TZRMAGwQAhY5K8a7kC
	UcXzc6NjE4TIosttm3G37gKHPDreO+CcqPBhotx+V1piA+wTrJjMB1kx/A4YC/c1LDhmKcD3cNr
	yA2l1MeFKHmfv/GlsgmaBgog+rPPToYJGxHB6NrRZDiAAk7NlW045dWKhrIHzrUJGylGHxG0vDC
	XswV4BBVgwLoCJoV3hkjbw93FBl0czHQpKhRoT25FX44aGJmu8PlBGs+VP8bmT2UkRmWzqF0OL7
	Aq1aO19THcHGhY6DfcxUbnPApko4q6KBAF2utxk4VU4VR45oeiiRaoB5esXSxkGDYsiuGVuNLLC
	lyPZ5cvjcHvJVJbLdtjPAVtH3QO6+owC1nvUmpPs7MTS/dBkTwJGouUFM3qFh2h9kK/CRqxZTqS
	Fvb3hKsL1pNfFlYceoiKdmue4y2yJeM8oQDAG06aCLLaRznq2JWurYiXgI/9pV9+u9oGQqK7ubW
	OLDsjasALziermDk1exERuCPy8Pg0eicMtKB+uOg9rC+yDp8yFBhdFE1mc9PsMO3ASyHyQYwjCh
	zpbrfK9OLeyxqIdwiMVbvepnMzHelL+83Ryi7CPoZSQlxNw==
X-Received: by 2002:a05:6000:2601:b0:4a8:647c:f965 with SMTP id ffacd0b85a97d-4a8648c3f15mr2958154f8f.41.1795027905569;
        Wed, 18 Nov 2026 10:51:45 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm5807868f8f.10.2026.11.18.10.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:51:45 -0800 (PST)
Date: Wed, 18 Nov 2026 19:51:41 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
Message-ID: <av2kitSLJNxlAKiv@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
 <179499607256.413320.18141155995846183804.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <179499607256.413320.18141155995846183804.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_105148_570915_417D00BD 
X-CRM114-Status: GOOD (  27.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > The S7 PLL controller provides the fixed PLL with its fclk dividers,
> > the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.
> > 
> > Add a driver for it. The GP0 and HIFI PLLs are expected to run with
> > their input divided by 2 (div0p5) and the HDMI PLL without it, as the
> > firmware and the init sequences set them up.
> > 
> > Signed-off-by: Carlo Caione <ccaione@baylibre.com>> > +

[...]
> > +/* The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field */
> 
> Not sure what this imply ?

It means that each of the five bits enables one divider, while the
datasheet only documents the five bits as a single field. I'll reword
the comment to say that.

> > +S7_FCLK(fclk_div2, 1, 2, FIXPLL_CTRL1, 30);
> > +S7_FCLK(fclk_div3, 1, 3, FIXPLL_CTRL1, 26);
> > +S7_FCLK(fclk_div4, 1, 4, FIXPLL_CTRL1, 27);
> > +S7_FCLK(fclk_div5, 1, 5, FIXPLL_CTRL1, 28);
> > +S7_FCLK(fclk_div7, 1, 7, FIXPLL_CTRL1, 29);
> > +S7_FCLK(fclk_div2p5, 2, 5, FIXPLL_CTRL0, 25);
> > +
> > +static const struct pll_mult_range s7_pll_mult_range = {
> > +	.min = 134,
> > +	.max = 265,
> > +};
> > +
> > +static const struct reg_sequence s7_gp0_pll_init_regs[] = {
> > +	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
> > +	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
> > +	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
> > +	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
> > +};
> > +
> > +static struct clk_fixed_factor s7_gp0_pll_div0p5 = {
> > +	.mult = 1,
> > +	.div = 2,
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "gp0_pll_div0p5",
> > +		.ops = &clk_fixed_factor_ops,
> > +		.parent_data = &(const struct clk_parent_data) {
> > +			.fw_name = "gp0",
> > +		},
> > +		.num_parents = 1,
> > +	},
> 
> Is it the good old predivider here ? Shouldn't it be modelled with
> a read-only divider rather that a fixed factor ? just in case whatever
> came before did not leave things as we first expected ?
> 
> Applies to the other PLL instances

Nope, not the good old provider, this is separate from N: N is in CTRL0
and our init sequence sets it to 1. This is CTRL1[27], div0p5_en.

Now, it was indeed a read-only divider in an earlier (messier and
unpublished) version. The problem was that with a cold PLL it could
cache the power-on setting (/1) at registration, then the VCO init
sequence would enable /2 without updating that cached parent rate
basically breaking both rate reporting and set_rate. The fixed factor
avoids this mismatch when Linux initializes the PLL.

After dropping NOINIT_ENABLED from the HIFI PLLs, the remaining
assumption is that an already-running GP0 has div0p5 enabled. That
matches the firmware I tested, but the driver does not check it.

I could (in theory) return to read-only dividers but with probe-time
setup before registering the clocks to establish the divider setting for
PLLs Linux will initialize, and selecting suitable multiplier limits for
any inherited setting we preserve (the current limits assume /2).

Any preference (or any other approach at all)?

[...]
> > +/* hifi is HIFI0 in the datasheet */
> 
> What is stopping us from calling that then ?

Nothing, I kept the S4 name.

[...]
> > +/*
> > + * The datasheet documents HDMIPLL_CTRL2[22:19] and [18:15] as single fields:
> > + * each is two power-of-two dividers.
> 
> This comment is somehow confusing because it only partialy matches the clocks
> defined bellow. Please clarify.

Riiight. [22:19] holds od0 [20:19] and od1 [22:21], and [18:15] holds
the hdmi_pll divider [16:15] plus [18:17], which isn't modelled. I'll
clarify.

Thanks,

--
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
