Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C57BEB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jul 2023 12:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kimjWDgf0YTV2JLrlLBB39g8uZq9G15CNO7BCoSC0Uo=; b=dsNvcl5UcehJOc
	jhzEZc/XpeqgfR7PP61hcWDKFYvYJsHa+yu3rAaA7W0DdzjXy1UrhqLy/hLd7wnT9kFQSOqnHj4d4
	/dr3q4evJqNXTSH2E4amNgzSbHcjRkZgp74KkBqxXWXZfVpBNs2g7xk7mOJ5wbU2KuhxfYP9PoeFC
	HIueVVDKWxxKqF4Q5YDmsOBGyMGi6A25Zss4DN5IBpHWGx+1Mq1pHUJZiJWZZwZKX7CbbifECC4nA
	RIR07rVqaLYwCwBZa3BiY0UaJ9y/Uk+y1paSb4my+g4IeJvHa6LT9fbD1TL4UCfK6jSCMliYwFGx+
	DvZlVn8flmkGZRTIaE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLNUo-0040WW-38;
	Mon, 17 Jul 2023 12:38:34 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLNUW-0040Ri-1g;
	Mon, 17 Jul 2023 12:38:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63003C0003;
	Mon, 17 Jul 2023 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689597489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MM/PEyd181tJuLy8r7nqOJOdJv9WHZixT7LUP2KhY9Q=;
	b=CJSdJUIaJOmzbN/Tj4KhsGBnpIzKmLKXw5kMnjexwbj9y7Ge/VVgXKfpiv6eq5W9wcF9dp
	sd/2U7mXflRPXLpVjusstuLTPt8N2SZlDeNsujy0iHcJE4iLv5gRuMhTwZ4mMmBMGjAF64
	qwHz/AKECHcd0xWxb2+V+Up/oxY2hWG0KeU8blU452HvKU9iMKB3HedvxklLcwyMVE+Zy+
	50B1rWMTI8ltBn0//4FfpRbnkzFIA2rEYf3Gj3lDjF+D+cJiPdTwvuCcfsiimP3e+v2LdY
	EDKN/bYZ9JBD3oCSej3UhQM4VknrSyUzHk4r49YevmLr/q96PziK3BkSVQTHhA==
Date: Mon, 17 Jul 2023 14:38:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Hiremath
 <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder
 <elder@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, Parthiban Veerasooran
 <parthiban.veerasooran@microchip.com>, Christian Gromm
 <christian.gromm@microchip.com>, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] staging: Explicitly include correct DT includes
Message-ID: <20230717143804.4e82bcc1@booty>
In-Reply-To: <20230714175002.4064428-1-robh@kernel.org>
References: <20230714175002.4064428-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_053816_942717_4371AFDB 
X-CRM114-Status: UNSURE (   7.66  )
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

On Fri, 14 Jul 2023 11:50:01 -0600
Rob Herring <robh@kernel.org> wrote:

>  drivers/staging/media/tegra-video/csi.c           | 1 -
>  drivers/staging/media/tegra-video/vi.c            | 2 +-
>  drivers/staging/media/tegra-video/vip.c           | 1 -

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra-video

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
