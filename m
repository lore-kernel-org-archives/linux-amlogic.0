Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3565C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A740D208CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:17:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dG+TnI5i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbFHF85I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A740D208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilgqE0xZGBEk+GzYnucp1NeOExzOw6S4UZSKRw1DKMI=; b=dG+TnI5i1kppJ5
	VcDYaBxxglT19e+pPaF4E30lojfkVt0/jhtwodx9lrGXLFMO66xyYlNc7dKeeYfAS8+L19X8WJ90f
	i14h5x/VkHRJ/39y15XZMjTbO6gqeHLNS41+++rn2zsWhBpzVVKkJ70b24e4aQmlkFiE/bmhFtUpb
	rLas4VB5FhX7CwZ1nzKUXXOWNdzVmqPDJB4zi8uJARaZld3wjio+DoTiZSXau+amZKinb3QxEyCvE
	HkMxKvhwqfaaQ8Vm6nFVPYCP/c+JFrC27hKK8gft0dQS3oGzJwdNU56ROuEUlrdFgjF5CK/fESOcN
	GvpV6wqTs+uoDpIBEuyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFVa-0000EK-3O; Mon, 27 May 2019 13:17:46 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFVX-0000DK-2R; Mon, 27 May 2019 13:17:44 +0000
Received: by mail-wr1-x441.google.com with SMTP id h1so2774754wro.4;
 Mon, 27 May 2019 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3CdhkKFfggu7RKyEGJPDR3uKtKfRfN9PzQkEoRGpys0=;
 b=RbFHF85ICbSpB/QDeuBoxpPshiJs01zY4pu/8n9Lf3BNzE4SFyL/GyytRGewLvfrPo
 2SDaDIMtzrrdACNFufY1J9BG5RMntHYFdQZ9KdGNiSpf5Ii+VdlPrRo2G7fsVxBRTNLN
 J1iKR6bK3sZ4mw3u79gezUI2/eCWN45qwQ5RubnV6Zw6OQFLOJjrYcLr1erCTdw+iRac
 CNbXnm+xzAIGSw5+CSghe/JflH4LpDc3NJzcQuBXR1X4Uv4W0o3pIxwV0zL0746Q6N7r
 VifVZCTVWUSX+uChCR7uBMMOnUW+VjxnHyXA3VW+Dq5T8FXYBqg+DNAl0h7762vib/5/
 oKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3CdhkKFfggu7RKyEGJPDR3uKtKfRfN9PzQkEoRGpys0=;
 b=eayfGQAkPFbyiJ7e50FYVOFJ1q/tGgMpy5a5TQiihMPb6uYrlXz504R0hAicey+KxR
 ZlsO97R2z/mSMAa7sC1KVnlJ85vZPKJ2qfkTioeDAknDzxdKzadj9LIgZ2IQGbhPRlFI
 MSj/CQHMRgVW9xdt+jlw2iupdLISnMxzoGgGXq60LaN2p/qf6bChmizrnLnv+2oZjFyV
 h/06dGLYdz09CkcJcKAtEES9IvCxkSvjVO6x/Tj4tQczEjdTuLtmhqhgNt1Y93XxUxuM
 i/4TJAQVcEufT12EfqKX79IoZ+S2ambXhIbOLNuK6eMNJJWUjb7xlWFqxX/UC0aJV5P0
 X3QQ==
X-Gm-Message-State: APjAAAUP783G6gtjHKBgkc+gQyBsDpMMIyVcDhUJT25fT3idUiDpXRFg
 3GHsarjtHxaeraG+EwplLX6X3O4ytm8wZydj4Iw=
X-Google-Smtp-Source: APXvYqxwsgyqKq3v6r0+iHi/zVPWhJzn/oWLFri6jGvIXh+zaY6enrZ38Uj3PrCQ1+XWh5tnUc1T76NEJbrPh7coDvQ=
X-Received: by 2002:a5d:5406:: with SMTP id g6mr9664403wrv.286.1558963061338; 
 Mon, 27 May 2019 06:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190524181936.29470-1-martin.blumenstingl@googlemail.com>
 <20190524181936.29470-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190524181936.29470-2-martin.blumenstingl@googlemail.com>
From: hex dump <hexdump0815@gmail.com>
Date: Mon, 27 May 2019 15:17:47 +0200
Message-ID: <CAKTihDV-zee+rodgg=h1xgBnyiq2oSg4UcaURtCcGCN-Qa4rsw@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: meson8b: mxq: improve support for the
 TRONFY MXQ S805
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_061743_140952_D8D566A1 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, May 24, 2019 at 8:19 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The TRONFY MXQ comes with either 1GB or 2GB RAM.
>
> Both variants share (like most boards based on Amlogic reference
> designs):
> - 10/100 PHY (IC Plus IP101GR) with GPIOH_4 being the reset line and
>   GPIOH_3 the interrupt line
> - SD card slot with the card detection GPIO at CARD_6
> - VCCK is generated by PWM_C with a period of 1148ns and XTAL as input
>   clock
> - USB OTG exposed on one of the USB-A connectors
> - 4-port USB hub with 3 ports exposed to the outside
>
> There seem the multiple board revision out there according to various
> forum posts:
> - storage: eMMC or NAND flash
> - wifi: Ampak AP6210 or Realtek 8189
>
> Add support for the following functionality:
> - SoC temperature (hwmon)
> - changing the CPU voltage
> - Ethernet connectivity
> - SD card
> - USB
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: hexdump <hexdump0815@googlemail.com>

BEFORE (no patches from this series applied):
the mxq device was not really useable with the old mainline dtb as
most peripeherals were not supported

AFTER (the patch applied):
the rresulting dtb works perfectly fine with my mxq device and all
mentioned supported functions work as expected

best wishes - hexdump

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
