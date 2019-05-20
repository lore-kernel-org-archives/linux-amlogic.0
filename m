Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F988C04AAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:49:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD72214AE
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XtPnoPYC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KRuSI92X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AD72214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lBiWcnxgEZCwtkqRFegUU90KqVrQq19z3pDF9MZjjM=; b=XtPnoPYCNhrHfc
	+oXegnvMb/vLf7CovnPSPivTpWMsJMC6A9V363XmaAweXh0shtA3pIPz3wdFU0jWUtwd8fuDwcq9t
	K2ReGvMoAsbY4hfaPo9Bs85/QTrrJGesVpQmPm6hLKenJAc/+cfNI5fkvcIL+nmE9lquLEmtex7kH
	NZYi2CvoBy33HYntZz2QPqKuVxTj0ZJw0XqHlTn3fHqeWnS6tTO8VXpXLsHvxzyz2B6DE0kBFg6Mp
	LaX883Jm5IeKo6h9cJ0tf3Ri2ZUfmqkWJg+naGSlmpFay9owBQOEZGYfnBW+nEmeojDSC0IdAHd4a
	evFaGOEBaiUrusZQk/RQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmPu-0003Ay-65; Mon, 20 May 2019 17:49:42 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmPs-0003AJ-0H; Mon, 20 May 2019 17:49:41 +0000
Received: by mail-oi1-x241.google.com with SMTP id v2so10663916oie.6;
 Mon, 20 May 2019 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PMu5z9Pb1JYnZ/S7r9n3dN5Znr+GV/uPeHM78vQFblM=;
 b=KRuSI92XIgS95pGI3LCda2ZEvswitp1vv2OAChZPPfbBnF2ZbmyL37TbD8BcOpbaam
 YqD/hVyKk7Y14DQrWjWC02oHqiMs2HfnYeX6J2DX79jdEHn2dThmNcVCLIJHe5hahOUO
 DdDPZABLzVzQB9/r7QxW96TGDS44zWI/hCR9kUqs1FjNaq3EX9+dHD4TTOZZYvN3rb6p
 ABZSAq/hHZ7m1KvGqtuIM5uo3Jt4mgkuJBZ0rYwiMhWZc3Xf5fvnLO6e8cLKLwcpvvbo
 xpr47oLIs15cFdTY5NapQkialIZPY7BVmq7yylmpdu+pW6qX6yY2KFd6pDYvag6FHSL1
 wJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PMu5z9Pb1JYnZ/S7r9n3dN5Znr+GV/uPeHM78vQFblM=;
 b=JkdHcf7H7OPY5iy9w2GnynF9GigXx+JlMmvCrDQk8swZsm9pF0BRB8zVqrPWFa/soE
 Bc9ePR+uO75W+VJWJWwTCzTiAorOgrcYkRt1OvP845Bklr3qHcBVen0JrERLRZyDtqjP
 vJstD1zbR6sleTIitOZNSF34P5XhY5jruOJo9OcPD+YoA6fLF60peLGBhKR5F2iYJdws
 qXEE7CG7A94mOwVOIkvODME18GSyHjgyrq274kxonBSu1CZGLl2BtwIufToD2drG+0MM
 rpWiYHN3jGBJhHfA+FG+mbEY7gBRdKCFKkthtDjiXfkdWx8lgKjG27rh0pvgwpnzlxzM
 KTZg==
X-Gm-Message-State: APjAAAViT5BNOzLy/DsJYn+FLmULIOlU1e4KNL4qeTa7PeUYnsR+3jEm
 dcrqbWtMNUvmUu1rcNqEUN2uJBO7ogsGJdMFHq4=
X-Google-Smtp-Source: APXvYqzSgtPQegeT7Oj7PJgF8RjjJD8LkIdVdZGUr+tv94JHftdUknSgFg6oCu6UiaXRH1rM0RgY5cG0AhLn0g5BtK4=
X-Received: by 2002:aca:5b06:: with SMTP id p6mr260281oib.129.1558374579199;
 Mon, 20 May 2019 10:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190520134336.24737-1-narmstrong@baylibre.com>
In-Reply-To: <20190520134336.24737-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:49:28 +0200
Message-ID: <CAFBinCCvERE1V9aBhwNadwPRAi3Fy3EPQ_MGTGX23CQaHi0_kA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-g12a-x96-max: Add Gigabit Ethernet
 Support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_104940_045949_C7D39EFE 
X-CRM114-Status: GOOD (  14.81  )
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

Hi Neil,

On Mon, May 20, 2019 at 3:43 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Enable the network interface of the X96 Mac using an external
> Realtek RTL8211F gigabit PHY, needing the same broken-eee properties
> as the previous Amlogic SoC generations.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index 5cdc263b03e6..5ca79109c250 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -15,6 +15,7 @@
>
>         aliases {
>                 serial0 = &uart_AO;
> +               ethernet0 = &ethmac;
>         };
>         chosen {
>                 stdout-path = "serial0:115200n8";
> @@ -150,6 +151,27 @@
>         pinctrl-names = "default";
>  };
>
> +&ext_mdio {
> +       external_phy: ethernet-phy@0 {
> +               /* Realtek RTL8211F (0x001cc916) */
> +               reg = <0>;
> +               max-speed = <1000>;
> +               eee-broken-1000t;
do we still need eee-broken-1000t? there are only 2 boards left which
set it and I'm not sure whether those still need it after Carlo's
fixes

> +       };
> +};
> +
> +&ethmac {
> +       pinctrl-0 = <&eth_rmii_pins>, <&eth_rgmii_pins>;
Jerome renamed "eth_rmii_pins" to "eth_pins" in v2 of his Ethernet
pinctrl patch: [0]
you missed his update only by a few minutes


Martin


[0] https://patchwork.kernel.org/patch/10951103/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
