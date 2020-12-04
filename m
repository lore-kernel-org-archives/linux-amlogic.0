Return-Path: <SRS0=hFP1=FI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8030C4361A
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Dec 2020 09:14:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA5D2255F
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Dec 2020 09:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CA5D2255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rq6PwSsn2mCGuYmbY9TUK1Zm0wjb+tsua+8CwUBcOCU=; b=aDhHwMTVWADoXaZH7xAjKqDWR
	WaU4Lbdcy6XdL7h8GFlVnLBFNu12sxF3oDdGey732KB2XrnyZnuNu2sUw1IIkNoVbcVGuafj20TjN
	JiRjCu4HFX8YNS9keBuvTqGlmEJ0LK6TW0fBSOfEHqfPJKtr5Y5x0lMMBLwg7Q6otv0Sk7RoySssf
	J8uHQ/myOLzvYwyymfaSWFcr+4r09pNiHPgNqUOmShZNg3sMRzKrnMcKLM3UKxBylnOYmjQFKp/M9
	jF5cLUZOvGdMjOLsogDDEeXcuDNXiI/SZOSlI/yW1gPQxXigb7Wq5MYbXXeL2olxKXxY+rtfMkiG5
	3l+R9CKlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7A4-0003zU-1n; Fri, 04 Dec 2020 09:13:56 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7A1-0003yD-Cc
 for linux-amlogic@lists.infradead.org; Fri, 04 Dec 2020 09:13:54 +0000
Received: by mail-lj1-x232.google.com with SMTP id y16so5799478ljk.1
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Dec 2020 01:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7XN3FvCjmFNo5Sr6ESr4GizIse9YN91u6D5JhDvwqTc=;
 b=GBst2pETPJ1j+SpZum1btOVpGJOd6ns7aePudho7xjkOALoKW9+qWfjMJvKK3OxElK
 p8z0BgvKP8/IT40pDMT0s6H6VKbA70f15oN3L+ocyFtEnnqChD6WNaQ2qQNChI0/UWdt
 YklAsG4+m4LHxLTt4kjbDG9h5veAtuCvXhBgPx/r7Rj7yv0H4RUG0sMkn7kc1mO8HURq
 p9N7JUnTyyRq7oNTzmD8tL77QrEuQl7QFxdbeb3+HtOiJqlxdxgNCBYex7IF9Vd+1PBZ
 n6eFRCPU1n1s6yvRDYX7oTmK537tQiBJsGS5AYpfLeuKLpdT9ODGZdZ3VaWJ+9uqGYv9
 FKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7XN3FvCjmFNo5Sr6ESr4GizIse9YN91u6D5JhDvwqTc=;
 b=sNTd/X3P1+P/bp51jH7z3h0f5MumMfFlFdIk7MsIwiIWQJcvryJiGZWyg3JOOonNoV
 MwkZPt97XtjUGuOnT//GtXDnMQu679up7tmSg9Kmno8A3Xlp2iObyEc/Izyco95slczi
 dFZXJdhbj5+sb9RZoRDRhTKARZzRD4YPYqD4l4eKKF8PIq76a9RkHC9OHW0ySWD1wa+H
 fubzYDCLzGEN2oj+VR728Y1LDweqsu+YdJjDCGs5EmvmzMQt4Kt6SzWGwO2BpLFjLzGV
 ey/zu+qwTJ+VYFojEeFSlAjgd0KqFCKP9c9Ch1IqP5YS5fFFRKKerQypDHynfWL222MR
 R07Q==
X-Gm-Message-State: AOAM533BJWRzH/0FYMgvSA2hyn4uvA8s7DHbmftVMkMw1V6RFBSGhcau
 B1WbXb2nP5RLZdfz2OEuJSRIVO3413xXuqO1nKEQsA==
X-Google-Smtp-Source: ABdhPJw5qYm+l+Rp/69vH4PvUB0w/FnfN/CwLKYy56wGElmGSDNFyMyPm7Ra81YrEho49ZapdSAiLLv+b56JVz4/h3c=
X-Received: by 2002:a2e:97c8:: with SMTP id m8mr2792964ljj.338.1607073231283; 
 Fri, 04 Dec 2020 01:13:51 -0800 (PST)
MIME-Version: 1.0
References: <tencent_220963AF059847E1171B4AB9@qq.com>
In-Reply-To: <tencent_220963AF059847E1171B4AB9@qq.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Dec 2020 10:13:40 +0100
Message-ID: <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
Subject: Re: 0001-add-amlogic-gpio-to-irq
To: =?UTF-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_041353_451072_AC1C3198 
X-CRM114-Status: UNSURE (   5.74  )
X-CRM114-Notice: Please train this message.
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
Cc: narmstrong <narmstrong@baylibre.com>,
 "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
 khilman <khilman@baylibre.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 jbrunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Lisheng,

this patch got a bit mangled but I get where you're going.

I think Meson needs to be augmented to use hierarchical gpiolib irqchip
because this seems to be what the system is doing.

So start with drivers/pinctrl/meson/Kconfig and add:

select GPIOLIB_IRQCHIP
select IRQ_DOMAIN_HIEARARCHY

Then use the generic hierarchical gpiolib irqchip as described
in Documentation/driver-api/gpio/driver.rst
Type
git grep child_to_parent_hwirq
for several examples of how to do this.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
