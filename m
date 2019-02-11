Return-Path: <SRS0=yrQE=QS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A029CC169C4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 08:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B3720873
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 08:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e/8VDecV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZWvoY2MU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65B3720873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAYwYquBu/N+/TbO/Tq/eXRUZNFoed5pvodQy7H4r5Y=; b=e/8VDecVeykpqg
	iyQPcTIhNgnpzkpx5U3Gtk4rFpI/XrYiF9pEBAoPWxaKjqHCOtwXcRFrXyA0t2VyXfiIwfB/TaW8M
	pIxjeV7JVN/a0rV9RUfpCnwHKS9NH3JqlxhTmvISG0iSDPQJbl4A4bbUXE3hZeKSK/M+ZkJSh+NRZ
	2v9oaHiVo7xzxf7qwfEjRe9E/0Yj4Iz4PhIF81CklRR2/osjAvAjlLkq5pzQPisBdrvFHHQpKPxrc
	JF3MUmL3g2sNgQqttbDeJGYwHkKA0eM4SzGWYYWD01wlmqkJ1M5TXQKrseHSzBCgO7Mmp3N0zCCRz
	g1Aab17pmBOwG3qP/dAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt6lM-0000Hk-0V; Mon, 11 Feb 2019 08:16:24 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt6lI-0000GB-PP
 for linux-amlogic@lists.infradead.org; Mon, 11 Feb 2019 08:16:22 +0000
Received: by mail-lf1-x144.google.com with SMTP id q12so7045688lfm.0
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Feb 2019 00:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3rOeLj/zzZBpsUzwQ4Gl0C5dRDYfMa0NPqlhcNE/Mh8=;
 b=ZWvoY2MUdc978cQven92P/Vf4iHZKtRyBolu+Ld+IbzdNWHmmDRgLzQh0WFZZsdVr+
 a0vTkvYJ1bMZjAtnuYWJa3EIcu1n8+EqbkO0sGox34JjJ+2r0h0lwXWxinjlozPpxbJ6
 yfjEN0jpGT/uHCflstsHEY1/s0Tov39OW3gp/AvlYTFMwmB6DJaZGBl2nQKbMGXNfl38
 ygynFodafAOmsgs3eyYad9QF2gzi0PrR3rXqyQXB5HWYmr3O8ilRFJSw7ciVWF6Rg4sE
 saqCJinu1mxqjHCE8TKPun2E+LhK9U0dov2G1BIQwmMCYxwY1XW+Zr8L0M/j69KsuFjk
 NfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3rOeLj/zzZBpsUzwQ4Gl0C5dRDYfMa0NPqlhcNE/Mh8=;
 b=FTqwFcQWSSu9oTKWVGyXJcLI19smmdvtxyQoPyQMnp87h43okWuTkW6UEPFdt+7wOX
 8+tkYawQNOkV3LiaorMHYLhN6wJty4+GDxKkGzNgR/laaAZvitwcvgFIytzJGqJucLGP
 093qCBVE5DrbhT+wOGOM0YMTbNu84Xp4xdzy95PTU1UmMq2fAm/kAf9XwC0kyUvOsecO
 z3es5X9NZXL9dmfOYvh7EIx+wlG1hGXda8pVrfek8+utfI3tiDXGAER8FyyC/Yx04yyk
 eT6x2a9nLjtsgYAZSqoz/eSyccSAKwHYFfFcHtIsKDCBd6WoQcxZoTvVZXWb8LbtaSP2
 tU7A==
X-Gm-Message-State: AHQUAuZbhY3/VLpyAKgQ+qE7svYmOMS6ihRjwxO6wleg8Y5d2x8H4WQ5
 nu6Kt0f0mDNrNukgYf7Peo+lZPI4XVsdWdW3UMn3qw==
X-Google-Smtp-Source: AHgI3IYRwiauksWbzzhVv/buhcfZlPVVNva9j5Ck1EjuNTHYFYEXIgDLOIWrcLp1Aob/2SQDsMtqEuzShuyFaVmsLm4=
X-Received: by 2002:a19:7dc2:: with SMTP id y185mr21953938lfc.27.1549872976524; 
 Mon, 11 Feb 2019 00:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20190209010101.12210-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190209010101.12210-1-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Feb 2019 09:16:05 +0100
Message-ID: <CACRpkdY3ygTU3UvA=Gu36S+Gte_WpR3stX5H-8Od42fJyDdSug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: meson8b: fix the sdxc_a data 1..3 pins
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_001620_856131_EB279AB0 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Feb 9, 2019 at 2:01 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Fix the mismatch between the "sdxc_d13_1_a" pin group definition from
> meson8b_cbus_groups and the entry in sdxc_a_groups ("sdxc_d0_13_1_a").
> This makes it possible to use "sdxc_d13_1_a" in device-tree files to
> route the MMC data 1..3 pins to GPIOX_1..3.
>
> Fixes: 0fefcb6 ("pinctrl: Add support for Meson8b")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied for fixes.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
