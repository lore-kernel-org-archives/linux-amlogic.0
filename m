Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A588C88E4D
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 17:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWqfkqkDyrLGBlUJUMiY+svZANS/xCbnIfbgjXIYKBE=; b=m+Iu72rLRhkyxc9gng7JOXdv0g
	eklCsex2bzZ0rcRgllhf8LIiyTEmgoRk0wuflPDm1A38OJs+/BZkHe8TgXV9L/8CBpyUqLbVHcEp0
	tR/Y3OrxbI4Ee8vboJTuRM4koQrr+0SGTd7gLdoRpwWJO54e8sxFxOFG0RxVGopmXqXxhCtzd5UA7
	y/gt34Tu2hTQTCdrBj42t6+shafsHE00ZAnEE3zinkx4OTg1hpaN6tWpDiU6Q2UUTLtvzPXl4e4WL
	sPYdmMrNRNHgWKpPtzWzAInYUpv1gQeGzyiGaouYAO5n1pYtColyi10AM4ilJLT2UzXDETeKkj2x1
	ACNkNfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55Sk-0000000HObT-2lsa;
	Fri, 11 Sep 2026 17:54:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55Sk-0000000HObL-0bCk
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 17:54:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C66A60008;
	Fri, 11 Sep 2026 17:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D841F000FF;
	Fri, 11 Sep 2026 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789149297;
	bh=8cxjmKiY1sOm4ulmfevoosxn16poSMCFfGh2sHVKhUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k+yDUymr3tSJlZLIn9Z/GA2guz5UToealWDOSdnAPZ0OHg1NSZrtNcBS/kBhfBze1
	 peiftt8Ucv3tH03HkY2YeC4icyGtUaU1yJz68k0aMNcZeDybewkMw6tcbvOrAy3uAb
	 bm51ys9ncDWVy2jGE85HJ0m+v1B8hgaT/xDn31Ff4pTBe7BXK4TdEWfwBuQpSVf4Np
	 a0v9j7Lbr7cdPEUJefFUve/s+Jzo9cLCy54kMDk+edBm0LhmxAPQ8IBiChbUnsalLD
	 +2ryb/xnB5yt/ldWKAwqGVZ0ML1iB+NV/HjpgJsFhlqfM7kXifR4AiEEc7NVsLvzRX
	 t8zZWx4Rq8pcg==
Date: Fri, 11 Sep 2026 13:54:55 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: stable@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6.12.y] clk: meson: align gxbb_32k_clk_sel number of
 parents with actual count
Message-ID: <aqRAbyxpEnKlOXOu@laps>
References: <20260910072139.313775-1-jbrunet@baylibre.com>
 <daily-reply-0030-re-clk-meson-gxbb-6-12@kernel.org>
 <1jik4c6imt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jik4c6imt.fsf@starbuckisacylon.baylibre.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2026 at 03:07:54PM +0200, Jerome Brunet wrote:
>On ven. 11 sept. 2026 at 07:20, Sasha Levin <sashal@kernel.org> wrote:
>
>>> The following out-of-bounds read has been observed by Christian on a
>>> GXBB WeTek Hub:
>>
>> Queued for 6.12, thanks.
>
>Hello Sasha,
>
>In those instance where exact same backport applies to multiple versions
>how do you prefer to handle things ?
>
>* Just replying 5 times as I did ?
>* Just reply once with a note explaining that it applies to other version ?

Hey!

Either works - so whatever is easier for you.

Something along the lines of "[PATCH 6.18-6.1]" is what most folks use.

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
