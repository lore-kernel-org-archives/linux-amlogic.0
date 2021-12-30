Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CB9C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 22:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ifo5GVzOOsuSR8BK9KyIeFsszINOY2hRHIIGAWtLmkY=; b=0ZfdyOaEE/McRw
	Bcb5EH0zuHz9r+508/q8bRXGfCUJeaqosM0lm0XF/WOWS19baSk7/tAdd1VbU0aDpDhPtEzdTMPGi
	JgK2EAx+sr9SI7ga1Jo+Qgv3oXx/KTnzQLRnFl+TNBomAR0TeOg0o/UPaAAPs1jTwvItRjgkGmd6o
	33rNbiShujqlSh1pnQmm+Aa6mXPMmbDtR48E4dfhqQnIVOlZgnUPz5wQro3dgnzPKDdw54NC7I3E8
	xpVRHQzmZeMapVSbIt1ZL7ye1U5CpkDvfYrFlwB8KkwU0vl0nKONWL2dYyMHeDWy5EfytHZSaYdnw
	euRXuf7hbVWbnKAVy3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n33el-005JhK-10; Thu, 30 Dec 2021 22:12:19 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n33eZ-005JfR-Iw; Thu, 30 Dec 2021 22:12:08 +0000
Received: by mail-ed1-x52c.google.com with SMTP id j6so102632637edw.12;
 Thu, 30 Dec 2021 14:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DedCEFaVWFUdlSNZRbDf8/T4GxDnWWvGzCzcWytJzvg=;
 b=RET8CBTqlKAHofEygl9IOPC9RL/Gmr5AaJTUdKip/xVrKvRHHNheNMccskFvCYn0Rl
 X5CmiM59nXb2gLAtmSaAUd9RyDWP1jtGgl8WTO8k148IR4iK1mGfiCVEAfY4lhbMt4ju
 3BNqjjK1Rht7+LC258pvQOfisfoBuNplLRY9Hm3fjcw9iPkEPSkPiMgw/6ydiEXiLeqW
 pOnpc8EAbrM0BGhJJ8BGJZmDJcHzQ5bRSOFXWoMRLv0q+KV/b9YJul06pAO1S47H36co
 35UzUChEbLbsQveDAbG0miCE7wSMHyKfhMiW60JOPqTGtb9Gnq9eZyr619EFgyJ5gpEW
 5V6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DedCEFaVWFUdlSNZRbDf8/T4GxDnWWvGzCzcWytJzvg=;
 b=7DTwVRtnFvV4neHUiTxY8nTRBaLjbBVcmzuUYxEOdG2Pp6+we/bmUW8aPWLsi8igib
 U1OHgQSdPhIkkHMY8bW+5E9pbp2cyZkR6m4SL/BFdcA9qumiqODUFQRbWvd5kkKiNvBu
 pqnNOhH/kd9949TG2t+hCqyRTk8ty8jPrg9CP4i16PipXzKvAD9XT3B9NoLllIXL0gEp
 L2+fKLHVc+ndWtc5W+U4RVtZxXWIZ3n2qMtO2SWgq7k5vuvPqaTPWX8QlpXbkraBZHZW
 OyT7KYdMKBJ6G9m7kwROQWl4cCnRbdjlluVPyu54ZBDPXqSioiKMV3k22++xTpLNwaCR
 srjw==
X-Gm-Message-State: AOAM533vo1NSS6eSp4+jCiGJYxRqHoln6Hrqlzw8i3PPn0VIPvqEDEwp
 pTeGd2/S4+H5IcHFTYwiOupAIx6eJfey76X4qkR5rAKDCHs=
X-Google-Smtp-Source: ABdhPJxmS4AM5VcnKC+tCI/zBL/iNXBh2z9WZT/iIt3c/chXpv/vtJMgKr0t42v0sysM09OBUEVzXShHJ7S1RC/Y/yo=
X-Received: by 2002:a05:6402:518a:: with SMTP id
 q10mr29695785edd.29.1640902326352; 
 Thu, 30 Dec 2021 14:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20211230094434.3053195-1-shunzhou.jiang@amlogic.com>
 <20211230094434.3053195-2-shunzhou.jiang@amlogic.com>
In-Reply-To: <20211230094434.3053195-2-shunzhou.jiang@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 30 Dec 2021 23:11:55 +0100
Message-ID: <CAFBinCBN-QoA-e9JzfUq-Wc4Chu=x6cVoP2SYf=q-GrnLdLGKg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: power: add Amlogic s4 power domains
 bindings
To: "Shunzhou.Jiang" <shunzhou.jiang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 jbrunet@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_141207_653687_D8705C09 
X-CRM114-Status: UNSURE (   8.21  )
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

On Thu, Dec 30, 2021 at 10:44 AM Shunzhou.Jiang
<shunzhou.jiang@amlogic.com> wrote:
>
> From: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
>
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
>
> The bindings targets the Amlogic s4, in which the power domains registers
> are in secure world.
>
> Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
