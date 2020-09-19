Return-Path: <SRS0=f3vK=C4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638E0C43463
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Sep 2020 10:12:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 176C021D42
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Sep 2020 10:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gz7/Z0ez";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5uq/J4W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 176C021D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O4pCZtSUWADo70dufS46GYu9R782axwH2rFJTk+iF2Y=; b=gz7/Z0ezv/oAcZ0Kr+3z6lix7
	o/iBWltOAuMYy2roITQQAMTLoTuswTxVa8GgAJTftRZxwLz3kFG0IzbMdFcEHEAgj7lneyYE1RvDE
	p331wdqRKI3g4fs39hYIzaHBJgnru8GUPI0G2TwB3QiuEthEWEJIkIzO7p5LJzqjc+mO/oeTARSU0
	dJ2gfHlYwKe+1iVBbp+fJr1l43j3DGwS3KA3JggeYnjYr62toJxznVBI850tPqUjfnV1ZMScNAYRI
	fe+dHQHIZ48PAKb7RkvYqh7Wj2a91VGcBwCMPs/IxKyrk5kNUoykLZxj1MLyxVTaAdlU2o2fajG07
	8/bwKX6hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJZrN-00075B-9A; Sat, 19 Sep 2020 10:12:49 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJZrE-0006zm-Es
 for linux-amlogic@lists.infradead.org; Sat, 19 Sep 2020 10:12:44 +0000
Received: by mail-il1-x130.google.com with SMTP id h2so8746134ilo.12
 for <linux-amlogic@lists.infradead.org>; Sat, 19 Sep 2020 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h6y3otbe++i4/q+EqicnIIpOahEcuXb8VWWLuzNIw6E=;
 b=M5uq/J4WZuGT4xGqMZCcyg07/phrK8O6CAPm7V8MoVhNeCaW277TbidRnZtWMOGP0t
 c9arzNkQduVxb3JznV62D2a7zyKBG1BbrhCCWcDpkEe6QYTS2h6tkZdjBz1UMnPaOER8
 b5rvB6kzAAF5aJvqC3tLuiMdjSBYgYBCVyzNFBrrePM2rbH6esW+Ch2kCD+DCoDC233E
 dKF2W4LzltNP8NTHt228Z/+wWaUGIoj8CuY1PD8idaGFZOi9BeHFTbjEbUWD4iyBiuoi
 DBAn3VyDnv3bv4oIhWYWp3Op7wDJRfctVdtLv4HsUGMCSmJMeo3IWtyd4fpxmqHB3G1D
 yiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h6y3otbe++i4/q+EqicnIIpOahEcuXb8VWWLuzNIw6E=;
 b=YzULvf7rTKLZ2gLJlWZQWoB2+BQnIAottH+FQ1r2zFhxdvjeyzE1UjXcH8b+w4tXWr
 IcTShX4yBLbH/sX1hpeGP3WIkthVwL/FK+JQVYv849okoHKUT8KYKKyn5PFHw0HQzJ0p
 czumjZjtntqWAQpH4CWvwD2QFkXVr9HYAQus6RiiR2ILBJrxK3HGj45/+7jo5r/gof8j
 C09PfziMeCoug9P0H426QyqqAMl/J5B/a2KXNx6v2muMXu8fdIzTZ86SubD0LlD4oh3o
 tS91FsguM2UrGrOn3VEpQERRepGHXbxqQbT0UMAq7ER5veidn8LdFNxIzbhL5NDufkUC
 nMTw==
X-Gm-Message-State: AOAM531BuPtQrhUqP2gnnMaa8oAiawlwxrnnj8TE8yx+WyZB4VCGhEML
 t8WMGKcG5oMK/AYzDyk05Xe2dGnpver2XmlTUOjc5pr60FAAtQ==
X-Google-Smtp-Source: ABdhPJzWD9TH4uBY+tRUMkWlDI9TDZCji7rZCjWATXrOVjwiJmkH6P4lgsHA3wqzyajXbn5IGfaP+bbSBCX2eZcsoFs=
X-Received: by 2002:a92:c084:: with SMTP id h4mr11661195ile.6.1600510358522;
 Sat, 19 Sep 2020 03:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <87y2l8plev.fsf@dell.be.48ers.dk>
 <CANAwSgTx9FHnueO0-K5M6kFhhWLJ0MEdcDKDnxbrwDnkM+AK3Q@mail.gmail.com>
 <87tuvwpgjr.fsf@dell.be.48ers.dk>
 <CANAwSgQnnkVdYNWTdTez8wdDHMW50vk+1Vcb7mBFkObnS1tAnw@mail.gmail.com>
 <875z8ap0xe.fsf@dell.be.48ers.dk>
 <CANAwSgR4Nq0rsg3yi-AF1HfAAvNquB2=EJj4n0_J2uHbSgVJCA@mail.gmail.com>
 <871riyozkv.fsf@dell.be.48ers.dk>
In-Reply-To: <871riyozkv.fsf@dell.be.48ers.dk>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 19 Sep 2020 15:42:29 +0530
Message-ID: <CANAwSgTxt+haenzOL35fO_OfWRHaLT2GyoLDjqG7r2OKqMX4eg@mail.gmail.com>
Subject: Re: s805x USB broken in 5.8?
To: Peter Korsgaard <peter@korsgaard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_061240_522293_46898ECC 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Perter,

On Sat, 19 Sep 2020 at 15:31, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Anand" == Anand Moon <linux.amoon@gmail.com> writes:
>
>  >> Sure. Have a look at the lafrite defconfig and readme we have:
>  >>
>  >> https://git.buildroot.net/buildroot/tree/board/librecomputer/lafrite/readme.txt
>  >> https://git.buildroot.net/buildroot/tree/configs/lafrite_defconfig
>  >>
>  >> You may want to change to a prebuilt toolchain to speed up the build
>  >> (make menuconfig -> toolchain -> toolchain type -> external toolchain).
>
>  > Thanks for the quick response.
>  > I will give this a try on my SBC.
>
> Out of interest, what SBC are you using? A lafrite?
>

I have an odroid C2 / C4 / N2/  Le Potato.

> --
> Bye, Peter Korsgaard

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
