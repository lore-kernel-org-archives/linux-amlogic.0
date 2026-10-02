Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBE7CA5FD4
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2026 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXWwPJrW+neSXc2/Gki85UaHB+WGjxpJaXvTEeELmIU=; b=RXbX2VMifytfLD
	MU6y3jjZFxINaYLkmeDYI9SntFDj+HYdcLIkg/IJug2aEN/jt5zTRAM0O7ZcI2396z6dxI9alddpi
	vEcvQv4ZIbfPWT5InPnCo3RMhyOe9HwQi91TA9gFWGpFrFP3LqzPK9PqzKKAA0sAEiZ2ufrn+CZJB
	OfGQmdrQKSHzHsCSUhtvnelWS4Tuafp9m9GM35jhD0oyOZcSu0joiVIkiJ0QpxTOepR60nqPw2igf
	f1qE/4CtoZMSG5SxZfrxskJ1gZ0YtCgD4IzxcLQEXabK4UnDf+i47tmNk3Q6/bDNAVFIcTklU04Jp
	Dw/+6sOF+cRrK/m+DEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZmX-0000000BBaI-0nHi;
	Fri, 02 Oct 2026 09:42:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZmV-0000000BBa7-2X7M;
	Fri, 02 Oct 2026 09:42:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54693418ED;
	Fri,  2 Oct 2026 09:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFF31F000FF;
	Fri,  2 Oct 2026 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934139;
	bh=efL1+n1dK7AWhH37EQ0nV3a1HbjScxl8OApVSmAnV5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hplXPbVjlKdXr+GoZfnOiYnK7paer287vF1PjzJuXNqGHk2hI3obnO02CDrcdGcOC
	 HK0+DIDKOLVNjLw2DN1zOqahPNYa8UOA6GgCTLyHb1TMm4eWTLxK3l+IwiCCj0WcdG
	 K/KF7BRyR/753FfsARs8g+QsOR8V/w9pJM+XPkoAfPzroz/IbU9AXeCSuFvR4jx2JN
	 UFRk1Rg2GVY3Io83a7GKi6X9FcMh84ihpZ+p4SY2dyttmgeyTrweuukhb1VGbP8XJo
	 mfHL3EKRiVulKZNm4OrmxazNailvb1lPBZNNxFkgkHa0sA4jHlU7hZX9bquzVULvbp
	 C+rW/hCzUPCrQ==
Date: Fri, 2 Oct 2026 11:42:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
Message-ID: <20261002-curly-bold-octopus-ade53b@quoll>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-1-2476646118b5@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261001-audin-v4-1-2476646118b5@baylibre.com>
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

On Thu, Oct 01, 2026 at 06:06:26PM +0200, Valerio Setti wrote:
> AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.
> 
> The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audin"
> uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
> added so that differences can be handled later if any are found.
> 
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
