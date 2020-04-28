Return-Path: <SRS0=mJnT=6M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E88C83007
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2020 10:01:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCC9520663
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2020 10:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cso/+QS1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuSW84MJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCC9520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1V1KOpR2wj+3ZPhEZEYS76vnz3yKjpUKrBGuk4Rp/Os=; b=cso/+QS1RX9pBL
	SfDP2h2o8N0fFCfNDCazn7eCWTKBNu6l5h2CnuvXjBg62GLM+DB86ZYJ6lZ7eFBjTZlzo9sZ8bZ1q
	lTXTWUq9NxVCe/80Unhd3sPm6NKxRPc0E6rgh3M32rXYbQ4A0fWxI1xpUQo5F1se0/Z+c1BO67vli
	h701kjvVcIUKd/lrli1eQMW1hwJNgHyDrTA73ttYo99EYRLyNW+QKqRWUgGTaBBYnbgm2FXFBGNRx
	fFPSp5rgsyDr59PnNL/6AGe16jYbwa1kMywn66ubkq95RmWnRpqhhG6zTSi8GW2ZdCzIKJ9RXNWwZ
	KoQQ7Sll2pF5TQ4AzGAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTN3P-0006cb-MN; Tue, 28 Apr 2020 10:01:27 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTN3N-0006bd-1u
 for linux-amlogic@lists.infradead.org; Tue, 28 Apr 2020 10:01:26 +0000
Received: by mail-lj1-x244.google.com with SMTP id w20so20837041ljj.0
 for <linux-amlogic@lists.infradead.org>; Tue, 28 Apr 2020 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vLmsZ8FzUvZ2qyUD84j1b22i18dHEE70Jtvscxhc09k=;
 b=YuSW84MJxGm4qTrO7x6FDa0tNZ2DwTGnBZcdLuuUJwmIySl3NXFo5FIxgcdvSWhhHw
 w8f3SVhylLAGIenBWpXFofh7SIqxoYqGlwz7LQm+YJ51a177fjUJO5Xr8wTKk7PLE9Ow
 sq0njirZjcIVJgrpYtz0SI1Xkqde9Fx+gJzIVvtihqPzC8b+RubH3I+eAsZH3kyRJCaT
 TGV1gQgqGK9ntlhlHxoERIFjvIwg0mp1TnG9kPacdcpTqghNObPflJ8OxLxmk7azsenJ
 5pB5uU4FilL+JAVfPKMCSGlURLIKRawxY2bwR16A3geOEdTBD8NnehNPWlwNekdReDCw
 g9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLmsZ8FzUvZ2qyUD84j1b22i18dHEE70Jtvscxhc09k=;
 b=X8YivJ2ZQPibYpUmvgjjkHmdMd/E2g4IAjs1DNZMxB3/nmXP5nkarQehxJweiW5AJL
 GqyltFzSGI5798cs9ArCKZ2G47WE6GjJZ74o4whi+bNOwdZZN82WPiY5vhRzD5KrTudS
 hq1rY3y+pgYn5IoJKZvUergczs4LpE+ISX730Kz1gAHsuf+L92HDIQMe4wQhK874mj0E
 Uwm2LEAP9g6hspHVN61yUI2R8rxzWyB+q0eApt78u2Go23QYS7T8ciRnr6Q3FzbnDrUw
 +rOARdV9BA7FMJChH3GVGbM4/0kkWuNUHDaSH5WoQA9rmuv0F5G80dLBcLZktME6RA79
 BGTg==
X-Gm-Message-State: AGi0PuZZwmU5csRqo6eHzDA/65lJL1GvebYMX33T3MUPTIEFAZoZkkng
 YNwIcbjBl0ivTFDu1RP9OtQqbkQAoBF+FKfiCm5DRQ==
X-Google-Smtp-Source: APiQypILX45Ac1tiqnMnI+HFKCHUmn1qsryssGy+UbF1Sz2zs9tEQxqIByqukAumdnDai62XdgrEeXgjb4HSD+iqAwQ=
X-Received: by 2002:a2e:2ac2:: with SMTP id q185mr8308858ljq.125.1588068083674; 
 Tue, 28 Apr 2020 03:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Apr 2020 12:01:12 +0200
Message-ID: <CACRpkdZ82tjcBc_kF29zUMiLLH==0zKbOd=fTRGq5-4FOiez5w@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/2] pinctrl-meson: two small improvements
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_030125_246740_F421CB6C 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 17, 2020 at 8:34 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> While playing with audio output on Meson8b I found out that the
> vendor kernel uses a custom version of the GPIO_PULL_UP flag. I
> suspect that we will need this for audio support on Meson8b and/or
> Meson8m2 but I don't see it hurt other platforms.
>
> Also while comparing the register bits with the GPIO direction (of
> GPIOs exported to sysfs) I sometimes had a mismatch. This also wires
> up gpio_chip.get_direction to have sysfs and the actual registers in
> sync.

Patches applied.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
