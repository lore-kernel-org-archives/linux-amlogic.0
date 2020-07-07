Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633E0C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 11:16:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3067020708
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 11:16:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jJ7g5cbS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MbMMReVh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3067020708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BGZpa7LuXh1EfmaSiwt4g3wpLNcVFh1SA7HmYl8w1ZA=; b=jJ7g5cbS1pn4dqkpOybrEe4oS
	Nnca9O5HoYhuk+GGuPus5qhXFxfLgRIoCjIYSuCg2RWrDMVqxEi2wrO0wMGcWJvIc2+gOvmpH4IV2
	rD2R04gsI/c9u4tGMt7VsWp9aPf3sPq7fYLNwzK1ymzQOKmzq/JctjYm3TAvnra4UiUgqLp28ysYj
	3QabAYfG/q21t2um66q7zb4k9M+hVKifNbczO59vo5nnYdvF2P4/BoAmrSZz/S5GmIFrgl6Ol/ZoO
	IlFRmvmk59+BdvD9MRJJ+V34CZRlBzhTeE0KRCiJWhNgVn/bK4i9bdtIp92EdCj4WYq8T9+1yNyTZ
	jCqr36J6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jslZp-0003YQ-T1; Tue, 07 Jul 2020 11:15:53 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jslZo-0003Xl-6Y
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 11:15:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id h19so49450344ljg.13
 for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2020 04:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IME/GKmb03RMGZjHJLw9fB5q2hWSVThgD6kxOkSv7K4=;
 b=MbMMReVhvU1Ziovve/YFlmTeUU52Pj/orKnR7kX0NlykcVik8u67E66OxRylvX4Oaz
 EklcD2sTe2vWnBBM/OrMJN9XhiXGr9KnB3NO0SaKVMbMRzzmQv0mpSIU3l8usw++6Di/
 YATzyor3V8fa3yajhQQ0JvV+5UyJ2t4+EWpgJquP7iad6/KuBlQkef3UOB+wgdDGi+zi
 M7tRYg96icGx5VqDZulWFiw/mEN+gdLBERSj5VsUwT3xllZrYNq5/vXaDf2h70MBnUa3
 G61L17PrwXwrz72aXhT8lIDpbDP8M5nEucOcfgujb4xoACysDuy4vpC1krs7qL1xDlzN
 BhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IME/GKmb03RMGZjHJLw9fB5q2hWSVThgD6kxOkSv7K4=;
 b=feJvU/Ta+ApB1usby4bNrXymXWonhOU5YBFmlGudk8jzpc9EijQpRrFDbWyVj/QrCI
 dC4wNxCf63LuR5aY/ldgZWEaW+UFABoo3TL5YKdoZaP62HEcdB9cI6QY/6zKYytUoDXb
 +EeVldF5wcvST8xVYWjFLMGOshsDI622t1434pTubZS1uHykqiL+FRFAu5M7S/yMgdc7
 AWPWEg2LnN9GjsKfIpoz2tHf/ljLNWAsUJOCnhDHf3l1HYWc3aTqTVGlVQT1Bp7kSCoJ
 MQnn4MnUQzvoAS1t1Hen3tXthysDD1MiY0clg75xa5P/sn4Eo0DcF9vXgntdKZlHd9ou
 fCPQ==
X-Gm-Message-State: AOAM532hxJ+vs87Z9DyRVtNxBsbk8aIel4NnR731p3m6AVK/61kGaC2b
 g8lccca6T5vzMJbMTCA9+2fBEQyQz8a11sin7lCBKA==
X-Google-Smtp-Source: ABdhPJwbsoWVmqeN0/WQZpQJHIRzq9HpNh3Mx3xudoIWyjVcuG5GzzrQ0ViAG5GTTFplqmcdl8EFB/wvQqzTDo1sta8=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr8480046ljj.283.1594120550675; 
 Tue, 07 Jul 2020 04:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200618025916.GA19368@home-desktop>
In-Reply-To: <20200618025916.GA19368@home-desktop>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jul 2020 13:15:39 +0200
Message-ID: <CACRpkdZqkAXpH83H88=phtVcJRhqh-1865X8gJun_oOqBwzxrw@mail.gmail.com>
Subject: Re: [PATCH] [v2] pinctrl: meson: fix drive strength register and bit
 calculation
To: Hyeonki Hong <hhk7734@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_071552_370929_68C67F71 
X-CRM114-Status: GOOD (  11.63  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jun 18, 2020 at 4:59 AM Hyeonki Hong <hhk7734@gmail.com> wrote:

> If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
> or more registers. However, when register and bit were calculated, the
> first register defined in the bank was used, and the bit was calculated
> based on the first pin. This causes problems in setting the driving
> strength.
>
> The following method was used to solve this problem:
> A bit is calculated first using predefined strides. Then, If the bit is
> 32 or more, the register is changed by the quotient of the bit divided
> by 32. And the bit is set to the remainder.
>
> Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
