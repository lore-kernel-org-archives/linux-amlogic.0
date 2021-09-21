Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363ADC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 19:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01AFF61050
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 19:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01AFF61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaEMNcr60tOoLQ8GhbDjRXPmyXB1ny96G1zJcpoZSz0=; b=mLTtCYK7eq27IC
	zY8E/CZ+9qinTFRTbbH0KsagqiO9TjHmHqTT89ERirMBcvazVqC8o4y96EJ8k4nnZ4AZBvFCotf/O
	uTYHco5Ljl6sHSsb2onxpUb4NL2TL1qKfb2LQGf/zZ7MTdNwkswSlWJPVeJbtZ0SVvZ6A6do3OOSD
	HXhb4aJsyQxAmUUpDFJVhhhUXba4nt1vhuWBQ7p1t2lk+MJR0GjkSTqFcn7lANKsdXWPeZNUcRJ5d
	plE6g4Rnoy2imPwXornAbo3cFo8vtWydw3MwBZDj8y3eGqebce3Due21XE/wg7Vf0B4PHFDjMzlpe
	IzkEw/xEJxAS+p2bMsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSlRr-005cjj-Q6; Tue, 21 Sep 2021 19:28:59 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSlRD-005cW4-J6; Tue, 21 Sep 2021 19:28:20 +0000
Received: by mail-ed1-x530.google.com with SMTP id v5so645153edc.2;
 Tue, 21 Sep 2021 12:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0gRmMl3ATKMwqytANP/bGvh926ut0U/W4MmekIp4BdU=;
 b=a11YL0Ng5emaJ3g6CV3iyFHFoD9QHsGNitdmgIaEuUGCpK6F36173WgPa6n1cP/pdA
 H47OX35q9mlJQPqNPxk7l2ZADJpYCwfJaLdMFqPUWfsSIj4fo0yi8dY7SebN6jnpUogP
 gPJSkuugJej9CV/vUe3x2HAibgjkzDOVPdbcoPVfwGeBePWdaioKr8oZA0nhzqAzPm79
 IPn3tN9Z0mgcWwkqaGGm6PGqfxGu8LU3548fgymWKO+b2IXwj6LaAGuAGeEzSK9e+XFH
 9W6AJTheq9Z1h/Z1a9MXYrGzKgB6hSkEC6phKJyBEp+g7pCDu9fdRDqYzFJUsD8buCM4
 kBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0gRmMl3ATKMwqytANP/bGvh926ut0U/W4MmekIp4BdU=;
 b=5A1jxq+k9f73X+kzBB46UqydSYRfi12jv0EkKWDHGTEv3idVba8vKiRlASOtgpyT7I
 VMU9beAZA//IzmBJhqUeCfTjMUWZ+KOOTGI14a9MZS+KBywZsiPeNCjtvlQaERFBc4OD
 bupL+9yyad9iHjIrirJ0rq68cBqXN963WqbZ1iQ0sJoL9EXtJPCp2UbO64Tml8DUgr9U
 FaBP4AJEgzg7wQ4pc/qtSijHNFWE/xlugf5hN5my3VQo0zigD5ppXnEUrRSl7D0LhncU
 HtmD29I4xw7MF2CvR9uELmiF4Qzn0I9aaLUl3Vn3n6iNTp1tAitMv1mA3Bs/IOrUb75y
 YMTQ==
X-Gm-Message-State: AOAM531qv+TRzdBRx93AVSE918auKSR+ou2rur3/TrUs+RnypfEtvtsU
 nTTLCkZPHLpNhl76OO9IRWgB7bDmMJGVZzgvT10=
X-Google-Smtp-Source: ABdhPJwH5FKh4ezoVaP46HatD6aNGuB1kNtTvLNwYTxxWCb//BZ3ATo7gO+0oKXqSq0bXcWKgU/Z7ccqa/6+JyTbH7g=
X-Received: by 2002:a17:906:e105:: with SMTP id
 gj5mr35812674ejb.408.1632252497689; 
 Tue, 21 Sep 2021 12:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210920203735.675-1-linux.amoon@gmail.com>
 <CAFBinCB682kFB47=K5-Pod5cbrnNTtKdAj3i8PHrxj8VxOH8FA@mail.gmail.com>
 <CANAwSgRtZoAmMO-WtRBX4W4pTkmzJKH1zc=6-99Py-d_4cOR0w@mail.gmail.com>
In-Reply-To: <CANAwSgRtZoAmMO-WtRBX4W4pTkmzJKH1zc=6-99Py-d_4cOR0w@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 Sep 2021 21:28:06 +0200
Message-ID: <CAFBinCBXv7YVHy7SECrmTwTM+9zwU3KSF6U613fjoi+JQRdOnA@mail.gmail.com>
Subject: Re: [PATCHv2] regulator: pwm-regulator: Make use of the helper
 function dev_err_probe()
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_122819_689448_99B6806F 
X-CRM114-Status: GOOD (  16.96  )
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

On Tue, Sep 21, 2021 at 9:21 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > -                       dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
> > > -               return ret;
> > > +               return dev_err_probe(&pdev->dev, PTR_ERR(drvdata->pwm),
> > > +                                    "Failed to register regulator %s\n",
> > The message here should still be similar to the original one since the
> > actual problem is that we could not get a reference to the PWM
> > controller. At this point we are not trying to register the
> > pwm-regulator yet.
> >
>
> Yep, Typo I mixed up the logs completely.
> it should be  "Failed to get PWM, deferring probe"
I think it should only be "Failed to get PWM" only - without "deferring probe".
If the PWM is missing in .dts (which is not valid but might happen for
someone who's creating a new .dts) then the "deferring probe" part is
not correct as the error code is not -EPROBE_DEFER (it may be -ENOENT
instead - or similar).


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
