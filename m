Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D33E81815
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Sep 2023 03:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDL7ZpVIiVZEehcr8hM+qASZGw660BBEcoDejf6T3cA=; b=SB0LU8duOiW0g1
	2QHwgWhGZg1XalJKyYJVPTgDHNhs3NNY0RVQnnufHYOB7myDKPJmTK3o4C9RW5/DWc5WjA1aWLhPa
	yVUn6nD/FyK0UhPrc5t9eN9CBsjDVydiOMu5HJemseO9KpfylP07nSTzHMEcwpXPzbxDm057Pu6t1
	5fH8ofH9b7m+mK+ALIVC0pGEzzNM+VVDa8JSpuyB2keCVFjprP7Z0PCjT+dTuXXc9IUo6xUDcMS9M
	+SLJVWguDkGm/NFz4F7Uyf+ExLH/7ZFsUFi45MFcZNLpp9v47mVN/xiLCftVaSvxl492EqXyMH+GB
	m76JrOgTAAYVCqaFOSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkyYT-00FSYA-09;
	Tue, 26 Sep 2023 03:16:09 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkyYM-00FSVP-2l;
	Tue, 26 Sep 2023 03:16:06 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qkyXf-000cC3-99; Tue, 26 Sep 2023 11:15:20 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 26 Sep 2023 11:15:22 +0800
Date: Tue, 26 Sep 2023 11:15:22 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"olivia@selenic.com" <olivia@selenic.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"conor@kernel.org" <conor@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"lists@kaiser.cx" <lists@kaiser.cx>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v3 1/3] drivers: rng: meson: add support for S4
Message-ID: <ZRJMynUI0W/jqeYt@gondor.apana.org.au>
References: <20230911101129.10604-1-avromanov@salutedevices.com>
 <20230911101129.10604-2-avromanov@salutedevices.com>
 <ZQp7Rf3qzoN6c2Le@gondor.apana.org.au>
 <20230922081514.p7patdvkp4mujk6k@cab-wsm-0029881.sigma.sbrf.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922081514.p7patdvkp4mujk6k@cab-wsm-0029881.sigma.sbrf.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_201602_893918_4ACDBB21 
X-CRM114-Status: UNSURE (   6.87  )
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

On Fri, Sep 22, 2023 at 08:15:27AM +0000, Alexey Romanov wrote:
>
> Are you suggesting remove meson_rng_priv and putting a pointer to read
> function in meson_rng_data?

I just thought it was weird that you assign meson_rng_data->priv
and then never use it anywhere else in the driver.  Did I miss
something?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
