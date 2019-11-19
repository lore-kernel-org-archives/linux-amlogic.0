Return-Path: <SRS0=oAzn=ZL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CE4C432C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Nov 2019 14:55:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C897222DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Nov 2019 14:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KX0hsYX7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ct5f1NDg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C897222DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMKT300JVYRpwQA2iICHLy5MIpmLxKcGmfSxhd2yprM=; b=KX0hsYX7sNE/pE
	kq2NO8gELl28sOU8WNLnKkS6rj1wn0tk+LvYVm/6YoQkCICYOQDjFhgBuNQHg5A31abYkosGgSh4N
	s0IgPfepfFXDTfrvYODdOTQTP9/Nn6fAxFL7MPhZO1ild/qEXgkJUxGv9eLWSXt18hq9KMQNvPZD6
	gDmlrfcoYLV8Y1pcAm22bZ0RrwOhXdUBC/7apHlkJ3xv0HattD5Xuu4VK5SFANYMmZ++LoeghWKbs
	4PTE6ujkYe/QM/oyMCFu2ZmzMAncdxW30lSgjfQSWbiFqMxkMJwxOXVjYp7T9zvC+U/gPyQgtTOEW
	5eJqSfomdmNwm39xBVkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iX4uH-00054d-PM; Tue, 19 Nov 2019 14:55:05 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iX4uE-0004ZQ-PK
 for linux-amlogic@lists.infradead.org; Tue, 19 Nov 2019 14:55:04 +0000
Received: by mail-lj1-x242.google.com with SMTP id e9so23646337ljp.13
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Nov 2019 06:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=30HsnFXKOn2D4Ac/Y1QirFdNbvGbwWtgx1aMNEHaCAk=;
 b=ct5f1NDggcLQsLtQ+UoakvEeM5R/sTJTQWFTHA2W1uKiXI8ZuWOcM3k9iF30mF4YzS
 J+VaokKIS/qBkUhKymjArTRRYPXnEU4KBtGZVs/SJNkT3w3Fs7Vad3XifsM7NrtZ6F6U
 GFNmZtnpojBJKnSJqK/v1aOBZf7iFqqzbfMSY9dEWSih8hbfDxpxlSY4dIti3HIw8aXl
 xx1LDkOpg+Em8PWpklrLzBayVmyzg9RWJTT0NlKwrEY7jV7/vFL+qVJBbVexwavMiQI2
 WoCdj91tsUURfX11LPJdWm5Y/o1SzPHM0By0CswZpkQfBxXLasD7Rv5MCESnnIQj+ZQZ
 AZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=30HsnFXKOn2D4Ac/Y1QirFdNbvGbwWtgx1aMNEHaCAk=;
 b=gwdyIKop8Vs7iEN+I60dgTVqfGamquQuCw3/q/TSICobUJGlbH+2mIsZ6bUC1mDs4r
 55RIj3qZsRQA1/HmYG7tD0QMs3UsDivf1SStwTfnA6cy9MJ95gOSrpHSXpuSaVBWD6mn
 Bn7WIQY0tdq8P6wjnrBmz/HlRy+xNyI+wJxbuwOySgWoorDyl2kSb7ZecfvboVESGGEs
 6AIp355zxpWQrjRpPE5DcGlbBNKYqABvT97w7uUW4KINK71Mqgv0cmH12GgCKWeHZaNy
 Hl8qV+lljQW4dpCNlVYro7u3FKaFupPveI6875T9yJJtIPOY/FcGeFa4idsSsRvebEq/
 VI6A==
X-Gm-Message-State: APjAAAUHKpcTpu/4jeEMmV7dmyXM16rpIzeEpSJPokHrZ/iRh0d8wUol
 4H316nAIk7a+Jc0LZWkhr9Vd6DBTbgs91ZQKUUK4jg==
X-Google-Smtp-Source: APXvYqw8q1ClY4DpKAB2UVHvvEiU+KZqkbNXEwB22Kyo/eJ4d51VbtZfIpv7a/9bbEnHVShukCfvJg59ec4RpUNX/qA=
X-Received: by 2002:a2e:90b:: with SMTP id 11mr4146912ljj.233.1574175300137;
 Tue, 19 Nov 2019 06:55:00 -0800 (PST)
MIME-Version: 1.0
References: <1573819429-6937-1-git-send-email-qianggui.song@amlogic.com>
 <1573819429-6937-2-git-send-email-qianggui.song@amlogic.com>
In-Reply-To: <1573819429-6937-2-git-send-email-qianggui.song@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Nov 2019 15:54:48 +0100
Message-ID: <CACRpkdbXcT9BSgBurHHhO7tOM67oHsX6s72qEAV7=MrPy-0uZQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] pinctrl: meson: add a new callback for SoCs fixup
To: Qianggui Song <qianggui.song@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_065502_867572_37977E69 
X-CRM114-Status: UNSURE (   7.18  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Carlo Caione <carlo@caione.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Nov 15, 2019 at 1:03 PM Qianggui Song <qianggui.song@amlogic.com> wrote:

> In meson_pinctrl_parse_dt, it contains two parts: reg parsing and
> SoC relative fixup for AO. Several fixups in the same code make it hard
> to maintain, so move all fixups to each SoC's callback and make
> meson_pinctrl_parse_dt just do the reg parsing, separate these two
> parts.Overview of all current Meson SoCs fixup is as below:

Patch applied with Neil's Review tag.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
