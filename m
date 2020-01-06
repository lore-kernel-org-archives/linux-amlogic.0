Return-Path: <SRS0=vBZN=23=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE7CC33C9A
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2020 03:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B042320801
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2020 03:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DvM0vfcx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8jLcelH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B042320801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:Subject:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfOc6znSJkoGpJF/H33HnyZSphLEpiiKGcjYEBAxxXs=; b=DvM0vfcxk75jGy
	GOEzhIDwyJQ84a0s41SRMWK/OEwSi6+VWOrlr58ztHhy+eHD1M2rwizab6oz1PdBC8N6uCKn2fHAz
	T94npqgqk7QGbJNSUTL6c7pm+0f3CpbBLwxoX57DsS2qRMf7GpGdiqx2eH5BNJrTul+Rfok2ztuIR
	pQTKvBanuFaIFf94BcCk0dc0zRa4WTtR2AAMBId8ZzrHPpAWch1teComKr3pRE8f697k9rBw5IsSu
	f7u4t0mao0+vBX1NtA2NZXyIwqTlQSy1zLv4UvtqxMyCqXgM5/MKnJVhxugKDGmWjVoQw+10AOndb
	Q3hLMnCHAq2r+1ngxlQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioIfi-0005hE-4T; Mon, 06 Jan 2020 03:03:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioIff-0005gk-Q9; Mon, 06 Jan 2020 03:03:13 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6538820801;
 Mon,  6 Jan 2020 03:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578279791;
 bh=CNeeKXcxdQM66JWLklaMOAzOty0uI/w8076uzZzgDRI=;
 h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
 b=B8jLcelHLRRSOCy+vJWPw+k53NEYrT9FYA57S9bX/rSFrb1QnF7jiZzenQE97Bki8
 bmLxQ9wbVrMV+s3MvgbJ7IelLc0T3WRD4sygIpTAo27zyJ0oW184daAwo9vXsqoCR7
 UJnYZl57w2F4em23l0WDNz1ohcgOJFr4qSBL+IXY=
MIME-Version: 1.0
In-Reply-To: <20191226191224.3785282-3-martin.blumenstingl@googlemail.com>
References: <20191226191224.3785282-1-martin.blumenstingl@googlemail.com>
 <20191226191224.3785282-3-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/2] clk: clarify that clk_set_rate() does updates from
 top to bottom
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Sun, 05 Jan 2020 19:03:10 -0800
Message-Id: <20200106030311.6538820801@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_190311_875312_72880A1E 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Martin Blumenstingl (2019-12-26 11:12:24)
> clk_set_rate() currently starts updating the rate for a clock at the
> top-most affected clock and then walks down the tree to update the
> bottom-most affected clock last.
> This behavior is important for protected clocks where we can switch
> between multiple parents to achieve the same output.
> 
> An example for this is the mali clock tree on Amlogic SoCs:
>   mali_0_mux (must not change when enabled)
>     mali_0_div (must not change when enabled)
>      mali_0 (gate)
>   mali_1_mux (must not change when enabled)
>     mali_1_div (must not change when enabled)
>       mali_1 (gate)
> The final output can either use mali_0_gate or mali_1. To change the
> final output we must switch to the "inactive" tree. Assuming mali_0 is
> active, then we need to prepare mali_1 with the new desired rate and
> finally switch the output to the mali_1 tree. This process will then
> protect the mali_1 tree and at the same time unprotect the mali_0 tree.
> The next call to clk_set_rate() will then switch from the mali_1 tree
> back to mali_0.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
