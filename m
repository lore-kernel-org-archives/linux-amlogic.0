Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FC8C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 21:19:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A40202087C
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 21:19:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="synEHKpp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="scmnTBde"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A40202087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdahkwH0f/y8e7BNGGit8tBn8OPGw6AJ0Hb4T2QxFXw=; b=synEHKppzxYaOK
	bOvUeojb5/prrdHNxk3GQ8ddDnGchvXwLWPCDPoe3J6TRBhV6pOFQVP47lsn7ILYISlf1ryJfz8VZ
	yFq0yG4ZXJm8j24Z5Lj9hfmDSGTZy1mAF9wimRahZ00MJOPlSf2qnVT1bGhJdlXoWCpeyF50ZHzaw
	pD4wayFRxJRdhlrbQcM2yp0CssW3WYLtjOq8JTV4DkzEoHx3UpOspALI2TSvI/SCzhZcJah7fEQmg
	PviZsdOXMhi91gtT0RSIJKDkqiAeLVO7gDA1T+T1ExC/rd6F8o28OIdhkNzQu8p3m/ZF/MJsJpnQe
	W+fhrmn9XLAseXKs78ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3SKK-0001wS-S5; Mon, 11 Mar 2019 21:19:16 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3SKH-0001w2-Jp; Mon, 11 Mar 2019 21:19:15 +0000
Received: by mail-oi1-x243.google.com with SMTP id i8so303607oib.10;
 Mon, 11 Mar 2019 14:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vl+etrAUgCpe9fsjHd06euM2vV1upm3SvdC8UB6mEEg=;
 b=scmnTBdeU1WLv8FGWntVQlu71VYSiwb4WArqky8UJw158K+g1Sx8hThMfpbl7Q72CT
 3ur6NDyCChD8KP0nBAhniV/Ch1hgnjEvIbLXk8a5Q7JOMXXKS47ZwiWwSbXFMG2ForNA
 ry1QupgOMUBCcy2bzfw34YDPdfMNRN/1QkK2zbvtT0mLimwje9dX4XFjXFKTSLaIvxma
 QuaYTiYElUWcl2cXVKXM3yryobx937YrBmgwWHLDlvK3LFjloQFQ2fFtoRm6XeBBu8fk
 WKN578XSGV8T6hu0dwRXWEYSQSZfMllwjJmfCIScITddCVDkeEIErBzUULWZI4RbkkNv
 KPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vl+etrAUgCpe9fsjHd06euM2vV1upm3SvdC8UB6mEEg=;
 b=Shwb5J1U7KhbRPS3up/DTXlvW9Ne9Kt90FBl+eEKPJYLMEK0roHlC5GSwARzX04WII
 x7ZlVvBl8VlEVhE5qmn3luoFf6hpLNtDzo+FQoO1zqOoIoZ6zDk1PvaNRygeMZfTKZVl
 gZQPBBRKqwASnAqprkoYTKPa/HEQ22RkBA9M9GJzdFWSJjkF57Ho5Pm3HoTADTQzBbIv
 CcSkocYJHOL64/jZ89MbxYPz+ECIjp7tUVvtmxDRn0pXYOech8+KgHDWPHYa3nk8TgE9
 scuO39TuJLjJFVYAclyEZyWiiYzOiZegl5tINxYKEE/Xusrmu8/YU/+GdtoXS3oz+0rr
 bzTw==
X-Gm-Message-State: APjAAAXrd++Z4JDGOBpZZryfCy15stC3vkTCK0dyvDwBdbjNX5YB/xUU
 MUhsPlXPi9XAIW6Oexi8wzkaUzpzajmVthaTZtc=
X-Google-Smtp-Source: APXvYqyHe9QPMFYdAufSMRbPPGqAb+8CcQWIIfPWsC828Moci52N5yUQIeMvh5JngJp06jz3riVakXooHaVEKj82QiE=
X-Received: by 2002:aca:c286:: with SMTP id s128mr177191oif.39.1552339151283; 
 Mon, 11 Mar 2019 14:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-9-narmstrong@baylibre.com>
 <1551924176.2210.104.camel@mhfsdcap03>
 <6eaff413-d2c7-125a-f165-e4226c7a153e@baylibre.com>
In-Reply-To: <6eaff413-d2c7-125a-f165-e4226c7a153e@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 11 Mar 2019 22:19:00 +0100
Message-ID: <CAFBinCAUMNBeTABNeyOiYu9Gu8zWWmG3dBNJwFpop3QNp6ZG0g@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] usb: dwc3: Add Amlogic G12A DWC3 glue
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_141913_694277_58827B2D 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, hminas@synopsys.com,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 7, 2019 at 10:46 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> >> +    /* Setup role switcher */
> >> +    priv->switch_desc.usb2_port = dwc3_meson_g12_find_child(dev,
> >> +                                                            "snps,dwc3");
> >> +    priv->switch_desc.udc = dwc3_meson_g12_find_child(dev, "snps,dwc2");
> >> +    priv->switch_desc.allow_userspace_control = true;
> >> +    priv->switch_desc.set = dwc3_meson_g12a_role_set;
> >> +    priv->switch_desc.get = dwc3_meson_g12a_role_get;
> > to me, use a local variable for switch_desc
>
> I'm never fan of changing a local global variable for a driver instance,
> is it strictly required ?
usb_role_switch_register (which is called a few lines below this)
copies all data from "struct usb_role_switch_desc" to a newly
allocated "struct usb_role_switch"
in other words: you could make it a stack-variable

personally I have no preference so I leave the decision up to you


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
