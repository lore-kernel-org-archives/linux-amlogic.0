Return-Path: <SRS0=NIB4=PJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8490C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Oct 2021 12:20:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237E961221
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Oct 2021 12:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 237E961221
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkNjQHBXR7sKEoJCPScEsTbCYhbqbeGSMXsDlnFIbqo=; b=r48lAL265DNdgf
	7TkkVnKnoHeoN/DT6SEZgGnxd4MxvSLs0pVJlsTFTjpxJSyhhOPLuw/p8pAPgwj7nCSxWKcmVRGIE
	HBjqQIsArSaEjMUhugkw3CAlcqMkj/NUDsHVB1M+4LjWpSjdwIEZT18tCO/RI9i4OWW7ZG9Ygk1/0
	WRwzoDX/FW7f6dtHMuyLDbpFLo7+2/Dp3ZsAcgEUgIaOZsSzjX1yb8KDi6DxRByxzFOWSzNh9qd7m
	lHKie+yxIyN+ARjqd9yApvGrWGh1pioBtLjjPbpW3uH027AdSJeJIZ2i3tPwJ+X5FcIMmuFQmb/EU
	F2dlIEu4UubFNU5TMsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdX3A-007RrP-2l; Thu, 21 Oct 2021 12:20:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdX36-007RpG-O8
 for linux-amlogic@lists.infradead.org; Thu, 21 Oct 2021 12:19:59 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r7so732414wrc.10
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Oct 2021 05:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=1MAcWNR4eIJHPkpF0pYcakZ/CD1b8OAEZ6esT1QDubc=;
 b=hBCnOWpAXWArLg0uH9UGShDwvTdqrT6J/fDuC7xhthw0qa2wBVNACShsI7AISgfR+d
 YJIVZHIJPWeNFDiq2VIA+I///w1zDmM5lO2OWmh9154MduFB2OM8IhFLstq+rvPCmTTj
 AecQMUgLfL7ChrRfMLg/mNhdLPy1a4IxlgTb33oc6uytvUdukI63bZhtEYHVnEXLbWkD
 OE9r4iwGFvJIRzMDWVfad0JxcBuig+jD6hK518WZWIHfAicg0CstlGMEM5jHiD8E3pSE
 pFiZx0isZAP5kHfk+EPvELt6K0hFc+4j3i7TBbr9LAffw8aCWZIjAequzLZy9FP46rPy
 V1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=1MAcWNR4eIJHPkpF0pYcakZ/CD1b8OAEZ6esT1QDubc=;
 b=wPnVOqJ6oxDaPIaNZUOKmbRaXLPwDnnRID+h4d2T+hlMOpuWrIiqkxdnydYuPCNlRm
 15DLTFSZOyxu9Fx77tfRCG/s4sX+Clu/EzGI9fl2+QkrWVN3yfFTYkXvODGsxdZ3u+mL
 hMDNMlH+tTJFIvDSQ77qw3zZCqsvGB+zw6ERrnoLGDYPr3s+En/kUrPXnwJhOglVioZM
 sabFUP+qbYqTw7jpBDPmd1o573Kxg82qfrV8TlFjMpFrepGzvXYSlWuRXjvkb7siUwz8
 3pWDeqXGQLMLsIV4Bs0qQsY/HIIHV7YzyCU2deb1WsK2z+X3KuW2W6uiQBReqOzwo9tW
 s1iA==
X-Gm-Message-State: AOAM5322UqZYb8y06dfOJ1Pt0HNud6uGnSJ95+TB3V2GR/WWNKEAameD
 4miZb4V34nqteDijy56TqRzxfw==
X-Google-Smtp-Source: ABdhPJzJvoUSpjaqHzOXELw1I39FiK/03T2TYTk/qaJuwZGyqBujn5meTTPNaXiPnO9TLEbK6mN7ZQ==
X-Received: by 2002:adf:ff91:: with SMTP id j17mr6555798wrr.132.1634818794258; 
 Thu, 21 Oct 2021 05:19:54 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 133sm7971860wmb.24.2021.10.21.05.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 05:19:53 -0700 (PDT)
References: <20211016145939.15643-1-martin.blumenstingl@googlemail.com>
 <1j5ytuvdmw.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCBGZi3MRqTRshyCkq8AAaqHi2NkZVV80ppZr4Lx=xWOWA@mail.gmail.com>
 <1jmtn6tu99.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCRWS6j=6hDo_sOBmQZw5X8L4GYP=rHQVqHd04keCrbuQ@mail.gmail.com>
User-agent: mu4e 1.6.7; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong
 <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] clk: meson: gxbb: Add the spread spectrum bit for MPLL0
 on GXBB
Date: Thu, 21 Oct 2021 14:18:01 +0200
In-reply-to: <CAFBinCCRWS6j=6hDo_sOBmQZw5X8L4GYP=rHQVqHd04keCrbuQ@mail.gmail.com>
Message-ID: <1jfssumuxi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_051956_890687_E02C33AF 
X-CRM114-Status: GOOD (  23.81  )
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


On Wed 20 Oct 2021 at 20:16, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Mon, Oct 18, 2021 at 2:03 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [...]
>> > The difference here is BIT(14). un-setting BIT(14) (documented as
>> > EN_DDS0) did not change anything according to Christian's test.
>> > That also means that SDM, SDM_EN and N2 have the expected values.
>> > I manually did the maths:
>> > (2000000000Hz * 16384) / ((16384 * 6) + 12808) = 294909640.7Hz
>> > which matches what clk_summary sees:
>> > 294909641Hz
>>
>>  ... and (2000000000Hz * 16384) / ((16384 * 6) = 333MHz which is fairly close
>>  to what you get w/o flipping the bit
> This is actually a great hint. So far MPLL clocks have "just worked"
> for me and I didn't have to work with this.
> With your explanation it makes sense that SDM_EN makes the hardware
> use or ignore the SDM value.
>
> [...]
>> For example yes. I am asking check a bit more what this bit does and
>> what it does not:
>>  - I need confirmation whether or not it does spread spectrum. Yes this
>>  needs to be observed on a SoC pin, like MCLK with a fairly low divider
>>  to the averaging effect which could partially mask spread spectrum.
> I did some more tests with Christian. It turns out that on GXBB
> HHI_MPLL_CNTL7[15] has no impact on the rate seen by meson-clk-msr.
> On the other hand, HHI_MPLL_CNTL[25] makes MPLL0 use or ignore the SDM
> value (again, verified through meson-clk-msr).
>
>>  - Get an idea what it actually does. The 2 calculations above are an
>>  hint. (Spread spectrum does not change the rate mean value)
> Indeed!
> My conclusion is that on GXBB:
> 1) HHI_MPLL_CNTL[25] doesn't control the spread spectrum setting of
> MPLL0 - just like you thought
> 2) HHI_MPLL_CNTL[25] is actually SDM_EN (and HHI_MPLL_CNTL7[15]
> doesn't seem to have any impact on MPLL0's output rate)
>
> Please let me know if there's anything else we can test.
> Else I'll send a patch for making HHI_MPLL_CNTL[25] the SDM_EN bit of
> MPLL0 on GXBB.

Fine by me if you are confident that HHI_MPLL_CNTL7[15] has indeed no
effect. Maybe add a comment about this oddity.

>
>
> Best regards,
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
