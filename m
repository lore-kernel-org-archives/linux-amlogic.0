Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BA9C88E7F
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2026 23:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvwO3J0KT3t+l4NqXNpIyCGGRyoB+GADodyJ/gW7sUI=; b=l9ZnXtaFEqQlXU
	kxcb3TKKjf2Rw/RJvkBFqqfiQonWkU1b2XXRUrv+R1hVVwvTqjo1TOAY9yXU337gbJUjRCO43DU+N
	gr1kjD0KIY7s13pLYPH+wUGesAX7kHqFlgxfOvTlQ6M0g18Ynkh/xnhT8oe+4RorYOsjNFRXc5Y/f
	tJYMwsgN7I05IgApdW+9eDuz7qju4kzLYy7T9aR0TgJAK5hrQ/7pWZZp6vPNQXL9XuM5qrNAGJfr4
	4oDktOybBQgY0Hs4AjSAYJI4ut+oXMc52EBcN+V1temBJzXQJ4pAsyrgeNfUTRl9uQfec4hgnWRZ3
	2xRL9BcvgHloc5zKBhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Fu5-00000004pvu-1J9Q;
	Mon, 14 Sep 2026 23:16:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Fu4-00000004pvS-1wIY;
	Mon, 14 Sep 2026 23:16:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C554C4166A;
	Mon, 14 Sep 2026 23:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F941F000FF;
	Mon, 14 Sep 2026 23:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789427759;
	bh=RwH+G4NIKOPDOx7e/oMm/7Vklp7Y5keUcHCNIa7SkMw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fIzWyZA6UdmZD7hsC15psgVvwBq/uwrPdOgfhkHgj1S6Cuz2PkBpi2vJw6ldTH7en
	 4/YOUYZufDRk25xh7Qoqxd5cx9SmOhAV4UQeYqsCXBhHkYiJH7areds0K/D08KcUz9
	 wghgZVZPlV1i++y4bKcODpWeJTVjxXnOBBEdSms7NXhsuvlhDPc/bqDei2LrF0J77t
	 FZSfsmUFXNw1ySkFkB1PFaYfTDYnmIopXnBpG0BpYNTKU3NP/NFC3Lv9e747KEF7el
	 QtCPQ7FfKsKWKStI1K/XQHHdIRl6nUJA9ZvCfOs1k5HGHcRdu51e1k2U2vYBi2VTlR
	 WC9Da0tS7vBdg==
Date: Mon, 14 Sep 2026 16:15:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Radu Rendec <radu@rendec.net>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v14 00/10] net: stmmac: qcom-ethqos: add
 support for SCMI power domains
Message-ID: <20260914161557.3b520b4a@kernel.org>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
MIME-Version: 1.0
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

On Tue, 08 Sep 2026 16:57:19 +0200 Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.

Sorry for the delay, this series got eaten by the recent patchwork
upgrade :( I will manually send out the AI review, would you be willing
to report back if any of the reviews warrant v15?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
