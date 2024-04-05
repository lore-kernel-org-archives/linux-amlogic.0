Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D913CD1284
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2024 06:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/avVZ3ZEIzmaGSNfHnJ+XW1qPFYuz7x5u+BwFQXMMo=; b=iXEeDcpqGpEnLS
	Yl64jYR8GPUL+N44b9gdm4wcMi2b5GSbDxw1C4w2jiXuMHWzw80MuS8DH1r51p8nS3H9Y/czNqfI9
	m1Opjr2pFYjLnPWofydZKSdkwhRWILjQv/nGacPgB9CYC/U7Ps/Z0PY4hMdi3adqzjdqceTpPVx6O
	0EPlThf/uH2o/DLHRWmzHQ65yb2C8Z4L//E2SIXDmQk+0rIVo3F9+vUXgAK23CE2fqKW1uDDiw+14
	b2UJ6Ek0CAYsLGtrWJxoF42+zluBTIBIEqHKpkS/TtsccG7Umk+B0y8TFq2IOOJcpEMwVbX/DfgL8
	d2Kpoy0QPVwiemltXvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsdV4-00000005YsY-2yLK;
	Fri, 05 Apr 2024 06:56:34 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsdV1-00000005YpU-1Vxi;
	Fri, 05 Apr 2024 06:56:33 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rsdUj-00FSq8-QC; Fri, 05 Apr 2024 14:56:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 05 Apr 2024 14:56:30 +0800
Date: Fri, 5 Apr 2024 14:56:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
Subject: Re: [PATCH v6 11/23] drivers: crypto: meson: introduce hasher
Message-ID: <Zg+gnrO/wX5S+zlw@gondor.apana.org.au>
References: <20240326153219.2915080-1-avromanov@salutedevices.com>
 <20240326153219.2915080-12-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326153219.2915080-12-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_235631_434604_B01CE840 
X-CRM114-Status: UNSURE (   8.87  )
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

On Tue, Mar 26, 2024 at 06:32:07PM +0300, Alexey Romanov wrote:
> Introduce support for SHA1/SHA224/SHA256 hash algos.
> Tested via tcrypt and custom tests.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  drivers/crypto/amlogic/Makefile             |   2 +-
>  drivers/crypto/amlogic/amlogic-gxl-core.c   |  25 +-
>  drivers/crypto/amlogic/amlogic-gxl-hasher.c | 460 ++++++++++++++++++++
>  drivers/crypto/amlogic/amlogic-gxl.h        |  51 +++
>  4 files changed, 536 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c

Where are the import/export functions?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
