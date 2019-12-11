Return-Path: <SRS0=S6c6=2B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6620AC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 09:51:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39541205C9
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 09:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hv1nClob"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39541205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eig3uMQly6vuWYqT0nslWBUAc2DeBoVtHM8Wr7LNuzo=; b=Hv1nClobYAwtvw
	VrZjClyFy/appdnn9bC0CmeFwJhzxd2JA5W7W23phZltooqpwy9Niz1LljHs1lRD+8X1bGYBSQjcX
	M4gQ50z7OaAmF5thiRZp4+a/+d/xk0JoviAP0jQ1K5a5tmFQ4CFg5JQfLZdQJ5mu9X5pdefgMOC9f
	l9oNEVYM5O6j03+5OWDjL1MA2fXjE0V02Yj38eLJsWORIom2SAA6R4b0xAMmAub15xrrUXRb/7NU9
	s3g6eZlpfbnuqjfxrAIa3ke+cL/LbvUN0tyFQ9cu8oMBwufS5csTVdFQhzv99eNhkcrMyOhb0rppM
	4UoXqb5ih8DJS3VGr6jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieye7-0007CQ-Dr; Wed, 11 Dec 2019 09:51:03 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=deadmen.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieydy-000745-5h; Wed, 11 Dec 2019 09:50:55 +0000
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1ieydq-0000iP-RW; Wed, 11 Dec 2019 17:50:46 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1ieydn-0006eC-Cu; Wed, 11 Dec 2019 17:50:43 +0800
Date: Wed, 11 Dec 2019 17:50:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv1 0/3] Enable crypto module on Amlogic GXBB SoC platform
Message-ID: <20191211095043.3kngq7wh77xvadge@gondor.apana.org.au>
References: <20191211084112.971-1-linux.amoon@gmail.com>
 <a4610efc-844a-2d43-5db1-cf813102e701@baylibre.com>
 <CANAwSgQOTA0mSvFW5otaCzFPHidhY7VFcrXZHjCD-1XkQpcx3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANAwSgQOTA0mSvFW5otaCzFPHidhY7VFcrXZHjCD-1XkQpcx3w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_015054_365121_8519B8C8 
X-CRM114-Status: UNSURE (   4.50  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2019 at 03:07:53PM +0530, Anand Moon wrote:
>
> name         : ecb(aes)
> driver       : ecb-aes-gxl
> module       : kernel
> priority     : 400
> refcnt       : 1
> selftest     : passed
> internal     : no
> type         : skcipher
> async        : yes
> blocksize    : 16
> min keysize  : 16
> max keysize  : 32
> ivsize       : 0
> chunksize    : 16
> walksize     : 16
> 
> name         : cbc(aes)
> driver       : cbc-aes-gxl
> module       : kernel
> priority     : 400
> refcnt       : 1
> selftest     : passed
> internal     : no
> type         : skcipher
> async        : yes
> blocksize    : 16
> min keysize  : 16
> max keysize  : 32
> ivsize       : 16
> chunksize    : 16
> walksize     : 16

Oh so you did actually get them loaded.  You need to run tcrypt with
mode=500 instead of 200 to test the async ciphers.  Does that work?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
