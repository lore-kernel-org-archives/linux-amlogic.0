Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB2606A322
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2026 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rxsqan35;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPDjmvlj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G8Ule6R3Uq4qzP7AzenPphKimvT7gbF7PRPfw67B4ag=; b=Rxsqan357WbJKzyN6yQjgKgARA
	IOLX9Q05SM+8zr7q1VPGPUPV41C0Qib/Gu0Uvrj0Br5ROtmrpqLmf5T4rJxPYSkzK1DoDxB2k63Si
	eS8QYnpEFzK+p0Sk/4XkVc4/7lrkpcXmqPyuwQq+3UI9bFWLXV30UIuKfWLNrCfWxK0jrQJOcsYuX
	kZqgWidybaTICFaujOPYWZMjShMmITRrnvBGUN5lWIkEMJFWjo0y1J1hRFix+9Ubs3PT8j2EjkgpN
	mQVpxOShNX++/LgU3+WRJgHXMlK3SCFHUWGmcE1va8Gjze4EjYoqyZpjyDq5IVz/tBocZXsmuniDN
	MUnnXBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4xN-00000007FWe-2CyI;
	Wed, 28 Oct 2026 14:48:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4xM-00000007FWB-21zG;
	Wed, 28 Oct 2026 14:48:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F62560207;
	Wed, 28 Oct 2026 14:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D111F01825;
	Wed, 28 Oct 2026 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198927;
	bh=Dji3XbcxBruXL4du3GW6afPCNwFUKBPPMSrHsKB8V0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mPDjmvljOWfR2WCxVwsCMCTrrxvR3gprOSt1d3iQG3Qb0xD9wFM1J/3w9sbph10It
	 cfx84oETwlzAKrIiQ1InLY4zxXMSOUETRFKw0qRKkk/gwxI4cFM2FgAVhHFo5R3JRy
	 oo1c1TrYYvEb2eOouY+/Lo5PccLaI6Sb+nUbo4iLkfC3+YC91aqqBUCJBktlfYcmNh
	 BPCHOxSPtKKcMD2o4nAQnmfSa/mbqnRBpWTp9gZpuMAr6ValcNIVVPHrnKu7fHLEsX
	 lEoWiPm+Dcwg93VSIP3LXYCU9pY7ooaZCc4z5Tct5z6CO0IxJQoxu6KN+u9ygxEUjf
	 s3Qp0AyDNNxsw==
Date: Wed, 28 Oct 2026 15:48:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jian.xu@amlogic.com, 
	shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v7 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
Message-ID: <20261028-sparkling-objective-cricket-a428bd@quoll>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-1-2b9aeae9cb8a@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261021-audio_drvier-v7-1-2b9aeae9cb8a@amlogic.com>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 03:08:28PM +0800, Jiebing Chen wrote:
> The audio power domain has been found on S4 device.
> It must be enabled prior to audio operations.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4cea..69f5fef5f14a 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
> +      - amlogic,s4-audio-clkc
>        - amlogic,sm1-audio-clkc
>  
>    '#clock-cells':
> @@ -100,6 +101,8 @@ properties:
>    resets:
>      description: internal reset line
>  
> +  power-domains:
> +    maxItems: 1

Missing blank line.

>  required:
>    - compatible
>    - '#clock-cells'
> @@ -115,6 +118,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,g12a-audio-clkc
> +              - amlogic,s4-audio-clkc
>                - amlogic,sm1-audio-clkc
>      then:
>        required:
> @@ -122,7 +126,18 @@ allOf:
>      else:
>        properties:
>          '#reset-cells': false
> -
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,s4-audio-clkc
> +    then:
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false

And here as well.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
