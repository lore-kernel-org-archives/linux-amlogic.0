Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BE4C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00F0921871
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ICIDLpMg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iZ8BTifh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00F0921871
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acD/XIlMbmRSR8bRpYVAu+C2c1TMah0l90nSCENSNcU=; b=ICIDLpMgZP6dm0
	+rmKVWqpRO7ygalBiGJASndvL1SzFglPE7/YasueNpo1rKanA7IbmzcSPOLCdm/0tRo5tex0zvxq5
	NL0JVNup/vJVGHCNiv3aJgepb6M+zI9iXG2FxdBjGK5atjeG4wGOSQjiqTaHdc6Yz4TKfnyQ2d/rS
	o31Shuf5CbrpE4jlcj6JAJusUGQQjpnWjJf+xdYsXIgLZ89MpChrDB7+IjqhY8WQA3vkQD0r51vJD
	2DblyIUt2GwgT3N2Fm48ynomYLV/Yop9zx7KbojRj6qwjy5k8EWvtCM0VnLMkjEj70xlZGu41TYyT
	j4PCuyYEFkRBiQN6BoiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4ubG-0007RJ-Ue; Fri, 15 Mar 2019 21:42:46 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4ubC-0007Ku-OB; Fri, 15 Mar 2019 21:42:44 +0000
Received: by mail-oi1-x244.google.com with SMTP id m4so8533544oim.9;
 Fri, 15 Mar 2019 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wCtk3aXt0Yk6toX/gAFR9+fxygQzQO4SiBLOx7sFfow=;
 b=iZ8BTifhTEFX51Zn899jDENWT9BuurPS045AAH97doS77Pr+ovLEc4i2gAYOyc4cSx
 r/B6MhXGDN0BY0Ee08O+E2aDrUHJKbgeEQ/h6KwqF/dn6MOSw1Khw6Cccq3aupUUdver
 cMBvqYRSkmsBMZ6OSsjv+fuTP+hRwNzm5+4X29Z/LhxcszvnPN+VgMuY2eAizaQaIGlL
 E7pXt8bTZryzqyYWMlCbCBDB0HLh/SDZOAhmh28QH2CjT1Bp7CQL6vdNVyLwnEybaPG8
 wYGe+gRiO+BVR1lMk96/2pC7+rZIFKFwzHRiprGGbY1obY0Y18h+tzbWGj2ei6HD547B
 iPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wCtk3aXt0Yk6toX/gAFR9+fxygQzQO4SiBLOx7sFfow=;
 b=Vg7rW2/vWGihwBgKCMOrLcdHE3AgbamFVxhoj1LD4BtXDca0nyZc5yIOypOCb3L/2w
 oZpkrGqnqvXtR9jeqMIdKUepnPBWAHNXbNKlPP05SwMLwHoUFH/Wn3/BYSahTMmoVOfB
 lDGUE8Qvla1CBNXO/lL5WR5EENquG182Q8/4aMFHVg89NpZBECJK97pTB3T6pfC5wCXB
 y2W9hdIEAS87JsuihpYF9c3xUUcG9Vgvj8cQNEJpGCz7jwFXCdJmStOSWQr2OqJHLcw2
 /S2a2z/W5lpy6oUGmXYhEbYqdc/QebfRDBcFgf1enMYu/J+LF6i9p0uCC3x/zsPnsy0E
 2kmw==
X-Gm-Message-State: APjAAAVwp4cOP2bYmpxDxcT7/tpF2AjErhZXP8X2VkkOAanbTdkDleI7
 LUAiKucgMopbI8/w2C/N/dse1MdJIdABq2IpD24=
X-Google-Smtp-Source: APXvYqxBaBq3VYbfG7CF7XmaCLLGwiZ9+0qqC8BEWY5vEx11GoQ3gEDnspE+CVC+Ms9AOnUy8NaVYj+ghZvPBGzZ2mI=
X-Received: by 2002:aca:4808:: with SMTP id v8mr2958837oia.129.1552686161894; 
 Fri, 15 Mar 2019 14:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-3-narmstrong@baylibre.com>
In-Reply-To: <20190311095613.11371-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:42:31 +0100
Message-ID: <CAFBinCCX2CqYXJgDzQX-cocKGCk00_rrV9Jvbisf2PL+HtrqYg@mail.gmail.com>
Subject: Re: [PATCH 02/11] arm64: dts: meson-g12a-sei510: add uart_AO pinctrl
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_144243_417112_0B612E5D 
X-CRM114-Status: UNSURE (   6.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 11, 2019 at 10:56 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add pinctrl on the always-enabled debug UART AO.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
