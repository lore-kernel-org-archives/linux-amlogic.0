Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3CCC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Sep 2021 17:34:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1361C61076
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Sep 2021 17:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1361C61076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCAx6uT74fTOToX1/DPb2dAsIH7tIEZzSrL4H2GmOgE=; b=jp41up8vQ0cvpl
	sJg3MOosqJ93FcHiQmRaKRzax23Cs7ZzURAkIshrlH+gVkSG6LVn63+o2uJ2GB2+B7x+xnY40Ukjg
	K3yIs1ReB1jpKBNAn6SWYUZV/wsGCDnjO9DbM9zTSo8GCq4Y41D971uTokPJSpBY8gYgtezyX1moP
	E8q62YhyvstxZ2SHpkHGFau9kx3dYKdDJfEB4DIkKMRp7tm21pSijgeZXS+y2V1uqnS6CNTLpddAp
	Ehi9JRFvSRJl6L3/VYsSzg2qZ+efLn8syukL8Qa8q8uE5qO6rlg6nvs4v3hkP9E30Yc5B0E2cZMCZ
	JsuN2gNXvQb5r83syPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUBYx-00GyYK-2F; Sat, 25 Sep 2021 17:34:11 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUBYk-00GyWD-Pa; Sat, 25 Sep 2021 17:34:00 +0000
Received: by mail-ed1-x533.google.com with SMTP id bx4so49611191edb.4;
 Sat, 25 Sep 2021 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gkBWlplztzPYq7xEWUT333cO8AXxvEK462eV+xY6d3Q=;
 b=CmboLcZVzqLZ65pb77dGE9Tb+zbVPpRadSvxK+GRWbZ0/PMacdJT4C7khWZgMHDu3u
 SXZaIJ4/TuZJqyc3/nqA4JgSQVT9lmUKDqhh7WmnB2v87/FKi8hFYvL0ZAfKJOXHmcpi
 FzgRz8SGJEqBXnBylB7zICXbT67RqdjT7Zysr1wDhxzKOaEiKU1mPeFlQf8G59TWhhgB
 lDcZbS2Ty/cDYSfNEwSK6JS5V/I5lOpmpYnRCSDJSqVlu6qfPaqX5PydiG/gLV7zptvb
 ihFIpmYUpM7yzg4wIHkx+2IKiqJj25xJW5Illgh0Ad27FraOeJg3NTtMTjH3nV970yvC
 QNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gkBWlplztzPYq7xEWUT333cO8AXxvEK462eV+xY6d3Q=;
 b=R1aPJ4CrHcUxlZZCz7vwsbHD1oBEEBEdtz3MmzBtCM52ZE4CBj0QH84iWo7+6+hTPj
 NcLo59kDPcEWY0IWXs02/m7tXOf63NPT28/rmCUEZKA1PnnPfgh7Ffc7VptTjQcY0uZs
 CZ6Vh/Grxn3FwLk3RQcrxIO2BVR/vuJXKUsEytXZ0+NGW+4Orl5yo4cjYn9K3xe/Mgon
 ErsT1AVhMrS4vW6EvqFvU4YT49O4q0HuuNT42nKOieFEWiLQbnePHNeJ8aQdlJ8k4+hU
 SndrHnna4mVgX5wwCff7stnEYi1jo6ldKB9dqYoLFlSHPMeWCvA1QgDdpvXrJW2UuJlv
 fGxw==
X-Gm-Message-State: AOAM532QhyDl9AQf/6f0w14YxBz1vKXvhi+llL5lWAe9KDVNpaRRXc/B
 Z88XZlzoLP/VSe6xRL8YHUy47Ed0hKr9G+rBepc=
X-Google-Smtp-Source: ABdhPJwOhEN6jApVHtjpdjUknol4tn6WsTkxJF1T8o4ZP0cQAq1EKvHzYz9l2WQJqByLtAKc5JzZ6q/quRN7eOG9VCc=
X-Received: by 2002:a17:906:b10d:: with SMTP id
 u13mr18123747ejy.135.1632591236112; 
 Sat, 25 Sep 2021 10:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210921212732.1334-1-linux.amoon@gmail.com>
 <CAFBinCBHDTCkBBxP9u-Qh_k6ZSswJ_5XDL9oq2CSEkWG23dXfw@mail.gmail.com>
In-Reply-To: <CAFBinCBHDTCkBBxP9u-Qh_k6ZSswJ_5XDL9oq2CSEkWG23dXfw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 25 Sep 2021 23:03:43 +0530
Message-ID: <CANAwSgQaw=1VAwQaW5PnE=5LxK1M9COCPiwTVi+iN=2D_y10fA@mail.gmail.com>
Subject: Re: [PATCHv3] regulator: pwm-regulator: Make use of the helper
 function dev_err_probe()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210925_103358_869077_EF3602F7 
X-CRM114-Status: GOOD (  22.03  )
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

On Sat, 25 Sept 2021 at 22:42, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Tue, Sep 21, 2021 at 11:27 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > @@ -353,13 +353,8 @@ static int pwm_regulator_probe(struct platform_device *pdev)
> >
> >         drvdata->pwm = devm_pwm_get(&pdev->dev, NULL);
> >         if (IS_ERR(drvdata->pwm)) {
> > -               ret = PTR_ERR(drvdata->pwm);
> > -               if (ret == -EPROBE_DEFER)
> > -                       dev_dbg(&pdev->dev,
> > -                               "Failed to get PWM, deferring probe\n");
> > -               else
> > -                       dev_err(&pdev->dev, "Failed to get PWM: %d\n", ret);
> > -               return ret;
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(drvdata->pwm),
> > +                                    "Failed to get PWM\n");
> >         }
> From functional perspective you're patch is looking good now.
> I just noticed that the coding-style in the pwm-regulator driver is
> not not use any curly brackets for the if block when there's only one
> statement
>
> with the curly brackets removed (and if there are no other changes to
> this patch) then you can add my:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
Thanks, I will update the patch in the next version.
>
> Best regards,
> Martin

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
