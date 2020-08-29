Return-Path: <SRS0=Pllw=CH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0D8C433E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 15:26:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A36A20707
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 15:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAuLpQ6I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="m4XsMpk2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A36A20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=viJxMPixiSXO4UJj3gwFGCutxDByxRuh6zTvtiKDCWk=; b=eAuLpQ6Ihn4GI4BXrrB7L2vEU
	u8l9LB8XIN7QV9H6QLwAljil+ditahNKgEoYGpcR+o0H5lUf7d5O0dH8JpeTFy4ZkntWBTPjvqwWZ
	aQc3wmi4eeb44LjEZyiRKns4DYp44JD2y3P/esYHKjyeYZGp4LDCSP2V0UzXJ3VVPI88MnNYEh/27
	ztky99SQDo93WoYMsitzFG8SAZYG93Ja9XJAnXX5HUo7GeUabCRBxdqGKMxXfNGHYsZMdn8+DG2LS
	2oJmFPxhsY+GgHhZViPHcIHqmnC7aTMVROGvWyc78mT51H65KmHLSWFHahhdArV7bHakE8R23XF7D
	twNfJwAQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kC2jv-0001eE-K1; Sat, 29 Aug 2020 15:25:59 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC2jt-0001dn-3j; Sat, 29 Aug 2020 15:25:57 +0000
Received: by mail-ed1-x542.google.com with SMTP id b2so1707087edw.5;
 Sat, 29 Aug 2020 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VlZBchCAyWhuNUD37n2dPDCJAJclNP7/k78UQz5aH6Y=;
 b=m4XsMpk25tlrcGVQqQpM+7r2/Bjvrr/qPL8d+LgyuzzcqusO+srnJUfIvx3rpfniRn
 WQVU9S+3ZgzFOp07by3VNOMcFIiUV5a3pAqviuOe6MziClK7/p4YVJFTB2k9q570znSy
 R5dVw0/r66Jsq0tpkawxKhFVA2gVyaN0toXYqFfpOIB0Gio1LwJc3XH8iq1qR4+tHhLV
 MQTdl5TFkqMyYi0VO34MhMI+OrZ1eivXF8wMEhu0Jitn9S4+qNOgrKmKfTfew1Jj9G6x
 z5V0KfyGayhpShYxFXvSL3ui35InB8tShz5RUI+qjPSoQx6gh8/tPf3I/t22u0W42euW
 YwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VlZBchCAyWhuNUD37n2dPDCJAJclNP7/k78UQz5aH6Y=;
 b=newTyG+pBYp3adcVlB+Z0HSRMA4XCJ1Abn40Coyu7zU2zdUcIu/K3/ZhAIcTcz6+pd
 86QkEIt4jLdFEA9xaJ/KTvwgLb0XHmtu4CF+JI1BoxnhWTh+z3VYt5BG1DEFkRBd2VOd
 tdyIqj8esliCyTKAEqs3+CVeQiKHrZrxK5CsFAHofqoH76l5kBlPXxAAzL5aAiQH249T
 AYWy7zm/gyWG7h9az4nX0Umkj9m3bJaMRCWGVZr0qp71xOFQQPWFX0RrLcGCMQfBwcc9
 nfZ2qhZgj7JX/NRN1/cFppTeg9w3hsEsUCxlixO1JzBx5B8LldV5BeLgt/2UJU+xsST4
 hLFQ==
X-Gm-Message-State: AOAM532JUIdtq6cDOxj2bg5mTlYPiA5uqveACWoY7IPEh7A1+uSYivzW
 AetDPYK4qI6KTXAoE1toWb+M3FaiW6W4I1jepJmcttBd
X-Google-Smtp-Source: ABdhPJz5XzPTbZ7BAUYzHuDxgUeYvsO0Qg+A3sH8USWhY8loqiIGsVFvzhKelnueGLLZLJeSRSprgA9A9IRvPluCnNU=
X-Received: by 2002:a05:6402:1443:: with SMTP id
 d3mr3975828edx.40.1598714755843; 
 Sat, 29 Aug 2020 08:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
 <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
 <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
In-Reply-To: <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 29 Aug 2020 17:25:45 +0200
Message-ID: <CAFBinCC60WzSRitVGBPon9zZVJ_eUjdcEoP7NBHiHR24mLBgig@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
To: Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_112557_185097_253A6AD7 
X-CRM114-Status: GOOD (  22.67  )
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
Cc: Dan Robertson <dan@dlrobertson.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-usb@vger.kernel.org, aouledameur@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Philipp,

On Tue, Aug 25, 2020 at 12:20 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
[...]
> > reset_control_clear()
> > would be the way to state that the ressource is no longer used and, that
> > from the caller perspective, the reset can fired again if necessary.
> >
> > If we take the probe / suspend / resume example:
> > * 1st device using the shared will actually trigger it (as it is now)
> > * following device just increase triggered_count
> >
> > If all devices go to suspend (calling reset_control_clear()) then
> > triggered_count will reach zero, allowing the first device resuming to
> > trigger the reset again ... this is important since it might not be the
> > one which would have got the exclusive control
> >
> > If any device don't go to suspend, meaning the ressource under reset
> > keep on being used, no reset will performed. With exlusive control,
> > there is a risk that the resuming device resets something already in use.
> >
> > Regarding the condition, on shared resets, call reset_control_reset()
> > should be balanced reset_control_clear() - no clear before reset.
>
> Martin, is this something that would be useful for the current users of
> the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
> meson8b-usb2 with reset-meson)?
for the specific use-case (system suspend) this would currently not be
useful for the two drivers you have named. This is because the
platforms on which they are used currently don't support system
suspend.
if other drivers are going to benefit from this change then please go
ahead and add the necessary API. Then I can also use it in these
drivers. however, (as far as I understand) I won't be able to verify
the new "fixed" behavior


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
