Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AE2C4727F
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 12:20:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26D6220759
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 12:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fay5rQvS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvmD222G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26D6220759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l8xo67VYaMq3Jh8u0VGZ4EWijQAULQ1kZluRMoYiFk4=; b=Fay5rQvS6oIH5B0jYjARi8pVl
	kBaslgl/3VFDY3U4kSSQ2r2RBC+aBIO8yTtsj8mZrZGHbhmDvyKAhPkyVwuMJ/VAxmxs8JhpkqwG1
	a1NlxG5Ng8v7ILtRT4tdX73iDJTQtRIoyr39BI1Y8PkyQVD/jKrsSGc683n0Kqup2IceC5CEdJnxh
	I85J+pEJ6ix73lWx22GUqPoKzU/4JY9KDyjRCvJQZop/n4M4aY5A4guQ+Goci4O9Az28qpqAwm8Cx
	KZ+HU1G8HPtl+wP2ADi4aQ1CL1tA1uFU+wXb4XSWH0eY5ldIMG/c7P50Cdw3vKSGn+J8QG0BSPZFk
	WSUei9E6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNEcD-0002UR-PO; Tue, 29 Sep 2020 12:20:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNEcA-0002TW-JK; Tue, 29 Sep 2020 12:20:16 +0000
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8D69221E7;
 Tue, 29 Sep 2020 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601382012;
 bh=ov1elNoAqvpAgkFdDCEUFjYQTLHr/ttO0TQvEJAVa9I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jvmD222GUH8GXZXMqLgvR5A2+dOAEZWZqu4PegoCrdYQdzBlMInSen1U/TUqJEq8O
 ceT34IkdoHIcZvgHpI88n6jirXc5UQcpO8Qz6F77lDrlzzwk0iFCge1wnf1OTx3Elx
 zfbRYdhsjG0Yv1fzcUprrD5yQS1C84H7eKuBhHBY=
Received: by mail-oi1-f178.google.com with SMTP id i17so5161507oig.10;
 Tue, 29 Sep 2020 05:20:12 -0700 (PDT)
X-Gm-Message-State: AOAM533pAdM4T9HN/b5k/CNqGBHBsB6nl2ZQuFZ+mJr5R5yhPeWIMLa7
 uekkxEIFFubpSpI7gvNUOo7igS4eeR83mVc7m30=
X-Google-Smtp-Source: ABdhPJxHjqLRU0igLQr7uKep0t1UD6JefrmIRI4HIWmkx+yCU9/FWYtVU2YD0jwBcbkAVEkIIOoN6IXn5rWs3UBmGUQ=
X-Received: by 2002:a54:4517:: with SMTP id l23mr2509374oil.174.1601382011805; 
 Tue, 29 Sep 2020 05:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 29 Sep 2020 14:20:00 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
