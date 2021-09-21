Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E950C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 05:34:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D91446112F
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 05:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D91446112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bj4Yrtww4d1iWfy18l+UV3BZYV3uHrqec/jQGEkI2fs=; b=RG7DRdasjCGUAp
	bt4YBI8IJ7baEQnFr3QNPWKR31DD9z9dEDUiYw9cPPYqwlCjcGD6H92MmjGL/4IXsRFzkkmNA+wep
	Gwdls75rxSdI0w5QOVfP5nN7EFwiwQRfSUhXBJxiM8tWO8dplqxQ+2Op9hjf0qX/Hn/YwMWwEc1jI
	d0M4+ALjMzXQlPW6XKJQ1fHXZgJCVB1f8D7oZo9D07lvVM3CLzA9O3lDCM92qylXlEjxvDC1T/hJ/
	cWa0u87eJOqxS3oJexQzEFR8ty50seR4PLqOrklNdy3LBAqVvQwimMZizFJ59eLZTKKveoAk27iHn
	NB31eUJKEniQISXfCpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSYQJ-003e4Z-Hl; Tue, 21 Sep 2021 05:34:31 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSYQ6-003e1R-NH; Tue, 21 Sep 2021 05:34:19 +0000
Received: by mail-ed1-x531.google.com with SMTP id c22so69635355edn.12;
 Mon, 20 Sep 2021 22:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=raCTCJXxXg/ItVbRzM7CGl3oXuyIE/XxbNyI6hSTq7E=;
 b=KrZNpc22Ky0v9hnMfwLmqJTdXsD8std2aRtIrgg5SnHJEl7l2E8YA5OCEur0iZ7EYL
 /HnvUPw4q6eF87hlO/0oqmOhrh8l8bv0qWl9LXV6kTish/c+Gv3CiQRBfLZyaq3ExmQ0
 NwJA86w4VXwQ+MyixtGSeaDJOTfGf6GVMbbYZwdp9vDT4KTiR7vl+Vy4qIXHQHcdytV/
 UxL9JbPldCuFnIAfipYqKpPYQL4OCfsZjf899aclIvtIqVsKLQ3bg+4UyYrKGtNjxV8V
 +E2PX77CJf1r2xbb8wGA6Azma2z3C54st8nc2x0GHZfN6Y0KyzD+YNm3Mc8/MWJwgJPR
 rvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=raCTCJXxXg/ItVbRzM7CGl3oXuyIE/XxbNyI6hSTq7E=;
 b=iJBFxAqgYT+epxpA7lcJb0QRhyF90lQvXQGOrFtN8dQMA7nvxb5z/4dAMNortDyqmk
 MgfbvgXyH41ilw4srZJKSv9po7C1NeOIGWKHGonVBqakd9xfw2a+K1nGdFNCigxqopGY
 EWRIv/XymNAaEr8BquwNgl5Z74WaPmbzlystEYTX4wP1L4Z/tiz6sZbrcpHF6iZoZ8dr
 RA30SL3okGSdleCoMXDn5V74OytgjHe3JHBhoqvH1G2aof0302wJyLbUIhB5JFba5+Bm
 ImcWUidRrFqvPR+MXg3GJsAWXV6/JqWDTetfhuEw+0PR8eD0JaewqKNdUa1l7RxknogU
 t+xQ==
X-Gm-Message-State: AOAM530/dY1VymFNp1UO0VCrtH2yFK7z1dZ5y+LwrEWDUbcBFXr5fI60
 NZFFuHoFndHlbUBDGJisl1bLOqya77FTedMAXms=
X-Google-Smtp-Source: ABdhPJxK95W+u/Y1+Ydk4XFb2GShNgBwLsQzG9NQtWZFjqU3HFcA0JJgOlldIARODeZSSAWoXyJkXXkox8nv02jUuN4=
X-Received: by 2002:a17:906:e105:: with SMTP id
 gj5mr32019021ejb.408.1632202457171; 
 Mon, 20 Sep 2021 22:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210920203735.675-1-linux.amoon@gmail.com>
In-Reply-To: <20210920203735.675-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 Sep 2021 07:34:06 +0200
Message-ID: <CAFBinCB682kFB47=K5-Pod5cbrnNTtKdAj3i8PHrxj8VxOH8FA@mail.gmail.com>
Subject: Re: [PATCHv2] regulator: pwm-regulator: Make use of the helper
 function dev_err_probe()
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_223418_799184_0EB2A66B 
X-CRM114-Status: GOOD (  12.83  )
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

On Mon, Sep 20, 2021 at 10:38 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> devm_pwm_get() can return -EPROBE_DEFER if the pwm regulator is not
> ready yet. Use dev_err_probe() for pwm regulator resources
> to indicate the deferral reason when waiting for the
> resource to come up.
>
> Fixes: 0cd71b9a43ad ("regulator: pwm: Don't warn on probe deferral")
Personally I consider this as an improvement (having the deferral
reason show up in debugfs), not a bugfix.
Because of that I would drop the Fixes tag.
Let's wait on other people's opinions though.

[...]
> -                       dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
> -               return ret;
> +               return dev_err_probe(&pdev->dev, PTR_ERR(drvdata->pwm),
> +                                    "Failed to register regulator %s\n",
The message here should still be similar to the original one since the
actual problem is that we could not get a reference to the PWM
controller. At this point we are not trying to register the
pwm-regulator yet.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
