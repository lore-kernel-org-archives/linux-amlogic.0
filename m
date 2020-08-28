Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF6BC433E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 13:04:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCEAD20825
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 13:04:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="znklN92r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEEhM6bX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCEAD20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GVDl36OLGX0IzDEeYxxm2q3MXoxbUPyxrWiWedCmjc0=; b=znklN92rpBvgh3KdajMhDevRW
	CBHAykiNAkfskkzoGqpoGmKjPnMVA065ivmW7TLLiBKX2GiBCe63iG/0cM3l6p7b+pcp2X1LObeR/
	BAWtAOHze2/gVA/Jc3Xx7ypKEL9qFdWC4NAMyAS7PjT5MaluyMuY+nFj6IsLlfDJ0E4En+9peG0Oo
	aT6wnRbawpS2101GYyT4kKXf4n2aMTeix8BzxUa1WvDVyuQlj/JNI17e1ETcRNUpbPn+7G6siu9Hc
	+9TGNt1/LKqzpTaQG92NyBZtM5Yr4w7YN5uZdlZZcloUyqeadjkUhJ82/fGMGEonRFBbLKlm1rVwf
	OevNod0jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBe38-0001Eg-UL; Fri, 28 Aug 2020 13:04:10 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBe35-0001Ds-RT
 for linux-amlogic@lists.infradead.org; Fri, 28 Aug 2020 13:04:08 +0000
Received: by mail-lj1-x242.google.com with SMTP id y2so1236165ljc.1
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Aug 2020 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kY6QohH0kHOg+QzN8imLnNqmKHUkcybm8RndPGRcKBY=;
 b=hEEhM6bXCEN77L0tGNTDS6zmOH04mOyuhnqNM5uPZYN0gYXTGXcdFAqeulpAUvxcWh
 DCCXZNQm2W0N8pG5Q4oIUMSHcG+kSdHUexRSjlZzGNpsRL+09rLkUl8e9Ty9YRfA8xg/
 zsviZhnOWi6K/8Se0ecZs49+o1JpUI0ouq1tOYIBK9lk72V2kJL3oTdKTp7G9JLHHmCA
 VJ/Py+m0DYy20mN5LcZ9yqol6X9R+XQ9ZjGCIZvBAxdw3UZj0mnfSalWOQd4EIPK36wE
 c7pd+QX7k2WKJoKBmSKL/j1M50mHmPityogf7HshbDgyYj4WAlQiauK+oot7jpk5Wut7
 R1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kY6QohH0kHOg+QzN8imLnNqmKHUkcybm8RndPGRcKBY=;
 b=AVwYwPJHPT2MFJVIXWhjnP1B2dKp59RPxem3zoa6gq31nvcK/oXRfzkyuiyIkxLP09
 8oAB3E2qzdPbXj94R6tecTKc+lmD7GW0UaVpEbEusr5UzRfxgJdnWdTp3psALULpImV0
 QOenMjsdbpqm+tOUI23MlB4wFAsxSi/hQQdQR0U0uO/dUURhVX5BHMfoFOl9DU5EqSHu
 spvpug46TjXNSaRBIl926jp15LIJmEbPJvLf0+FVktO4uURLGdTUZHiXTXTBoIw6jaVw
 mlM9WTD7nibCpz4/yWRbMbSW0qGBV+km/61Sas0KJhIdi0RpU9UMQOE/kAxW7UITj0sO
 CeQg==
X-Gm-Message-State: AOAM531kJGY2vTLiEWiokQKDReXJzsUGnTc3N0UUPQLUZNK4Uxt9OnYz
 Ot0AUgVGtM2kiPG6yYHinyMVMuKyHmQsXErZOehOKw==
X-Google-Smtp-Source: ABdhPJwsd1zLLYUQfLBwKIUDzPngm5BPAn1Oi62bpRLI87FQeo/xi46FUBxuYdvnnmkfHALpRVoAob1SKb1fomVrKmQ=
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr772794ljc.338.1598619846247; 
 Fri, 28 Aug 2020 06:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200826145153.10444-16-krzk@kernel.org>
In-Reply-To: <20200826145153.10444-16-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Aug 2020 15:03:55 +0200
Message-ID: <CACRpkdarHXwpNfVqODTn3ZZ02W5GTfynQDL3=Y+Mg8ytY8SOvA@mail.gmail.com>
Subject: Re: [PATCH 16/16] iio: magnetometer: ak8974: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_090407_891392_C534AA12 
X-CRM114-Status: UNSURE (   9.28  )
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
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Marek Vasut <marek.vasut@gmail.com>,
 Kukjin Kim <kgene@kernel.org>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 26, 2020 at 4:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
