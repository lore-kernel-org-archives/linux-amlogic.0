Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FEBC10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 11:13:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 163AC20811
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 11:13:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ARpzmYal";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z6XS5541"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 163AC20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbPGTPkmgPeKkS3wq1uttAq8Vp5Mfkx6bmBYlOfwUOI=; b=ARpzmYalU+mIfN
	BiXOHe3x4QTb6PUxgmCqYSPOhUm5173I86qLgdUxe0gb0ktx3IlEgESzl0Hq7rjhl8jMXelcw2eXc
	9Tw+fez1uXkvahIaHSMb8HzOL0xVj353YIDdK9DKuKKow12nmCYk4Kuz5OQBaWp0xhRWdBK535sY2
	mSpg2Yvh5vL1YFKWSyodwvtI34GKHhBkFC8UNqhgw8eTOk85BmHrpmGF04JNd31aRrVUjEIYT34YV
	w55qNUdW2JzGDmXffFcVtQyIATrl1f4wZMfwoX+/S+s1m3jnHmMu5DpH8fq+feI1AvyPkGBwDrZc0
	lo//Vnab935f4mfduljQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hItMS-0004YR-8e; Tue, 23 Apr 2019 11:13:16 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hItMP-0004Xe-NZ
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 11:13:15 +0000
Received: by mail-lf1-x144.google.com with SMTP id u17so11430504lfi.3
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DhOw7o912vfFOZ34iqlw9fd1E2tVhBfbGcfDDGhgt6Y=;
 b=Z6XS5541Tv0znlysRgrRT1nBIi1DhNaLap8IJeLA8RZZG42/JfXgtmuoZkt4uFP2a2
 x60vh5iHP4jx5DCL89pu+EwxzqCQaIL5Dw42qpqwqAHIyhkUtHXhtDxgoTWw9idB+LYK
 AigXa5nQn/WsNqhgZQ66efBClnD/Jufxe/JG4mpDzven1/TW23KFkdvQkZko+CtRYQuw
 lyoT0NsNkEXntLBRSudFGB5y2OBWwWmfKcD0WtdmjA7194TDeT++4DY7Ck2VFZYiKqdX
 w2LEZNw1LMD1iTE7xzpqqNjp5+cFedmS1rg8KN9zbyTxT3Xeaxvb/eJ5IAhTzJyXgBQE
 G5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DhOw7o912vfFOZ34iqlw9fd1E2tVhBfbGcfDDGhgt6Y=;
 b=NJducFegyT568bYCZcqGDWVI1i4NgCwXVXYxhb4k5jyWeA5qaanbjPoa98vwzVxM9q
 mme/nP4RyE8OIkLRh2A2YlSlUhALg/Mack9kLClXHwDu64JNva3JN+VsA2FBicB8ZoxC
 SLtqw8UK7ho/utRKiqHKUwJa77vlu2c+0+cpKOp5Ptfqm3T0qamxQ/pibI/R2Gay4Qah
 NuLcNvv3tFZ4jfjb4FbaOZvZjZTbg3tlW+kCDZKY/9e/QxKAOUo8LyefrdfFq7ZzoroC
 IRyQQquMboABg+sl5vMvoX8qVCKAzCrYAj2ox2rnDf68e5etw59JLjboKQPk0k6q/qaH
 nOLQ==
X-Gm-Message-State: APjAAAV4r3K13vEr3pRSI7+w+SqYgnU5vEzohBwM+H0CKyPlg2ryKkzW
 DUrs+OpX9MvHU8j1eQ315Tfb+Kf5yvtUiDG+PdKCIA==
X-Google-Smtp-Source: APXvYqxcNGH4YVFTHh94wJmO6/uuV+Nbfmb4zbwn0bKzlyByVglhZ9OT01AvGqQMOb1HXwjqTsJojhplmatbgiE3eHs=
X-Received: by 2002:ac2:4647:: with SMTP id s7mr13196956lfo.168.1556017991868; 
 Tue, 23 Apr 2019 04:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190418124758.24022-1-glaroque@baylibre.com>
In-Reply-To: <20190418124758.24022-1-glaroque@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2019 13:13:00 +0200
Message-ID: <CACRpkdbLJYgU5ZP5CkwX1FBv8eHp+7TsAMv3_H51C_EOA85X4A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add drive-strength in Meson pinctrl driver
To: Guillaume La Roque <glaroque@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_041313_767047_626ACA54 
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:

> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
>
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-uA". The change to do so
> would be minimal and could be benefit to other platforms later on.
>
> Cheers
> Guillaume

This needs to be reviewed by Martin Blumenstigl, Martin can you have a look
at this patch set? If you don't have the patches I think Guillaume can
resend them.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
