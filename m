Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AB6C48BE8
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 13:23:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB3461261
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 13:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BB3461261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hy+iGY/eczj9iW6z1iw232bcWVqVZBLaI0AM7WRiLzs=; b=M+IqrXk3mnMaMc
	i3eedmPZ4MrHdVmHXtte75RFMOQdb064aonYFGWSWPSiLOnEE9yhBInEikFEgF/Zz2YaeP3zZnW5V
	fgYOCBqHQLuxQxdLXfA9IFrj4nTkzb9S9cGvHDzRfSQ3oBDX+TqZunSXv5A/HXAHiaGHS5NJGXemj
	LGd+gx5BpPDsqNd56OGIZlp5EpqTsDSZ0z0np7ecJwBfSl0j7R5Mh67JoeHjaCra4HIu1wx7N9Mcs
	TXl5tt99LGlI1Ot591b/dtN++9sPe+pm96NjHpBjsD5UmtyY4yerBR6oVnEohfiP1pJgMOm9zunUs
	vBh5WSde1qOTH0sTpwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luESV-00ECVx-4s; Fri, 18 Jun 2021 13:22:55 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luEQV-00EBWM-Aq; Fri, 18 Jun 2021 13:20:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id w21so8624307edv.3;
 Fri, 18 Jun 2021 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aCfQbfrt5qvJnNWovlWCYxzbElz4rKl7GdfgBa31+S0=;
 b=SPQP+UH7dId/IFlM1J6+ZfRgx8exW9U3zL+aaj4MkRT+pL0NkV8A/24dFWYVgssc0J
 zJMk4NWKjGAvvgOQtMcFh7md2xPV0RgXjQ4jIwe7HSY4KUk4nN7D8hwSwY0Fabt17zmP
 k//l7j+Wf1xHnBSxskgG8sUzbdfqo9a+eNAdyILA/ejkkeabsvHdTn2FLxp6hxgBgLs2
 eHao7rU8TTQlM3TtzFVeqQlZP8iTtmeOAOXcvmxuhJt6AO1vJtudPKBitEN28ZyeEgt3
 C0UAwMzYmEX7BlW63NaRdFL0O0oAElcvWTUN//dHwHgGRqq4dX7kLSmb2iyxdVnnwAin
 lErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCfQbfrt5qvJnNWovlWCYxzbElz4rKl7GdfgBa31+S0=;
 b=JxXKKFnEpoKy60iV4b0RAedHiO/di6DpWogCNhVNELcPjM7IAIV0BPeJNaNOqKVFbY
 h32Dvvta0T5ypzDsz8PW1Z7CxuHuiUcKrUtqToUh0MxWP/qR3gKBiYBJcO1Ae5PRIAEm
 5NObBKEual4q99dKqeonK5l2NXt371MUpEY5QBCxClXGYklACGVxE8AWPekQfp8UoWyI
 3b0S6RTQvgs1wNqDpoJtKdvV0We+Uqc6F3aYddgUziVTHFOaXe8CctkXGnvgFdQk4Q2a
 /v0ucflldTINMgQBGnBNDVQisOvm/t4hvS5hVkzkkK8PkhvzKdNgMdkxT2h+iY9JOJKz
 YwKA==
X-Gm-Message-State: AOAM531Pmla9lkR6JvvlH6q09CyP5iciiRESn7zBztJu3FZUMaFofZJt
 WM7mF793yNqM10Uo5pIxUl0jVNhVjKawRZL+h6c=
X-Google-Smtp-Source: ABdhPJz6bucKNYlMeaQC6CItsCc6UV9ebDQXJxtGgVJZr2SOOXBkE+7nJoqtVBuCIevPJTlwVz463DwbN0CK5Ec04VI=
X-Received: by 2002:aa7:c40a:: with SMTP id j10mr4863359edq.59.1624022450023; 
 Fri, 18 Jun 2021 06:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <CAFBinCDVnBApYziHazeS8f2FXHQ-tUS55-g6B22c20OtfYD=xw@mail.gmail.com>
In-Reply-To: <CAFBinCDVnBApYziHazeS8f2FXHQ-tUS55-g6B22c20OtfYD=xw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Jun 2021 18:50:39 +0530
Message-ID: <CANAwSgQcVDdPMZjuaN4O1dpVDd-KrNCGLDq0h4vfP4YZ2vSV2Q@mail.gmail.com>
Subject: Re: [RFCv1 0/8] Meson-8b and Meson-gxbb USB phy code re-structure
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_062051_454588_633F2D81 
X-CRM114-Status: GOOD (  26.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

Thanks for your review comments.
(some email id got messed up while sending these changes.)

On Fri, 18 Jun 2021 at 03:41, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Thu, Jun 17, 2021 at 9:42 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > On Odroid C1+ and Odroid C2 USB feature is broken
> with "broken" you mean the hotplug and IRQ issues you describe below?
> I think that these are not PHY related but rather a problem with the
> dwc2 IP/driver
>
> > this code changes are just re-structure the code so that
> > proper callback function execute in proper order.
> >
> > Code changes losely based on phy-meson-gxl-usb2.c
> there's a big difference between the Meson8 and GXL drivers:
> GXL requires changing some of the PHY registers at runtime based on
> the mode (host/peripheral).
> The Meson8 PHY however (as far as I can tell from the 3.10 and 3.14
> kernels) don't require any runtime changes based on the mode.
>
Yes I have gone through 3.10 and 3.14 kernel + u-boot source code
My intent is to simplify the code changes so that they will be
flexible to be used
in the future API.  It does not solve the problem.

> > Initially if we connect USB HDD at initial boot it get detected.
> > but after that usb hotplug of USB HDD is broken.
> > I did not observe and USB debug events messages to trace the root cause.
> >
> > Another issue I observed is increase of USB interrupts event
> > even if there is not much activity on USB ports.
> > I tried some clk changes but it did not workout for me.
> I suggest reporting this to the dwc2 maintainers and asking for advice
> on how to debug these issues.
>
Yes I have enabled the CONFIG_USB_DWC2_DEBUG
to help debug this issue but could not find much clue on
why this is happening.

I will keep debugging the DWC2 code or try to understand the missing features.

>
> Best regards,
> Martin

Thanks



-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
