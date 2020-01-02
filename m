Return-Path: <SRS0=tZMI=2X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79837C3276C
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2020 21:53:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49BB821655
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2020 21:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YEzdUJPx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pt+8L1kf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49BB821655
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZYa7v4cpV+4x3yP5H+cwEf6cqbGVz0Ka+vY5Qzsau8=; b=YEzdUJPxt8kmkz
	y9xDayX3Gpp23r2d6Bkb6v5b/mhp0Aap/WR+9YQYnBV7J2+TZQxClRz73FkAIamTDIQtVKNIhPH4p
	1LkIKoKtefSM1G1/BFj/2qO+6yPtF2MrsNlR1Ips6NjpU4qfNr7pF196UCo+jyXSKCIg1DRli7dXQ
	01Yte+lOxhJI1g2A5SgWxAJZXGyH9GXbgRijVSinEtwQojk4QiBUjsG9zic8BpwTdeRBrY07CBX7R
	MC7MgGclaH8nNDpEw5XS6FGIyUOMLAI2QdT0XF1NulHUPozR4xkz9KHBnHrHraz0EW7VoKrUkl40k
	/GkhdLZifvBkyFdyvk/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1in8Op-0003RI-P2; Thu, 02 Jan 2020 21:52:59 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1in8On-0003Qv-Br; Thu, 02 Jan 2020 21:52:58 +0000
Received: by mail-ed1-x543.google.com with SMTP id dc19so40221278edb.10;
 Thu, 02 Jan 2020 13:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hvu2XgZLIAybTxeXvSxciwNCDI/QTjrV4RLf06zuwtk=;
 b=pt+8L1kfxsX0Xxqv1s32vYhKZ0Ehx0enq8/6v/tV9pcIelS/duSghfq9QbBGzbWmtr
 K7ef23N6Wc1GG6zhr+FtBE1UzCgHZq33Wc4wop1pvAc0TwGWv6IyTQHw32qhdqEP0NTI
 RnZKGzNyx4U9n+jtQVCpKI7TxoG5iNG8RtI7ULvxf1ivAPLvjrDrXBBi1/FZpnmJgHsI
 5RWeO7GsrQe5v/h+OB2aOQVQYgU49ciDf8wFuizGVYTXnMFnbftDO+wSVmKi1/AUdeii
 V1F8yfXoAWRUvHuq6Q8MfmZLQ5ENJYt5dIwrFo/vJ99osCuIDlsOPQJL7iKy/RNKzMS1
 CAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hvu2XgZLIAybTxeXvSxciwNCDI/QTjrV4RLf06zuwtk=;
 b=n1OkQcIPioma4AprybTzIZIDLXYiv2ZpWazuGP99oOw95eXw9dX1pVu9W7hxhHOMw8
 4/fFgLW0w3Fzxxg1DXQePlkJggbDQr73cT7z5irZzs/y7rjQOy3xG/LRnhF4FDR9MrLg
 G4Arb/XwElwNbqslG91q5H/H+N1axBA9iTPVn4kRe36HCJ0Zh3lyN5b7q7lYVAXlAzmO
 0Ki+SnsJK5sI8KxeO38629IJEP28+Ssf3wkqL6mZ4ZvAnETxx6/fk74IqSeAmPYG68q4
 q3AcWo57b5aqNaqEt5EqS99PS6v4zM/FMfL6lNhRNx1KsKkfuxcsPKsJ1vUeUcJieoVF
 wwmg==
X-Gm-Message-State: APjAAAVUZq2gX3tm5mAvc+JiHaE5Ag7mKtDyQK6f/mwzprAzIkMmJRMK
 9w5K9aDCZZ+nd+jIqvQNKHH9RuVakKcsPcxe1os=
X-Google-Smtp-Source: APXvYqyLuGqANpkEmw72e7jynDm+fNMM49TQnwz/BBk2Zt26OUL6Fve8YN1sQTqqR68Jp8kkufLSn3wjnTCMkt89RHE=
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr53418384edr.57.1578001975370; 
 Thu, 02 Jan 2020 13:52:55 -0800 (PST)
MIME-Version: 1.0
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-5-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCD8V-Swihz+VJ780sXJtM9cXprDcGCHVuHjjCx0DEOodQ@mail.gmail.com>
 <d66abc21-1440-503b-3515-6c495bf0db80@amlogic.com>
In-Reply-To: <d66abc21-1440-503b-3515-6c495bf0db80@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 2 Jan 2020 22:52:44 +0100
Message-ID: <CAFBinCAEO=c+5oZrUmW=YhqD5tQkm0NUSbgwxHYqL2UgcK4c5Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To: Hanjie Lin <hanjie.lin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_135257_430898_F005BBFA 
X-CRM114-Status: GOOD (  16.36  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, devicetree@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Liang Yang <liang.yang@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Hanjie,

On Thu, Jan 2, 2020 at 1:30 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> >> -               if (i == USB2_OTG_PHY) {
> >> +               if (priv->soc_id == MESON_SOC_G12A && i == USB2_OTG_PHY) {
> > on GXL we have two PHYs (0 and 1), the second one is OTG capable
> > on GXM we have three PHYs (0..2), the second one is OTG capable
> > on G12A/G12B we have two PHYs (0 and 1), the second one is OTG capable
> >
> > you already wrote that there is only one USB2 PHY on the A1 SoC
> > is really only the second PHY port ("usb2-phy1" instead of
> > "usb2-phy0") used on A1?
> > if "usb2-phy0" is correct then you don't need these checks (there are
> > more checks like this below)
>
> Actually, A1 have same phys("usb2-phy0", "usb2-phy1", "usb3-phy0") and register base with G12A.
> But A1 driver is designed to support host mode with usb2-phy1 only.
OK, thank you for clarifying this interesting decision made by the HW team

...]
> >> -       usb_role_switch_unregister(priv->role_switch);
> >> +       if (priv->soc_id == MESON_SOC_G12A)
> >> +               usb_role_switch_unregister(priv->role_switch);
> > I didn't expect this because in _probe usb_role_switch_register is still called
> > on A1 we now call usb_role_switch_register() but we never call
> > usb_role_switch_unregister()
> >
>
> Actually, usb_role_switch_register() can be called only in G12A.
>
> dwc3_meson_g12a_probe()
>          ...
>          if (priv->soc_id != MESON_SOC_G12A)
>                  goto setup_pm_runtime;
I completely missed that, thank you for clarifying it

>
> Same with second suggestion, this different SoC extra logic could avoided by add constraints
> to .yaml.
> I will do this in next version.
that would be awesome if it works out!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
