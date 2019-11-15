Return-Path: <SRS0=o1hk=ZH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CC7C432C3
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Nov 2019 06:07:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2841920728
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Nov 2019 06:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="il9YMdg8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2841920728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PdnQ5kp9bS/NJ/zjr0g4NH/kccCBIzsjz+WmpKeJfC8=; b=il9YMdg8Zm2CGl
	W4GM5iWiqA5JQ2FJgI0DAuzf/8SolbF9EIY+gVDHdjES1Mdw2AmsyLq2EBKnB4Tur7hIUqThK6+8d
	k3h3xRwD4TmkG1atTYi1TeX83EM9Di3rvLhO+U6XBa/2G5NtMAUUHctvQgd9tgfH1o0+LyKE7EQCp
	sDU/BpwiLUjXBYS29+hm7IzQwMCxgdP2QLZ+9f2KYlME937m6CDyzRIyPEdKBXQ3j/1wNglL8kiqA
	Ty8Ln+02LWjDXWa5YUxgDsyj2953fn6RKLkB0Pu+mo33X9jRes3CTmfhPSCvorNCWA4w7yBZJtQP1
	niP9SepXmgYnhE4y5w8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVUlI-0007ZS-2y; Fri, 15 Nov 2019 06:07:16 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=deadmen.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVUlE-0007YO-TA
 for linux-amlogic@lists.infradead.orG; Fri, 15 Nov 2019 06:07:14 +0000
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1iVUlC-0004lr-5s; Fri, 15 Nov 2019 14:07:10 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1iVUlC-00067e-13; Fri, 15 Nov 2019 14:07:10 +0800
Date: Fri, 15 Nov 2019 14:07:10 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: add linux-amlogic list for amlogic crypto
Message-ID: <20191115060709.slerz6ffzre2sjza@gondor.apana.org.au>
References: <1573207986-26787-1-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573207986-26787-1-git-send-email-clabbe@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_220713_083445_6DEF589F 
X-CRM114-Status: UNSURE (   6.93  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Nov 08, 2019 at 10:13:06AM +0000, Corentin Labbe wrote:
> The linux-amlogic mailing list need to be in copy of all patch for the amlogic crypto.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
