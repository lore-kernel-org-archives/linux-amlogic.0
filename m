Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AD5CDB474
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Oct 2023 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AiSa3ilEwC6RBDzMOTF9hK+lm6TzxcYM6RRzrLZjoNI=; b=ziyaaCE/UfEVDE
	I/E4dT2XW4VjcbZBXzzrTwdzcvRfKK+cdarCI9tjCZTSgjsH/SLH08NDmU/K+7rDg1WX8M17tC11o
	3BlmSDzmlo4awIMwAuMaIjpy/VETdMeXJ4pZOGaVtfhX7GLNwnHpv6Hr2EcYjd6aE9b8h+Zsth5oo
	r7tH6V5l06GUg5iLF+OrDsJkfvf4OOhUaWq1ZDuVIGp7/VvHR1vQiueA0q5p5rhfTCZaIQ1Nt3bs1
	7lbbelHjmtiCWBTchCF8RvR9F30riyNkFxKda3Wd/nUQC/fz5Yeo1QzocPq5yIpdw9XDABOgdCN+l
	oSvEhcHRw3+SslaGX9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjqq-00CM6b-1U;
	Tue, 17 Oct 2023 13:11:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjqn-00CM5g-1c;
	Tue, 17 Oct 2023 13:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64ADC6150C;
	Tue, 17 Oct 2023 13:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9C1C433C8;
	Tue, 17 Oct 2023 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697548268;
	bh=crP2Q6lKGLJtFT7a6m4r7m8MiXo0QO9LTQxNQRWK3Z8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HvP+rcmUghZEfoEP7vk1vj9ARvr+1YE0fLsJpwGIRirSb8wNlmZMilKjYWXPCW08D
	 A8PoGuZV0qtUh8afH9+Og7gX4q8gfRX0upaCSrusNhAbcWYO/Th9kxhN3Unykvgftd
	 GhVoTpZbQgiV1c5VXQjgX/HSXZz+r75gnmo9mzyjIwamCpg6QSFoFxjMB9oVTuVdiO
	 hrsNu9QfD4bK6qsBLU6O9ImHTAgUT5TZQpoih0j7LpStIRccXm9NmCn0HTZlFQ3isP
	 SCd8xWUSWb2ogwhHcKfSmMnVE1rtsQmQibnZ6ri5Kjl92rkIa5trlFWGk+TNms/0CB
	 NGe+n5Rt3LViA==
From: Will Deacon <will@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] perf/amlogic: add missing MODULE_DEVICE_TABLE
Date: Tue, 17 Oct 2023 14:10:59 +0100
Message-Id: <169754257300.1684180.5817305296970667269.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231012103543.3381326-1-m.szyprowski@samsung.com>
References: <CGME20231012103551eucas1p2422c1c7ace26714addeaadde8b645d4b@eucas1p2.samsung.com> <20231012103543.3381326-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061109_606313_B009C679 
X-CRM114-Status: UNSURE (   6.80  )
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

On Thu, 12 Oct 2023 12:35:43 +0200, Marek Szyprowski wrote:
> Add missing MODULE_DEVICE_TABLE macro to let this driver to be
> automatically loaded as module.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf/amlogic: add missing MODULE_DEVICE_TABLE
      https://git.kernel.org/will/c/32269e09b137

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
