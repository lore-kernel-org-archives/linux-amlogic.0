Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB10CD1292
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2024 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxuukqixQSlyZ43Ym0fDqW8jj6YBDtKhXBUSqt7T/c0=; b=OU0ZEs1gVJpcWa
	NNvsK/1I13FVFGDDU6GznsjoJsGu1rTAT1lzmjZDPOMfNmbVIcmhZQJA2FwD/GfXJzqtYX0djdzOH
	a7855jJVF9H5CXX+cK/4lVH0ThK6qxE+JFpx2z92sVmr20leqhzmFTl2mjmNS2xCm7dF2EERXc87v
	nJA8fIeoTVhB0n1uY7F1/eiE4xa+AU9d2QKqnCG89Ki3xQLbfOcE9C+JQGeUMIWLiw5vlZzFmi1gP
	lZV1moWIk3wSz8wmaXZiQH5f5013BpdXuQo52nlzoNPrqe4oWd2BXda5ABIBRz8aHpG3Ajhrzisuo
	Mknr64FA2DUwERpBx61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup2Y-0000000Atzb-3NCm;
	Thu, 11 Apr 2024 07:40:10 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup2U-0000000Atv6-1ThL;
	Thu, 11 Apr 2024 07:40:09 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rup1d-000Fuk-TF; Thu, 11 Apr 2024 15:39:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Apr 2024 15:39:31 +0800
Date: Thu, 11 Apr 2024 15:39:31 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v6 11/23] drivers: crypto: meson: introduce hasher
Message-ID: <ZheTs8kfpSPOtN/1@gondor.apana.org.au>
References: <20240326153219.2915080-1-avromanov@salutedevices.com>
 <20240326153219.2915080-12-avromanov@salutedevices.com>
 <Zg+gnrO/wX5S+zlw@gondor.apana.org.au>
 <20240410103908.suw6x3pywk73nftp@cab-wsm-0029881.sigma.sbrf.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410103908.suw6x3pywk73nftp@cab-wsm-0029881.sigma.sbrf.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_004006_413530_37B7A0D2 
X-CRM114-Status: GOOD (  15.76  )
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

On Wed, Apr 10, 2024 at 10:39:14AM +0000, Alexey Romanov wrote:
> Hello Herbert,
> 
> On Fri, Apr 05, 2024 at 02:56:30PM +0800, Herbert Xu wrote:
> > On Tue, Mar 26, 2024 at 06:32:07PM +0300, Alexey Romanov wrote:
> > > Introduce support for SHA1/SHA224/SHA256 hash algos.
> > > Tested via tcrypt and custom tests.
> > > 
> > > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > > ---
> > >  drivers/crypto/amlogic/Makefile             |   2 +-
> > >  drivers/crypto/amlogic/amlogic-gxl-core.c   |  25 +-
> > >  drivers/crypto/amlogic/amlogic-gxl-hasher.c | 460 ++++++++++++++++++++
> > >  drivers/crypto/amlogic/amlogic-gxl.h        |  51 +++
> > >  4 files changed, 536 insertions(+), 2 deletions(-)
> > >  create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c
> > 
> > Where are the import/export functions?
> 
> Sorry, I miss understand you. What do you mean by "import/epxort
> functions"?

The crypto hash API supports partial hashing, which means that
you need to be able to hash part of the data, save the state,
and then resume it later.

If your hardware only supports full hashing then you will need
to add a software fallback.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
