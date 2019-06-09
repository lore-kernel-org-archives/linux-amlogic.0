Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482E7C28EBD
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 21:52:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F7B206C3
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 21:52:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uK69Jqzq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cl0rVA3z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F7B206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XO7rCPFcwV4obn6gS5EuPD2oVke6AkEGSMyVxRjtjM=; b=uK69JqzqrBUyUf
	z0ydme6ORPzQjKXhU9z5dU51TA6SyqVo/EEP+VMZgJIoa0ifVo75Bp2CkD6AM08AZjoSKvojS29+3
	3TJQJzXJlMMRe/JrzzmqWJtSqFcpQW3scvj+POE/l/XhOJDMeFJK2ekDB7V36GjwFYbT3jbQa94gp
	8WXs9gUgWFGBQUKSTx+GOI9vaQIohS3Xta4l8UP20IEdkmw75o8QdHEa7gmmTRzMcJQtoCBg5zEN6
	nSHZ//mU/7a3LgXKHCXh16EdHlj8GSJZKrtojZ91b+jUAkTQFnFSXCP5zlWcJZj8KaTvanmTZL4Lr
	rxpn/WBV7fHI+38WiWiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha5jq-0007x2-OM; Sun, 09 Jun 2019 21:52:30 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha5jg-0007nd-Pv
 for linux-amlogic@lists.infradead.org; Sun, 09 Jun 2019 21:52:22 +0000
Received: by mail-lj1-x233.google.com with SMTP id s21so6160899lji.8
 for <linux-amlogic@lists.infradead.org>; Sun, 09 Jun 2019 14:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3u47NK04VLWnks2ECFn41iwvdVn3zhAxLH2OdU56Dmw=;
 b=Cl0rVA3z38e6L8+wW94OpWj72TSurDFbVXa3pn24DZWJJzrOrvC+fdcaUtFQndqIgP
 txxwbLiEo1JBtH/op3umTaxckv2djd/WaR5I5qa+EGNTpKe0HtK0Tq8lpu4RgQ+aidH1
 RQN+njo2AS3nHqvbBnl0jOecogbHfZyq2ZQoBr6Un7SjO9AiaCcnPinHmJPgJB5ysgy5
 i4n1mXa2crZfqK3FvymkbMZneKJ/uEnHKZlQ/hZb3BaKT89F9FiUvIiAc0qIjTvgsyHc
 GdMMVySRP+4084kUDTBoax7mRi1FuV0caKswGmr9183KWlYwKXnOIZg9Gxdz/EPAQTx5
 IU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3u47NK04VLWnks2ECFn41iwvdVn3zhAxLH2OdU56Dmw=;
 b=A+xk2+yLZVZkKKmr5c4FY1QiZ08YT1AQMIvhPhoZAGq37JuYyLb8jARfoxmkmwl1qH
 Lg7fucid5zW+Y7cyFIDixl3orwxPnSCQ0NNnOgpdOnhssfWnOV0rJ2vY7kvIa7zNGgUI
 vDvs+KB5Gr4xBfvZ22N1pH6lB1syPGZw8ETiRBsFFBkVmC45uXWC4nxk7svU4H0Eum36
 o8K3QrTPaQsszyR5LtM7FI9IUin3NkhPnegpCIYKsy+FVtdD+fSI1mU8olJluYSsgFqi
 5zjqUFj9jk5PAFqST9MbgyBoDmIsX0q3rm35Avt9jQgUHYohNmpdgO1KhG7dZvydQp6f
 Piow==
X-Gm-Message-State: APjAAAU+i5btZhi0+/zjiC3sv26EyZHnjS13a7kvC4m/gD93mO06YbMt
 t60qRBvYv/vPkSHYqpaIvMqERpBsuefz27yc163UCA==
X-Google-Smtp-Source: APXvYqxxvAPH8DO2c0X0YBL0L2eBq2A1RkbOzyw6mq+phUKB0rDXYXygI1YbFcBf/zVxAnxBKN7lStrxUTnG75YtXlc=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr10655574ljj.113.1560117139172; 
 Sun, 09 Jun 2019 14:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609204510.GB8247@lunn.ch>
In-Reply-To: <20190609204510.GB8247@lunn.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 9 Jun 2019 23:52:12 +0200
Message-ID: <CACRpkdbOnxZJZ=Lvv0mbnrCg8kPWyeRsBbOa2cUiwjcPnR=4RA@mail.gmail.com>
Subject: Re: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset
 GPIO
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_145220_841888_F929C343 
X-CRM114-Status: UNSURE (   7.14  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev <netdev@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Jun 9, 2019 at 10:45 PM Andrew Lunn <andrew@lunn.ch> wrote:

> Linus can probably create a stable branch with the GPIO changes, which
> David can pull into net-next, and then apply the stmmac changes on
> top.

Sure thing, just tell me what to queue and I'll create an immutable
branch for this that David can pull.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
