Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447E6C43612
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 19:56:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C22920836
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 19:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jEH7VP9w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lREnOr2A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C22920836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8q+Lh1T6lvJ5VJRtzSXc/nv7okkWfgajcov/Pj6cBAU=; b=jEH7VP9waCW0cZ
	0aMBY2h1Ns82nRgGItks37XuEjU61qtKRm086KLKl1a1rR3jJ2XQ4gFrOjJjxV7qgMPZO3YOgoo9q
	iEFn07K5Zo96ZxSTSuSm4TVc3/gog1CkWFkj4cdahtDSZzNdoclj2mXbCPkriSo3XCVGAUQwXB1kx
	T+BqzggFuQdtWbbS2VNnvxKxyp+Vk43UHPLqxHIOOVs7uMU1ypww6JQuL587iKbbU8n0BS8sk7ZfN
	H/3+fCCEHSEqqJ40K3QFppWTTb1nt/KveqXZ8chUfl2ftuXwagjIAJm2JeozXMgU/tuV2xcQ4A4lt
	tsJlaBEJfiJ7VL6Unn7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi2uQ-0002mz-HR; Fri, 11 Jan 2019 19:56:02 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi2uN-0002mH-RW
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 19:56:01 +0000
Received: by mail-pl1-x643.google.com with SMTP id 101so7205522pld.6
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Jan 2019 11:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=OEko4Q1k2V9fZxblUwJN/ehB2KPRXcsUj+UxLIJ/99E=;
 b=lREnOr2Ab7Kk0yTYlqBE4YoNQuckrSl/N1T7ZYdoiFR8nIrOc5ApkvV3G4eTPNrOdw
 uSj15PfeBjfHhUSAtIAorUyKZuqAO+zw/2CYIE8C1vDGOhR+Q4qSl0RPqc3fm1eAyzN1
 6O/s6BKzHyPPuT0PDA1QAbLYOl2/eoY0qN5Fv9pXO0DaRRnd9Ucb5ThU7+M9/cH6ri0s
 omlTZ6o3vAw37lLxsBheXZbVEc6RTZ/Z2M86lVmk+pmDPYibEEBWvuuHPF8l4z7O48Y/
 mIvsE0TWTzuZz3UrqUZWJ6uZyeoklRaUswl90hxYN0UHG/Pq2xzXhjEdI0Ra20BzG5c0
 0kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=OEko4Q1k2V9fZxblUwJN/ehB2KPRXcsUj+UxLIJ/99E=;
 b=hV04RpUU5CtSYRzMncUexmIxNmnUiOh5pq90jqLIAyTUEpzTVPPaiq//6t7XDi+v5v
 DLPozsZxyIW0pvM5El4CqOQ/wqGAd47e9F5kLRih1f+wrxwvYisfv1qVCgd9CmdagI8V
 i2f0i9qkP5Bpm/jYJufhbfY9nWbdZss4/nWJHt1RCJB0Swv5FUSzq+PoP5XDNFoTdrA7
 xXH5HgSepsZ2UEv23FsfZlntMsHViC8VHj1nn1K1nm+GZBG9iqiah3ZCZx1u8gBdNJpW
 9r3l/0Z86L+kWpf0mj9csAS3ewP8+A+FcaBYOfXcdvjQ3scZYGy8XlluighXEFsyzoQR
 1zOA==
X-Gm-Message-State: AJcUukfPMM6ZtSY3wQOU5sCzepWjy+m5LK5s+LKBa8afUTOHOLGqCmTz
 aPTz72xgT2TtX2LH5muC6KuWHA==
X-Google-Smtp-Source: ALg8bN5L/trq5QYIz/32j0sWyti7NW7gpTBlSWdiqFsYW+rU55NoRqzkkchPuRExl5FjqljMxD/VJQ==
X-Received: by 2002:a17:902:9047:: with SMTP id
 w7mr16117360plz.270.1547236558983; 
 Fri, 11 Jan 2019 11:55:58 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id c7sm110659515pfa.24.2019.01.11.11.55.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Jan 2019 11:55:58 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH v3] arm64: dts: meson: Fix mmc cd-gpios polarity
In-Reply-To: <CAFBinCDM4BTx0Ude-M=O6B2bXPE9EdfD=VxZfFzR9Dc=yT+xWQ@mail.gmail.com>
References: <1547134822-18498-1-git-send-email-lollivier@baylibre.com>
 <CAFBinCDM4BTx0Ude-M=O6B2bXPE9EdfD=VxZfFzR9Dc=yT+xWQ@mail.gmail.com>
Date: Fri, 11 Jan 2019 11:55:57 -0800
Message-ID: <7hy37rm0j6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_115559_893318_3D62052C 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi,
>
> some nit-picks as well as my Tested-by (in case it's not too late) below.
> thank you for taking care of this!
>
> On Thu, Jan 10, 2019 at 4:40 PM Loys Ollivier <lollivier@baylibre.com> wrote:
>>
>> Commit 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
>> changed the behavior of "cd-inverted" to follow the device tree bindings
>> specification.
>> Lines specifying "cd-inverted" are now "active high".
> this depends on the polarity from the cd-gpios property. above commit
> caused cd-inverted to be applied twice (effectively making it a
> no-op). thus "cd-inverted" only means "active high" if cd-gpios also
> sets GPIO_ACTIVE_HIGH. if the polarity in cd-gpios is GPIO_ACTIVE_LOW
> together with "cd-inverted" then the GPIO will be treated as active
> low.
>
>> Fix the SD card for meson by setting the cd-gpios as "active low" according
>> to the boards specifications.
> not only switching to GPIO_ACTIVE_LOW, also dropping "cd-inverted"
>
>> Fixes: 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
> in my patches for the 32-bit boards I used the commit which added SD
> card support to the board for the Fixes tag. however, I'm fine with
> this as well (I just wanted to point out that there's a small
> difference in our commits).
>
>> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> on my Khadas VIM(1), using Kevin's v5.0/fixes branch:
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

I can add this tested-by tag in my v5.0/fixes branch for now, and can
replace it with a follow up if Loys can update the changelog with your
suggestions/clarifications.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
