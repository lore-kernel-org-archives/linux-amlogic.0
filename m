Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C2AC5DF8C
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Aug 2026 19:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsuvQPCSB822r+WR1YapoMWApb/jJC8/iXJPzVlzAys=; b=Ji1Lk6lQ/tD1R0
	4+5H2oB7yVfwl9mqeyPYr0j38JuA4Olro0hO3c8sKAEJHT27yZ7zUvUti1OPlinMvpFGhV8AJbASZ
	bX4v/yVue7QceRFhn8mVCc27NG4Hcis6ZJslgNY7NR56eFnhMmWvhcJtX9VHqc8j3iPY3zLWXl/aw
	qiGtKnyz5L6Kn1IKVi7FUo/VCkmmg3Hv7ep2WQYFOSWwgLczXTcZxY6d9KDZkffG2eF9qAeEpyPuW
	U1eVXuo7CH8o7Q78AGGWQaqK4wU4OXVorfWPdFRq3LUEVq7uOkhaYd2JGkVCWT5so5kvDzWBQtsOi
	EvZXT/4OCSGQTmWJ578A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrdx-0000000EkSW-0amn;
	Sat, 22 Aug 2026 19:44:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrdw-0000000EkSK-1jMY;
	Sat, 22 Aug 2026 19:44:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD0F440392;
	Sat, 22 Aug 2026 19:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE6E1F000E9;
	Sat, 22 Aug 2026 19:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787427879;
	bh=zDyng24oNDCdDgCI0OnzaGcRhJHZICMrLTy9e+W9GRc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D8iTDr7L0yisd/hYhMolRDHGlp5Di+L7AhGGezgIMmFOIKCi1DP87M+cb1GLdZTwP
	 0ptycL6pV5+xi9cfKIyijKCsJ6CghBerhIPFGdzP9dW/oo3vkVkguOv8waYn+/fbx7
	 yMV0dJMzJOU8g5RZ+cA25/w2KXoe6/Rl2lRIUM4ySF7fHxXDa27Arpsj2ukuWG7RkZ
	 ecHE0J1TXumklmlBhqqbwvd+LxrEXBFQfU/6nuydaWWhiRcwNkIKzVAHFAOSyAUai2
	 T02Ou0aFDLi11/phwDmaKLqiCL5RsYxbal5Pp8DfkUsIfSnrjFn8oVrvENHpBRkqAJ
	 xLQri/PdQtnyA==
Date: Sat, 22 Aug 2026 12:44:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Conor Dooley
 <conor.dooley@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>, Russell
 King <linux@armlinux.org.uk>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: Make sure clk_init_data is fully
 initialized
Message-ID: <20260822124438.527c40b7@kernel.org>
In-Reply-To: <cover.1787240118.git.geert+renesas@glider.be>
References: <cover.1787240118.git.geert+renesas@glider.be>
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

On Fri, 21 Aug 2026 12:07:29 +0200 Geert Uytterhoeven wrote:
>  drivers/net/ethernet/cadence/macb_main.c | 2 +-
>  drivers/net/mdio/mdio-mux-meson-g12a.c   | 2 +-
>  drivers/net/phy/air_en8811h.c            | 4 ++--

Hi Geert!

Unfortunately we don't queue -next patches during the merge window,
you'll have to repsot.
-- 
pw-bot: defer

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
