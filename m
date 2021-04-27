Return-Path: <SRS0=DSzN=JY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6817DC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Apr 2021 19:04:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2377613DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Apr 2021 19:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2377613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T2sS+KYyU3an3HStvLCAZZD213daZP6j78NfwiehNMk=; b=HX2BUqsOKtJ+XpgOKxVtx5UaY
	tyhl/8hb3PfxsFFmnOyuLRWnyDLjZsEv/4C6HX0cmE/QZXBa3b9hK3gJxtWxOld8CrWZuNPV5kOmr
	FniIP+WUdByNCoefPpMvneH7jOo2SbjVh7zSbE7ABRgPnFDCB9AMPL7JQLMX113DFBQ9tNuzoMbib
	gstz2Xi5+VYfQ2JGZwJ95WrtgbIr7+z8YBEqU31seo//1fCQ54puG5LzLGiMS606I+dk8yyAQRrjm
	HegZINOzQIYlgX8lqFwQSMeXTtDq1UiMsRIHmRIhkDYA2V2tXeYX7+4O0w7U0KeLm+Zgp2hMmBMeG
	r5dtsoiEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbSzv-0026UT-8E; Tue, 27 Apr 2021 19:03:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbSzs-0026UE-UD; Tue, 27 Apr 2021 19:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5AYP4KxhmIkQe7UcuYlxvC2jIUXwtQ3ProZ5mNQJqDs=; b=shD9sDeLC74kWTpWtVmJ8TcdP7
 URJFLsJAFDOBbvgl8H7NpSRP5mTR5s5djVwvh3I7fbGwl7N+f9u+MbRf9lIY1BDDlWh6Y2iiRsG+z
 KlLW3dgncHK0XPOnw6myD5wAYqT7HRgRBDB+3X9dSVCQXQ8ANXuYPV1cn/iA0YLDOGQSJxBJMxw6S
 3RMuWOsZNw8TUazPRumaH1HKUQhzgkX3w7TuIQpXUz1teQ/eYY9CMN3E8Zmn/kKxkh7VIDmx4WS9m
 oheJSt4hvfpuBmOMg9ooBqc/Yy7OmuSexzsislrlivDS/Wp6vhsjfrIKmFa+8m1M0QJOi6JWK0JlF
 RZUEsPzA==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbSzq-00Gvpm-5X; Tue, 27 Apr 2021 19:03:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y3so34982124eds.5;
 Tue, 27 Apr 2021 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5AYP4KxhmIkQe7UcuYlxvC2jIUXwtQ3ProZ5mNQJqDs=;
 b=UlIUlSs04s5Amuabx+5K7RsqwQMa5AAAdjyjwJZB+M92fQlR+T9AwRoHNo+YgJDVZ3
 n1n2r09TAgFNNphfHhghLA3jG+Skp41RZwzACfsFsM02OHyl+tFOGXAHDutHCWc/hkJV
 QYKzEjRjdiIGb9yNRLhXR2Nic7cTl/kcT/d6g+0jAxd4H5zpLes4m+a5TxtFFcLIaKh7
 zJLCSAkme/5aUqZm4rni0i86nEMV3XI/Dp5KgOHPQ/CFPbiE34miX3375k186NXtcAGa
 tveNRpYrL3xcnwIMjSQm/j+bz7EHL0aXpQpn5TK3G93tKW7H/KuATaFXb3E4Zw/+wASJ
 3CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5AYP4KxhmIkQe7UcuYlxvC2jIUXwtQ3ProZ5mNQJqDs=;
 b=m4IhG1afJN/AhpsCc3+xkjAt155JSykwBojaBmM5idy7Nb9nGdk+0H1XARWDXmPfdP
 hGXde+rs8lrjUIK/F7Go03amIOB6s90BvbanbI44YMCcENFrdhEY/V2OgjJd+YdFD+Jb
 I2lXhrnUgfNku492WOHGey+GdYN4iggZ95d8c1CCkZXXUGhHUOHnIEGPo/lIIr2CVSK7
 eDCJMgqImhC0lUtq8IEnJMZiRCgNNhXngDsyHBYGSiSMUBgDckBbbQuxIz1+EbL1pH12
 /hfkGz6IirPm6b6QDBlM6xLt5c8q78w4SGNwpOZJ0OeJsXpgFl/G+c8kIHObhKCEI67t
 jQ9A==
X-Gm-Message-State: AOAM532yrDuCtrcCB7s2E9UtYD7Kmsh5q2ZE4XQxX/fxai/fkN0DXYiO
 EpJsLA4Akr1EhyrXYOmaJrznvmhZ/smWXe0zblQ=
X-Google-Smtp-Source: ABdhPJzBTlGqWZFllivz6SGMkHdvJgZYMGWKlvYCeURJhhugmqbBHOfLHrVh5fejLfJEru2ldm+1hnu/1jRJW22vClE=
X-Received: by 2002:a50:9e4f:: with SMTP id z73mr6064469ede.338.1619550218836; 
 Tue, 27 Apr 2021 12:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
 <YFLBPGNQpT9mM3AJ@builder.lan>
 <CAFBinCA92411o5+AGApr8+nkMdmzJ4ddzVY+Cb5FLBez+-92nA@mail.gmail.com>
 <YHYGLuxIN7WMakco@builder.lan>
In-Reply-To: <YHYGLuxIN7WMakco@builder.lan>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 27 Apr 2021 21:03:28 +0200
Message-ID: <CAFBinCDCtaqZG4a5jbw64RK4mrccSJTmznTiMPpp+gJNmo2LkA@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: remoteproc: Add the documentation for
 Meson AO ARC rproc
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, ohad@wizery.com, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_120346_253184_A0497D38 
X-CRM114-Status: GOOD (  13.73  )
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

Hi Bjorn,

On Tue, Apr 13, 2021 at 10:59 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
[...]
> Describing these kinds blocks in DT is indeed tricky, I've had
> both cases where a block maps to multiple "functions" or where they
> contain misc registers to be used in relation to some other block.
>
> The prior typically lends itself to be modelled as a "simple-mfd" and
> the latter as a "syscon".
I think here the former description matches better
each set of registers has one very specific purpose (pinctrl, GPIO,
I2C, RTC, IR receiver, ...). there's only one exception inside the
whole AO region called "PMU" (which mostly contains power management
registers and a few clock control bits)

> So perhaps you could do a simple-mfd that spans the entire block and
> then describe the remoteproc, watchdog?, pinctrl pieces as children
> under that?
I can send patches for the simple-mfd conversion (syscon won't be
involved) so Rob can also give his feedback.

in my opinion this would not change the dt-bindings for the AO ARC
remote-processor.
Please let me know if there would be any dt-bindings changes so I can
also include this when updating this series.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
