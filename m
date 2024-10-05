Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EE8CF8851
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Oct 2024 05:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gYjPWEdt8FujQ4/ydQSatJHXFMzoYgrOV5MGfKaw1gE=; b=sPX6PQ3Ozb+QPo
	s5+G9WPbPZsc4rThkunybGJksqFbhli61o2ObMuJj8AGwtzM/DYs3XtmUnwI8WqpfIXtlGoOHX86M
	M2c/jp0cCiguFsAC0eONypyIlC4VqBoWhb4TkNZ2e8JHMvYBPI7r0o6t1LsYgBPcdMM0jEO96i8JZ
	LJxYOzl6sMITd2mx2xIVGxTX648yukNgWlSAcJdiAuZ1BdhBj2rOPoxIdBjrGV+eBYGHJX+5gUxBp
	U18yO/dvLDzIqKRc7utockxzRidPjH9lol/zWXyrMfiMJZ2SwfPB8cbNRFtqt9aBIqG57WshyYmia
	84s2oqA/nnxBQGsSHr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swxMP-0000000Enq2-3HHN;
	Sat, 05 Oct 2024 05:29:45 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swxMN-0000000EnpV-2F3u
	for linux-amlogic@lists.infradead.org;
	Sat, 05 Oct 2024 05:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bgduNDVUW7IvjOOcmNkqrjQO4EKeMg7qKlVmi8rGSvY=; b=f+BallSlkzMTTgal6Cr+VOLySp
	nhwyNsi6o9+VaxF3sUOA2ymt649gi5QTyQhhycL8RLD7d7z7xWXn5g1n7xB7J9cw8fjJumEnxgBEX
	aeRQsf3zTIBHKYmG0MpfmABmjPV46c6QSF4twBiOl1U84ZRfWW+7oyuG9seetZHq9Da/+obbqD/Mx
	qBVw8D0t/Ni992msyDcC2W4IA9Huz3re843hB2un15Fa1IvDw02Ol7TRgVu785v3EoAohch/G7UWu
	UsW2zju5w2VXyhiQZ87yrBZCobAK8d4wlsu0lPI7zEVJ/OwV7FqKh1xU3Y0zZET3HyUwol1Ut7Anm
	HV9ANv5w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1swxCH-0071T0-35;
	Sat, 05 Oct 2024 13:29:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 05 Oct 2024 13:29:31 +0800
Date: Sat, 5 Oct 2024 13:29:31 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Cc: clabbe@baylibre.com, davem@davemloft.net, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	tangbin@cmss.chinamobile.com
Subject: Re: [PATCH] crypto: amlogic - Remove redundant assignment and error
 messages
Message-ID: <ZwDOu3C70Q1MwG-l@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911121751.1900-1-tangbin@cmss.chinamobile.com>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_222943_594890_7EC43619 
X-CRM114-Status: UNSURE (   7.63  )
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

Tang Bin <tangbin@cmss.chinamobile.com> wrote:
> In the function meson_crypto_probe, devm_platform_ioremap_resource()
> have already contains error message, so remove the
> redundant assignment and error messages.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
> drivers/crypto/amlogic/amlogic-gxl-core.c | 8 +++-----
> 1 file changed, 3 insertions(+), 5 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
