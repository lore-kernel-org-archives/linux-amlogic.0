Return-Path: <SRS0=WE2E=J4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B046CC433ED
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 May 2021 09:28:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E93566142B
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 May 2021 09:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E93566142B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7wYLkHFD55Wpb+dg3pv9cmYt3GLHuomcyXhnN7OJhis=; b=lCj6QkEYJOkbE9TaWWHDCy+tx
	Szl90d9b2o7/G2wgMmeU4D8U1Syjy+ULm+FP08u2DLGinOxSI9RXyJPM+UqVycUKuFIWcG4vzM0Z1
	xlqHcKVL/4LwvktTHb91x76DmfVWz7Cxa611GSwg7R19GXZUeZ9VbDALlgR8f/t8d0VCZojWAmvFq
	iN8zUPfMGXJitTX2Raxy2Hi3wqnldHdXGe5mAt4hf9W1mgq1PTlNuj4rAheB1oKRjuZMmut7QBMzy
	d5gUdYio/P5aj8NAxnoCmlDvs/im1QtTnYLlNXetHHVLmBJbghijGGisGRY4sV2Tdwvx0qZWFIZlq
	coVUN3MEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lclvP-009nfZ-BP; Sat, 01 May 2021 09:28:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lclvN-009nfL-9P; Sat, 01 May 2021 09:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SyGYqVikn3sRvr8oBxpMkevusdQYlEUroZdr1msedCw=; b=TB8SEnOgsJNTruRnCIXWUoxRRi
 yJ38GAdMak862OnePb8DeH+MLpUegPoPyV5CAJbGT0FrkhWtlnM9/Uz3UsnAIbA4X5fBJ2WgeKJU9
 eE0VTJ4RedyjlaTaDYBCHj2usW6KancHFog+BDl2jNxjplksVFOBMlu3GgtYKb7kdpyPHcp83ZXQt
 2uJyPSm4CC4Ga8SqX8EWOApZdLT/CB1ix+ecoe7Kd0qjD/Kq2uicl7RpTuc4WnDR9A6nUefSqfZVp
 a5khUT2d8bPS2ZYDcqJeqEq4Hf0Iu0FD7LRWTpIjYwoOca7R69sHT4qCGZ9+vYNQ51XzU7rYv9DZY
 8Mqomt6Q==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lclvK-001unh-9O; Sat, 01 May 2021 09:28:31 +0000
Received: by mail-ej1-x630.google.com with SMTP id w3so727781ejc.4;
 Sat, 01 May 2021 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SyGYqVikn3sRvr8oBxpMkevusdQYlEUroZdr1msedCw=;
 b=sPwxNQlVV9CppL4NWcVqlYriHNWEQ1jnrUky72n7dWeTrSjnoShtCz1UmjSjIXKeP1
 fiTOIlRGqn5mcAjAkwNN9/4E/vyAdhV4Vp/NpCFU2euSm4GMYStdi6jtNibwkV487KFy
 X9+cALwYZ6NToc/MYX7WyVi/4KJMmStpkuIjGqpY+/t610JLjww4dx6TTNBbZBNr3W76
 4Jqrg2qSHis/Sn7t7qc04lkCQv++qvC+5odOc5zbl+lwsjkyxY/UnIGHn2F+VhXcT/00
 MA31SzIymM8KGROsE1pA50qxsb7sMQoDT5A7LslAdzdR5CT4dHdN+Rp0aVJdyLkYIhPp
 Ot+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SyGYqVikn3sRvr8oBxpMkevusdQYlEUroZdr1msedCw=;
 b=EUgb0BFRgZmxWsf7FOQk4vnLCcx9TAdE1KjTr0f5cU84UbM7WVd8Z802kV1+bFgfFN
 DP1TsgUCf1ve5jAOwuMxHfRJIhPC/8/r/Z7LTwlVTGgX+vGR+xmMXAatGeoEyUWFvPH6
 fuaVrfG7HxhtowCk2tcJa39TVOuMHaDeKzF2K0PA72CuYnRdm/qHYYfWiAKIVYjgNLkJ
 GcP48EpCm2wpELc4NQ4OuD8ghbRPFCZlarEAavZQ0sLxgABDvGnhLNZeFLtnI3eb9VDY
 8dRrykrJ5Cj/sZ7/bt6x9mFiclQXCpNzn8gQVYT0E3gVJv8lnBbj0VlcW6Gi2+6sWrHR
 qxaA==
X-Gm-Message-State: AOAM530Ysoz44UI2AxaPK66SSM0ol+1Z3Y3uQa5YkY74ytJ2Zb3r5g9q
 z/HVpRX2MJO53d+NiyGS1lDOq58wv+BMox6Ph/LzSGbZblk=
X-Google-Smtp-Source: ABdhPJwL4T7Awvt9Npw1jmNY5GUe7UBmVuRvRtXR9P7lvQ1b3cJnmJdcuCfMyjJWCMPtCTNZY1uuTR5hVVqKhk1/37Y=
X-Received: by 2002:a17:907:e87:: with SMTP id ho7mr8119874ejc.2.1619861307057; 
 Sat, 01 May 2021 02:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210429170404.3616111-1-narmstrong@baylibre.com>
 <20210429170404.3616111-4-narmstrong@baylibre.com>
 <CAFBinCDQeTU0ss=oNmjX78MPyNZmmCt-haojNNcQqkjJUmJYKQ@mail.gmail.com>
 <cafdf662-6f15-8e16-7752-5740f28b6682@baylibre.com>
In-Reply-To: <cafdf662-6f15-8e16-7752-5740f28b6682@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 1 May 2021 11:28:16 +0200
Message-ID: <CAFBinCDNhErxk3va=rMUpOoh8b7iNNqWJh6Ry_Y5sC5AxYLn2Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210501_022830_371027_EC53E0CA 
X-CRM114-Status: GOOD (  16.23  )
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

Hi Neil,

On Fri, Apr 30, 2021 at 10:16 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> >> +&ethmac {
> >> +       pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> >> +       pinctrl-names = "default";
> >> +       status = "okay";
> >> +       phy-mode = "rgmii";
> >> +       phy-handle = <&external_phy>;
> >> +       amlogic,tx-delay-ns = <2>;
> > I haven't checked their u-boot code but some of the newer Amlogic BSPs
> > seem to let the PHY add the TX delay (which is also what the netdev
> > maintainers recommend)
> > that can be achieved by setting:
> >   phy-mode = "rgmii-txid";
> > and deleting the "amlogic,tx-delay-ns" property
>
> Done, but what about when we use mainline U-boot here ?
I think it will work just fine if
- the PRG_ETH0/PRG_ETH1 register is programmed correctly (that's what
we have in dwmac-meson8b), which according to [0] is partially (RX
delay not being supported in u-boot yet) the case
- and the RTL8211F PHY driver can set the RX/TX delay on the PHY side,
which according to [1] it can

So I have not tried it but I think it should just work


Best regards,
Martin


[0] https://source.denx.de/u-boot/u-boot/-/blob/798424e8573a6b642a1bb507d41c1f73e6736e2e/drivers/net/dwmac_meson8b.c
[1] https://source.denx.de/u-boot/u-boot/-/blob/fa6539a3dcbf269121ca64084cff4c146fcdaf19/drivers/net/phy/realtek.c#L204

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
