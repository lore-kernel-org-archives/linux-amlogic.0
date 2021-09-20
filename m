Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFAEC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 18:05:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B71619EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 18:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73B71619EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALC49SwyNYkVJT9wrt6zb+KV5O4CEzGu1LXj07iYrsU=; b=JO+1lS9b5Azr3G
	D7vuJJPZIh2l4QqGRdhAMUbIN7orP/OizkgIyHAnbnAj9jT1ZXiaXT5OcfeXnhqYBNIMEYMyUHA60
	ejVKyN0h2DXOUZnGNpjTlzdRkVvi5XB3C32yM7okjrH62LqeNQDJpURSlhhMAaj3sD9qzHOGlDH6W
	F3xn7GltkWqhiFwvaEk2Ih9HU0Kw0RdAyRW5P4IU41W+pNIf5D968F1gT7PT1TuKw8L9coPcROVqw
	7+A7NDDQyfGRRDJDYXG0dW9KnSAKwCa0h/YDLNcPoJSKGtKt8eZ7NTD2+PmSS+WsU0cLgbwGPMo6q
	2E7Z9uFtbmGbQFOpuBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSNfs-002iuk-BP; Mon, 20 Sep 2021 18:05:52 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSNfZ-002isT-Hz; Mon, 20 Sep 2021 18:05:34 +0000
Received: by mail-ed1-x52a.google.com with SMTP id h17so64731904edj.6;
 Mon, 20 Sep 2021 11:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZU7cvM5PEGyRcNJxXhrz4KrtRbPr7EX5WBgJywTvWKY=;
 b=aJWKVw64oeyoRl5vGYArhl2y79yi8hMO1OwshxrjdyyZRGWk5o6rIqhC8bqga8F/uf
 onqA7Xqi28+eIiRjjA19DE4V2yRUHpNmU1Ph/7L/P10+BY1XO2FDq0ErARsb5p1wF4NC
 iFzwn2Byt9ASMrSF/TH2d21FsdNdzJQBneNIaVrhW0+mbcx71Cx/7XsLOTMUGOzodj/M
 KYMm3Tja/KFAP9VgccdgJKPvlh4xeW0k/qKUzhE/JdcsYbMWG+2/lPu1FUvXSKqScK7b
 UPWkxh7zbevO76IMjca79uSyqPYAKUUxIGmiS1vMmV2XJUhCcBeoHn1oTgaA+mh0dhPr
 BVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZU7cvM5PEGyRcNJxXhrz4KrtRbPr7EX5WBgJywTvWKY=;
 b=CLPPmALpECB+UmsAx2hFGCU/vGqIkgycDYIAomtRUAopYmWGIKU6Cyy0HME9AZfZ2X
 JDJYfZcOLaly68vb0uonICWSMxio4715LOztNlpusfogd4ME4IsKGXixHWCGJNY2/DFP
 O5jKfb/5+RsVM4Z+sky55dl3OHQ4JJ+pe7LYC/Xhv5xN5s7k9xVSOuvD2dX9VnzeMfYx
 C9DSVcN2EV16sMBkuCmItcq5JyRTgIuEdpII+SFOlKXJm4a2mh0OwIM9CrqG0Pk89jcp
 Ui7EzK7QT5jmKless47mLQsWNM2joczlEYXxtPh8f1FlY51oNWDqZk7dkHjVsZx2e6hk
 57dw==
X-Gm-Message-State: AOAM533EhkVqjUgY6en3eucvpz803eCvndkWEHDAY+WCSoZiqMwEqYOo
 FwAfP5YNd6YGXSw9j1AmyYmFIoS+JDoMuKJ/oJE=
X-Google-Smtp-Source: ABdhPJxmR593/MPAQk2Xqg47pVQ+UDuYPO0btjpGJ3TcpM176eIGgymlOdP99yhb7I1zGmOOzWbUpDHD3PNYosB3ng8=
X-Received: by 2002:aa7:df09:: with SMTP id c9mr31090749edy.243.1632161129883; 
 Mon, 20 Sep 2021 11:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210919211129.4364-1-linux.amoon@gmail.com>
 <7dcee097-9119-1987-9bb5-777d541cc9f7@baylibre.com>
In-Reply-To: <7dcee097-9119-1987-9bb5-777d541cc9f7@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 20 Sep 2021 23:35:18 +0530
Message-ID: <CANAwSgRtChYZWogwSVggqT1491oWx-eAf8d95dGvPkLy3=1DwQ@mail.gmail.com>
Subject: Re: [PATCH] regulator: pwm-regulator: Make use of the helper function
 dev_err_probe()
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_110533_637877_0B7B23E3 
X-CRM114-Status: GOOD (  21.86  )
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

Hi Neil,

On Mon, 20 Sept 2021 at 13:56, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 19/09/2021 23:11, Anand Moon wrote:
> > devm_regulator_register can return -EPROBE_DEFER if the
> > regulator is not ready yet. Use dev_err_probe() for
> > pwm regulator resources to indicate the deferral reason
> > when waiting for the resource to come up.
> >
> > Fixes: 0cd71b9a43ad ("regulator: pwm: Don't warn on probe deferral")
> >
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/regulator/pwm-regulator.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
> > index 7629476d94ae..451e57a739f8 100644
> > --- a/drivers/regulator/pwm-regulator.c
> > +++ b/drivers/regulator/pwm-regulator.c
> > @@ -382,9 +382,9 @@ static int pwm_regulator_probe(struct platform_device *pdev)
> >                                           &drvdata->desc, &config);
> >       if (IS_ERR(regulator)) {
> >               ret = PTR_ERR(regulator);
> > -             dev_err(&pdev->dev, "Failed to register regulator %s: %d\n",
> > -                     drvdata->desc.name, ret);
> > -             return ret;
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "Failed to register regulator %s: %d\n",
> > +                                  drvdata->desc.name, ret);
>
> No need to keep ret and print it since it will be printed by dev_err_probe, pass directly PTR_ERR(regulator) and drop the ": %d" from the error string.
>
> Neil
>

Thanks for the input but it's a wrong fix I meant to fix another probe
defer with *devm_pwm_get*
I will correct this in the next version..

Thanks
-Anand

>
> >       }
> >
> >       return 0;
> >
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
