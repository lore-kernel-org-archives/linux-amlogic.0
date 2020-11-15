Return-Path: <SRS0=lFz5=EV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3B9C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 09:22:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2168922450
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 09:22:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AhvofPB+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EiRQv+5W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2168922450
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mdOAxA0UrKLTI1Nb5Up2G2oFz9fSprGG9gyUdpeX1XE=; b=AhvofPB+/XIb2eCc+e/nweUzk
	i8QieLGxqrEbgcnzuslKUEIjIFloTQG2Odqq6l4Gv3jQVBqrZ1M3rIrowLSRLEGcQ7f+wDkMoEyBa
	0WamtwXEa8ZGwhs66QV7XtY96Q+Wx1wpnpFikzF+PvB/z6dL9OE+NOVpcKexaxphLlNJk/PtZ13AE
	UI86PkSLrZygfcjUmHZ+j47VzxA6seCqe+npHiIl1egSSZO4pVE+iEA/mn4E1qqM2epmPG6/g3plq
	jn+7L1t5zRHSvLE1jrU92/UBl8NUu1qdTMFPY1zJ+Q3TgkV1yaGWl+sBmY1NaPA21g48S3p5aj/Fl
	UNO5Lqy1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keEEn-0003Fx-Qs; Sun, 15 Nov 2020 09:22:21 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keEEl-0003FL-LA; Sun, 15 Nov 2020 09:22:20 +0000
Received: by mail-ej1-x642.google.com with SMTP id s25so20065955ejy.6;
 Sun, 15 Nov 2020 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ErxNsuDkpd1W/DgWEjOvUcqQZYKwNOZCjLfy5r+fMW4=;
 b=EiRQv+5WibDnUbF1YEgtIVVn9/cZsIfofXuGl9oIzWePfmtK8bWFCJR4TkWuUfuS+w
 E0uYr+CrVEX85JHkcRN1idUF45nSjh+gHru31LaQ8dN9WiSoI64HvfMufvJ8f7kkkfu+
 CHfjek6MtyQHtl1lwKE8CAq0220jL2woE6SXZg1rrE2SPPhb3u7Su1B8aP1JOjUZFrmr
 qaTTSMfmwV5HTA6n2E41b7nRLzl9I8S3TT974jah7fq9xkxDKZhKV/7iK2fucT4SUg95
 TbOsG43zvqu+EGTg6PxyZFh0whCPzCdDeGgySDyB/EQaGOhL72jH5jEjYaubgx0x+Wia
 IbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ErxNsuDkpd1W/DgWEjOvUcqQZYKwNOZCjLfy5r+fMW4=;
 b=UvgRY8bJYBEhlnxnTF5L9B4qVp88aYU+zrq2jbx+wNlJK+d8MI9D8A5MBx2FQioCMK
 uOEAzeh+oaHBeHMVHrucAQERg/nQn0Czo92Mf6A/C8I2TIiKKLYmTz0+wFXC+Vl32HY4
 wCIA60BgedG02bSdse4uINDhxSKnFPDNsd+pMt8uZ7r6s2leHmPj0tAjN4+/GE7oj3AY
 FiFIRRyG9imqo4rXrKdsDSphiUHqwcZaa4ubOFPuhV6tH4gH+y1I35h74n5Foj+14Bdi
 yuiXh+xD4xMbhm7EdactUSJgzz76rJNBrc9tgk8XBHlFD11dg6j1NOWjNqNM7BzvQw2t
 X4kw==
X-Gm-Message-State: AOAM531L5clxmSZw3bdYuxS6S4U8lfNLw4rDuHypGegIsv+Qz9w5SKSU
 zftsz0VyKD3wK7VTDqRNq4zv/Hu/Zxdf63Kbtpg=