Message-ID: <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
To: Julia Lawall <Julia.Lawall@inria.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_082014_802544_46A751D5 
X-CRM114-Status: GOOD (  21.78  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, drbd-dev@lists.linbit.com,
 David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Joe Perches <joe@perches.com>, openipmi-developer@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 27 Sep 2020 at 21:56, Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> These patches replace commas by semicolons.


Why?


> This was done using the
> Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.
>
> This semantic patch ensures that commas inside for loop headers will not be
> transformed.  It also doesn't touch macro definitions.
>
> Coccinelle ensures that braces are added as needed when a single-statement
> branch turns into a multi-statement one.
>
> This semantic patch has a few false positives, for variable delcarations
> such as:
>
> LIST_HEAD(x), *y;
>
> The semantic patch could be improved to avoid these, but for the moment
> they have been removed manually (2 occurrences).
>
> // <smpl>
> @initialize:ocaml@
> @@
>
> let infunction p =
>   (* avoid macros *)
>   (List.hd p).current_element <> "something_else"
>
> let combined p1 p2 =
>   (List.hd p1).line_end = (List.hd p2).line ||
>   (((List.hd p1).line_end < (List.hd p2).line) &&
>    ((List.hd p1).col < (List.hd p2).col))
>
> @bad@
> statement S;
> declaration d;
> position p;
> @@
>
> S@p
> d
>
> // special cases where newlines are needed (hope for no more than 5)
> @@
> expression e1,e2;
> statement S;
> position p != bad.p;
> position p1;
> position p2 :
>     script:ocaml(p1) { infunction p1 && combined p1 p2 };
> @@
>
> - e1@p1,@S@p e2@p2;
> + e1; e2;
>
> @@
> expression e1,e2;
> statement S;
> position p != bad.p;
> position p1;
> position p2 :
>     script:ocaml(p1) { infunction p1 && combined p1 p2 };
> @@
>
> - e1@p1,@S@p e2@p2;
> + e1; e2;
>
> @@
> expression e1,e2;
> statement S;
> position p != bad.p;
> position p1;
> position p2 :
>     script:ocaml(p1) { infunction p1 && combined p1 p2 };
> @@
>
> - e1@p1,@S@p e2@p2;
> + e1; e2;
>
> @@
> expression e1,e2;
> statement S;
> position p != bad.p;
> position p1;
> position p2 :
>     script:ocaml(p1) { infunction p1 && combined p1 p2 };
> @@
>
> - e1@p1,@S@p e2@p2;
> + e1; e2;
>
> @@
> expression e1,e2;
> statement S;
> position p != bad.p;
> position p1;
> position p2 :
>     script:ocaml(p1) { infunction p1 && combined p1 p2 };
> @@
>
> - e1@p1,@S@p e2@p2;
> + e1; e2;
>
> @r@
> expression e1,e2;
> statement S;
> position p != bad.p;
> @@
>
> e1 ,@S@p e2;
>
> @@
> expression e1,e2;
> position p1;
> position p2 :
>     script:ocaml(p1) { infunction p1 && not(combined p1 p2) };
> statement S;
> position r.p;
> @@
>
> e1@p1
> -,@S@p
> +;
> e2@p2
> ... when any
> // </smpl>
>
> ---
>
>  drivers/acpi/processor_idle.c               |    4 +++-
>  drivers/ata/pata_icside.c                   |   21 +++++++++++++--------
>  drivers/base/regmap/regmap-debugfs.c        |    2 +-
>  drivers/bcma/driver_pci_host.c              |    4 ++--
>  drivers/block/drbd/drbd_receiver.c          |    6 ++++--
>  drivers/char/agp/amd-k7-agp.c               |    2 +-
>  drivers/char/agp/nvidia-agp.c               |    2 +-
>  drivers/char/agp/sworks-agp.c               |    2 +-
>  drivers/char/hw_random/iproc-rng200.c       |    8 ++++----
>  drivers/char/hw_random/mxc-rnga.c           |    6 +++---
>  drivers/char/hw_random/stm32-rng.c          |    8 ++++----
>  drivers/char/ipmi/bt-bmc.c                  |    6 +++---
>  drivers/clk/meson/meson-aoclk.c             |    2 +-
>  drivers/clk/mvebu/ap-cpu-clk.c              |    2 +-
>  drivers/clk/uniphier/clk-uniphier-cpugear.c |    2 +-
>  drivers/clk/uniphier/clk-uniphier-mux.c     |    2 +-
>  drivers/clocksource/mps2-timer.c            |    6 +++---
>  drivers/clocksource/timer-armada-370-xp.c   |    8 ++++----
>  drivers/counter/ti-eqep.c                   |    2 +-
>  drivers/crypto/amcc/crypto4xx_alg.c         |    2 +-
>  drivers/crypto/atmel-tdes.c                 |    2 +-
>  drivers/crypto/hifn_795x.c                  |    4 ++--
>  drivers/crypto/talitos.c                    |    8 ++++----
>  23 files changed, 60 insertions(+), 51 deletions(-)
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
