Return-Path: <SRS0=LWkI=U7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0481FC5B57D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:12:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF0D21BD5
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uWsYlx1V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="F9MUeCgD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBF0D21BD5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4wNryMdMztlsgajtmJaVV4gdXuEVSLlD4buWruG0ZI=; b=uWsYlx1VMJbTBI
	yD7L1HT4UUqBGX3XyfuPv/LNpF08XBwG3nQD5Ahn0nmWJE1lncIjHRsZHmI9pTbcsqehh8bUnU5eq
	P+kdGMcMfBCbFLkiSW3QjAVsIwWr/dBHbwWQRfHA5VBNiy2pbicznU+LuJ8hNNltptDdYx6NU7f0T
	ehUWq3m4d4JBc+qH7ny+hPuPJRCZF8YHTodVjmQ9K42bsK47d1GYfB1Uh4pet7qLjbZTG805x8SXT
	QpUtjyfALOhejT5CVaYV1XwVu6fYuZ7D1rlXRLlrSvW88Dre95AfzS7QfAK47Eeqx0O+sa0qJhI+q
	9Bh55H0WlZhC4JzcvjpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiRwV-0008Pc-0R; Tue, 02 Jul 2019 23:12:07 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiRwF-0008DY-D0; Tue, 02 Jul 2019 23:11:52 +0000
Received: by mail-oi1-x243.google.com with SMTP id w7so439434oic.3;
 Tue, 02 Jul 2019 16:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=svNvFatzWg+J+IzhDu/8UapYNg/XQoHt/D9xO5S8sAU=;
 b=F9MUeCgD5cE83rQOPzxx5wJd9MM4XsOaW7CIpa4R+sQxmLnclcmJO63t/siBAt1bnG
 dIq1jh2p3nvQRTk0klvt+b+dpokQiEvBU/mW8Tz0/iJhNbNb5VS4lIjToMtRZI/IEpCl
 witmuIYcjSU0uTUAs/gfjuL22B7GZKSiIWHLpET9fUaEvmReFRIc7y+jZUIUkl+KGFez
 VFO1+gJp2ROeOhbIcjhj8mdVRjMS938Wbz4n+9d06KWPmZEzJO02wIgDirjXj7o/yGus
 lD5EYU0K+0/34oYdedokRlbfGcTNxqXAcEJ1UY5wCLwjl9Fy4FWiYGq3r2u+DSd1+3Bw
 D33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=svNvFatzWg+J+IzhDu/8UapYNg/XQoHt/D9xO5S8sAU=;
 b=RopmJcP1aOTLoKAfpPjyzkAKuKjPgEYr55fpLmbBwwQ3+lxr4QVQYns7fXfTct+kr1
 VJN65VVErq8ELMnJG8QDdAfKX9WcXhSk1jmqMzcypM0FWdYhKP7zfalCpCm8pKNnN69r
 +Z9N+RGXMHpGB4BQTpxDOYUpmvJD5US63pvfNDF6AdcecoTwK+Q4d/qoa0v1CX/sezTR
 kkJbrBzPPbOlX4JqOArd3Sr/L/T4zc8josR6mMn5Og93GrssQMbteu4untVfaD2j3cuO
 PFzChDfyGcFuBtN3zTAb0AL2g8oAM8FqFZKDalJhMxAHer31Lr9/H/OzumJQNe1pXZru
 0MuA==
X-Gm-Message-State: APjAAAWzg3jm7ZBFjZT+0CjOwutr/24s/Q9tqM9jMvc1eeHBx2vR5jUa
 Zw1KQUFGYsLbAtTF0av0NqPScaU49RGcqjVRLpg=
X-Google-Smtp-Source: APXvYqynGDp6RgAE+20EuhfnSaAl8FY4WjfZlQXJcX2FtOElvoAuFudGEiRTQUO42XE3uT6QyB6b3k1bfYY3Tam0nmc=
X-Received: by 2002:a05:6808:8f0:: with SMTP id
 d16mr1458640oic.47.1562109110323; 
 Tue, 02 Jul 2019 16:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-11-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-11-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 01:11:39 +0200
Message-ID: <CAFBinCAJPQ-gu20UoJEGx+fx6TZ1Eezh4sA+24mppffH5Ft25A@mail.gmail.com>
Subject: Re: [RFC/RFT v3 10/14] arm64: dts: meson-g12-common: add pwm_a on
 GPIOE_2 pinmux
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_161151_439411_D01470C9 
X-CRM114-Status: UNSURE (   6.04  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the ao_pinctrl subnode for the pwm_a function on GPIOE_2.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