X-Google-Smtp-Source: ABdhPJwBuH2TYudRTSq4x2ACk4w4Jv5QBQFB7KtV8gD0oxBNII0XyQUEUWfGeLMsNcLBmzBTRATH3faB9L1T+PSsmuo=
X-Received: by 2002:a17:906:3d1:: with SMTP id
 c17mr9576167eja.187.1605432137878; 
 Sun, 15 Nov 2020 01:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20201114200104.4148283-1-martin.blumenstingl@googlemail.com>
 <20201114200104.4148283-2-martin.blumenstingl@googlemail.com>
 <20201114223250.GI1480543@lunn.ch>
In-Reply-To: <20201114223250.GI1480543@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2020 10:22:06 +0100
Message-ID: <CAFBinCAmExHsCpP8hh_K6M6pg8SjoF1WNNj9fwSKR3dhgBGJdA@mail.gmail.com>
Subject: Re: [PATCH RFC v1 1/4] dt-bindings: net: dwmac-meson: use picoseconds
 for the RGMII RX delay
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_042219_762260_C8630ED2 
X-CRM114-Status: GOOD (  25.03  )
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
Cc: devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Sat, Nov 14, 2020 at 11:32 PM Andrew Lunn <andrew@lunn.ch> wrote:
[...]
> > +        amlogic,rgmii-rx-delay-ps:
> > +          default: 0
> >            description:
> >              The internal RGMII RX clock delay (provided by this IP block) in
> > -            nanoseconds. When phy-mode is set to "rgmii" then the RX delay
> > +            picoseconds. When phy-mode is set to "rgmii" then the RX delay
> >              should be explicitly configured. When the phy-mode is set to
> >              either "rgmii-id" or "rgmii-rxid" the RX clock delay is already
> >              provided by the PHY. Any configuration is ignored when the
> >              phy-mode is set to "rmii".
>
> Hi Martin
>
> I don't think the wording matches what the driver is actually doing:
>
>         if (dwmac->rx_delay_ns == 2)
>                 rx_dly_config = PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP;
>         else
>                 rx_dly_config = 0;
>
>         switch (dwmac->phy_mode) {
>         case PHY_INTERFACE_MODE_RGMII:
>                 delay_config = tx_dly_config | rx_dly_config;
>                 break;
>         case PHY_INTERFACE_MODE_RGMII_RXID:
>                 delay_config = tx_dly_config;
>                 break;
>         case PHY_INTERFACE_MODE_RGMII_TXID:
>                 delay_config = rx_dly_config;
>                 break;
>         case PHY_INTERFACE_MODE_RGMII_ID:
>         case PHY_INTERFACE_MODE_RMII:
>                 delay_config = 0;
>                 break;
>
> So rx_delay is used for both rgmii and rgmii-txid. The binding says
> nothing about rgmii-txid.
interesting point here. it's been like this before this patch. still I
would like to understand what the proper way to fix it is so I can
also include a fix for it:
1. should rgmii-txid not add any RX delay on the MAC side? that would
mean for my board I will switch to phy-mode rgmii so the MAC applies
both the RX and TX delays
2. update the documentation to clarify that rgmii-txid would also add
the RX delay on the MAC side

> And while i'm looking at the code, i wonder about this:
>
>        if (rx_dly_config & PRG_ETH0_ADJ_ENABLE) {
>                 if (!dwmac->timing_adj_clk) {
>                         dev_err(dwmac->dev,
>                                 "The timing-adjustment clock is mandatory for the RX delay re-timing\n");
>                         return -EINVAL;
>                 }
>
>                 /* The timing adjustment logic is driven by a separate clock */
>                 ret = meson8b_devm_clk_prepare_enable(dwmac,
>                                                       dwmac->timing_adj_clk);
>                 if (ret) {
>                         dev_err(dwmac->dev,
>                                 "Failed to enable the timing-adjustment clock\n");
>                         return ret;
>                 }
>         }
>
> It looks like it can be that rx_dly_config & PRG_ETH0_ADJ_ENABLE is
> true, so the clock is enabled, but delay_config does not contain
> rx_delay_config, so it is pointless turning it on.
that is a good point and also a bug with one of the previous patches
I'll include a patch fixing this in v2


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
