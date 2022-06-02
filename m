Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26740C43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jun 2022 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmvDRPkFuM1CKx7M796TNb90LzE3NUn8cPwpbHIeV4Q=; b=P/fu3PXrtOctBH
	z9jz/y3HB0+NygSreHDmOcCMrIB9dZEsGypAjasELgAUFesAfjq/xPIqqopksJMD95qwZRweNRCko
	wLGs+HwNGGgvWXadVlDad6LR46ER/RKry2NEh+4rpN7Z55dEqJ2TzhuTcEmLwzq5SrvIv59pSAFt7
	wT2wXEiMbLK7jmW46xB7RdtVuwOA3Ic4wmEixZwbC6iAZK5RKBguG+MQs6LeDjm33jFx1Afn7r6Eq
	J7TblNNo++jtkn88meXqvyuTb2kPkFWCJfErct67ncH67BEUelVdlPDH0RRoEh0SfR/RWViYiGULz
	HLG8wKMBn3CeWToX3pgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwl9W-003SZi-B0; Thu, 02 Jun 2022 13:46:18 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwl9K-003SXL-Vj; Thu, 02 Jun 2022 13:46:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id u12so10072644eja.8;
        Thu, 02 Jun 2022 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TjLXjWL9wqYYrtKcARcm1yup8NwPPFc5xmJR2d2VRXw=;
        b=T+ezoU9lVT3i7sGNy4W449w7TEAZt24NYm16K1PLU5pcAYWEW43c36fO4PrbEqDlkl
         iK42SBU/2IoTfkudAPfvHOpKGAJJgxfd8TvfyDNNKOvc5HO6ekcqLOQ/bPjO2YCkD8tr
         oTZZtSN8nbdbp/CYpXCrfigymVN+WVrOiVgTyEzpIfxgYpgTo8qt42zDSI0mdfaAVFLQ
         N7aK0dSl7ahVe/vBbovmDUmWtdbtwC4fBVKRMVdomVzXjHgyg160KCgmBs3mYAt8S/MH
         JZEhHEOXulHgSgwfq7WPhbgWhPf41o0NRUjmCo/yfZPmtw5VZIIDur12wbOMHEwRB+GN
         J2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TjLXjWL9wqYYrtKcARcm1yup8NwPPFc5xmJR2d2VRXw=;
        b=E5VKr6pimxqp1EixdQ2Q5dKieIDw1bjsHrNS+2RlgO3V/LYMBxMS2tU6IblG/cjFey
         xBgn97YeTZJJK5ao4qUUKawp7wp8E6Kg/YIFBqoIxIyP/7ix7tx/oBJhaj08V6TTxgw8
         +lohWNIwX8Qn5gKSMx6ABv2jK/1k5ozdX0Yft4e+ls/HbN24+I8Rx8sZKXoGWVl5fV/S
         lHopIjiVInAdy2XocJrTusX5kVZUqYpQERiaqjQEkl+IxQIrFloJJ+l445P4lQQDFgZ8
         /xqhxMH/5i0De9eqbWdWskVX5+Bpk/Hzu7iGQCm69sOrooc36Aos/nOOIrPwZSMx8kVj
         +kKg==
X-Gm-Message-State: AOAM5302OslLroxzKfpEubDkA5i376q1piSRCaSsGQDUZgRUCXNhGNnK
	Ioz4n9gOknXEWD1qQWhGYrpO+PAwW2iVkfP+QMchpw1NioeYpQ==
X-Google-Smtp-Source: ABdhPJwHAbggTcvlbjWNHP4pPg0l413e0ilaz6KDRuL60a/o7cOFJG5BNCUysdDQJLe4TShUAov5x2g/NSwOsZ0m0wg=
X-Received: by 2002:a17:906:d550:b0:704:7ba6:9854 with SMTP id
 cr16-20020a170906d55000b007047ba69854mr4273032ejc.579.1654177563309; Thu, 02
 Jun 2022 06:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220602114241.12601-1-andriy.shevchenko@linux.intel.com>
 <20220602114241.12601-3-andriy.shevchenko@linux.intel.com> <ad3af033-97f1-3aad-d082-c6ed56185b59@metafoo.de>
In-Reply-To: <ad3af033-97f1-3aad-d082-c6ed56185b59@metafoo.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Jun 2022 15:45:27 +0200
Message-ID: <CAHp75VcSFr+E7_woyw6jx7e9wCeFUUouV_7xJXYO26_y6=fwTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] iio: adc: meson_saradc: Use temporary variable for
 struct device
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-iio <linux-iio@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_064607_079149_B281F658 
X-CRM114-Status: GOOD (  15.04  )
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

On Thu, Jun 2, 2022 at 2:08 PM Lars-Peter Clausen <lars@metafoo.de> wrote:
> On 6/2/22 13:42, Andy Shevchenko wrote:

...

> > -     priv->adc_clk = devm_clk_register(&indio_dev->dev, &priv->clk_gate.hw);
> > +     priv->adc_clk = devm_clk_register(idev, &priv->clk_gate.hw);
>
> You are not changing anything here.

The scope of patch is supposed not to change the current behaviour :-)

> But we shouldn't be devm'ing on the
> IIO device. It will get freed eventually, but only when the last
> reference to the iio device has been dropped, which might be long after
> the platform device has been removed. devm'ing should happen on the
> platform_device's device. Might be worth fixing.

Thanks for confirming my suspicions (as I mentioned to Martin, using
an IIO device there feels wrong).
I will add another patch to v3.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
