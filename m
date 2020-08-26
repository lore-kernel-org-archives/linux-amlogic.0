Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0525BC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 16:17:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C71F3206FA
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 16:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ngS8rba7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C71F3206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulP2lvLTjO0G2bmDvwzCH/vK/igEzK1MDxIEgV0jjpA=; b=ngS8rba7O4kgtI2Hae8Pm69o1e
	WhnWBWScSkNLOjgVf+O5ZqHkAWHHepJ/mBh5Laqip00Pdz8knA147X1OkUzo9kA7WWtrpJ8VEYUKM
	/dI2y6oyF6Lr1aV+r3oDB/5ASv+uCH53fFqJGVCVJtGa9AY+NOE1LSL1VeBNz3DgqNKve2u6gWT0x
	OCqJt7qEBiH9k9qNkvLZVoy7OEc2VgfZXq951odmyRFob+TutvcV+mOJGbLcitSDdlM7/fJNfnTNs
	35IAxhzZSM9IfykhJvc8ZEPaspwakc3XAZrClxQXO8GYnpe0x99oUAiGzv4xYRvm58m4r2uTpQLHH
	E4SfTWXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAy76-00041d-R7; Wed, 26 Aug 2020 16:17:28 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAy72-000407-1H; Wed, 26 Aug 2020 16:17:24 +0000
Received: by mail-ed1-f67.google.com with SMTP id l23so2226194edv.11;
 Wed, 26 Aug 2020 09:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=laWDGcI0X9wsLJOKujDeA1CnpKtg4JiaZl3VvU6mRis=;
 b=UyHIASUNkypV3gILKjN+11kW5Xpsq5GNtaNN4tvGPNhUXlHzwav2KYg5rRfU8tR+Cc
 TlWObB37fevIuoLA+GDKTejyO9jTPBrGqdvjTfTl/qWjdGKyINSyng+PTx5EvXxX2YbR
 rDV642Y2TMLSzNEh656ktz6LP5qTCMEVzHUVVBYVMHDKX1GcQlQuajTjAFBhA/+hnBA+
 y2IHZcwY81VV//UASfPIISNTMz/+AVP+bPaWcwEmB6Uln9tu4CQJvE8lAPz9F4/6zkqA
 tXCygOLgCHLAiqCwJmaTXlfSbMRK+oVH+ulUBGksydlPyBSWbO25sr5xZ/xrBgavnMgy
 e38Q==
X-Gm-Message-State: AOAM533wtFd7Qp69bs/HwMDCi1ZD2t66zSy2TrBiqwpsG2NIR25WJQR9
 eKtrdpaFMQbJjAsMDoiDlzw=
X-Google-Smtp-Source: ABdhPJwDaFNcHPrTYdLriZtJcxNZ110E7a9YGPHsFImoDK7pqL5BMNNSt1z6y1v86s6eweEOR3zqAQ==
X-Received: by 2002:aa7:d70a:: with SMTP id t10mr12649505edq.161.1598458642874; 
 Wed, 26 Aug 2020 09:17:22 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id p9sm2325797ejg.120.2020.08.26.09.17.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Aug 2020 09:17:22 -0700 (PDT)
Date: Wed, 26 Aug 2020 18:17:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Peter Rosin <peda@axentia.se>, Kukjin Kim <kgene@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Bakker <xc-racer2@live.ca>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 08/16] iio: adc: stm32: Simplify with dev_err_probe()
Message-ID: <20200826161719.GB31748@kozik-lap>
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200826145153.10444-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826145153.10444-8-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_121724_151735_43356E8C 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 26, 2020 at 04:51:45PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/adc/stm32-adc-core.c  | 62 ++++++++++++-------------------
>  drivers/iio/adc/stm32-adc.c       | 10 ++---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 10 ++---
>  3 files changed, 30 insertions(+), 52 deletions(-)

For this one I have a follow up - I found more of places for conversion.
I will send v2 for this one only.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
