Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73ECC54E60
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iu6X6/K6PkQqsTd44TH/khn+Za4IImL0QUFKkOwrh4=; b=iAv2oJvHm9KJUp
	OgVjHD+GQ5dBfbMNpr040NR30CRwaSTOi1sdTJNc2rdQuhcmaLp9RDjU9gUD7UnzLNdPaaHYQo83T
	wiT8FkvZN+ivj/2YQ6bakbNs2C2kHldaKxzfyB2otlMIGxVn+8JtttBmN0VmBEz14dpd1vVmbGDlG
	ulKbzgBqCAH894AyXitEcMsP7w1xl/dQ0ctCvwJGhvipCaVjGolbW1Z7B9q6xCtA5SoAYmY01HUEe
	S384QUcr0tUZgQO7TuuKZuaSjtTxgzcsmZBQaTjhj9wRUbJqMnWHkslISkqBTnWvQFSPt9JkjsQZy
	gAIb+UWLRHLiepawezrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvtw-000000069hQ-3Q9p;
	Sun, 17 Mar 2024 19:10:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvtt-000000069cX-0afK;
	Sun, 17 Mar 2024 19:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8AF1CCE0916;
	Sun, 17 Mar 2024 19:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E14C433F1;
	Sun, 17 Mar 2024 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710702612;
	bh=m0Flx86hlt0ID5OEE6IkxZUX4ODTKKRFVINUHUA7ss0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSi2XOPSw4Fdzj6YPbJ7NmZItS9T42PBNe8meEGA9KvXJRseIYJNeFYApi1qVRjuF
	 hIcM+uFWfRSLKPwIEl2GIBRnd/xqgU02SVSNm08VSB2uIpoHwsjOHvrYMOKlecUNqe
	 sNLexeaItJBWTmeVgGgkG0bjOqiKxcdEeQSmeE9JPymngvyhmvUGJSw1r1ho26OeJA
	 sx7OgUz6iWHYATK8MUlkVmE+L1E8nd3af5BCjQjAKDUMxsERP65WIi+VlffTIPxhwL
	 T8mRlVfXX8byeWK2sL7DNvakNHAC6ae1At+0UorQOGPwMdLHUrvc2KEyio6w6lWTzT
	 OpDtA+MjP4/2w==
Date: Sun, 17 Mar 2024 13:10:10 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, kernel@salutedevices.com,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 16/25] ASoC: dt-bindings: meson: meson-axg-audio-arb:
 claim support of A1 SoC family
Message-ID: <171070260941.2083610.11098658927011018629.robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-17-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-17-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_121029_430175_9C5A23DA 
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


On Fri, 15 Mar 2024 02:21:52 +0300, Jan Dakinevich wrote:
> Add "amlogic,meson-a1-audio-arb" compatible string alias to
> "amlogic,meson-sm1-audio-arb".
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../bindings/reset/amlogic,meson-axg-audio-arb.yaml    | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
