Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31F5C02198
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Feb 2025 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnFarKjZIqUYfQ5Hz9CKVIet2OnhATHQaD4SNwPuvsQ=; b=PXfOifRDu23BfR
	eYKhKcnQjPM2B8QiyF3YQiI2w3qNUHmL5Dj/HZFUBXru3tR3gddSI/IcnEmyYkLpxbEmTA1PtNV+u
	CUGrDokSGyD9eVL76D7rjFJNtjBKMoUFVjkYT7nFzs6Dmm2vokhHsVuedlcETvYIRim5zzOFwzBoA
	uG00e4diZH31Y8XPzALxW5Wg0Y9ezpiBkcBpxFzIH0sLR2+FSu41OmuYn+Taf3uUMZI3B4prqPsaM
	BdAhfePR71NQLfdK6qw69QOqrBdaPuNl4nvl1QnlNOY32Zsds42B5E1gkDIqrx431wXKs+27/4G3P
	HKwG255k/jYNYjRxzMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIvR-00000007GfD-3MC0;
	Tue, 18 Feb 2025 08:25:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIvP-00000007Ge9-1Agl;
	Tue, 18 Feb 2025 08:25:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4610A41D2C;
	Tue, 18 Feb 2025 08:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7A8C4CEE2;
	Tue, 18 Feb 2025 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739867150;
	bh=EvID7D86PKXTeqELs9veszakyXMUP1t20zGjfOD7Rt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3r4LZVwnWLy/POh9hH3tZRQxKLNC1XClRyAHPbp2o1mm4xMHA4MRjgdRBRszn8tX
	 y7VJKFLeiz+p+r2UUM82Nptn726NNgkG/JuPjxcYYDTQIRneYDE/hKbRtXngp00Fph
	 g68+Z3QiTUgGQfW6oOOEGwZmsYRwJLkvJ8xXh0IItNPlFBaBjArVl8TDhPv76WXnuD
	 xxv2EdFS64ShgdI6qiezKwfEqLbBNmWw98LM9ys50zz9t3GqWgDmXWlOIV4jB5WlkT
	 GASt9J1eAtYDKfm+/6e9gfIP5l47Q3ERmlNZx4TuosVJPnKlT/9byu1o0WovsunJJK
	 ExYJsVmS1wKEQ==
Date: Tue, 18 Feb 2025 09:25:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
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
Subject: Re: [PATCH v2 2/5] dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
Message-ID: <20250218-opalescent-teal-of-patience-82cecb@krzk-bin>
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
 <20250214-audio_drvier-v2-2-37881fa37c9e@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250214-audio_drvier-v2-2-37881fa37c9e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_002551_381603_AD32417A 
X-CRM114-Status: GOOD (  13.10  )
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

On Fri, Feb 14, 2025 at 10:13:41AM +0800, jiebing chen wrote:
> add the s4 tocodec compatible

1. Please write full sentences.
2. We see that from the diff. Say something about hardware instead.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
> index 23f82bb89750898d20c866015bc2e1a4b0554846..ea669f4359bc81b0f45bc2105c832fc2b11d8441 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - amlogic,sm1-toacodec
> +              - amlogic,s4-toacodec

Keep alphabetical order.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
