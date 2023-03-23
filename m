Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CC2C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccDa0VLZshZKwGI4JnzXivJyaxG+5rKZJFZwitVrIdE=; b=idjNCUCmjyn40m
	eMhHEabvFarSh+WWc3NS1bS7b9JsC2GjvqogZZ3R9Vsd7M0moaCXRp5ribSTPibN/OcZod2Dru1DD
	SOKxRC1HGO6r8xtrTNuE/6ak58OSJWgf4v/sy4gSKWnVzy732BG3vntzfpm54IuU0sNvq+a69a03+
	oUYd4IaPl0wVGse+5iNoyYfHHgdanUPFSPmd6yw53e/r2V/3uY3E47JNuDV8ebzKK6ds7UiEqDWLf
	qs3/7o1TyYj0wcPXWLPCt3YKpOG6P8nhnf5zz4LAFBnwnQaHNEQqOp7O0g4JSo2KY80If0esCnHaB
	eVklEdJIjYFjZMqy5+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJpj-001rnV-2M;
	Thu, 23 Mar 2023 12:14:19 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJpY-001riR-0M
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 12:14:09 +0000
Received: by mail-yb1-xb33.google.com with SMTP id x198so14797839ybe.9
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 05:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679573647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5NKR7SYBvWpREo0MMAoKbqMCXotiJ17PbmiLaS6x+lw=;
        b=Va/q1CMCaXzBFX0bn3P83b2ChgiFn2WVQ8bCk81bQSlKPcXiZ+1+brIcbwXBOv32eF
         56uZxcPBHwE3iD5zEQ5WQaqcgfCkrH4C6clcAtn68/Et7Hl5OVCWO4pWC55Cws7vKqmm
         zMhijmNoI83GtgdKQ5uVbG6vzCOznsv54jCMh48jVjC9nMRhvLmUmjJjyBeqFcsuZCmv
         USeEFaBxUphyd2nxNtTePqsgzxHvN0Zg0QvyHvsJY2jFbRVlD0TT7fXSQ1FhmIZC1ytv
         lkKd/60i5srHA1ZpwOil02W3b7dWXfyD78nH7JyCzvL4fZjPP3YQ40/YkU44ZhYQjqWi
         tpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NKR7SYBvWpREo0MMAoKbqMCXotiJ17PbmiLaS6x+lw=;
        b=0QQ4Uut017LKcTdMt+9UFs8BYIftDhH10XVCS6Mp4h/wPo0P9k4FXsaDpeWlqDXSBy
         xho97RJDS/suC/lsLGhaZs+W8ar7Xc3+p5ayrh12nBTV1Eqp81R26pninp6oZT2cTc67
         sq9XXbAbtpZXa45dtS9MujSptekw2dMrkfcbZvlllu0yfFQcY6pVIod6IhQiBb+THBTN
         P1MkMrd3VpQBD8mnd0lT7/UdqqPPfkhe8TZdcnNaWc4GXxqcLwS4AeEW+BkzW77neqHD
         oYCwadECpO17SvJOo+t6ZWV3XcikI/aaMbQMgl8u/HuzU7HyXMBFisLAJlE5Vl+HQCo0
         L1fw==
X-Gm-Message-State: AAQBX9fYhTiMYwk33PpXdoDdijCpRYyyZwp3XphAw0tIyA6AkU8EpSB2
	2xKrZ9v26oOpawkwcvuMNglJeCVEhFD8tcM/4W9Ryg==
X-Google-Smtp-Source: AKy350Y3csOipYNvmlN0E9VYnS6UZ7MTsB9nbcmQZBbf1aNX4uvsptpDrA3C8IAlkZjE+aatt3Qfv5VqOykNt6LHGeo=
X-Received: by 2002:a05:6902:1895:b0:b69:bf76:2243 with SMTP id
 cj21-20020a056902189500b00b69bf762243mr2100817ybb.3.1679573647378; Thu, 23
 Mar 2023 05:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <d2444591-c91b-a94d-71e2-9dedc3b6c514@free.fr>
In-Reply-To: <d2444591-c91b-a94d-71e2-9dedc3b6c514@free.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Mar 2023 13:13:31 +0100
Message-ID: <CAPDyKFo7z9c9A0ccqBja98WCvp+zJHU2Ni9AZ=UK=fy-nsuKXA@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: log empty non-removable slots
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Pierre-Hugues Husson <phh@phh.me>, MMC <linux-mmc@vger.kernel.org>, 
	AML <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_051408_149755_C69D4FB7 
X-CRM114-Status: GOOD (  14.79  )
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

On Tue, 21 Mar 2023 at 19:01, Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> An empty non-removable slot might be the symptom of probing too early.
>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

I took the liberty of adjusting the code and the commit message a bit.
Please let me know if it doesn't look good to you.

So, applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 426c7f66b3492..b8137baecee7c 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2257,6 +2257,10 @@ void mmc_rescan(struct work_struct *work)
>                         break;
>         }
>
> +       if (!mmc_card_is_removable(host) && !host->card)
> +               pr_info("%s: no card detected, check post-power-on-delay-ms",
> +                       mmc_hostname(host));
> +
>         /*
>          * Ignore the command timeout errors observed during
>          * the card init as those are excepted.
> --
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
