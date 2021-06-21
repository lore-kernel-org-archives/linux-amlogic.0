Return-Path: <SRS0=jJRA=LP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DDDC49EA3
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jun 2021 07:15:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3849C61156
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jun 2021 07:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3849C61156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zK7bKcuvZKb53VO9T/AqQgxsqHWo60O7i6dQ5koa3Po=; b=VUtQAhnh3hiv2N
	J7NXKKkRUs1riZ6BKPsMsWxPT/VoEPry9u2e5ADz4UQjngpCe+ct+UIdwQDs6JBhc16WgHnElRHMK
	C+qFks0UDXo3FxvFgXJR/k918HnmTc7keIcTl6JvsGxwFdbhQYqRJc6foGNpOaQxxBxfiQTSSM9rx
	hqOqJL2FNGoATqWduttY0pT7z8MC1V5610cORCIZaut5MkBU9GX0GrZhUwhFsQCN/+zrpLVJWtgwA
	WUBFkb0Gig2QMQMx8vUe7yOK3jKXVQNEBT+U7eTdXcl9trdOkX9WCmZpamQnej9oNwFWlhdQRfXA6
	ld58D9zI5NpfZo5NXyRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvE9W-002ReJ-Sq; Mon, 21 Jun 2021 07:15:26 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvE9K-002Rcz-0V; Mon, 21 Jun 2021 07:15:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id d7so17551664edx.0;
 Mon, 21 Jun 2021 00:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g2VmOBbh4kfF26YhpUPXGB28rPvNAwUjRDpuCeiXVHo=;
 b=fqKD5IDT5oHBC8maBgSPfZhCXdKhsBTj5jzlUbJgQijXi1mI575CgsyZDErzU7gicQ
 6zayRSxarLEgm9D8EQ+x9C2pNhfQIcNUNBg/LYsQeopH3uwf+qu4W5L1BU1+Af4L5TYT
 Bfyt1AlBB6sL1WTP8+D1QO5VUuD1Qazv+e09PNXA0WOTO1L2OeovaSWYfhGDIP56NVfd
 1DDM4cTu4NUx3w8g0z36UnxoC4gWrOWrei5wWqoRdD0B9Okc69xFtNlY7DfE1pu0HeGW
 IK4LE+G6hFiGGG1fuvzlvKAXqTIg1/qjHo+ynoQDOddWnwXkTtkV7jM7NceWlViXHmSm
 0eQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g2VmOBbh4kfF26YhpUPXGB28rPvNAwUjRDpuCeiXVHo=;
 b=N8GwRfoXZuNB8ww6Z2mu2NDARqfFtYKQ4KJM+wrxgAwUi1GZOX3TuISKGWWyabbZNf
 tNNhty1r5nxmiFR/QScZQrM6v5fBETYo6BmNdC3/ucuFBkAiMQl9LMjSbW8ROibJLjlY
 x908c32h6B+q8cJ6OgnR32hg85dyyqsyWLrNOZxAsPbCtT+r/qPurQG3sHN9rVzBWYvS
 fJ2tQ7PkaGPp/JPigm7JcFqIwDk8Znww7WugOj0RMcMHAcynuIhK7B53MByDaQJ3CKPt
 cYVCsWkHWokSxRe3HqE99qVaGEmcG5mvb4kYhesGCsl5OBkG+tWd/dcnVO4vTXIzUilA
 7bfw==
X-Gm-Message-State: AOAM533DsbCpRWwSGNMEzkVCFdjElR8Ss8OQoVezszKc16J33IfJeFSh
 gfUsigOcusFruWaB7slOQe7rQEckRHJ2TI2+Dus=
X-Google-Smtp-Source: ABdhPJxMw27+fNAEFULQjd6QLuyehyn4PR4Z6KE+kRdu0VUzdLm6B8ZIFnOIpuWRHMTIhMVnTwggmWHQo2W09KWm6rQ=
X-Received: by 2002:a05:6402:4395:: with SMTP id
 o21mr19677609edc.163.1624259711929; 
 Mon, 21 Jun 2021 00:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-8-linux.amoon@gmail.com>
 <CAFBinCC0KScn6cJ36ZB_=TRncOOCXJHWwR3s=o3TobH=yOrGJA@mail.gmail.com>
In-Reply-To: <CAFBinCC0KScn6cJ36ZB_=TRncOOCXJHWwR3s=o3TobH=yOrGJA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 21 Jun 2021 12:45:00 +0530
Message-ID: <CANAwSgRi7UcS22QKZRRhwYvB3Dyk0ChowX+KByEsxP35ezjtKw@mail.gmail.com>
Subject: Re: [RFCv1 7/8] phy: amlogic: meson8b-usb2: Power off the PHY by
 putting it into reset mode.
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_001514_095118_479157F3 
X-CRM114-Status: GOOD (  18.46  )
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

On Fri, 18 Jun 2021 at 04:07, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Thu, Jun 17, 2021 at 9:44 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > @@ -245,8 +250,6 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
> >         regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_FSEL_MASK,
> >                            0x5 << REG_CTRL_FSEL_SHIFT);
> >         /* reset the PHY */
> > -       regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
> > -                          REG_CTRL_POWER_ON_RESET);
> The vendor driver uses the following sequence for the power on reset:
> - set the power on reset bit
> - wait 500us
> - clear the power on reset bit
> - wait 500us
>
> With your change we now:
> - wait 500us
> - clear the power on reset bit
> - wait 500us
>
> I don't know if this is sufficient to bring the PHY into a well-defined state.
> Maybe it works, maybe it doesn't reset at all in this case - I don't
> know how to verify this though.
>
Initially, I tried to some bit mask code to resolve this but it failed,
So no harm in keeping the original changes.

There is another parameter REG_CTRL_PORT_RESET to be considered.
>
> Best regards,
> Martin

Thanks



-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
