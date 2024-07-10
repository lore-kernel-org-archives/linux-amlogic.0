Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285DFC3DA41
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 22:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBGt+xYK7csflqhqDT6F4tx+kHFE3ls65HNx9fTVODU=; b=hufl61PDWUl1LN
	NWrtWcXaBgoR+lcLoxeiFfTPy6UySl3mSNou4L1vDW96UnEj14qYtRyQBnIlTZUQvSX/jV46ZInjY
	SltIgDI72/2j7+Z/SaGua4ALdFiCPUcRd532mwz5xXCSFb3pk+rPqDi1qSTn8/9ilODOJgN0W9xCZ
	U+srBf8Zv8eZqLSdrYNkhOT0qPnFOBDRC42MDi+KPHmIu1U544iFE5VkOTVBlCdf3NtnX1YQKrkRY
	+ThExHpIE10gxLUsayle9Z5N2cb+ih5g2hNuS0hFRcUUxsC5mfGXSHGk0woshjWmX6cqDbI3nh1Qz
	WCK7s5wwZnEDUnrbIURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfz5-0000000By7e-2bXQ;
	Wed, 10 Jul 2024 22:40:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfz2-0000000By76-3SPD
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 22:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3774ECE17C4;
	Wed, 10 Jul 2024 22:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DD4C4AF09;
	Wed, 10 Jul 2024 22:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720651218;
	bh=n8Br65WDv0TBlYxPu6aUcBP9x0s1qbWYkv6MPDoPWM4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EhiHoxeuwg0jmhdrH2kjIwU9yvphwj3ZYHPQ4+GUDGaza2oZI0dVr3epGOxPf9Nh6
	 38dmF7bkQ5GXcfsJ50wR6q5CyrarhvrWher0+cMgmzX9dX+xbFf9NeJqQqoW7sN0do
	 9XqxqaQPxYbyyXyXEX2RFhik49tjB21kL8oYODixoGRa0E3+M1lnT0jp0/UeLqH0u7
	 qVV9pkVkCYjx+BqXehcvDXsfGDzQaJfXixExzMXQUHlp4KYUpOWXy5d/vX5PPc0Vju
	 eHbBaW/6Z5/AVmJgqOLrB2xHnMVQLZOw142encANwRAz2vsAGQIt+V9HVgFTIsecPi
	 ibFQlDFROsozA==
Message-ID: <c34a2d1613da179a27123be95eaf4ddf.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240710162526.2341399-6-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com> <20240710162526.2341399-6-jbrunet@baylibre.com>
Subject: Re: [PATCH 5/8] reset: amlogic: add reset status support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Jan Dakinevich <jan.dakinevich@salutedevices.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 10 Jul 2024 15:40:16 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_154021_065849_F1D753B5 
X-CRM114-Status: GOOD (  15.20  )
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

Quoting Jerome Brunet (2024-07-10 09:25:14)
> Add a callback to check the status of the level reset, as done in
> the reset driver of the audio clock controller.

Why? Presumably so that this driver has equivalent functionality to the
reset code in the audio clk controller?

> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/reset-meson.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 3e0447366ba6..65ba9190cb53 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -69,6 +69,23 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>                                   BIT(bit), assert ? BIT(bit) : 0);
>  }
>  
> +static int meson_reset_status(struct reset_controller_dev *rcdev,
> +                             unsigned long id)
> +{
> +       struct meson_reset *data =
> +               container_of(rcdev, struct meson_reset, rcdev);

Nitpick: One line.

> +       unsigned int val, offset, bit;
> +
> +       meson_reset_offset_and_bit(data, id, &offset, &bit);
> +       offset += data->param->level_offset;
> +
> +       regmap_read(data->map, offset, &val);
> +       val = !!(BIT(bit) & val);
> +
> +

Nitpick: Drop the extra newline?

> +       return val ^ data->param->level_low_reset;
> +}
> +
>  static int meson_reset_assert(struct reset_controller_dev *rcdev,
>                               unsigned long id)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
