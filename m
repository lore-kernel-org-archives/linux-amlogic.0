Return-Path: <SRS0=R/Kg=GD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BE0C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 00:24:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7050E207AB
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 00:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7050E207AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WAmaFHUNYVnn8FzDmVzykLFbPxAl2VvSp01hal9hj7Y=; b=mmyq+thaj1JtAnyz2Gw8BY7YJ
	ZcFmWiqhrCtXHK2Cc0KRPL5aq/lp9NyPe7ukl4U7NSHhZPlduCtZVbzXE9J61GpS7QI2w7iej5mH2
	dlgv3MjlOXgjPBW4OkaTDQCm0uwTykHw9IkluSQ7EHCiF+1p3dT25sVYY9eGVVNZvIY4/+/gxxkW0
	2nrdwepD2YbCb1Tyzms5ZyG9kk89MgMdhefOTD6lztt9bniDrbXdsDDkJKHCjCZQtYGsKd9it1vP9
	YuGhz3zX6Njnx9hy/3GgT8Qnp1Yp1xllT3FW1BGetzC5pqcgVJ+T1QX/cnOF0+Kjg9iHauGwlfrxJ
	R6V001NCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kullH-0004RT-P6; Thu, 31 Dec 2020 00:24:15 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kullD-0004Qi-Bs; Thu, 31 Dec 2020 00:24:12 +0000
Received: by mail-ej1-x62a.google.com with SMTP id lt17so23786727ejb.3;
 Wed, 30 Dec 2020 16:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aw/X/9HRdFlK3ENliYd8yhkSzevuBoqDvbJ7g1FREOk=;
 b=oBhDqrr7CNIeA+HEckZ/BoMozBaZ67j517MnLQNWF9HHpKlIqcbDi+KgYiPH7xi+KR
 dEROELyMEY9jwEJo/3g3xLv+DyU7iOcPMkKDvkL20U0bRwSpIKrvroIPmF2OiNgghdem
 qm57V4I4n57aM+wl6J7q7YFvzobYCcLOUUB/LKM5eraIJmEEDjqDa5PUzi6gbQXlpq2e
 6dlKXi9yGfxheRtTTszM9X+vWdFbrQB/Jl9vEm9xenlaeetoi8Uz0xL3EuEV832O5uiB
 JXVYJLF+sTpKw/qBfMAQGvpQG7GsXEp532hX0saFjthrMIympWIjO3iu2EYAmBnEbMOT
 3+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aw/X/9HRdFlK3ENliYd8yhkSzevuBoqDvbJ7g1FREOk=;
 b=OjKLJRm7t4mO6t6HY7CP86aHpfg5ib5wbNag/ecXDBCYE2mgUs2gJwOcil94gDOe5D
 ak+4vUj/zKxXEahsJ3WO9R1WdF71I9VkK2PeC7bZPPx6HCeezTFKU/ufh83Uv8+4Z55Y
 eY8XSe1ElpRjapGv7bgHqueTA39oSl6OEMLPz+dL4ejhMygs7e0EhkOGN3ofK2qtCRWO
 qZygnJOQdkRLbxM/kUTviz2UQO80MaWV95j3C93CTbKGCX48ZXohFZmPBci5zrSPjxNM
 wxwrGYVlC3lxO/R20ofIWUIQkkrqDXmUShxrDAqTfYLthMkMe5lQaY7y/MRCubPMGOMO
 tmcw==
X-Gm-Message-State: AOAM532ozWf12uIt1VJ+rIgI5pNyFCNqvZTJcneYHvGVnaITWlF3F6of
 dBgXYPmgosLo7TLiwauMHXI9t7zTPV89pNwwaRE=
X-Google-Smtp-Source: ABdhPJxrDxW07y8dLE5n+dcM/FUCVDaKSfs0FshgoV6zFzewudotaQBLzrHOOshSLszMCmD5zhQsLk6tRtwXHFx1Heg=
X-Received: by 2002:a17:906:447:: with SMTP id
 e7mr50750226eja.172.1609374250025; 
 Wed, 30 Dec 2020 16:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20201230103729.2272-1-christianshewitt@gmail.com>
 <20201230103729.2272-3-christianshewitt@gmail.com>
In-Reply-To: <20201230103729.2272-3-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 31 Dec 2020 01:23:59 +0100
Message-ID: <CAFBinCCUV4piTy7n83GsV9Tny+JYA9_AXS0uiv5FeNPYejNR-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson: add initial Beelink GS-King-X
 device-tree
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_192411_541901_E1FB219F 
X-CRM114-Status: GOOD (  11.30  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Dec 30, 2020 at 11:38 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> The Shenzen AZW (Beelink) GS-King-X is based on the Amlogic W400 reference
> board with an S922X-H chip.
>
> - 4GB LPDDR4 RAM
> - 64GB eMMC storage
> - 10/100/1000 Base-T Ethernet
> - AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
> - HDMI 2.1 video
> - S/PDIF optical output
are you planning to enable this also?

> - 2x ESS9018 audio DACs
> - 4x Ricor RT6862 audio amps
> - Analogue headphone output
there's no driver for that DAC so I think that's why you are not enabling them

> - 1x USB 2.0 OTG port
> - 3x USB 3.0 ports
> - IR receiver
> - 1x micro SD card slot (internal)
> - USB SATA controller with 2x 3.5" drive bays
> - 1x Power on/off button
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
I don't know/have this board but also I don't see anything problematic so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
