Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9DCC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 21:05:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C8C214AE
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 21:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mzYqJcgt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EyGUhTcu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C8C214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLWDj4JhSWlon4efBab+vpSFvgeeScik84gpmZiEMEg=; b=mzYqJcgtIhZW2c
	jdVjyW3P70p9w42PJGCTpoqsmDhGrCw6Sy6yh9lHBgaWW/KHQmQCEb0rqAoHsJOydRNEIsQsdBGPl
	NRvNhy7MhKHqqdQpiNqu0Wg2JVRnsiDibeY+tp0m3XAG12KnCNQbrcNA1lTPSC8/KeyfjF+UpbMTI
	ATFu8mMfgn8+fMC5toJeta9dVsCLYzc7PZNQQynSvuejbsztlcWK0ZPDwtbP00i+K71eBqmN6QBzZ
	nNjFx7hey1r/uoKAjHrZajR01vwqkaNhQTkk6lfNuy6FvTLgX8OEFamTsk3jYQwzxNW0OsCjgwapo
	RlNW19kT/kuO921kcfYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3S6Y-0004l8-OI; Mon, 11 Mar 2019 21:05:02 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3S6V-0004cz-Qf; Mon, 11 Mar 2019 21:05:01 +0000
Received: by mail-oi1-x242.google.com with SMTP id u128so315295oie.2;
 Mon, 11 Mar 2019 14:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fyEh/q1GP+1TyFUYOgVLvvn+RIucRiEc6k1EbDSBA+o=;
 b=EyGUhTcuTghuetEBkt2+jsJOxfLGtCb8lsuNzw6mUtAQHjZ/MxHGGeu78tpFGmiYaU
 QuOQJSXwTGzPx57TFEV32wbFVS9eDLS/FtTYZus87W9p6oMYu9d1gBWg1SYasoZzVwqL
 NMXA/jRkNYxSkd1KaIytdw/Yw8AvcyYE4eG6BwuRTiQmH9O2I2aHxx4E+AVTWjsrywUk
 aXgekKfN43Y2pwsnXrLql30VlpTCrexJRQRcmBzLTwU3viBtiYIhiYvEcK15dDkn33fI
 sxR1JEDVwm46VdWqsJjPtmiMYr+HbINMwVR6NzkLLUyDebBaYamPyYdz9nRqv7XfxrOx
 hx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fyEh/q1GP+1TyFUYOgVLvvn+RIucRiEc6k1EbDSBA+o=;
 b=WS1Xh787GYZPphc9dZR7HYhEh/8TUjo678GtCtFFq/28zk99CGBGHlyCfmt1kFVoUL
 PmelU8jtAnI+d6OuTrVA3m1kBpJh4qscHDEpWuaN7ImB+fML9p26OC94PValtSTsaEYA
 ei1C42h7b5RN9tWUGG/U59yTeJx1WuXU6RfSUE9qOWTo5Lk5K+rWnyFjEdunG0zuIj+X
 KUOdifme5o90Pg829inPiesljFtV03QBEZRCwl2MQW1q/SN750WSdq44WyeiFoBZiYG9
 58oCHOTpT2cceeWqJJvnHDjc2Njoa5RovNIa9ug1u+/8/0vj6DjNDsVTZcy+bcqaISLS
 oPjA==
X-Gm-Message-State: APjAAAXo2+GNQljRO49TZoV3KLo8ObmhmA28yRyuulg1a9Oq3hmDCn5A
 SXM+svXLvjUWD4Chca+Vk5FFs+H+1ROKWSrwLWQ=
X-Google-Smtp-Source: APXvYqyUMz74cjyyJyPY950MjOdrXSuPDzrF2i3ApYJtGbQefLPpFqXhEy1ibyXj6TkjGZI6pVygfhf3cPeIdIp4MsU=
X-Received: by 2002:aca:c286:: with SMTP id s128mr137941oif.39.1552338298130; 
 Mon, 11 Mar 2019 14:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-6-narmstrong@baylibre.com>
 <CAFBinCAacdsjwtg_RK=e=Lnep7oLF+eTBmkb1FB4nFR129z1jA@mail.gmail.com>
 <bd9d1b4b-4dd7-864e-b197-c5993d3dd24f@baylibre.com>
In-Reply-To: <bd9d1b4b-4dd7-864e-b197-c5993d3dd24f@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 11 Mar 2019 22:04:47 +0100
Message-ID: <CAFBinCCuWvm203nQFw6y3Nwoj_TxqgRk7X-N8O_P=SjAGJwDWA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] phy: amlogic: add Amlogic G12A USB2 PHY Driver
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_140459_885727_50186365 
X-CRM114-Status: GOOD (  20.15  )
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
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, hminas@synopsys.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Thu, Mar 7, 2019 at 9:41 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> >> +static int phy_meson_g12a_usb2_exit(struct phy *phy)
> >> +{
> >> +       struct phy_meson_g12a_usb2_priv *priv = phy_get_drvdata(phy);
> >> +
> >> +       return reset_control_reset(priv->reset);
> > do you know whether we should reset_control_assert here instead of
> > reset_control_reset?
> > the probe function below already uses reset_control_deassert, so the
> > current implementation is inconsistent. in v1 you replied with "Maybe
> > it would be better, indeed." - if there's a reason why
> > reset_control_assert doesn't work here then I would like to have a
> > comment stating why
>
> It's not clear yet, I implemented it safe here since in my tests, when
> I left the USB2 PHYs resetted, it was kept resetted on a soft system reset
> and the ROM was not able to setup the PHY correctly.
that's probably why Amlogic's kernel also uses a reset pulse

> So maybe it's wrong for power management, it's safer to simply to keep the
> PHYs unresetted when unused.
if you re-send this patch anyways (to clean up the #include) can you
please add a comment with the explanation from above?

> > Apart from these two this is looking good!
> > Human readable BIT/GENMASK #defines for the register bits would be
> > nice, but I'm not sure if you have the details to add these.
>
> I have the registers set in the doc, but it's much longer than copying
> the registers structs from the vendor kernel, so I postponed it.
>
> I'll try adding these, but for now it's low priority unless the PHY maintainer
> asks for them.
ACK, it's not high priority, so it's fine for now

with the #include changed and a comment for the reset pulse you can add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
