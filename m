Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9499C04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:47:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4452206BB
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y4GBlaSX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cDwW5mVx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4452206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhy5GokWdcjTcGUXh/lBNZOhjPDJDskzFUDQSpIJM1s=; b=Y4GBlaSX6Vf527
	tBG5jYS0DgJb1vOICZmPB5jGmiHmO4ba9CrBAXPdoRJszZp45NgfX/f+ZH6EDhtPhmHGqffaFlwq7
	0vqq/oVhB83GXHfnsmb3coQZi495eN50RwM5NbWDaKAh4WgGu9jqP0C3uvuKyTLHfutR2yGHQOVZE
	JdW5ZrpjNM0ppNyUEAuYlVxAV53UujPvNgdbX4k/PhfMrfSC9AVcZei9XO+9wGSvkBx+cLFMmohel
	OEesmxDdXyDlHBb6Vln6/UQfx92KT1LvdLKJyZyZj751x130UHfVP3OFL5oyIgAxgE4yeiFw7j+RC
	mLOzz1q24U4QZHs14zYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYyLj-0004Mn-WA; Thu, 06 Jun 2019 19:47:00 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYyLO-00042C-9u; Thu, 06 Jun 2019 19:46:58 +0000
Received: by mail-ot1-x342.google.com with SMTP id j19so3141155otq.2;
 Thu, 06 Jun 2019 12:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=apUohLJFv/6Ma/Odfu3BrkIEtoUfH61u2PuyTYCjZvg=;
 b=cDwW5mVxP7Q24RCc61BUOR351XLtcuEjXUZ7l9Ld7d3UHg41U+1qXkEQo+teFO44dz
 yZzd1PdPcO9KwpNAb/sS6ffMLzFXONJlcmsefoynlVfYz4hUj5vJ5+cV44K1qSbYGNon
 6h1s4WbmNEbGRDArcdHt90ob0/uiy9PyvfeWa+BDgQaETs4Nl7ELIoIrPCETOqHKzAuE
 KK55l2jvoxIsFGCJf15SEF0og2a1Lx0nRYgbMd40AbR9BDbt3U3wnYipVG1vZ8JoghQJ
 Wz4Gs6D9OyYlKfWLETUIS6lXzqAxp7MaJvctWLXmERLXDjk/U7wru/46ez1NrafI/ghJ
 /QHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=apUohLJFv/6Ma/Odfu3BrkIEtoUfH61u2PuyTYCjZvg=;
 b=pb0vaO/nj+KU+6d2/pdrI0wpQ6YwQFfSkvlu6v0AUmvXoj4K7q+7/2DY1I7T6hALpS
 MPr2bcfZrbJTHRSXw5+fBhtoGurXnKUVgY0HlO6Ro7hbxaj/vhP9h0RPu2ETt4ErCw/f
 Pl6j988Oi7cjroXMMoJPUUtLBYXD/ZmUu12/OlTOVP0aqjy8qOZ81CduhWeS+9vBO7lL
 QUG3TqVwQGaBMVqkV4/R97D7vd4FMzrCt7FopqAYltXkyMcfPvIiFCKo/Eb/aodcIp87
 H3CiUZ7vYMv8jEd2ntJ2vuP/I01hRrcPu2w+xzSNCCu/K7AHnqtkQRuT8O9+qWf1VwCv
 MElw==
X-Gm-Message-State: APjAAAXr+zdZRjz0QmC1aw3i1B/FmNwf9eeUazuat/epltBMfvJeOS0M
 buALfH0baSvYiYh2t26XV1506kiSeJXOXSHtqSU=
X-Google-Smtp-Source: APXvYqyEecKKROAJgJ0f1bUKxcE/zJpLbenKfwbAR5m1rOjlR1UHNjL8uTKGU/flEXz51JoivrypOyNQGFv7rtlwHLI=
X-Received: by 2002:a9d:6d8d:: with SMTP id x13mr15661176otp.6.1559850397104; 
 Thu, 06 Jun 2019 12:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190603100357.16799-1-narmstrong@baylibre.com>
 <20190603100357.16799-5-narmstrong@baylibre.com>
In-Reply-To: <20190603100357.16799-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 6 Jun 2019 21:46:26 +0200
Message-ID: <CAFBinCAJUjwnLgqAxykpvZkeENENaJP4KT0hEje2yV=4Yutu2Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: meson-g12a-sei510: Enable Wifi SDIO module
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_124639_060516_348B0F9D 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Jun 3, 2019 at 12:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The SEI510 embeds an AP6398S SDIO module, let's add the
> corresponding SDIO, PWM clock and mmc-pwrseq nodes.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
with the comment below addressed:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +&pwm_ef {
> +       status = "okay";
> +       pinctrl-0 = <&pwm_e_pins>;
> +       pinctrl-names = "default";
> +};
on the other boards we list the input clock explicitly here (I assume
to avoid jitter due to a less precise parent which may be the chip
default or set by the bootloader)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
