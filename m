Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3244DC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:27:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1AE061351
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1AE061351
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TdytlVidQOmO0GQw+so6yEFIb25EkjGbHUqAMiWjxs=; b=wIQVJ5LKAy1yv6
	jm004B5ZP6fs+msaTXBKehw2ysswl3kPLdPetn5N5LxiQknSC3wKKtJ2Z75JPjvgLOQPyDd2c4Xap
	dx302J4kjiKBNoxTs4poHqChJmOqKs1I3vsU6RSqVKu7jyHzxAtwMy2IGTxhbOYN794RgiMNTA9jU
	TPl2xPIqiKxxrot0kBeSPYgndUmN4Jb80ORR4dPmD6JH2st6KAYFpwZOk3wp/GpqM/q+EezEfrL3s
	EJlD14zYmrEsU9ggBtYDDbPhnNjY++O0Ar3EVT1p7X7qPESCMrXTJZXuwEl6U02lZf+iPCZueV4kL
	7OBHBM/8f1cpJTs0Cthw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu0Tn-00Bxan-75; Thu, 17 Jun 2021 22:27:19 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu0TY-00BxXf-My; Thu, 17 Jun 2021 22:27:05 +0000
Received: by mail-ej1-x62c.google.com with SMTP id hv20so6553906ejc.12;
 Thu, 17 Jun 2021 15:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XBUUiRVifylGetd2oLvmNK/P++7zX9Z7YgNBUErs4Vs=;
 b=ggMhfu3axYL8C4ap0nbWKkEpnCtKKRXBEbRmyc0jerIaGcMimeQWJ8RvvbZL6U5OZF
 WsKQNOenJLOATry+yy1U1+cXSxUZntw+/z8ZQnko27QXIQhw38R7wORTRIgr27P5X7SG
 ipspex+3Zz0PEpfp16gkt61mRkmdpFsOHIWBcRw8OPSGvyHSO6wptXqTlu+FCKCgUHMb
 +YwjCicDWlyHGL38hNobBy5/Rnxyjx9JfQORRi8AucdnazkVESDdcpVwGyG3XuU8kOLQ
 tluzcMwM060nXgRbuwLWeFmFDmU+vQZqQH2zB+Mzng45PbBywIr9QoiFrms3dtbr/HUb
 qVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XBUUiRVifylGetd2oLvmNK/P++7zX9Z7YgNBUErs4Vs=;
 b=IbYlTWBYWjUV3m5lp1l+yQ6UC+COadTk0kwZ6OKzdpTqyquitHtvCTRX0KcRnSBlSr
 baYQeUiE9Dt63ZuIaw9FO1VsK6KaNDp4gppsVGLMqE5GaI9PRrr6L9B4b8EIlWGqZVnK
 n81GGDn4RluqUz21+3+jdbvCduKXjLPal4D/68/xQ8Z80l7oPRXCogXK5FV+JPMw5cWQ
 mfVA1PiR06aA+o53h75C8jvoCBCjuq7pGw3AbcEKg1+II+lS3kESg79Cf6JIjEEAhzZM
 tiZJMkZz+f6grXyz9UOHOruZxTPSIi/sStsYlJk8dZHbZFznSyNRpSGem6bm53nD+noK
 jx4Q==
X-Gm-Message-State: AOAM530YPiO7SCCdEA73Zg7CkCVRzQk+uY++zUpFP9o+/nBY7G3dVmy2
 L4SWIw67kE9zx8HhZPZu2e66giyWLISQRGDIcAk=
X-Google-Smtp-Source: ABdhPJyMKvbRGhk/yi1r0TWkeVgBBCLvywBFU7icC+Ej8Hh6tgBltevZFnA2nAbDjyGU1B7W65uQ06sVjxLlzccRECI=
X-Received: by 2002:a17:907:988a:: with SMTP id
 ja10mr7501286ejc.527.1623968822667; 
 Thu, 17 Jun 2021 15:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-9-linux.amoon@gmail.com>
In-Reply-To: <20210617194154.2397-9-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 00:26:51 +0200
Message-ID: <CAFBinCCS6mzukqgnJijn2khaaOAPb_mg+zAqYxpUb57297C6Tg@mail.gmail.com>
Subject: Re: [RFCv1 8/8] phy: amlogic: meson8b-usb2: don't log an error on
 -EPROBE_DEFER
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_152704_787763_084A5DBA 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jun 17, 2021 at 9:44 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> devm_phy_create can return -EPROBE_DEFER if the phy-supply is not ready
> yet. Silence this warning as the driver framework will re-attempt
> registering the PHY. Use dev_err_probe() for phy resources to indicate
> the deferral reason when waiting for the resource to come up.
This is a good improvement - thank you!

> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
