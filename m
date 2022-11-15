Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52C4C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Nov 2022 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VQT6ACdnpnGXMgCvY69esxca0mI7clPCz1zPODeQu0=; b=xbYe67ggzaOYfj
	Jy6n3gOBOfIoUUsR6/6OTlqg6x28quZwvbKy8cUjpsS12QIU3+6gvkK9W+yT66CQsFvCo4yEmcdoB
	7O8E9+EG7gfTNZ+mqs8UhOlFBrYG2n5EFZZAyoDZDGTHQHZPglplSV0IJCJhfGMZ14GeDftUPX7MA
	834hAca2pIgk1ckVESTl+gvAFYn2HN3ZRRUKsKZzpZ/ctbk4+FRfm6pavI0hOBOSjzVaINVbMUUSk
	4JBgjkuW7AJB9gikIj5yTZO26IO0P8afOk1REJnD5fhpnRFz8F6uGyF7D0P3OUoE4dt4rvgN9Bt99
	ZsVDujTW6id+vb6u/6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouujp-00AqRK-9Y; Tue, 15 Nov 2022 12:08:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouujn-00AqPn-1X; Tue, 15 Nov 2022 12:08:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D71FB81687;
	Tue, 15 Nov 2022 12:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38644C433D6;
	Tue, 15 Nov 2022 12:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668514100;
	bh=R61j7XvFsjKOIGH8lnB32pQtEXr+vA8qj1O0QUXEaRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hx/O2XaWQYMEROQxzdBxuKSHYCYl34im56uhTkwbkT21OFS9IwoWQRYp1PmJY5HkB
	 YR7MiU/850/8oDiOu9aVDg5JYBDly1HQIP9h/BTy4exS3wfQA1lZ3kEIQ/hVFCJMl5
	 wyxkt6zwCd4D0d5biedQF78/hMGeYjESNsfD/Tn7rx6rbmudi60ALNz/U3NRMKenU6
	 9cBHCsQJ5oqRYWWm2xQnEe2gTgPTNdM/jyOfggZgCmEgBwhBd3E/KGLnE+1SbhylOC
	 MpiB1tPiI3u4JWe9N+A9Dpsn4hkaciDWC2fuMOnAegvb3VWbhI0khGYwa2GqEypvxK
	 2zGJgQZfo1mRg==
Date: Tue, 15 Nov 2022 12:08:13 +0000
From: Will Deacon <will@kernel.org>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chris Healy <cphealy@gmail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	Chris Healy <healych@amzon.com>
Subject: Re: [PATCH v9 1/4] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
Message-ID: <20221115120812.GF32523@willie-the-truck>
References: <20221109015818.194927-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221109015818.194927-1-jiucheng.xu@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_040823_246482_87DBEC9E 
X-CRM114-Status: GOOD (  13.32  )
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

On Wed, Nov 09, 2022 at 09:58:15AM +0800, Jiucheng Xu wrote:
> This patch adds support Amlogic meson G12 series SoC
> DDR bandwidth PMU driver framework and interfaces.
> 
> The PMU not only can monitor the total DDR bandwidth,
> but also the bandwidth which is from individual IP module.

This doesn't apply on top of 6.1-rc4.

Please can you send a rebased version for me to pick up, excluding the
final .dts changes as they'll need to go via the respective SoC tree.

Cheers,

Will

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
