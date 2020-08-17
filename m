Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF586C433E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA8C2067C
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kjC1YkiR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPBQhW8O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA8C2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cFb0n3t+vvo6cMNzmu3Fs4MXRa2A8tzgaXlh649Pkaw=; b=kjC1YkiRmZ4hyLR3pHd8hXAyr
	VP7zKP27aChezu/UirGJbzBoXEYMjdCpu+Vov3wRsVSTkg29wSqeq+HtI0HBqYAarHbkLkc4RUpAr
	FVBIHoz6bZFxApyrQLNlNMtg4PnNkzvmjCXG2AHIKkqty7Hvqx7dC5ZbYZg3rDUfVPNHYBoxDjHNc
	AVup6XWyfYB+IsFeFQ8Lp0MLVdO3Dfj0PBnkQN1Zr5NsrYmZLLs6kvcKkXKzzLYUTYJEbo/piccig
	u6VnpDsfzeAPZNzk63YMSpqf1DkFWGZqWhyE9g6K61L0h4gaLG3cVWuDNUUONM8SDnBVXnJbg2qag
	BZm97tMLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFl-00023l-Mn; Mon, 17 Aug 2020 17:49:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFd-0001xZ-EH
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686532;
 bh=+DhmLcaVye2vOTvkJuIO1Vgkfm75NfROjn3U5/Jzaoc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=MPBQhW8O3Rvxl6Hhwz0sLqB0Smc6kO3MjOqvNCuMJj/YlwHVAT2chI7dFfw/bPiFM
 U7yGAP3Xm4nQd7/StcqdvUidUakBV30nBwE4CXojPDc7QjeLAslWm0qd5IqkUrWc+O
 2z5L2THGbkc5GHW9f6K5xtXttgTITU/P/iz5MbnQ=
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/13] crypto: permit asynchronous skciphers as driver
 fallbacks
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653218.32160.10971898010897300855.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:52 +0000
References: <20200707063203.5018-1-ardb@kernel.org>
In-Reply-To: <20200707063203.5018-1-ardb@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134853_578762_D3ABEA78 
X-CRM114-Status: UNSURE (   6.64  )
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
Cc: linux-amlogic@lists.infradead.org, khilman@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Tue,  7 Jul 2020 09:31:50 +0300 you wrote:
> The drivers for crypto accelerators in drivers/crypto all implement skciphers
> of an asynchronous nature, given that they are backed by hardware DMA that
> completes asynchronously wrt the execution flow.
> 
> However, in many cases, any fallbacks they allocate are limited to the
> synchronous variety, which rules out the use of SIMD implementations of
> AES in ECB, CBC and XTS modes, given that they are usually built on top
> of the asynchronous SIMD helper, which queues requests for asynchronous
> completion if they are issued from a context that does not permit the use
> of the SIMD register file.
> 
> [...]


Here is a summary with links:
  - [v4,01/13] crypto: amlogic-gxl - default to build as module
    https://git.kernel.org/khilman/linux-amlogic/c/3f368b886e95080daf811d228795c28716495279
  - [v4,02/13] crypto: amlogic-gxl - permit async skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/1d63e4557f0d11fd795c7acd50a241da2d8bf89f
  - [v4,03/13] crypto: omap-aes - permit asynchronous skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/6a99d7a2d73cbeaa0b93551fc8ec887295821bbe
  - [v4,04/13] crypto: sun4i - permit asynchronous skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/89fb00f245681d0c951cd889d3d165cf9959d70c
  - [v4,05/13] crypto: sun8i-ce - permit asynchronous skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/31abd3eb3df6bd520fece598e31047a0f377953e
  - [v4,06/13] crypto: sun8i-ss - permit asynchronous skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/44b591753731f12dcf5d8e72df69baa9f3c48921
  - [v4,07/13] crypto: ccp - permit asynchronous skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/413b61ce0b4de0e55a9f8cf91bbce1ad7e0870cd
  - [v4,08/13] crypto: chelsio - permit asynchronous skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/d8c6d1886c8f436da96c0d91010040ca7caae9ac
  - [v4,09/13] crypto: mxs-dcp - permit asynchronous skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/c9598d4e13ca0a6747235257a8e38cdef6973d8e
  - [v4,10/13] crypto: picoxcell - permit asynchronous skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/dc6e71c9d9cfef98b95cb6e7e91ed2bb64b63e76
  - [v4,11/13] crypto: qce - permit asynchronous skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/90e2f782719fc5ad2af63096815a69c5320704cb
  - [v4,12/13] crypto: sahara - permit asynchronous skcipher as fallback
    https://git.kernel.org/khilman/linux-amlogic/c/56ca499f1b58235d5b3f247a887cc636d849d351
  - [v4,13/13] crypto: mediatek - use AES library for GCM key derivation
    https://git.kernel.org/khilman/linux-amlogic/c/f441ba2ad34102692b9836923776f017b40afc88

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
