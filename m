Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9450C54E67
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 19:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXBBulvrcXx85WdHafwlu4L0OQQIt2WZNVSagjUZznk=; b=k5xZ3nS5xkb91I
	Ac5/MUc8OljL4rVxNX634wFe421JcwpT3LoQnDCHIhf+cB3NiT+QCBWnhaxtJhOw4X1PWzBsHrFWX
	wMMibIUz1Pc+3J3Wk6y8kp/RByvJFdd360yYZ1I49us+JLzXRWTRIdESaLfjBPV7hxHvem2+zX+Jy
	UzoGFdCPHyOc7wdN3NGhCu02tTJsKQMXiLJmeGrCKdQ45GmXTD0zDCpJ2ckJvr5fytJohBiw0hswr
	kD4Tf6E9SYGa+TGnprlsrV3VU5USCTWw5jDdLlV5blNWY1jwC938opZ4S/Ycu2/TcO+a4iPvHwttq
	PxfA/fIJM/Uzx2B/a+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvxn-00000006APx-3JOG;
	Sun, 17 Mar 2024 19:14:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvxk-00000006APC-3Die;
	Sun, 17 Mar 2024 19:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C942D60B8C;
	Sun, 17 Mar 2024 19:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F67C433F1;
	Sun, 17 Mar 2024 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710702866;
	bh=fztyQgbF2q1PoJtiGulktjTHyUhlHcKdvlGV1V2IrWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Czq4BK2uZkizeJ8j9pxUjylVlTTZiixjX/OQAeXZE3CCK3ozdfkU3QT6VfDA8EVdb
	 QwJECovGef+zpZH1YYoBZbnusq5LB7GgKd9aYM3WPjvowQbmDNXblNlPr384UbAHrH
	 Ty+5SEprnxK3ewfqWkYu27lx55p5eQXuI4qOzeyqP8XrOdIDKmaHX2F/opT2USpUVK
	 +FusKo2TRReDaiOTfNGPscYskM2UXGBGxDKyEuRwGJPRGJ9KjzXg9ciMEEiERGbQyY
	 WGsEbV4HBY24+Ot9Pj4Wl0tRgL9myDmj/GdcTx94cxoFswDbS2GsYbTY8P+d2Wet8H
	 7eljF77ZnHYHQ==
Date: Sun, 17 Mar 2024 13:14:24 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	kernel@salutedevices.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Philipp Zabel <p.zabel@pengutronix.de>, alsa-devel@alsa-project.org,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 18/25] ASoC: dt-bindings: meson: axg-pdm: claim support
 of A1 SoC family
Message-ID: <171070286359.2088899.4357091464110739659.robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-19-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-19-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_121428_867215_00F0FD93 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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


On Fri, 15 Mar 2024 02:21:54 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-pdm" compatible string alias to "amlogic,axg-pdm".
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
