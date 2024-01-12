Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79586C47422
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jan 2024 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQN6Kz1KbaOT7bTuYHQmDcNz/eV9IwubCT1Hv24ZgGE=; b=H80utXJ/mxkFsS
	D7SClMUtccI0NYVqAvIUHW8grux8z8YLyP5vHYXuQ34UTF/erR8Ut3Jm78Ab56JLk6BapH7/rUv/X
	f0llwCcN1usYTo+qb8zCIueNgGKD+stASnmHE2lUYGyqmbyFIwNfjVXwazBvYGAHjuJanJtFzTWCW
	BXV8/zR44b+w7J3nxzEUQFbK3+AEF16RPY49kaghD90WQUkO+hydrJyY5tLqFDk2DJnidW2C92AmL
	qzoOo2oNIBY/uO+hot0cWxq439DaBp4s96Ar39kEoGTO3rqHT6AQbA8P3KXIYpiHmwi/FcC2GiLqh
	kWQieX1pk8DGqlGZwwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOHvY-002xap-0c;
	Fri, 12 Jan 2024 13:50:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOHvV-002xZP-1W;
	Fri, 12 Jan 2024 13:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F2D90CE2253;
	Fri, 12 Jan 2024 13:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D5AC433F1;
	Fri, 12 Jan 2024 13:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705067418;
	bh=2GBsmlDMuRrcjc2Hma/6Rsppr8bfpOi1zXgsvajbU7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3QPwCi8lSUlKn9lVR7v8i0+OSGblLUhqlsqZKv6AReHbWezDzAbl5Ek0HuC1CMbH
	 hn/K732i14ODy4j2Gz5t8iq1wiVIrk3MHXTxnaaTe4Io23MZhxn1BkFS0xUqAwdZHg
	 Vz6QIeDaCfTzD9YbJgKaCHyNxhIMTmMuWDE+DJ3FgKiZPEPzEeUOKGALfd1OgO60AN
	 cFFoMfQYsZFxQAZCdn/15HZoag1q5sVA2/btsTQxSYdhbfTLInbvYY8Xc7ABrVUw9/
	 zwYQM6+8NRSDNSlwnhPXE+pdEGVIQVKm32r90zeT7MyJ/h93VrME76gBc61jsp553F
	 LDNABLAzw/HEg==
Date: Fri, 12 Jan 2024 13:50:09 +0000
From: Will Deacon <will@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Raag Jadav <raag.jadav@intel.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Frank Li <Frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 00/18] perf: Convert to platform remove callback
 returning void
Message-ID: <20240112135009.GA16771@willie-the-truck>
References: <cover.1702648124.git.u.kleine-koenig@pengutronix.de>
 <vlnl6og3bts5hcdjw5h7c4km7zolzuf6h7cwyfymjzan3uqjwy@rsra3lqdhou7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <vlnl6og3bts5hcdjw5h7c4km7zolzuf6h7cwyfymjzan3uqjwy@rsra3lqdhou7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_055025_697093_85700DBD 
X-CRM114-Status: GOOD (  21.21  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Uwe,

On Wed, Jan 10, 2024 at 09:56:26AM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Dec 15, 2023 at 02:59:00PM +0100, Uwe Kleine-K=F6nig wrote:
> > this series converts all drivers below drivers/perf to use
> > .remove_new(). See commit 5c5a7680e67b ("platform: Provide a remove
> > callback that returns no value") for an extended explanation and the
> > eventual goal. The TL;DR; is to make it harder for driver authors to
> > leak resources without noticing.
> > =

> > I based the patches on today's next, I had to revert commits =

> > 3115ee021bfb ("arm64: perf: Include threshold control fields in
> > PMEVTYPER mask") and 816c26754447 ("arm64: perf: Add support for event
> > counting threshold") to compile test on ARCH=3Darm (this is a problem in
> > next, not in my patch series).
> > =

> > This is merge window material. All patches are pairwise independent of
> > each other so they can be applied individually. Still it would be great
> > to let them go in all together.
> =

> I wonder if this series is still on someone's radar. It didn't appear in
> next up to now, so I guess it's too late for 6.8-rc1?!

This came in during the holiday period so, by the time I saw it, it was
too late to land for this merge window. I can pick it up for 6.9 in a few
weeks, though. I usually start queueing stuff at -rc3.

Will

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
