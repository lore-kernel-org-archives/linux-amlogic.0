Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7156CA5FFE
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2026 15:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E8fJiJhc56OrstNaVGxEFthxzY+Xvxy0XQAo9jOl8pQ=; b=O63KqNnTIYPryw
	duKagbW9eE5/3pBBOWHDPRAguFp3XbgOcvON0qNy0Q5URuwYR9XClJ8NlokjBZuytMAl97tzyxF5d
	QV2TXDziYm4aQK59Wk98xdv0O2XH+mnTAXgMXOitXTcVKPo7RhdBX2PzQ+l+a5OyJLGxu0ykOD6IX
	oW1jtgxab+FcU8aqSz+KOsWruDpcZCvmsz/0z64yJVbQ1+ReQ3BLYtaX7/wvAIvSTMXkb6MGnx6qE
	LCi+RYCJ4XZojUrOvhLkgU7B1HecNB9M9yDbkGSftl77LSRJ9wu4kD2q/gBUQeY8EGOhwcg++eF+t
	NsthPhxzn4mdXg7HIVoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDl3J-0000000GnqA-3Zvw;
	Mon, 05 Oct 2026 15:56:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDl3E-0000000GnpL-3636;
	Mon, 05 Oct 2026 15:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ozhBT/7/VytNYmqj1zwDdXmvQwSa3zBNWtW17/LMIWQ=; b=zTyc7cz1q7j3w9ngmTqOhART3N
	rDVPcD7swj8UOMFW8VMtjNSo4ZTuRdPjrFArrsvpF4nhjAUhmdv0u2x69X24n09PVFNPcHuZqzr8b
	B1RyomobMnaKwerkCSZvH3rQQZzRO8ByKM6tz95/sg1CvFMC1R/qfQrPCbDM6LsmNPuI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xDl2p-0094h1-93; Mon, 05 Oct 2026 17:56:03 +0200
Date: Mon, 5 Oct 2026 17:56:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
Message-ID: <f282770c-2238-4a1b-b811-c0c483fa7681@lunn.ch>
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-7-tanure@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261004144046.391444-7-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_085629_196791_473E3CA9 
X-CRM114-Status: GOOD (  12.29  )
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

> +&ethmac {
> +	status = "okay";
> +	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> +	pinctrl-names = "default";
> +
> +	/*
> +	 * The RGMII clock delays are added by the MAC, so the PHY is
> +	 * asked for the mode that adds none.
> +	 */
> +	phy-mode = "rgmii";
> +	phy-handle = <&external_phy>;
> +	amlogic,tx-delay-ns = <2>;
> +	rx-internal-delay-ps = <2000>;

I agree with Maxime here, rgmii is wrong. We really need to understand
what is going on here, especially since you are asking for the MAC to
do the usual 2ns, nothing special.

Is the PHY not actually inserting the correct delay? What does the
datasheet say?

Also, we have one vendor property and one generic property. Can
amlogic,tx-delay-ns be replaced by tx-internal-delay-ps? But that
comes later, once we have determined these properties really must be
used.

Humm, what is meson8b_init_rgmii_delays() doing?  What is
phydev->interface in the PHY driver.

Please take a read on:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

and figure out what is going on here, because at a first look, it
seems broken.

      Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
