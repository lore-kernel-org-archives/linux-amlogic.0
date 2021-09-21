Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F808C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 19:22:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E321360FDA
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 19:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E321360FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCQVjfx4OoSBqIpxjpxOGJFoCXznJCbF2WoyW414sho=; b=BsMt2OKeX9YcYL
	EZH9UBQ30OY+60J5ZNkbIkT5grZSteFJsL53s+WweIq6jBh7j1RMayfeRrfIp1qGE5kVnxDt1VWAh
	cr4gwfLbkdQr32UQcpF0NS/bfwZFgTYoyKYXFBAb1HXPtV8gq6q4K2ltM0/nq7bhzY/WaDhuR0NYf
	2p/2NVs4eylFLh+ohOU2dpCMB8kL6KKbbuLAQ9HZ9CVh7IZp4osTY+dwTUtuK7nStBAYdSctieU6z
	vVWLpMCOpbETsRpcDVD/VlCJx3bfsE1RHQ3N7RcBVNk5Jlg/uEXyYZFkQIUV8nUbg9YxZ6M+sD9uY
	v867f4RPwYHW5cHdQ54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSlL6-005b2o-Ai; Tue, 21 Sep 2021 19:22:00 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSlKq-005azq-Pa; Tue, 21 Sep 2021 19:21:46 +0000
Received: by mail-ed1-x52b.google.com with SMTP id h17so492571edj.6;
 Tue, 21 Sep 2021 12:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CoizIjqkQkAgXO3NanmUI7a4z4Mg4O/HFwzVnIRa9bA=;
 b=L4Dq7fxn+T5CnRWjI2RzQxbBMPmM/uJPBGd1OH6JHrHqcDodPJRB7rVWREZn/NMDx5
 kvQ9wgp9tp4se1p5dxYmvfMC/rLxgofi19rrgBti+gXm3P6CGdUeRVDwQD+OCEVGzV/m
 HYyv+0K/E6P6shH08Di8bhjwK2q9p8yE/Vhuj50rkmEsNmPt6hTHfd4qVz7mXfpOJpNL
 18KdaM+jBKiPMmTWUuCOPxKsO1Ceqz3xW4v+/hLMij67QCFyseY3abu3zFf3n0boGNq7
 TVhHbbZOPCJpwkem989BAeTmUUBmweed4AH6fldPEAYXrTtl2PTaTTNfrm763ZLF729U
 Q2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CoizIjqkQkAgXO3NanmUI7a4z4Mg4O/HFwzVnIRa9bA=;
 b=YZfl8XMreABZJbhybf228edBokwkOSnAA7dVY7VF/87cwkZEWALckvkGol8Xm/sFhF
 KnvPpHWMzU3NZrzASxeWk/WMG1D/YaaW03OwBwZFViMlp37Y34Ff7tdAxTi/e45vGfZz
 HbPzu372EywsJJ70PwcCQC8omaltRrsa1LKpfH76CLNK7R3T8Rn7DiVT3n2aoOmnK1RA
 sBDPj0QBEYq0+7wvFXv8p9g6dV9MGVlax3xWHVagGH3YHJKrQl7+lxXm/72dUNjEjNc5
 ZMyM6cgrqTmbuN4/SX4kV+dOxQDMxB8yQN1CLRw2qyxULzyzJ9xXTUZhGZe3TZ2twtao
 9JhQ==
X-Gm-Message-State: AOAM532jZ9CL3l45UBgfyyFTXQoWsdvKHu0TwX2QMboCz2t+9WRvxn0R
 fjq93MXG5J1Ba7rT3jfETLaCdNKAh43n43906tsLU5SgF33JOg==
X-Google-Smtp-Source: ABdhPJyjeX9akdEf/RuGH/Q17gt5cyRtdcyppYt3wLVuxPcQ1tZjaAft84WEeGuffcm8zyVLfvWSyMIRng0kLQAYcrs=
X-Received: by 2002:a17:906:85d8:: with SMTP id
 i24mr36091538ejy.451.1632252102971; 
 Tue, 21 Sep 2021 12:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210920203735.675-1-linux.amoon@gmail.com>
 <CAFBinCB682kFB47=K5-Pod5cbrnNTtKdAj3i8PHrxj8VxOH8FA@mail.gmail.com>
In-Reply-To: <CAFBinCB682kFB47=K5-Pod5cbrnNTtKdAj3i8PHrxj8VxOH8FA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 22 Sep 2021 00:51:32 +0530
Message-ID: <CANAwSgRtZoAmMO-WtRBX4W4pTkmzJKH1zc=6-99Py-d_4cOR0w@mail.gmail.com>
Subject: Re: [PATCHv2] regulator: pwm-regulator: Make use of the helper
 function dev_err_probe()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_122144_898906_15ACC6C9 
X-CRM114-Status: GOOD (  20.85  )
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

On Tue, 21 Sept 2021 at 11:04, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Mon, Sep 20, 2021 at 10:38 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > devm_pwm_get() can return -EPROBE_DEFER if the pwm regulator is not
> > ready yet. Use dev_err_probe() for pwm regulator resources
> > to indicate the deferral reason when waiting for the
> > resource to come up.
> >
> > Fixes: 0cd71b9a43ad ("regulator: pwm: Don't warn on probe deferral")
> Personally I consider this as an improvement (having the deferral
> reason show up in debugfs), not a bugfix.
> Because of that I would drop the Fixes tag.
> Let's wait on other people's opinions though.
>
Ok will drop this in the next version.

> [...]
> > -                       dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
> > -               return ret;
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(drvdata->pwm),
> > +                                    "Failed to register regulator %s\n",
> The message here should still be similar to the original one since the
> actual problem is that we could not get a reference to the PWM
> controller. At this point we are not trying to register the
> pwm-regulator yet.
>

Yep, Typo I mixed up the logs completely.
it should be  "Failed to get PWM, deferring probe"

Thanks
-Anand
>
> Best regards,
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
