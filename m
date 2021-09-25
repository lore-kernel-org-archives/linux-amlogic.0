Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F40EC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Sep 2021 17:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25FC461077
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Sep 2021 17:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25FC461077
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEoA4gN56Bmqf8rcFprqBQSQtkx1HG/ZWnX0v+xAopM=; b=CmM/f0HnuD3H9j
	FgfELRQiHEaEmHTRp2N/ga+wky61kiJ66Ts1IVbzOYPug6GIIWjQmvLGwcLm74XdXtBo0oSyym+qQ
	S6CxqLX6lMc0PdpcZieQRexQzAFB/TcZKDp+r5D2fTE0IVAynzvg44+nOcWqelC4JRy7RcwiVQe/7
	oM6sCpzQUm+lJC49nFafFnZIMQtcp34Vl/dfiJ3D6KOnvdTixCiNRVoAPfd/6njs9JJqkicRB8i3/
	f3adaSUzk6ubq3ZU0HgBW8+MIomof+vBu53a19TmwMXLN4KXmvWwAEstF7VCeBHs2NBPZa3bVRpUj
	lgp3ZjpqHwK0k/WwE4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUBEK-00GwoO-G8; Sat, 25 Sep 2021 17:12:52 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUBE8-00GwnD-Sy; Sat, 25 Sep 2021 17:12:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id s17so30629706edd.8;
 Sat, 25 Sep 2021 10:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n2Pi8COsNP5j3xicpNqyAkP38kTOsAGtljrPGwc062o=;
 b=o+oJT3fF0AEB9OKGo6g5os3TYNi0Fc3o+4CpZLhGnF33Z1DtYwYxPn7bYahdgfs8ib
 I8VtKUoHrpgBM8iqFwarOeVE753VJV+bUM9/nb8TFUszJRi5Qs3jGkMuT/H1Cu0DBxOX
 FnzSgzZ53Ui5W0w0fZJZJeG89LTc8AtjYcdfP8jL0DURBGflkrnX5IKp7y69mxaVD9CE
 mMOcI2wX/L/5XRKMrofhs1rmy0bF2NqHpNxr+f3yl50/Z4qoB92VrTHWguHAxFtwagfS
 aULgt2tAx74cLTTHLYknm6B6QcRZgu5tT1dC7HhUBJeEiNlGlk8EVqcVR96Y203iYpA4
 /WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n2Pi8COsNP5j3xicpNqyAkP38kTOsAGtljrPGwc062o=;
 b=bZBn9qkw+lJRVJo4IJs6yVx4S0Ir4TS5wx2yK+HID6H4mbfbhtUaAujG6l6YpEEQEJ
 52nPgGi30gNYGuUFYAku2NruYiMEhoWHG/49JsJUeGFbnLrQndFjGrJXZyo7gZO5X6yc
 7TDp9UkDjB9edrx+WIgAU30MUXqkq6DvySC9fGF294c+hTCk6OlqsiCNAe6ewBEJlA1r
 uZHySZEY7KNJ5EcrsKxt3dPob4spjwldQ3Lhu0A5rjzvLV1BJmLngrORdVC3EeNBkufh
 1jsUsjaG8c9mBT6qOWlwTjUq1qTsZdOVBYPqqIf/h4E7yjQw07/YoXUzqMVBju2mt5dj
 AUhw==
X-Gm-Message-State: AOAM5326wjk6RUe7eFx2ropwQpS6L6FFfxGBf5OGB0YcsLoA7duncLVV
 /ZnB85KgIltXbZJo55BqAXXrsZvP7c6YJKu/pH0=
X-Google-Smtp-Source: ABdhPJzlcsciwb7JqAbDVej57aLkRZB7MjukkQMT/AwahCR/3dvzEfdcqENQONyFJ/Q4Ezv0c5xpwc8+ChZMFPVOMwI=
X-Received: by 2002:a50:c31c:: with SMTP id a28mr12922973edb.384.1632589959392; 
 Sat, 25 Sep 2021 10:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210921212732.1334-1-linux.amoon@gmail.com>
In-Reply-To: <20210921212732.1334-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 25 Sep 2021 19:12:28 +0200
Message-ID: <CAFBinCBHDTCkBBxP9u-Qh_k6ZSswJ_5XDL9oq2CSEkWG23dXfw@mail.gmail.com>
Subject: Re: [PATCHv3] regulator: pwm-regulator: Make use of the helper
 function dev_err_probe()
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210925_101240_983856_A9F7D846 
X-CRM114-Status: GOOD (  14.28  )
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

On Tue, Sep 21, 2021 at 11:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> @@ -353,13 +353,8 @@ static int pwm_regulator_probe(struct platform_device *pdev)
>
>         drvdata->pwm = devm_pwm_get(&pdev->dev, NULL);
>         if (IS_ERR(drvdata->pwm)) {
> -               ret = PTR_ERR(drvdata->pwm);
> -               if (ret == -EPROBE_DEFER)
> -                       dev_dbg(&pdev->dev,
> -                               "Failed to get PWM, deferring probe\n");
> -               else
> -                       dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
> -               return ret;
> +               return dev_err_probe(&pdev->dev, PTR_ERR(drvdata->pwm),
> +                                    "Failed to get PWM\n");
>         }
From functional perspective you're patch is looking good now.
I just noticed that the coding-style in the pwm-regulator driver is
not not use any curly brackets for the if block when there's only one
statement

with the curly brackets removed (and if there are no other changes to
this patch) then you can add my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
