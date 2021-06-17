Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F75C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739AB61249
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 739AB61249
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVc4DcijJTXqSb+xrDDy/dpwaiZoTLAj5nNqfrQ5D9A=; b=dpZM9SCuQ6DBkk
	57jV3e9SwEAfYH7VuR8DXaQ0TCUZ5WcqXzWJiujWfpJsgLmmsz7+cL9nBXr70OTyNvp24i8ZkHw5u
	2ljvDNqOiPKzdSudiZA7jDuEyPZb41VYaHc1ivU6nB/LuXGu3cHVXhbIcKFYT1N5Y0xS8bpF6uT2/
	KoqyBtjtW4FKA+mIcnYgtuDuTLA7ogQwAorVQtsF6YAHB+EQE5wZKPwJP4cI9SIwKkB+bP7I3AL7K
	Xub5vOHjeYIVxIcz0mlDo0QPDhKE0oXD/JW3hu4+fPMs4fT8SoYJWHMqvyl30uKw76DedPje+IY1i
	7UqXh4VhGgTOzHLO3SDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu0ET-00Buia-3E; Thu, 17 Jun 2021 22:11:29 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu0EH-00BuhX-24; Thu, 17 Jun 2021 22:11:18 +0000
Received: by mail-ed1-x529.google.com with SMTP id r7so5794298edv.12;
 Thu, 17 Jun 2021 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zesdvlDOTsfJCYMfxYc1eGdUgx4s/GRB2e4AjzOW/PE=;
 b=c6d/7vzaOUVDMePr0fBGYrzT6WgLmo55vDCeFW1vzWwyGxuLIlhG7gIfj8nzNJV8n4
 l9MRyCfWE8korSmGWWISVxk076slUO70E+qg/fu86m+bLv0AFxxLCtx9MADzS3WVZZ8i
 p5lcuLl2inhxGD5UK+n8/JszeE6MHb0efkxHaYvuLNBVtm1/xczacfrbC3heM9/dN32H
 E2zuS4aG5Q7IdGDhLzDVluLau1J85kuVISp6NXPdI8zHthb2E0Y8KAVe70C6XW7UPbl7
 3TPXjv3Z9RDOZM9idFbHvkrj8av94bUt+JUqqqFEIp+rKTL4Cnnfl+jdfjuQEH+1r8F6
 S6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zesdvlDOTsfJCYMfxYc1eGdUgx4s/GRB2e4AjzOW/PE=;
 b=pdvfF5oOv+QueJOz5haVkYaIFcL622NY3OgWvvsw0GYlYvvrWYD8rQrvFZO+mdEB5B
 4wB1xR5w/0WE8OJ6OhWHv+RnnQVUncou81bTKVu2rLhnElAJjYZSI5NLK19xE7/8+91D
 ga0LdUTlvDL4s9Ink5u20ncEo8/hGOXgpYbIiCQWpTrkC52mDLshIs0hcRAV5VLi91L9
 GoxzWCsS9eWiOXcoXTrpJxlAI9KmOxpXJYTkjcvTzYDLawXC3/Cpj1lO3XBr8FlJhUZ+
 /zQneLACapv28ZmU2JjbLG0OjpkppBshi/qEo0WTX84Qkv5xLYsCEvU09isctfGCFnik
 hamg==
X-Gm-Message-State: AOAM533PuRUJ5XSUULQIwOylew0QFsP2+J5f3LKuftx9zdTdkuMaAAO8
 0fDGJJFgmjX+AZjvRH7u+BxiV262Xk0MUvgy4TA=
X-Google-Smtp-Source: ABdhPJy+s7G8n2muPksCVmlW0yHIS9m4Uk35n+fl3NqiK+lQz3IllqAa/h2ZJAFr1oZZRzDtew4JHXz2WSDJXOYfza0=
X-Received: by 2002:a05:6402:177a:: with SMTP id
 da26mr724355edb.40.1623967873323; 
 Thu, 17 Jun 2021 15:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
In-Reply-To: <20210617194154.2397-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 00:11:02 +0200
Message-ID: <CAFBinCDVnBApYziHazeS8f2FXHQ-tUS55-g6B22c20OtfYD=xw@mail.gmail.com>
Subject: Re: [RFCv1 0/8] Meson-8b and Meson-gxbb USB phy code re-structure
To: Anand Moon <linux.amoon@gmail.com>
Cc: --to=linux-phy@lists.infradead.org, 
 --to=linux-arm-kernel@lists.infradead.org, 
 --to=linux-amlogic@lists.infradead.org, --to=linux-kernel@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_151117_165835_C12A63F1 
X-CRM114-Status: GOOD (  14.62  )
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

Hi Anand,

On Thu, Jun 17, 2021 at 9:42 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> On Odroid C1+ and Odroid C2 USB feature is broken
with "broken" you mean the hotplug and IRQ issues you describe below?
I think that these are not PHY related but rather a problem with the
dwc2 IP/driver

> this code changes are just re-structure the code so that
> proper callback function execute in proper order.
>
> Code changes losely based on phy-meson-gxl-usb2.c
there's a big difference between the Meson8 and GXL drivers:
GXL requires changing some of the PHY registers at runtime based on
the mode (host/peripheral).
The Meson8 PHY however (as far as I can tell from the 3.10 and 3.14
kernels) don't require any runtime changes based on the mode.

> Initially if we connect USB HDD at initial boot it get detected.
> but after that usb hotplug of USB HDD is broken.
> I did not observe and USB debug events messages to trace the root cause.
>
> Another issue I observed is increase of USB interrupts event
> even if there is not much activity on USB ports.
> I tried some clk changes but it did not workout for me.
I suggest reporting this to the dwc2 maintainers and asking for advice
on how to debug these issues.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
