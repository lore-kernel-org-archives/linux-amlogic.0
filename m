Return-Path: <SRS0=97z3=VA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5751C5B57D
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 00:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E08A21E6A
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 00:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aE8nlquL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ky+Qov/F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E08A21E6A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2lCtzV3BPpswPPYH4kEydPbxxxCXddr9/y/EBrcZWs=; b=aE8nlquLeRnjvI
	jc41DZU9t7LpWW6rnz49ymJwR5mXPjcIzPEN0A2QWlaeh6GQFosjgBAUvqntG3di2HwXVwndAsSfg
	M1HbAqnsPiPpWqrGLcumcLjJeU8LymrHF4HPIG27QEXDib1iRXRTW7eDCx7XVJpvcYppCqhUWfMG+
	7ycBgj/h9ou9O506Ypni1aYhsMrtaCbWE3+JiDJd1CmllR4tKts8GLdzNqWV2pi1YJIxBRfhJ3V1D
	PsQUc70xVbmtqnKyx+PINtfYVfNq2F47Vwm65cN3K7p9mdAqITK3K73nQ2I9sJqED438W0Izg+vv+
	km02+aLAJeh2HSBwxvAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiShy-0001gr-4C; Wed, 03 Jul 2019 00:01:10 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiShv-0001gK-8q; Wed, 03 Jul 2019 00:01:08 +0000
Received: by mail-oi1-x244.google.com with SMTP id u15so538837oiv.0;
 Tue, 02 Jul 2019 17:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EYSjJ+LydcEzxdw5idXtHVOIPJiJa1YBB46CfRDibpM=;
 b=Ky+Qov/F2L5VKJErmVkFIhuhAIV0b1AaOa7IMvL2kX/CUlcxAElMT3DrIgwtBnA4d1
 SQ/23AicMM7pBE+KLQpjWjno8WseCCJH2B9hFbvaoV728N3z07QHToIGQtDp6PfV94rI
 Dv/k6naII/d9qUlexdL/XoZ1IEf9ZOj3wXlcer1runlwnx96UQ55EyJWCSwYjcuyZSRV
 ETsmPLcasSQMP0aylaGM7CqMRgDkZzaVyopzqjOUyaupOk/n+qJGV3S3swBHCiTn9wm3
 l0vG4Le3nRf61YoCFWKKFPFbg2ybTvPs+QBi74QoDVpU5Ib2l0hrpfVXXPjP296aYkhL
 +tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EYSjJ+LydcEzxdw5idXtHVOIPJiJa1YBB46CfRDibpM=;
 b=WWZBRry+F7HPD53dUF89HgTB2w/h+5uxoLvT9rOenrMZHA+LuUX4VqehkdtZ8W8Nmr
 odULVBocpKL8coomnwDWKSVTgek6TkAnbxZwESxHbj7DcrFJO3QQl4gsoKWVDnc+mghr
 GqDXJHMpC+sErdUbaLTBUjrHMjXbz7vx1JCRql+OupVIeJQtujS0jYXZ/kkLN7TQc0R/
 NcZf/54XP0UCDiF6sbMoHmMkJpHOS/uisPKA7oFwsErlxH95vPoYu6FO6hnk14RKbdSp
 afachOAnxj2d2pUKChJsZ8DQBO9vKvDOXmHRL1Pzzoqf8I4tRT+0EfEfT7qFF9HcF4dj
 pXUA==
X-Gm-Message-State: APjAAAUNNFXLbI3cbZsmNx/Z350FXuE/K9P6i6ZIXzKBgFAbGrDtYure
 ROUSFzoSx4WtKuv00qMmdFvqIWeUO4HC1oYrULW45kVg
X-Google-Smtp-Source: APXvYqyaGj0PCGVVeTWrqW1w/ckN7gLuV9G2Q3xfXsdrU6SN4A4wrK/wTIoCTD3mXZvotSia4JivxoObW/UzXuEV8E0=
X-Received: by 2002:a05:6808:8f0:: with SMTP id
 d16mr1556508oic.47.1562112065923; 
 Tue, 02 Jul 2019 17:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-3-narmstrong@baylibre.com>
In-Reply-To: <20190701104705.18271-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 02:00:55 +0200
Message-ID: <CAFBinCAT1JaK6ksD9OzCK_wEEWJdaZL2vLzGeCzVVbz9V67btQ@mail.gmail.com>
Subject: Re: [RFC 02/11] dt-bindings: power: amlogic,
 meson-gx-pwrc: Add SM1 bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_170107_340855_77077D5E 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: devicetree@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Jul 1, 2019 at 12:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +General Purpose Power Controller
> +--------------------------------
>
> +The Amlogic SM1 SoCs embeds a General Purpose Power Controller used
> +to control the power domain for, at least, the USB PHYs and PCIe
> +peripherals.
AFAIK each binding document should only describe one IP block.
this one seems to be new / different

should it get it's own file?
also should it be a .yaml binding?

> +
> +Device Tree Bindings:
> +---------------------
> +
> +Required properties:
> +- compatible: should be one of the following :
> +       - "amlogic,meson-sm1-pwrc" for the Meson SM1 SoCs
> +- #power-domain-cells: should be 0
> +- amlogic,hhi-sysctrl: phandle to the HHI sysctrl node
> +
> +Parent node should have the following properties :
> +- compatible: "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd"
> +- reg: base address and size of the AO system control register space.
> +
> +
> +Example:
> +-------
> +
> +ao_sysctrl: sys-ctrl@0 {
> +       compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
> +       reg =  <0x0 0x0 0x0 0x100>;
> +
> +       pwrc: power-controller {
> +               compatible = "amlogic,meson-sm1-pwrc";
> +               #power-domain-cells = <1>;
> +               amlogic,hhi-sysctrl = <&hhi>;
> +       };
> +};
I'm not sure that we want to mix HHI and AO power domains in one driver again
back in March I asked a few questions about modelling the power
domains and Kevin explained that we can implement them hierarchical:
[0]
unfortunately I didn't have the time to work on this - however, now
that we implement a new driver: should we follow this hierarchical
approach?


Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2019-March/010512.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
