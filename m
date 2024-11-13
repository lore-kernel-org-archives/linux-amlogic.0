Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC85D41C1E
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrWTZdPYETaazaynPnKmk8XIeU2qHnrtt1QyU0Dvrk8=; b=1HVjTt9kB6IqQ7
	9/FT3shrU0N8sVRn4JnDVRb3DzJg46huvBspJr9wPb5gQ5vfXGMDtPxO7+g6ed9Wu6LkhMkNHnumn
	iC58oMvzAmKtu2oVlB2OHQCdkVYcfizx5YXy7d+ueO86DIB4DB1x02pR1nVuxOHeDurJOyQr0pcFU
	Yx6NJLp8suxe+YQGWstApidqliarr9yEyW//x6rM5E8uPjx5V21QBsHrDyj0Jmi7bB/nbEG60m2qf
	UZm8Wwj7ZgukHK13OgEEmnffOPc4sEz3Ri3goVKS2WedvI9Q5DIO8uwAVC48MS5y536A6PtNVgJzS
	ikE9SQI2WT85I3X4XNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9LE-00000006ByZ-2HnV;
	Wed, 13 Nov 2024 09:07:12 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9EU-00000006AkR-1OcO;
	Wed, 13 Nov 2024 09:00:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06D74E0003;
	Wed, 13 Nov 2024 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731488409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E9njZBTIcLfCJhjDXkZM9IcrPjxMe5ftrTxBl5Q+hx0=;
	b=O+cSYTJpFtM59gEG2fZwS7Kx64rVoZIN/fz8XtKBOJzQMqYjJSxrv3pcM2VZGX9E6YcSvZ
	emU0OCIPrY7gwusoiN5YBL8JKFiJTvlkli3Fcfl+C94ok0g8Z5vUk5GBG6Yh3vT862KnTe
	khUuzcc3GVP6/AD3nJ3ou7nvae/zV6+/lOjftJvSkrurn5Hb3nc5VreqnsInfcFSmCBoGp
	uUGl00j3aNMkHIWhD6Yz67oaGJ4L0W1COTCmsnsm9elzfh4hyrq8S80sOC9i70V4mX6nuQ
	CHhL3lJv0mOL3HsldCGmhi94uYX+s7oSLUy0kAKdPRb5QsuBmTQPsFUicTpPIw==
Date: Wed, 13 Nov 2024 10:00:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/5] Merge RTC Haoyu HYM8563 into RTC PCF8563
Message-ID: <2024111309000615fd9fbd@mail.local>
References: <20241113085355.1972607-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113085355.1972607-1-iwamatsu@nigauri.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_010014_552149_F59F98A0 
X-CRM114-Status: GOOD (  14.48  )
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

On 13/11/2024 17:53:50+0900, Nobuhiro Iwamatsu wrote:
> RTC Haoyu HYM8563 has the same hardware structure as RTC PCF8563, and
> operates with the same device driver. Therefore, since we do not need
> two drivers with the same function, this merges HYM8563 into PCF8563.
> 

I've seen that but last I checked both drivers are not functionally
identical so this is not that simple.

> This series was tested with PCF8563 and HYM8563 on khadas vim3 board.
> 
> Nobuhiro Iwamatsu (5):
>   ARM: multi_v7_defconfig: Add RTC PCF8563 support
>   rtc: pcf8563: Add support Haoyu HYM8563
>   dt-bindings: rtc: pcf8563: Add Haoyu HYM8563 compatibility
>   rtc: Remove HYM8563 RTC driver
>   dt-bindings: rtc: hym8563: Remove hym8563 binding
> 
>  .../bindings/rtc/haoyu,hym8563.yaml           |  56 --
>  .../devicetree/bindings/rtc/nxp,pcf8563.yaml  |  18 +-
>  arch/arm/configs/multi_v7_defconfig           |   2 +-
>  arch/arm64/configs/defconfig                  |   1 -
>  drivers/rtc/Kconfig                           |  11 -
>  drivers/rtc/Makefile                          |   1 -
>  drivers/rtc/rtc-hym8563.c                     | 587 ------------------
>  drivers/rtc/rtc-pcf8563.c                     |   2 +
>  8 files changed, 17 insertions(+), 661 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
>  delete mode 100644 drivers/rtc/rtc-hym8563.c
> 
> -- 
> 2.45.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
