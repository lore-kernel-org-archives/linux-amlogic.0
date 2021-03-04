Return-Path: <SRS0=6QAM=IC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AF6C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Mar 2021 06:44:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C3E64F07
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Mar 2021 06:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3C3E64F07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BCmvtosYVXYdOjiC5cEP0cH3sb9YWokelnBKRE78NqI=; b=QpmJQ6Tsw4CgN708c7YdMV9Bx
	r1s/LoX1aXBFjVqLBfcyeiFWRMMiU8tLNUTFjGrzwOv/bJS0SFxsaijlfkrLf6VscHd12T780TJx4
	SspAzJS0WXJlkMqE2su+g885gBwDjSls0GdjJymEfDRzeRa25bFvw+akg9TPX53MQKf9ACA+5ABF3
	vmYrx1Q3u7nAlbzaLGgA0S9SB7YQbKvSQbAg7qi3uu1mncCgSOwGitekmLWzIw0jplCsZw6J7sgga
	9Pb2oQVGPUtPlw3pmXEuNAiYEp1AMuUVtrNrS+udAfqs+/qNBy0i1CfuJCSoh7lYQdF72yRvcqrdX
	VfG6P9LCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHhiX-007x60-U5; Thu, 04 Mar 2021 06:44:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHhgg-007x0K-Np
 for linux-amlogic@desiato.infradead.org; Thu, 04 Mar 2021 06:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3yo8FEkBKFisotwTVSux53SzjtvQG/UisF6aOunLhjQ=; b=CACncNya/mQE+vhDXux54Mcv9S
 c252JlLnufjzgnFn/W+jdlW3yjuyybKorugpbRSj+we6dqDHhYmcj+YLFJmr0JDswcBJ578ek3XqF
 MGqUyTyJ+xsRid6yMKgMRBfQcvubK2MS1FQvtBPkZa+lGgIUEAPXnz4VPuCtIMwzn/FMMQEBm22hx
 c/9rphap2gHpkgXmPTlggdI4fZ7+1yJX7FlqkXzmZXHRcJ/2DaA7pvdw766yAf4j4a65RjzPvk/3k
 CnwhiNmC+R4gzoDzeUQxQChI9LA7ofMpMJf2QEaee6vkzkJa9tB8xR2yH9pa4Hu2kd9BW/4NQrhTH
 NiNmAKOA==;
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHhgZ-005tcB-Bj
 for linux-amlogic@lists.infradead.org; Thu, 04 Mar 2021 06:42:12 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1lHhgI-0007Ye-KG; Thu, 04 Mar 2021 17:41:55 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 04 Mar 2021 17:41:54 +1100
Date: Thu, 4 Mar 2021 17:41:54 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Cc: clabbe@baylibre.com, davem@davemloft.net, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: amlogic - Fix unnecessary check in
 meson_crypto_probe()
Message-ID: <20210304064154.GE15863@gondor.apana.org.au>
References: <20210210031637.19408-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210031637.19408-1-tangbin@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210304_064212_026301_FB493F56 
X-CRM114-Status: UNSURE (   9.09  )
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

On Wed, Feb 10, 2021 at 11:16:37AM +0800, Tang Bin wrote:
> The function meson_crypto_probe() is only called with an openfirmware
> platform device. Therefore there is no need to check that the passed
> in device is NULL.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 3 ---
>  1 file changed, 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
