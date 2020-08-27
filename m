Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAED6C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:39:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB3220714
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ekJW2oYW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8n5VPrp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFB3220714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tWJTWGdZpfNe2GY+tzIk6RQF5VLIOyAX9NG5bZHld/E=; b=ekJW2oYWNvgJfJBLw6aM6zYIQ
	ORVWAnu8TZNoOjuIJRZQn0b5trSOEP0Opf+tOS6QoRG1JJGmRJeSNjpItDTpHS+0n5BANOrEqPmb6
	4QvSq/lnhOdaLJwLZ4ph4hS7yteb+0p9nB5P+R2Tl6jo85sHiLIBeiOvuDktmFVs3daoBQ7uX2+dC
	cPM9SDZudDbDjgibXrFOamwus/TKRIXt12Btv/G5lPCZpuW0Oof3PoVpyeCpeduAweTgx3JDfnxqP
	SNoeE+MYiEieLysZ2mLOkrZNeQjDXDS+QXPXUsoTbpMmuGZ3suiMrFlnruwWhxpLYt0aiZsiQmj1Q
	9FbEjTNhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNjr-0003de-Cp; Thu, 27 Aug 2020 19:39:11 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNjm-0003bo-0l; Thu, 27 Aug 2020 19:39:06 +0000
Received: by mail-pg1-x541.google.com with SMTP id v15so4089262pgh.6;
 Thu, 27 Aug 2020 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MZm/oywi3r1tbCCgZePyobFM2PGZReJQn7CQ3uKc+Ao=;
 b=f8n5VPrpuTtwANe91fL3ceCKerjs9R1uZiyAXmwVy/cZqu3I8o92h7iWKeUrZbvTHI
 xv3f2KNykWxz9M4p+YEx/8qCMXuZ9zkFFj9z+dffQXJOEZsPQBZzrKqn6Xfw2iQuP5Af
 eIOEmUek3WrgS3fxMZwWJXrEDNbdzLAOraAWLfkDXyFr6h00Z7O9KvIpFIS9xEGr+3aX
 9zXFJ0A9XeZY0Ce0KWz63fWV7wQ7VVhbTgUiEEsxac+lfKyxCqS913SAPiQ6itoN4Kdu
 Hp/smrljQR+JJGKvlfG5Wqu+EBGIUVqGeslwuBUsIrpvL2dILvRlZuex9jG0lt4PEcd9
 UTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MZm/oywi3r1tbCCgZePyobFM2PGZReJQn7CQ3uKc+Ao=;
 b=raHm5MyjLk96SJlFh/iInQ9hRo9ghFWmAdmVyC/rdyuxJJK3k0sOG6PyQzDOTAj0kQ
 FCIDuWYU8RRIrKjJdBEzV/1yE6WaBCmgAYhVVmpZ2h54Nb8eYeFi07zYD22U/KIHzZ5F
 cLN6EcaKh3r+JUaDmL19P5cqfqiEmr4FWf15EzCZLroyJHPmYZ2yIL8Ld4hmsF40r4iM
 DWyOkn3iLxSg1SoUcHQRoja/XfbSTHibZYTGaCOKsT2eGw5cOHES8SxQbgocPTo1msfg
 osJwMAsvhS4ia62+LDs+Vx1Qn0g8AXjwllKcxtskG10yJfy4oVyJuwUgBEPCpH6xBNln
 gzog==
X-Gm-Message-State: AOAM530Ng0VrH9I6VnntuzOfvzXQD9qzbmLQOBR9g8UYYQK+V0DNp6rK
 XxOWGB+MEEFBk4ldZMl5JqXC/tb4vE66vqK8xFs=
X-Google-Smtp-Source: ABdhPJzf24/mTVbylFzj0huXtaxnG7j22bCzla2pU3gLISj7msJajR9gj4ZkRMNtbU33SxLbtqsrpdn12ipaw+rhX4g=
X-Received: by 2002:a63:ec18:: with SMTP id j24mr15210554pgh.74.1598557143681; 
 Thu, 27 Aug 2020 12:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-1-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:38:46 +0300
Message-ID: <CAHp75VeOWTuB1SqsajLZE9WB+VzgMuL9gnA-ohf58_hfJ=gn5w@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] iio: accel: bma180: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_153906_069594_53D6EF20 
X-CRM114-Status: GOOD (  19.57  )
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
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 10:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/accel/bma180.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
> index 5b7a467c7b27..448faed001fd 100644
> --- a/drivers/iio/accel/bma180.c
> +++ b/drivers/iio/accel/bma180.c
> @@ -1000,19 +1000,15 @@ static int bma180_probe(struct i2c_client *client,
>                 return ret;
>
>         data->vdd_supply = devm_regulator_get(dev, "vdd");
> -       if (IS_ERR(data->vdd_supply)) {
> -               if (PTR_ERR(data->vdd_supply) != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get vdd regulator %d\n",
> -                               (int)PTR_ERR(data->vdd_supply));
> -               return PTR_ERR(data->vdd_supply);
> -       }
> +       if (IS_ERR(data->vdd_supply))
> +               return dev_err_probe(dev, PTR_ERR(data->vdd_supply),
> +                                    "Failed to get vdd regulator\n");
> +
>         data->vddio_supply = devm_regulator_get(dev, "vddio");
> -       if (IS_ERR(data->vddio_supply)) {
> -               if (PTR_ERR(data->vddio_supply) != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get vddio regulator %d\n",
> -                               (int)PTR_ERR(data->vddio_supply));
> -               return PTR_ERR(data->vddio_supply);
> -       }
> +       if (IS_ERR(data->vddio_supply))
> +               return dev_err_probe(dev, PTR_ERR(data->vddio_supply),
> +                                    "Failed to get vddio regulator\n");
> +
>         /* Typical voltage 2.4V these are min and max */
>         ret = regulator_set_voltage(data->vdd_supply, 1620000, 3600000);
>         if (ret)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
