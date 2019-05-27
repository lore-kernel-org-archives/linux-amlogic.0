Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8837FC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 15:29:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F0FE20645
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 15:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c+tMRCtn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F0FE20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=siol.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuYzhSUqrzygtTyZ5JmeOONG0Ln6JNB+uH9aGZsbENs=; b=c+tMRCtnrZjXnB
	VBCWnl48CkZK9XbyB5b3RMw/WTCYFWiqSSnUOM6Bq/LFNQEfHcvXNjzkiBKxIpL6IMutXPjYrD8dU
	bq1WrL2bOpBfj/5w8ecvHYpc7AKAVbbJlPCp/X2/Kr4B5dOwPp3X2dRM5SMkC0ZlunI3VtjvONXhj
	VXcUg0eDDaA3x554vDQw5h8/D2byLnR7DISO7DPYvXC+DcATgW9cP92leuKmt5xrZnqBCNskjrl/j
	i0kWbg98GZiESIorEA/om04D0ROrOfNmRMDkn/8HkZmDtHA+DL3HXXtEFTazbnUfjYYET3fkgvggZ
	3OVfvwYSNf8qH+u4ksJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVHZR-00074Z-DM; Mon, 27 May 2019 15:29:53 +0000
Received: from mailoutvs56.siol.net ([185.57.226.247] helo=mail.siol.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVHZO-00073l-40
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 15:29:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id AB104520C06;
 Mon, 27 May 2019 17:29:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id D9ETVfFkE8JX; Mon, 27 May 2019 17:29:36 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 5733A5217BC;
 Mon, 27 May 2019 17:29:36 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net
 [86.58.52.202]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 9F19C520C06;
 Mon, 27 May 2019 17:29:33 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/5] drm/bridge: add encoder support to specify bridge
 input format
Date: Mon, 27 May 2019 17:29:33 +0200
Message-ID: <2679412.W4MLjRXsPJ@jernej-laptop>
In-Reply-To: <20190520133753.23871-3-narmstrong@baylibre.com>
References: <20190520133753.23871-1-narmstrong@baylibre.com>
 <20190520133753.23871-3-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_082950_324514_EC7F43B9 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: heiko@sntech.de, jonas@kwiboo.se, maxime.ripard@bootlin.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi!

Thanks for working on this!

Dne ponedeljek, 20. maj 2019 ob 15:37:50 CEST je Neil Armstrong napisal(a):
> This patch adds a new format_set() callback to the bridge ops permitting
> the encoder to specify the new input format and encoding.
> 
> This allows supporting the very specific HDMI2.0 YUV420 output mode
> when the bridge cannot convert from RGB or YUV444 to YUV420.
> 
> In this case, the encode must downsample before the bridge and must
> specify the bridge the new input bus format differs.
> 
> This will also help supporting the YUV420 mode where the bridge cannot
> downsample, and also support 10bit, 12bit and 16bit output modes
> when the bridge cannot convert between different bit depths.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
