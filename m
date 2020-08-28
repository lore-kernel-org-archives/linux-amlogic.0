Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5AEC433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 14:33:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C7F20639
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 14:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lnjiGLxV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXuwPRZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C7F20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aZrhe/InjFirKokXXEATPgphtRVIcC9VEg0Fb+QS2CU=; b=lnjiGLxVhnm+DfuEwg1wYKcg5
	KyNHhiWKWrn5Hrqa/Qt94+lLILrsSRE5orXNMJqQ2vesTp0n5zvyIeJTS9k8qtr2JIUbD/rYt5c5O
	ujCnu/+k8flNW6UiSPEb9A6lklxCOp6C1GX9cJUwVBQTYkm7fGi8KQXMg8q+vr0E61F0ur7Y3CIpo
	hNloFa0ttVqimSoYKD5UJ1Y8BJz9bmAdyYJVe+aVM6xqct8tBVFbkWTvXdUk2f42jxDw6kRwB2NQ3
	IZKTmTry4UxrgkTfD7OU3L9zmvxjbxehucRpX0t0qXBb4GoKRk+UEoFNaDL6fL8e5A+r51NDXZ6/P
	4cq7EPIXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBfRa-0002XR-2i; Fri, 28 Aug 2020 14:33:30 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBfRX-0002WI-Ed
 for linux-amlogic@lists.infradead.org; Fri, 28 Aug 2020 14:33:28 +0000
Received: by mail-lj1-x242.google.com with SMTP id w25so1527117ljo.12
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Aug 2020 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rpmT8z3vCoI387yR05xFtDPOcMcQ4MSd+QWPcIK213o=;
 b=SXuwPRZCasKbRTNTD4rBVmpvxw5674fLb7D3nUZanlM12QZHv9w8tybE1ygcVHuyHf
 oInP73nxqRqG/m924yhoXHEfVfMd8UNcGRHcOgglzIGOvStEqWimRNUmkiNO8lXlxASX
 CCpDX7fmupyd+Q7PIqp/vvF9e1lBa3Fh+ICv7e70bLR/G0jT4Gkx4E349CQz9h+h21Rd
 J9n3piyD5XHKRoxk039mI9PtUaLpkGEORrwzNi7gop6r9A58+nzmeDGzRENEZ4/0F3H/
 ri4qABCfHUAxKq3affmj3xX920jjMz3hnbCzfllSaY6dfAWtXQUtN0eWy5GAs/w/o60R
 vy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rpmT8z3vCoI387yR05xFtDPOcMcQ4MSd+QWPcIK213o=;
 b=gxJeNjevoZEdr3qzGqbwbM9V/G5nv7r4GO5yF39g4DrwiI6CIKRUrUrdMOSmJTcSV9
 9qifDHb3JwGeovFrqVhENFBhu9BxlYDMxw4vqGVB8pfEtXsRq9WlvwD+Sm252l/7I46z
 kWDn3W5W2m0EVd08YWtXjnM6oAvLKEpsFOQWFQGisBSRoulTdd/1K5SAXvziMX9cpaZ7
 TGuza+rAMSxfrxzzwCxmqy+RX3bBR3h5Pe5LJLrM4VY+jrHBi7bps12F6Zf3xUq6Axkb
 bg/RyNDLDOcvzEATq2ltP66GoG62vSNZpYET/lZ1DCcXUMWOn4h2vCqgT+kJFDF551Ge
 6yYw==
X-Gm-Message-State: AOAM53139RXdq9yEIeHSOqO0tgXwdmR+RjZdTMy7Dn5b8rOOxl8S4miM
 gIMyM1y1K8XoCFjzCtK6zkHYtWgNzpykUhB/sCxaNw==
X-Google-Smtp-Source: ABdhPJx50N3WCz+95xej33BT+LFzbgw+YdB2RFlR9a5r50nwxYsPt9Je6m4kpOoXdZYez8d1PPZWYNLG7DhnlToAq/A=
X-Received: by 2002:a2e:558:: with SMTP id 85mr1056326ljf.293.1598625206108;
 Fri, 28 Aug 2020 07:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-16-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-16-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Aug 2020 16:33:15 +0200
Message-ID: <CACRpkdZTTq=yARxK5uAu6f5rAJy0tH0V5HQU3d6ddEMa_a9KnQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] iio: magnetometer: ak8974: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_103327_662712_6371FA6A 
X-CRM114-Status: UNSURE (   9.71  )
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
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kukjin Kim <kgene@kernel.org>,
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

On Thu, Aug 27, 2020 at 9:29 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

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
