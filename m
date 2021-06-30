Return-Path: <SRS0=U8YT=LY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8CAC11F65
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jun 2021 18:39:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C7A861420
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jun 2021 18:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C7A861420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKZY7zLPqC6W4PjW1K1Ahf6fOzifF2Aal3Nd00K2UVs=; b=hW1yvOz0yMEClE
	EnrZvzSR4DnacWzdD8GGbmQxKre4Yf0N2ji+h01BUThI4bXsvZeBEjp2ifPicYOl8PFDXm/Vxexga
	R2gkdbmRU4tYw8JNnVhv6a0BmV7aJNagG3Sw9LLsdTJBPj0wDL7o3iFj84JzGuVqIEaAV3OLs7hkb
	vnyNhyl19EKA4Y2oiu5SOurfzfnFM49KoZyKCRVQo1ZV0lzDcLlLIutLlglo2Jnnx+KV3S1YABRt4
	NCoYqGYcK9dDsOOWNyuZisbEUMcp8vpjQUlcBvGC+0laiQGYrc/wNLz0mbZTubm5UFQuli11uWFeu
	AlIzjq0gBYdtxN4ZbbhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyf7Q-00F0oM-G8; Wed, 30 Jun 2021 18:39:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyf7F-00F0l8-Em; Wed, 30 Jun 2021 18:39:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10776613F1;
 Wed, 30 Jun 2021 18:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625078357;
 bh=FOBQo1OgPE61390jL8TCzD2bmnI+UvkFZuPZ0xnshbU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=g00tUWg2eYAaqMx7Vf2uJnFdKcNf2PF243by4nQ6QaeL1uLLjiyz5XdPLbk56cJFw
 L74NXlt49rJ2GXfR+TaIGKh1nTvMxf3aD1Rx6iHb4k/fVukrZOnWBLkSo+lgep2fw7
 J7qq5k9pXtktcQWsrkt9Xgz6X3c5M8MYTsHpnhC8nqzqVXO1XWcSmgrqgX6fE48FR/
 LiafHRJRtWH2xUx+zlwO+NIeIJhU98SW93py0hmNsxQjU7O61+AWFuBATVMd9UYStE
 XrI6YtiY5WVuh0kQ71jUmSPXYPh1LdzkdA/gKM7ITy9qt5WORo3f3U1eqxWAoW4qRq
 wXjq5jbxOxyxg==
MIME-Version: 1.0
In-Reply-To: <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
From: Stephen Boyd <sboyd@kernel.org>
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Wed, 30 Jun 2021 11:39:15 -0700
Message-ID: <162507835549.3331010.7414706391498029785@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_113917_555425_1EAEEFA9 
X-CRM114-Status: UNSURE (   8.65  )
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

Quoting Martin Blumenstingl (2021-06-27 15:39:58)
> .determine_rate is meant to replace .round_rate. The former comes with a
> benefit which is especially relevant on 32-bit systems: since
> .determine_rate uses an "unsigned long" (compared to a "signed long"
> which is used by .round_rate) the maximum value on 32-bit systems
> increases from 2^31 (or approx. 2.14GHz) to 2^32 (or approx. 4.29GHz).
> Switch to a .determine_rate implementation by default so 32-bit systems
> can benefit from the increased maximum value as well as so we have one
> fewer user of .round_rate.
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
