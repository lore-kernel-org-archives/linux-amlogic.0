Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A613C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Apr 2022 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuSqK9KzI702Grjdk0S+/3KOhzADlg0akP6aupB1RsA=; b=mBdr9gtEf3W7bb
	mA0x3jVBvbpWI6lZPnFoLpWTxGDbBUTkH7pyQEHZqCdvRyYzScWjGl05EU4/yYHYtzu6R5+Y9I3a1
	MjMsLQ6sk9JWFS4+B1zIf234Q4n3zC7DByj3K//61TYFgj6aCmc/pnf48HSIIxFO/0KtZF/EoTTOA
	/lMSB9vXi1KpX5LGu4iAW+D8aPQ8+iCNpz5r9K0SWDdzmcQC51qwvBcXZlybcmsFesI5NFY6N8t02
	fpuIg1lpk5FQxFYZE6yp+7SdxT/JpCwszU++bHV7wdUD7qFy8J1B8cHvdX984LUijhuzlShAb7eLo
	sTwalWCdAaUIce7DfvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngwZ0-006Yoj-8n; Tue, 19 Apr 2022 22:43:14 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngwYx-006Ynd-ES
 for linux-amlogic@lists.infradead.org; Tue, 19 Apr 2022 22:43:12 +0000
Received: by mail-yb1-xb35.google.com with SMTP id x200so33628391ybe.13
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Apr 2022 15:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJd5mXIJ9TYTPyuGeI1ku7Y3Z10VS13yfL8uaU2HGaM=;
 b=OwMNnkGCGYn+C9nRdX3zO/DaPCz8Vitby0qHNqI1JkBGlUWR0wOZs++OfRfniZYxi/
 v+xVJye4OMPpghx+7G7XqhXTOy78eQw3+sDH+0SUukW2paB2JVybasIgJ2foA5iqOC3/
 zERXi14JOQilJorJWOAyXYURGM1mHYyfN1m0hmgGetRAsTr2n+Z/5/WWDrRjpfWzoBB9
 eXzT1ui0fproWq7cRXq4KNgHzdMWhQHHt7YwREPT/0LjnpZ9KF7OO1Txbh3rHrUI7785
 4v+MpsrZ53LFchz53sSzm9ygDR+Ytb3OeITrWlg3MREAwg6oPTc9EFD3NKCucFstpR9n
 LeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJd5mXIJ9TYTPyuGeI1ku7Y3Z10VS13yfL8uaU2HGaM=;
 b=g82gNJvMIauSV9a4rmHEsNJzC7SL+kJ44OlR+/20svV2a8op80ECdRMKSxpAzOp+Op
 zyZsSg7nfRV9t7OfVw5k6hzT0HqNHyTvVdgWj3DZ7d+jtqTTv5OxZ21DwMOA3h9RIfAQ
 zxCDb3Sm62cizI4GnHia0YhlljFF1+WSMr/VotgWNXCJX2PK9IE4+omQvGZ2IY6EkVcj
 1W5MStUJnGXSgtDQSXS4WWOFaQcg614xADehdIs45TjSzKXuLlfOBVaMVxZTbbrKp0w+
 FhoqnL2BNjV3HMXAH01ioo1SnfJ7jg2pouZDGt34rADApKirK8Qm3QqAIqoo6D9oOhGr
 pySg==
X-Gm-Message-State: AOAM530xBd5CQ2pEFdiBh0cl4KUFKAhbQo6zaxzoAZX212QFRg8DYO6s
 ABOsymX2cWFM9PFRWk8WG+g6YF/sWcTwhIz5Q8YGQQ==
X-Google-Smtp-Source: ABdhPJxDPhDmxJ06mRcLlUYOqNBrMrRupWTsKU2r0ffZss19RV5zGyLwSV/l3JhJxgb4lNiKuR9LWOg7Op3D7pxET4E=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr12667515ybh.492.1650408190340; Tue, 19
 Apr 2022 15:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220330023720.18238-1-qianggui.song@amlogic.com>
In-Reply-To: <20220330023720.18238-1-qianggui.song@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Apr 2022 00:42:59 +0200
Message-ID: <CACRpkdZSVo=0Y1CTMccQe1a-GB6wqYTycnHOj8KtUdqL7f0Bxw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: meson: fix unused variable warning
To: Qianggui Song <qianggui.song@amlogic.com>
Cc: linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_154311_528777_13FEC7B7 
X-CRM114-Status: UNSURE (   9.24  )
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

On Wed, Mar 30, 2022 at 4:38 AM Qianggui Song <qianggui.song@amlogic.com> wrote:

> The kernel test robot reported a warning as below:
> >> drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused variable 'tdm_sclk1_c_pins' [-Wunused-const-variable]
>    static const unsigned int tdm_sclk1_c_pins[]            = { GPIOC_3 };
>
> Fix it by adding missing description about this pins
>
> Fixes: 775214d389c2 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>

Patch applied!

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
