Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FCFC54E60
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 19:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcJdNdxectfLDm7+hGtjsKasuAwUFgAZRMf8gPOmvs4=; b=GJwMZo91m7w0Z4
	tg/yBh+m9gkmm1sU5TsULtHwtOriboG5Ob1oidrrR4fJqLU4S7RliK66VIlgTcUuPQdqMhFfug7MB
	T1p/ckyktduDeuqEyvRSxOzAdasCoWaSn6imSCV78HAw3zR9W0F4+1RoLldbZrc9sgr3z5A/WDukS
	M+qmleZKx2TrHOfi9TU/2G849FFmltItnNjSXAum5FwACDgfTwBfhULapVcOEzzsfXPew3I3C1ocu
	vFcXOSayCpYPRyd3Lt++vJceLKRNX08nj7jp9Q91YooTcwx4YG7DCKv1PUOJGvYgQ6y4Y29L5jKCL
	iVJnazeP/0n6eiY2SPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvn2-000000068F0-0uCY;
	Sun, 17 Mar 2024 19:03:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvmy-000000068Dz-2l5X;
	Sun, 17 Mar 2024 19:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 784A560B21;
	Sun, 17 Mar 2024 19:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF428C433C7;
	Sun, 17 Mar 2024 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710702199;
	bh=jxULVwpCUVr9kQOyAisgtABRYa85JCUAZu0zVjCuxi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xi1NLRdeQz3riPNdP1ZHBPXe07dfHk/rdBMlDxr2BAuWQwtUOT7wvm3iubrbXXRN0
	 3vowVuTwWxL1s7iACpQuBk/vkRcZCT/JJ5Z8c0tC3QPuziteHXLw3/Z8COb++V4GZ6
	 2eyOGxxt+APWQCchtJO/NvGK5HaFgYvHfO0lBLoy0k/h0fGna/hRg7DfRtlUG4KMxh
	 1rZDa2CW6huDD/xp9X1X85VVCwEm1JLvFApN8U15+hRS7536bgd+HACCcW/V9KWZgw
	 u+cyv0lcIr6NEMbrcKFNSdZn6Qi22PoIuJVZ9TF7SQyVWhwOpcVhuQs3cnSvP1x8Fd
	 JSiL782nMVAlg==
Date: Sun, 17 Mar 2024 13:03:16 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH 11/25] ASoC: dt-bindings: meson: t9015: add support for
 A1 SoC family
Message-ID: <20240317190316.GA2071139-robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-12-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-12-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_120320_840745_97996034 
X-CRM114-Status: GOOD (  13.79  )
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

On Fri, Mar 15, 2024 at 02:21:47AM +0300, Jan Dakinevich wrote:
> Add "amlogic,t9015-a1" compatible string.

That's obvious from the diff. Perhaps what does 'a1' mean? What the 
difference from the existing compatible?

> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> index 5f5cccdbeb34..ee8bd57dbcf9 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> @@ -21,7 +21,9 @@ properties:
>  
>    compatible:
>      items:
> -      - const: amlogic,t9015
> +      - enum:
> +          - amlogic,t9015
> +          - amlogic,t9015-a1
>  
>    clocks:
>      items:
> -- 
> 2.34.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
