Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371BDC00A5A
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bi58F+rClxCZMHHVrzlQzE6GaIWmk6wNwFo8TkgYGpQ=; b=wRHEm9xc+8JKFX
	3Hpy1e5rzn+ppbLTvAkoUB/wsUn0i6e28fBhXgrNA8bAt50MpnGgr4ufOJe8M12c0KGfp/2M5t24n
	SOabUb4gfjaiA7q3+72B1pxJz+TaNFBK1CCirH/EtSbXkodrw7o6vD5oVnXKYx4OemRdo9GB6o1+M
	wC3uFgskmictr+SAvsh2ipSEmlKomceL8QtGrxSAsgRzdAICHM/oj+iLP3tPzA6hDL3twS5ew2Jsh
	bT+AoLVIvA7R5gGgOG+pLxNnpW8iiU84gNn6ALBWDLjvfMwnu2D2zdMvDsmDtFdr3Qp2h2MJvBaEt
	UWy7D+osdnjsU3TElfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pISZh-004VjK-CY; Thu, 19 Jan 2023 10:55:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pISZc-004ViU-W6
	for linux-amlogic@lists.infradead.org; Thu, 19 Jan 2023 10:55:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id e3so1423198wru.13
        for <linux-amlogic@lists.infradead.org>; Thu, 19 Jan 2023 02:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=W2iLqxzBf2lt/ncg4h7D713Xr/C62DP8hgV7AbUocoI=;
        b=P5LppqRYfNZ6ipt7+ZeQwYBdFqfSnUFgGDqlQvZ4vusjXWwLO9BYeS5+93bNYfRRmh
         qWajrm+xWAbEHdcQlzRE2FFz4nN4nVoMWfAYRfKyZWCOB7S7uTT3SsJKD/yS88bdZbom
         kXVs014BApTave9Lv2C7QjqXXZoNVvbE5BRUf43hOizXTkAElkuep4PNbXZKv/Y6iCKt
         wDb/QsJFjYQRj5xYFjIabG/FfeLBniAWjlxYCj3ASQVfoy4d31yHz4MPpWhiWqVaPS82
         Y73Sq/Gf5Fbg7LC7AlenM9EXejEZpPWaaLpvwSWTl8Ie9KkIHrGGQ3DdRsjCnUWuJ1E2
         38Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2iLqxzBf2lt/ncg4h7D713Xr/C62DP8hgV7AbUocoI=;
        b=V07lozPU2oQv4bPm/wNUeY5re9CpLrkbybhC1OuojVETOdM+1lVTqEUEUsNMgFiI8q
         rwGy7Xe18sf4Z1862fVXW1qVy+Yp/x/bEhHoudt4tFwL8sjikj/BJDsbCdX8kY4bPmAK
         EFyWsfIigjQyQNlC0dSBlVx6m8268+Bsv2t0fxDZCwUhxsrYytoE8TOqjZJTDqHSgWHt
         lzveWvXR9Cw0Sl6I0Fwok5dkTujKocXfjnM23ZY/u/pr8HPK6BgbtT3R+xJF9UvoQV4E
         bXXkATbO6LobI6hwq3SzePDDVsZIDyRwNYT5eWLD1H0ESrIwLcwvXRSsOZ4n756tGsnh
         ndEg==
X-Gm-Message-State: AFqh2koa4Yy+Mpgpj0EnRs0jJKrQZ7yzPhKoiHTQ40Nq+/9crySzPZaM
	vFaC3XzjnX/ddWLac8JPgDKuVbxL3qz/so4j
X-Google-Smtp-Source: AMrXdXtKFaRuKk7aQfl2q8ApDCvIPRIpAPBN2Nc4ZtdNxVZ0nz3wqSUr8VfedhOedhFNga6qKAibsw==
X-Received: by 2002:a5d:6545:0:b0:2bb:5d8c:9575 with SMTP id z5-20020a5d6545000000b002bb5d8c9575mr8403717wrv.12.1674125708342;
        Thu, 19 Jan 2023 02:55:08 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600003cd00b002be07cbefb2sm11691659wrg.18.2023.01.19.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 02:55:07 -0800 (PST)
References: <20230116091637.272923-1-jbrunet@baylibre.com>
 <Y8dimCI7ybeL09j0@lunn.ch>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Da Xue <da@lessconfused.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] net: mdio: add amlogic gxl mdio mux support
Date: Thu, 19 Jan 2023 11:42:11 +0100
In-reply-to: <Y8dimCI7ybeL09j0@lunn.ch>
Message-ID: <1jr0vqyet1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_025513_095071_CABA6EC4 
X-CRM114-Status: GOOD (  18.65  )
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


On Wed 18 Jan 2023 at 04:08, Andrew Lunn <andrew@lunn.ch> wrote:

> On Mon, Jan 16, 2023 at 10:16:34AM +0100, Jerome Brunet wrote:
>> Add support for the MDIO multiplexer found in the Amlogic GXL SoC family.
>> This multiplexer allows to choose between the external (SoC pins) MDIO bus,
>> or the internal one leading to the integrated 10/100M PHY.
>> 
>> This multiplexer has been handled with the mdio-mux-mmioreg generic driver
>> so far. When it was added, it was thought the logic was handled by a
>> single register.
>> 
>> It turns out more than a single register need to be properly set.
>> As long as the device is using the Amlogic vendor bootloader, or upstream
>> u-boot with net support, it is working fine since the kernel is inheriting
>> the bootloader settings. Without net support in the bootloader, this glue
>> comes unset in the kernel and only the external path may operate properly.
>> 
>> With this driver (and the associated DT update), the kernel no longer relies
>> on the bootloader to set things up, fixing the problem.
>
> Ideally, you should also post an actual user of this driver, i.e. the
> DT updates.

I usually avoid doing this since the DT part is intended for another
maintainer. The idea is make life easy for them and let them pick the
entire series (or not). I don't mind sending the DT update along if it
is the perferred way with netdev.

FYI, the DT update would look like this :
https://gitlab.com/jbrunet/linux/-/commit/1d38ccf1b9f264111b1c56f18cfb4804227d3894.patch

>
>> This has been tested on the aml-s905x-cc (LePotato) for the internal path
>> and the aml-s912-pc (Tartiflette) for the external path.
>
> So these exist in mainline, which is enough for me.

Yes the boards exists in mainline, there are still using the mdio-mux-mmioreg driver
ATM

>
>    Andrew


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
