Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588C8C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kow5l+Mau5GfD3lEsNIwvik+Yd3Xo3MIbxbuqSZLrEo=; b=Dy+y0WEILamhBV
	4WTRnLk/caYr2CqKCusrKrCuy43kV1BVvmN2nk6VVTeR50BZrHnGj0uPb9QTc1XCTLlDU9mXHf8Bs
	+E+N9RheeXC37/GCoFQRZbxDxo/h4zyPAYUuclxD2rb7IHg1Qrr3HrUfh8xZNhz37zywb3GEChCdO
	Xl3HinObPg5WEND/jjydxlB5hXxgXGgVycu8JsJwv2KyYJO6rmzDh6BAjLba3raakTDDpzCtbWdH/
	oRjwCTEZQPbbapwyqQGS/PHivWqIlFf8Uz1sYUYngOAK/74762R8CJgn1WyTATa4hYA0gcWndcOlF
	jInwG7O0zjb8xlS/n72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7304-00Dd2z-6m; Mon, 10 Jan 2022 22:18:48 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7301-00Dd22-UD; Mon, 10 Jan 2022 22:18:47 +0000
Received: by mail-ed1-x52b.google.com with SMTP id i5so5896659edf.9;
 Mon, 10 Jan 2022 14:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2wuC4QBxAL4gvA6QWC/OGqzBQ+FgoNoq9qXBNAbilkI=;
 b=gZ5zUOlenO/ly7lxX8d963S/GMOXF/nLk7n0jgUAQYWSAm4MrJKvTEoKVOpyYY6MJp
 rl4P8gQiJS17IhwHvT71WS8RbtlCGRn2oyHv1iDxLSARz2tItN6biu6sW4CEl/4F92ae
 tU+0NGvG6M1E2i6hhrcvxAog5jE2suyYwCJJsmbozyynu/Wt3oIfNaEBuIXies72Fznj
 +e4hnU6hGbiwt/5WVpc+iOE016WEi4N+kPqMVYMMBAkb0AgMfaFwn7o770IYAv5tbIUU
 ddV6C+vaIlsMuFUSrXm2ED/PmV5XAIVYkQtnQCovbW7o4yQszXBvqv46+gO9Ock/UBCv
 sBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2wuC4QBxAL4gvA6QWC/OGqzBQ+FgoNoq9qXBNAbilkI=;
 b=hlYqH/mF8pLPqUDB+qhb74bzmqKeBaQ0YWP//Eph67yefVLmmwPqCUqTQbqcoflkUD
 04SB41+Iv06/qxYP4JzZqzUeKgneRRQ/1YLjYw/kuPXm3tikUji4Ory2eBydIuaUOA++
 2Zf+YBNmatsh4pY7R+MPPsCPb6IR0iuaDGldQN+5Xt2+TbTo5y/WrBm1lYY/oIovFL/o
 FrgIObHItMZ4AsDdNjg5sBoZilGSCR3SI/FzdRP7Qg4DLpAxdD8F3TfSO1dhdbqNSb3V
 bug+EaMdZgPUh8qIpMneO6tT7uMtE8uIsBNSEVgTyabfTZG4Alm0YT5hdeuZhSdEV2l1
 HlBA==
X-Gm-Message-State: AOAM5334RPPgKVdXXHl8TXqSxNNW3Z/Xts485fqzqay5glKzEtT1n74R
 n4o4rrKziqGzvilP240o6dwQKh36nsfq5k36H2I=
X-Google-Smtp-Source: ABdhPJztnzSCV1UM5hQ3Y8AKb2QMmivElfcK6mKeONxweu0vrWguEgxTqC0RXmTiKv6H2RbGvdC+3F2oZ4GCJf7mt0g=
X-Received: by 2002:a17:906:519b:: with SMTP id
 y27mr1329857ejk.649.1641853124571; 
 Mon, 10 Jan 2022 14:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20220107150512.614423-1-narmstrong@baylibre.com>
 <20220107150512.614423-2-narmstrong@baylibre.com>
 <CAFBinCDRx6VaaAubr6VRLnX=G4Ez8cGg-=6e-9GWrH8FwwBs-g@mail.gmail.com>
 <fad140b9-2940-a24a-ba70-9849bacf617d@baylibre.com>
In-Reply-To: <fad140b9-2940-a24a-ba70-9849bacf617d@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 10 Jan 2022 23:18:33 +0100
Message-ID: <CAFBinCC7wfPjLGVe87E0H7WYXwrFw0e0k_2epF1dDaWKkSvRyQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI
 D-PHY bindings
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: kishon@ti.com, vkoul@kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_141846_015281_67BE0ACD 
X-CRM114-Status: GOOD (  15.83  )
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

On Mon, Jan 10, 2022 at 10:25 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 07/01/2022 23:13, Martin Blumenstingl wrote:
> > Hi Neil,
> >
> > On Fri, Jan 7, 2022 at 4:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> > [...]
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - "#phy-cells"
> > I also found a "MIPI DSI PHY clock" and "MIPI DSI PHY interrupt" in
> > the datasheet.
> > I'm no expert on this and I'm just asking in case you have missed one of these:
> > Can you confirm that these belong to some other IP?
>
> Indeed the name is misleading, both go to the DSI Transceiver IP (dw-mipi-dsi)
Thank you for clarifying this!

I just found an old comment from Rob on v2 of this series: [0]
He mentions:
"If this is a child of something else, then put a $ref to this schema
and the example in the parent schema."

To be honest: I completely forgot about that comment until now.
If I had remembered it (and assuming that his comment is still valid)
then I would have had to NACK my own
Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
For today it's already late so I'll look into this more tomorrow.


Best regards,
Martin


[0] https://lore.kernel.org/all/20210210165118.GA2311581@robh.at.kernel.org/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
