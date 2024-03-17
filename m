Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AD4C54E60
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2r4gpmcQ04650OY3RgBo4Xh/hzyjWNthCiEbZpbLKo=; b=Mrp+W9TIrXdTEL
	QlsWpYlj1jOENoGPhpKF4PpB3HhN47nTm1q7qBtIToibUZISsro4CMaJjuWKuArA+SnpdPzOJrjk7
	xNa33HyytTEu6dXDtmQH8eQQR/xFHMTItkSBc56lrUH4QcKNqHZBf+BA2pciiAseMYvwnmSup9ViR
	U6g1AhXhQWgI2BXG4ejXpn5DGtOe//tMSQXzbEECf9h6OmAlvKfctazx8PLIxtmo/CheOytTI86fY
	wdslZbPGaqoMj3w0yttQ2FIVxjS4wyrUaipptJIYvUh16D8cY8ZJYqyZil7mCuHLN5T5nkB2zDCa+
	UrpmY1DC6+xGsZYytAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlw02-00000006Aos-38wL;
	Sun, 17 Mar 2024 19:16:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvzz-00000006Anj-3OUv;
	Sun, 17 Mar 2024 19:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EFCD6CE013C;
	Sun, 17 Mar 2024 19:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28F0C433F1;
	Sun, 17 Mar 2024 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710703004;
	bh=7wgxPIyPTJm1sbVQLW+1u/0UytpBtpCuchrtZamPsh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCdDUd6XU5vR4dSofVsop9l+p6Dl2b5mAPLEOUE7ukSv4/Y8P/BVftbMzhxOhf7LX
	 6qIkoK14BS+DxglAcIaMLD847oylzu+ss8P1wMeR/0aB68MBkwaI1zpEB8YN9tH7PQ
	 QjraJ7ZUXmNmE+XSFJhRwr6aTD30kEkxM1sG5KmeFXBGS2LEx97GbmteJwoqE7/B0P
	 JAwqVb6hONCDlvIZNVGYH9BQrBaXwAlMHQquP5Qx3kFTSDbqsr1CdAUWQD9bzjPQc4
	 XoaWBS7iu1PMSMw2U0CPddNlsPWDjJ3WoCrPWmG6teSrG8+yqviCF6Lr23hiOoYxvG
	 eXsdYplLneFhg==
Date: Sun, 17 Mar 2024 13:16:41 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
	kernel@salutedevices.com, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 20/25] ASoC: dt-bindings: meson: axg-tdm-formatters:
 claim support of A1 SoC family
Message-ID: <171070300107.2091785.7788958335533419953.robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-21-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-21-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_121648_044125_94194097 
X-CRM114-Status: UNSURE (   8.02  )
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


On Fri, 15 Mar 2024 02:21:56 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-tdmout" and "amlogic,a1-tdmin" compatible string aliases
> to "amlogic,sm1-tdmout" and "amlogic,sm1-tdmin" respectevely.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../sound/amlogic,axg-tdm-formatters.yaml     | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
