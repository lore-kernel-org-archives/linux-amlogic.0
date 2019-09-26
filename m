Return-Path: <SRS0=DMeG=XV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B664C4360C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 17:51:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7027222C9
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 17:51:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HaoAuWBh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OnNRSW3X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7027222C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DqN7BFlKOPdE42akOZS5/Evv0NtTb7weO8x9F/eiVE=; b=HaoAuWBhjHwcxS
	X1oALxx++hkXDcq64skIm8BxKuJENJLFqo+nikbU/KCzUcbMqUfkDI7SSmw/gnKq56TI65EZijsnE
	TKW2X46DOcbudoSWMzdXOVhVBExAkukX7wFk4aregl62p92aYUqwInNRgPDihpRqtoXl0JoNnhJA9
	5+d4pfgCFYagBYoxQiXGVOEPl6ciwWrUKUfrxzHyn7S0i2G3ux91ZZXzysZzuYqNALYYmA7PyeYP7
	DO+LWKKAq4hYwEYkxs4d1vtemxteYIXpGkVYPqv4vt1XtsK9Ss3ZN+gxdqlI3yC8KbHHcmcIgvaeO
	ZKQ6v7/fyu8r23B2Myug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDXvU-0003nn-6Y; Thu, 26 Sep 2019 17:51:36 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDXvR-0003n1-F6
 for linux-amlogic@lists.infradead.org; Thu, 26 Sep 2019 17:51:34 +0000
Received: by mail-ot1-x343.google.com with SMTP id g25so2817800otl.0
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Sep 2019 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRBo1U1wJBMBsFedfuu4Oad4gF7xZhsuM6ZSQHPH+qM=;
 b=OnNRSW3XB6s5ucJQXxJXQsBRy1JldMeRW0F4MSDi7HvaLt3VVeS/2XZvGG78q+LmV3
 zI9U4AbwyAfrGneczOJdor/0MrNlSs3XnhKqZudTp7yX0kD5F29H8LYIHfASWTwjj2QY
 i8rv3TqVE6d7qztHTLIUU+pBwVryPrZqexCbJjYFAXhbD73xnHdBKkA2rmGHQ1xH8S9Q
 hESqdAoIP2vBU5qoxbKk8hunfYJAJdooKHZ5PrE/6/teyMN+6kZz7MDkul1xXF757bko
 SiBzKOPSimTW9QAOn6Q+wFJDYd5x7/TAcU05GEowkzM8+Y8Z28iHSlmA5KA7HibUmb1K
 wWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRBo1U1wJBMBsFedfuu4Oad4gF7xZhsuM6ZSQHPH+qM=;
 b=Lta+p7SoZp2HeyrrRsvJwMUKApbH1v9J6Jzjl/0SsMkOPMpLSYUHFVZRPYw4LOd4IU
 RacnB9WdpqhX9PfEEUpFV8Q6AbeNxQ3D1VajlaORZXDm7L8jc7eOs9qOC1U4KMXNmQo9
 eTo/+ya2/gVlwEZ5MhxUGZCVTb5S1GkEm9NG9i79lkrNx+hYcgY+tbsWQT/DRzKqfFyh
 oLSDAUUJPrPcg/kJ+ld4mRENiVpfJ64FSPTA5Z60rolv29WJNRWqaJn8SbDmtP5JIJVG
 yOG6gUGx70ZeB5ESkpefMaNO9BdpWuO7sz5V4obHuPMpKZJSRpakxLVa1xnZcKWWdAMo
 3M1A==
X-Gm-Message-State: APjAAAVRJwcw3auz1Q3JcfRyPlEw3ZWy4bvGYXVcP/mgKcO2RHVwTRTs
 98Pe4b/kOdgGsS6JWbUKDuNkkbxiRYHZrTL5NQQ=
X-Google-Smtp-Source: APXvYqwp9A2tjKQPnay8aqFF0fAxzgQxMo9Y09YF2RKzK274POwhGNUxLAVYH1NJYrKPlKizQ1rGrVEl6PEuFg+SeXU=
X-Received: by 2002:a9d:760d:: with SMTP id k13mr3342916otl.96.1569520291787; 
 Thu, 26 Sep 2019 10:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190925105822.GH3264@mwanda>
In-Reply-To: <20190925105822.GH3264@mwanda>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Sep 2019 19:51:20 +0200
Message-ID: <CAFBinCDZRkJJa_PnM5aAzG=pZkf15jB2gLDRkCqA5BwHMvM+Mg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-meson8b: Fix signedness bug in
 probe
To: Dan Carpenter <dan.carpenter@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_105133_510193_4DC13021 
X-CRM114-Status: UNSURE (   7.41  )
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-amlogic@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

+Cc linux-amlogic mailing list

On Wed, Sep 25, 2019 at 12:59 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "dwmac->phy_mode" is an enum and in this context GCC treats it as
> an unsigned int so the error handling is never triggered.
>
> Fixes: 566e82516253 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for catching and fixing this!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
