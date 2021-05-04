Return-Path: <SRS0=bYYt=J7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C95C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 20:53:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0489161177
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 20:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0489161177
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UJRmDpVmfeXWaeblGjSLjvmZ1QGJ9U0IDBBtXMyYUmc=; b=Q49T9HGEAIScIzOf8g857I03j
	cfPeveMC2lovJIwXBwEYHf/x5WHaENIQnBI8S5a/31PGiR8eLNzY7Z3i3sbwM+rduJSY9IGrAa2XI
	1k/HMv+G8jTOsJcUoEl8k48xyIXlSqvjtQkyiUfyBNa+N5VikJBMv9pPt0ToRHyOgAXbxHUQ79jfN
	r+4Vh0IYxOkiAx5O77TImuKkwsJs55rxSaC5DhlraKyTw1b4NkLyx9CFVy93hCwouZ94txA/kVxpY
	ejsn+WiZPAVuj/Zh/2pqi5WFaR8MyF1tgUWShdIKYeV7CtLiYF69ZQk5VEKOI6TX6dLgjxye1CwdT
	98HB0iktQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le22J-00H3sY-3X; Tue, 04 May 2021 20:52:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le22G-00H3sI-VS; Tue, 04 May 2021 20:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4mJQuD4mnuaCWq1D6gvIPhHTbCcwKAIz+YjfBqx3dCo=; b=ZfLLhOb4y1/HtUnlTD45OasBko
 czE8eic/UUv7JGGYe4xJVa8bajnIIWEfK7EzLPREPuhmGaAyVjKuKHTaBsIZ0QmM1eYcqIsUAP8zY
 zkD+4aKIa5lR3lsKDgdNaQTHQr6wQHTOdIHiu2Guk3vZlH2penzQ9HOyRBqGQEO6P476EVj0QQVDA
 F//lzdmDnq0Yed0YaxD7nh4i5+CVwSgqdYr21kO6E1V0qgV7M0JKG5esllfI19qyipejNsJHgRKv+
 Z6R7/x9akEFkCwdAl9FSi9xgdpUuQ0ZAYfuIxDKVx5GF3QxnmkG8xhM2vvmnrCBWzfxvalPsdSjJF
 hBvdPQqw==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le22D-004GOt-VZ; Tue, 04 May 2021 20:52:51 +0000
Received: by mail-ed1-x536.google.com with SMTP id i24so12020850edy.8;
 Tue, 04 May 2021 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4mJQuD4mnuaCWq1D6gvIPhHTbCcwKAIz+YjfBqx3dCo=;
 b=Hp1iYyOCcnpf53Q1fCKgIKV0WwgkMh/C8tJm6nrj5JrJd4ArrkpI6L4K5U+9Vtzu2K
 EjF2TbArco3pxszZBXr/devJ2be1uD77rt3WhsHyoq87GjaVNA+7uE7eMAafTlfQaY9H
 ZvOGc6en96CqXAzVUfPLUIPXpf7xYlTta0bvS3arvXs96ya/Xmdkax8tpimr443PcMTV
 BfP8PyrgBTPkkNUnasJ9pE1XB7TL+lZRdg6auJ4lPGmcRsViKRWoEZ1qg8CRcOmP7Vxp
 hayRpjMAM//E+In7pYXvBy077jf+yo5CKs4TSp+ln6DCMhFRAgHHs2Qa7UTH720VebLc
 wzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4mJQuD4mnuaCWq1D6gvIPhHTbCcwKAIz+YjfBqx3dCo=;
 b=DhbVmk7xwAPtT84n77NmdwNBomhlsVOS+p7Pspsc4k6Ti8iFCdMlhR42lnZ8DmNWS4
 jlDASTvD5LgoovhsejQ7G6NAtAWai6MyN2EuE2Vpv1SJkG8b0S6qYDdaqDP+U3IzJGYp
 H8t5vWHpnLIp4VzB9dqgl55Jh6K+opiFHPXCzpyZlo5kFwaqaOXXanqps44PoVy1GDSn
 zWuBNdp3d1MfeixUJWKBX4oDRDw2nuyuYa+705vufZ9esPaB2QU6Jz0AawR3YKWKzq9j
 tsMEOpxdgeUmct9p3qRNSEpz3ghh/kYCu60F5DWSDnnZj6CcP7nU2SEz33IxniipSB7p
 IUiw==
X-Gm-Message-State: AOAM531YikUxGaNkDn5E02yV+dh16Qr3vvCbhRwNHocaQ8ZpagDGPYF6
 eqIe2HVzXfZUoOo2fefb4FFBGjd3TOe8h86UUVU=
X-Google-Smtp-Source: ABdhPJxNH8mE/dJ2Lo61gkk7613QibMuhjIUwzyR5nTasiUbR3oRDUNK6TMQx2gz45mqNhi/7ZSLwLIrEq0z9JI1Dm4=
X-Received: by 2002:a05:6402:36e:: with SMTP id
 s14mr15914973edw.338.1620161565812; 
 Tue, 04 May 2021 13:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210504041659.22495-1-wens@kernel.org>
In-Reply-To: <20210504041659.22495-1-wens@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 4 May 2021 22:52:35 +0200
Message-ID: <CAFBinCBZa-OjjLE0oaNQzAL+tGTkiC_Kf+iHR1H3K5-b+uFK0w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_135250_036262_D401309E 
X-CRM114-Status: GOOD (  20.78  )
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

Hi,

On Tue, May 4, 2021 at 6:17 AM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> The NanoPi K2 has a AP6212 WiFi+BT combo module. The WiFi portion is
> already enabled. The BT part is connected via UART and I2S.
>
> Enable the UART and add a device node describing the Bluetooth portion
> of the module.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v1:
>   - added uart-has-rtscts property
>   - added alias for uart_A
>
> Hi Neil, Martin,
>
> I dropped your review-bys since I added the UART alias and I'm not sure
> what the policy for those are.
>
> ChenYu
> ---
>  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> index 7273eed5292c..f017a263784f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> @@ -15,6 +15,7 @@ / {
>
>         aliases {
>                 serial0 = &uart_AO;
> +               serial1 = &uart_A;
this should not be needed anymore since
a26988e8fef4b258d1b771e0f4b2e3b67cb2e044 ("tty: serial: meson: if no
alias specified use an available id")

IIRC for "newly added" .dts we are only adding the alias for anything
that shows up in /dev/ for the user
meson-khadas-vim3.dtsi for example is not adding an alias for uart_A
(also used for Bluetooth)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
