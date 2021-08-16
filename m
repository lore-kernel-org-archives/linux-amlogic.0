Return-Path: <SRS0=wHyG=NH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF1FC4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Aug 2021 21:02:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF0460F11
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Aug 2021 21:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FF0460F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unZBLv4FsBgArvPSt85PTpTOx1x2dBXVDT4ilGiHiEk=; b=IVYMt/twanbSGg
	KUYNJVkt2CcULUIRkmdwsmplUINzgHtEnh1Steh6ALV13sPL7mZ0nVuGNwRzFA4uiWQ1mXFSqtGLV
	QV5Uhu11wZPDZmX/QDUUuViA6CLlOPb0XI74A6aj/eDwy7HVMJ7ILDC2ehUAAESH4jJgt9fYA72JL
	bC8wQdnlMfs1REMJo96Z2XhJSKRgsptd/aYo1B2gPzPxrpARsUS2NDCkIDTfOMdX99aDiAZGziB9R
	E74bIUI3/+pvUGRLdPHhi+1Ym7dujlJGX+nHG3Jy1ijutVauz7ataDrFUwVDwOxDUSTm6H0dT0ETW
	SUNIu7ZejRykROusFZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFjky-000HvE-O9; Mon, 16 Aug 2021 21:02:52 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFjkv-000Hu6-9V
 for linux-amlogic@lists.infradead.org; Mon, 16 Aug 2021 21:02:50 +0000
Received: by mail-yb1-xb31.google.com with SMTP id r4so12501445ybp.4
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Aug 2021 14:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9tBnOccmzh2NJZYx5oDaY8MOAHPBqp1qYchURvuFzso=;
 b=R16oiv/oceeUQV3a8yDdzod/rO3qI0SEJlVFlqqsHY1kJ2SIGsYuwOrp7cudXALITL
 KHJxOV3loaVswHpYg9mED7WahY3ZCZbN+kf/QcUJRM4Nkx+oQ9Nbhaye9JkT5rKoPZhZ
 TXlUCUmKKQMZLOGx3gLZ/0A1BAxBD6hhNzch/x2ygnciQhCT4Q8OxxVsdEieebUda1j4
 Yl5srS5Ig3HVcPXA3fI8QBi++ZQlE8UYCRA66y1xaceEiDvRK+/CaxA7WHUrSc3caYOu
 FURHrXGr/JK3v89xSxs0acxIdq+Qdc6w7o9jIDqfQVElfYY/ogERPimfyKtdY4fyzNdh
 GH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9tBnOccmzh2NJZYx5oDaY8MOAHPBqp1qYchURvuFzso=;
 b=tfcpE/k3ad28I1a+DHatqC2AYciwqJDu0BA8Qew4fWBp/rftI7Lqzxy7ftcSvlRlpR
 IzbpTdAAihDndWuoiIqJfb+SU8TJGOt2+zWeDwJicnCkivAeXEJx3OVI+ZNdaDslBBTt
 HiO335rbHiliosyVgv/i8fNH1aNolL0LaQUvZEzpwysdHuwaV9aEiRYZGRiK6kOXZCpK
 apEM+6TzQoF9HRK7J4VIgCL2SA5Xi5/T0OwSdYAEBMdM1Xk/igy9ViodVWkrLZRb2zSZ
 L3b9g+o+mSc1bRoWKfUZ7fhmvD9PGqCuXOcleUJl4mPMs7q/0cY2uVhXTtTqanoU+qNM
 qT7g==
X-Gm-Message-State: AOAM531zjhNLr2FI+RQwjYchXVEQaXhUk4+VoQtb5+oqmy8+57zydx9W
 sckEqhqYm6ya27XxRswmMsGWkUULW6W3wO9LC+MaCA==
X-Google-Smtp-Source: ABdhPJzfOeoMrqnOumdBEyULbR12pEKizh9VCI5n4TPyzQfeauroCIr1y3HOIzCK1KqhoZVCucYu6yxU1MKOU+MlGp4=
X-Received: by 2002:a25:d1c2:: with SMTP id i185mr483413ybg.466.1629147768118; 
 Mon, 16 Aug 2021 14:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <87r1hwwier.wl-maz@kernel.org> <7h7diwgjup.fsf@baylibre.com>
 <87im0m277h.wl-maz@kernel.org>
 <CAGETcx9OukoWM_qprMse9aXdzCE=GFUgFEkfhhNjg44YYsOQLw@mail.gmail.com>
 <87sfzpwq4f.wl-maz@kernel.org>
 <CAGETcx95kHrv8wA-O+-JtfH7H9biJEGJtijuPVN0V5dUKUAB3A@mail.gmail.com>
 <CAGETcx8bpWQEnkpJ0YW9GqX8WE0ewT45zqkbWWdZ0ktJBhG4yQ@mail.gmail.com>
 <YQuZ2cKVE+3Os25Z@google.com> <YRpeVLf18Z+1R7WE@google.com>
 <CAGETcx-gSJD0Ra=U_55k3Anps11N_3Ev9gEQV6NaXOvqwP0J3g@mail.gmail.com>
 <YRrOvJBLp3WreEUf@lunn.ch>
In-Reply-To: <YRrOvJBLp3WreEUf@lunn.ch>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 16 Aug 2021 14:02:12 -0700
Message-ID: <CAGETcx_Q2-7B5RpHSfDu1KB0n+pT8nkCwGsthN20QBvgePcUtQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as
 a module
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_140249_400589_25F6F1CE 
X-CRM114-Status: GOOD (  14.68  )
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

On Mon, Aug 16, 2021 at 1:46 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Not that I'm aware of. Andrew added a "Reviewed-by" to all 3 of my
> > proper fix patches. I didn't think I needed to send any newer patches.
> > Is there some reason you that I needed to?
> > https://lore.kernel.org/lkml/20210804214333.927985-1-saravanak@google.com/T/#t
>
> https://patchwork.kernel.org/project/netdevbpf/list/?series=&submitter=&state=*&q=net%3A+mdio-mux%3A+Delete+unnecessary+devm_kfree&archive=both&delegate=
>
> State Changes Requested. I guess because you got the subject wrong.

I'm assuming the prefix is wrong? What should it be? I went by looking
at the latest commit in:
$ git log --oneline  drivers/net/mdio/
ac53c26433b5 net: mdiobus: withdraw fwnode_mdbiobus_register

What prefix do I need to use to be considered correct?
net: mdio:?

>
> With netdev, if it has not been merged within three days, you probably
> need to resubmit.

Ah, thanks for the info. Since you didn't say anything, I assumed it'd
get in eventually and didn't really check the patchwork status.

-Saravana

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
