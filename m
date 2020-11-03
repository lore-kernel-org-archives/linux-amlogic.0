Return-Path: <SRS0=c+5b=EJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7A8C388F2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 01:54:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 613D122243
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 01:54:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LKA3lnOf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/VPqWr1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 613D122243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lPHdanGf9F+XI7B+Ww+3JFIqiRSJeoQX4FzNyGLqmok=; b=LKA3lnOfmpIuciD6J3jZP3Qaw
	3OCmhDQ3E4qMkaFQn1HlVV6sJhkyoX/odPZVeBzxbrH/Qu5oOd/1BpgoYoAIPn86CGqRQK4yN+Tii
	8UIRhjM+l6x0EQI8EdWxcOq88GGL4fewtYHF4dyDseO5y6tiL5KkGZm70Vzgqe3MTuArCVsJet/Cr
	64W5nd7ojZjjP3MHb1J2n1PrRuRr8eKZDI5H3czsJK8x+pwcifurCRj691iEFY9pkn5vFNbNmFmtU
	TZDVKSHuLGdZ+IVa24UYkBGioyrZZiug1F7mtF+EG/MRCnPH7h4jbynVBX2FrHy2GfgsJ3zMJPE6l
	gO84xfSeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZlWQ-0008Ox-CE; Tue, 03 Nov 2020 01:54:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZlWN-0008O3-Lj; Tue, 03 Nov 2020 01:54:04 +0000
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4FD721D40;
 Tue,  3 Nov 2020 01:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604368442;
 bh=jTBDUd/sABFOHCwWC8ddceR41OFXoed4AKLUR43RnR4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c/VPqWr1so++LBT2aQNBLfFBJC2xvJ5MUBk8EHbGHVIycwsTz0zSf3Xjm3ZT9hFkh
 Y1G8HH5DoMob2JqVu3v4PtMLQY0c+mouLtL6DJ98t2ureB3Eh1dRi9wq8QlfoDIDFL
 L0knRnde3ib4xNTg4qmorG3LibljefWk6KvFF7cs=
Date: Mon, 2 Nov 2020 17:54:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: trix@redhat.com
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: remove unneeded semicolon
Message-ID: <20201102175401.091b384e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201101140720.2280013-1-trix@redhat.com>
References: <20201101140720.2280013-1-trix@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_205403_798153_9F25B176 
X-CRM114-Status: UNSURE (   7.93  )
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
Cc: alexandre.torgue@st.com, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 peppe.cavallaro@st.com, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun,  1 Nov 2020 06:07:20 -0800 trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A semicolon is not needed after a switch statement.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied..

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
