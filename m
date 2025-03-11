Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38F7C28B2F
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Mar 2025 19:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1UVTElduptioG7PgrKFo7HLZZ8/ee+t5Pf1Grqdp0A=; b=ZgTxWMJyQjGdUb
	OlescKIj+9+6W/6CVJup+XGXORkeFh2Ae7ADgOQL1ApZjYCJfaZpWOhlXGkrJ7M3+Mi5dX049vuCI
	ogFAj4sgB/MgK9p9y6ca80FuitBnJ+qsdPHOKWR8GAEeXFeqjo4ANVx49zuWSRa8rKZIf35GGGh7r
	g65bk150zyZM7Oq9WYoXMfvSR4keKLmqqv4AcViOQsi8N1axPWnh8ObFkXTVXhQ36dw0VaAV51/+/
	1hpSOTXocX00KfAgLgjDISUDnugB2pKzvMD/+QvDzSxP9AkC3hRzvrG3ytH/ctUHVyMJnRsBAATMX
	xf7NABJKVP9dcUlpnLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Fl-00000006lmg-1NNR;
	Tue, 11 Mar 2025 19:27:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5FH-00000006lfx-1pwq;
	Tue, 11 Mar 2025 19:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D824A464C4;
	Tue, 11 Mar 2025 19:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD70DC4CEE9;
	Tue, 11 Mar 2025 19:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741721190;
	bh=LXvcff6ovrE+lWjEH283+ozibg6lrSmGszx8SWB2Els=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gd8ps7tULO8XXkXmP6AJtLdw+gDpnZW1O7goGVI+cGeI/JW4cOn6A6JcyERONifij
	 9gBP8rzLd+fParVkgKJ94dsTCp+tvIWhI86mTGjq9wbs2D2wGQRWf24o7MYCzBxyFc
	 De8dxrxBsCVzhjG+aTDtSvTtUM1XPOMFoqW4f2qLAF/wFPdSx5yavcD8t+7CsmKoVA
	 FsHsVOHQ/XeNAotS4vJEelArSnl8OPrPDvNE7k86Wd0Bq3C8V4oz67X1FUSvpSWGw8
	 0tMR5lTtsVic6R/dQLOAldO0FPK33H86W6OHkrmP8T5kazlUs5yShRi4fl4zWj/X+1
	 Wo0ie+Nrl/gAQ==
Date: Tue, 11 Mar 2025 14:26:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] ASoC: dt-bindings: meson: g12a-toacodec: add
 support for A1 SoC family
Message-ID: <174172118794.4169317.149338949275613581.robh@kernel.org>
References: <20250309181600.1322701-1-jan.dakinevich@salutedevices.com>
 <20250309181600.1322701-4-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250309181600.1322701-4-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_122631_541073_EC700336 
X-CRM114-Status: GOOD (  10.69  )
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


On Sun, 09 Mar 2025 21:15:59 +0300, Jan Dakinevich wrote:
> Add support for "toacodec" audio component found A1 SoC family. On this
> SoC the component supports capture streams, additional DAI ids are added
> to configure this feature.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,g12a-toacodec.yaml     | 1 +
>  include/dt-bindings/sound/meson-g12a-toacodec.h              | 5 +++++
>  2 files changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
