Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129E1CA5FFC
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1cHfwfXQtul5Hjo9GBv12/86IT1DSlmBe1w7V5cxJ4=; b=Jy9GF5GhfcIYBL
	qubZb8yFxqawvmYVV9qQKHFmfiykspLijGwf+x9L2kpyoyfnj0zB0eixfWZwwkrFYezIBWzX379NB
	MDMuYbaIA6G8UyT53jiOzhjmJ7DgcAql/9nE7b9k5UYZDUZF4z7reKAVc1HTPW9i6g6MIC7s2CVhD
	T4hhJ+mnnPnqpQx2jNR3tUNbdYW76+g9XpnUMyY/U3thiObQcozgX3oQzrZ3MUzmpSwVgABE8Mvdu
	P6Aclt9juh2fZIWtShDJHTccImHpsSf9FYI7PtZtbKef2Ol1MbjwtWMJWo2040ykUJZT9Jl2KHswi
	jGzGdOfwyUV2pKAkqPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERmw-00000002XLr-3txH;
	Wed, 07 Oct 2026 13:34:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERmr-00000002XLD-2PTB;
	Wed, 07 Oct 2026 13:34:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D64481A1122;
	Wed,  7 Oct 2026 13:34:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A77CD6074B;
	Wed,  7 Oct 2026 13:34:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63D6D11D50090;
	Wed,  7 Oct 2026 15:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791380056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7JHn1c0jhTtw4x+nWKYYAbqqMhPie3zHHQoxJxD2lv0=;
	b=uXVuXvG16J656LdLBgB/YvdLRCtF7cNl7F7z8MRhCw7DfoMDCjoKh7CPEB+q8wYRKXkGF+
	gdbuM9x25zvRd+7wQkngET1D8OIxZIb7Bs2Z+PwMjqFtG/oVkzWxSOtR6tWIWr64vEN3fQ
	XOofftpU2esk91F41W9pDHHjXaX8ZskjCO5aRoJGO8rEWNlLTVKXuZMT4/l20OS3l7Q1O2
	ZZ2axwNfhTXrEYFzppLRJt278aYC/hqLkOhxHa58l5MnWSiBTDKtVfkfTrpiXpAL0dCB6B
	6+K3eBMumrG2ErINZe245wqqubl1ikDlNrWCPp0Q6hguo2dUL9nnZCr5PVlwtQ==
Message-ID: <4a283b8a-8019-4987-8c6c-23f9bebce858@bootlin.com>
Date: Wed, 7 Oct 2026 15:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 6/7] arm64: dts: amlogic: t7: add the ethernet
 controller
To: Andrew Lunn <andrew@lunn.ch>, Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-7-tanure@linux.com>
 <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_063428_005719_3B44E829 
X-CRM114-Status: UNSURE (   7.36  )
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

On 10/7/26 15:12, Andrew Lunn wrote:

> 
> You should only need max-speed when the PHY is broken, says it can do
> more than it actually can do, or when a 1G PHY only has two of the
> four pairs connected to the outside world etc.

We even have a DT binding for that case :)

There's an example here :

https://elixir.bootlin.com/linux/v7.3-rc5/source/Documentation/devicetree/bindings/net/ethernet-phy.yaml#L348

and the binding is there :

https://elixir.bootlin.com/linux/v7.3-rc5/source/Documentation/devicetree/bindings/net/ethernet-connector.yaml

Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
