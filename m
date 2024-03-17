Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD42C54E60
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 19:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pme/Rmy5kQfsyvkQLI2tYoi/ng7sKyb/z3K9n7uB5aU=; b=wIHxpD/6zCuQCX
	h9jn4gMnuQMgKAxLI7QNrqToPJZ1p98gQBq8BcWWWwiHI2xi+Sc3673TyIAE154lTSja/99vKBH36
	6ibsNpzlQvkMv9NhQ7MFXTxIrmJuLf78RSwG/j3dv+nazESGEQvxm+QV8F+WneaFr7wpZ9+PAXx6+
	np1aEgHuRhpAwKOHoPUirjOPa389KeMzseguKcI09eFZshQ7tn4gm+L53PyivCtFy8An63qdtuZLW
	5fFA8gz1OMDlTlyqeQiBrOZS2uFbocf5xA660SpIeHNiEv+zXFGlskL+dhQ20HcJUoGDg2ehZlSiF
	hxXyzMScxhCCzYiMa/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvwZ-00000006A6O-1uov;
	Sun, 17 Mar 2024 19:13:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvwW-00000006A5l-0AHo;
	Sun, 17 Mar 2024 19:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F3B560ADB;
	Sun, 17 Mar 2024 19:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CFDC433C7;
	Sun, 17 Mar 2024 19:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710702790;
	bh=JYKVdlCCGPEvfp7uaNFd4jaJ+73Ab9jX4gjFI8e6pV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mmh1P7pQhJxUV7thKu9zR+oBA53toGIgvDRcJGZ2sB8Y+vuOsZjnTYspScBo+XKez
	 Iw7JKRZvF9JNBKAhSGIYgsM9ZrwW48Uqs9zeF4TWDYmtu/l/5AbDaNh5cH9IWRRSCo
	 4Hfs7g7bYMysQ0PlGL4xTR0bYFhVz/MXt0mfs8WoTXAIB9DxuDyOq5NNkhcxrW3VA2
	 M1dVsG4tIKHOTg7N7K0jw8J0D2MUOQlP5Ic4mKPc9uTP3IqP/FQA4VxX+USI8VML+p
	 K2Iz419DngTmZKFzsBm9mHEjR11spvrjJb5k7B4cro4TIa49E6N40TluB7IdFzNiIa
	 nNF77kBni0gIQ==
Date: Sun, 17 Mar 2024 13:13:08 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	kernel@salutedevices.com, linux-gpio@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 17/25] ASoC: dt-bindings: meson: axg-fifo: claim support
 of A1 SoC family
Message-ID: <171070278776.2087227.539742040417816732.robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-18-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-18-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_121312_193425_87F1C3CF 
X-CRM114-Status: UNSURE (   7.96  )
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


On Fri, 15 Mar 2024 02:21:53 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-toddr" and "amlogic,a1-frddr" compatible string aliases
> to "amlogic,sm1-toddr" and "amlogic,sm1-frddr" respectevely.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-fifo.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
