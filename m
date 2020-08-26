Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB36FC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 15:38:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A12D2078D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 15:38:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKfMXjc1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A12D2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=octakon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gxOp80nTqkRBIdobPMZDhIxhaAAi7y+uglwea+UqDQ8=; b=UKfMXjc1ykowB9IP52wenYQNr
	/+L6b5Dwjh/M1PkjUiHq+G0t6L641dS3J7HMfC9KNK0N45jI/v3Q8rKwF6fSe1I1OCPBqPihrcwpB
	/rWjDRA7/dhLDccwfOsnPmNGmi4SBrK8YGhtHKrxzJpnvSp1HbZZZivdsLSHtm3axWtR7K7W0CcJu
	JU9nEzT02CA7MAD3eiaEVUD0hKUyDlEQ4ntj1bFphEKeRSjR7HrlOPrYy7/BRlgjLEeNnN2cBV6JL
	P2umWf8YaN5z37F6mDfnPi0556ArYIF06ihBTLNkvA9hm61zX+fB4m0TO01extk0vnHCbj4kuOp53
	UHgtNcsbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAxVR-0005ja-9H; Wed, 26 Aug 2020 15:38:33 +0000
Received: from smtpout1.mo803.mail-out.ovh.net ([79.137.123.219])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAxVP-0005j2-1b; Wed, 26 Aug 2020 15:38:31 +0000
Received: from pro2.mail.ovh.net (unknown [10.109.156.191])
 by mo803.mail-out.ovh.net (Postfix) with ESMTPS id 6EAE963F16E0;
 Wed, 26 Aug 2020 17:38:18 +0200 (CEST)
Received: from localhost (34.103.240.152) by DAG2EX1.emp2.local (172.16.2.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 26 Aug
 2020 17:38:17 +0200
Date: Wed, 26 Aug 2020 17:34:34 +0200
From: Tomasz Duszynski <tomasz.duszynski@octakon.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 11/16] iio: chemical: scd30: Simplify with dev_err_probe()
Message-ID: <20200826153434.GA7468@arch>
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200826145153.10444-11-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826145153.10444-11-krzk@kernel.org>
X-Originating-IP: [34.103.240.152]
X-ClientProxiedBy: CAS2.emp2.local (172.16.1.2) To DAG2EX1.emp2.local
 (172.16.2.11)
X-Ovh-Tracer-Id: 9361576253439499417
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddvvddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjihesthdtredttddtjeenucfhrhhomhepvfhomhgrshiiucffuhhsiiihnhhskhhiuceothhomhgrshiirdguuhhsiiihnhhskhhisehotghtrghkohhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtheevtefhffduteejfedtkeeuheejgeejvdetfffgveekffefgeffueeghefgjeenucfkpheptddrtddrtddrtddpfeegrddutdefrddvgedtrdduhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhrohdvrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepthhomhgrshiirdguuhhsiiihnhhskhhisehotghtrghkohhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_113831_227132_0650ECE8 
X-CRM114-Status: GOOD (  18.95  )
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
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Beniamin Bia <beniamin.bia@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 26, 2020 at 04:51:48PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/chemical/scd30_core.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
> index eac76972f83e..92358797796d 100644
> --- a/drivers/iio/chemical/scd30_core.c
> +++ b/drivers/iio/chemical/scd30_core.c
> @@ -705,13 +705,9 @@ int scd30_probe(struct device *dev, int irq, const char *name, void *priv,
>  	indio_dev->available_scan_masks = scd30_scan_masks;
>
>  	state->vdd = devm_regulator_get(dev, "vdd");
> -	if (IS_ERR(state->vdd)) {
> -		if (PTR_ERR(state->vdd) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -
> -		dev_err(dev, "failed to get regulator\n");
> -		return PTR_ERR(state->vdd);
> -	}
> +	if (IS_ERR(state->vdd))
> +		return dev_err_probe(dev, PTR_ERR(state->vdd),
> +				     "failed to get regulator\n");

I'd say that removing like break would slightly improve readability.
Besides, staying within 100 columns seems socially acceptable now.
Otherwise,

Acked-by: Tomasz Duszynski <tomasz.duszynski@octakon.com>

>
>  	ret = regulator_enable(state->vdd);
>  	if (ret)
> --
> 2.17.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
