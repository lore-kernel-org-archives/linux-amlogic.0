Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CEBCE79AC
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Sep 2023 04:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCnaK93pDuvDe+hAHZxU5tsimQQsSsZZWsIN7uf/Lbk=; b=m+VEPc4Ok2YSjS
	ZrfAVp1oYsTIRf+zAywWFUrUT41JR6ra+r6D2mdW2N9sLKXbGtwUrPYGpYhY4cKA/4D9EGFU1+BTh
	6yEOgwI6cI+FmnKtEBodLxLhrHqNQZ2C37dfujCOqt0DsT5DZnpBmXoh4ZbdXTPZ6NJt8+ht0ieIL
	aCntak7qgD+imKV+2mwp2U2KPRsujz8eNh2X0WKeifx2tYzQkslyJlyXXBABZdUncD3w+TOW6OlIw
	2tsYkRS5ofo98E3AINpNfD1HZuqIPVtWY+z66bKh/U9kdEl+blQvf91p5BiG+lDG7EkN8t8jiFm0M
	FQ+TqWYam107OdZ1AHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qipGA-001ryg-0A;
	Wed, 20 Sep 2023 04:56:22 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qipG5-001rxb-0S;
	Wed, 20 Sep 2023 04:56:19 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qipFK-00GCoh-9L; Wed, 20 Sep 2023 12:55:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 20 Sep 2023 12:55:33 +0800
Date: Wed, 20 Sep 2023 12:55:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: narmstrong@baylibre.com, neil.armstrong@linaro.org, olivia@selenic.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, conor@kernel.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	f.fainelli@gmail.com, hkallweit1@gmail.com, lists@kaiser.cx,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-crypto@vger.kernel.org,
	kernel@sberdevices.ru, Alexey Romanov <avromanov@sberdevices.ru>
Subject: Re: [PATCH v3 1/3] drivers: rng: meson: add support for S4
Message-ID: <ZQp7Rf3qzoN6c2Le@gondor.apana.org.au>
References: <20230911101129.10604-1-avromanov@salutedevices.com>
 <20230911101129.10604-2-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230911101129.10604-2-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_215617_202122_6A64B246 
X-CRM114-Status: UNSURE (   8.69  )
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

On Mon, Sep 11, 2023 at 01:11:27PM +0300, Alexey Romanov wrote:
>
> +struct meson_rng_priv {
> +	int (*read)(struct hwrng *rng, void *buf, size_t max, bool wait);
> +};
>  
>  struct meson_rng_data {
>  	void __iomem *base;
>  	struct hwrng rng;
> +	struct device *dev;
> +	const struct meson_rng_priv *priv;
>  };

Is data->priv really necessary? It doesn't seem to be used anywhere
after the probe.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
