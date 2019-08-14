Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD14C32753
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 16:47:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70CF620665
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 16:47:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UifFIMUn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sS1u4khw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70CF620665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hf035OnHZlfM3k+laTK/qyqsja+Mkfmx/ITGsLUwAUQ=; b=UifFIMUnKZmT9r
	hwc11j/Dv6Y2L7/rf6Wbiiv02E4So1bUk0ZXkiTNd6TvulomwHpq9ArK5Dk3dX0XGYoh4Q14BTwbh
	p3Vio6/knR0m299VfRzeiSZC0JqB23zKvvdI5cbtu4hNJ3bhURJlgj/PCiiNJLQnRqjNr1/6NFhDf
	k7+hrS6L+splKo7J4cenP0wSGCAN04PSxU+di/jA2Vs2tqI+HSpIA273NlDWuBaJs2rSbKffFA9Bf
	Mz+pzfv4QWYIQe/6GCu4SA6IZ1/o1YzbSXE57MOm6Xa1l6uLfjR1E7j7f7Gvk7F9eB7reNvqAwx75
	eGd7/aDvGO3hpwtY63Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxwQk-0007zW-F3; Wed, 14 Aug 2019 16:47:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxwQh-0007zC-NW
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 16:47:20 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3123220665;
 Wed, 14 Aug 2019 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565801239;
 bh=hrLkt9nUrAtiNUI0NPypePWmV6ZE8myEedzY2T161BU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sS1u4khwMRaP6+SV9Xcf7z21SCJ5myrPvWtsvjbuL8h4meSvhVi2Zv62oD8T1Na7c
 ipKmR82AFRBTT5Wi5ZucDBJFx+BBOm42ZPQgFTPN3gTJvJ/FVcblWlVmRaGF+SyGcG
 n68F9hVMU8ZukSo1RK4yTi8/dbWZjIlGe98lknE0=
MIME-Version: 1.0
In-Reply-To: <1jr25qivi8.fsf@starbuckisacylon.baylibre.com>
References: <1jr25qivi8.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: updates for 5.4
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
User-Agent: alot/0.8.1
Date: Wed, 14 Aug 2019 09:47:18 -0700
Message-Id: <20190814164719.3123220665@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_094719_789382_55F0A1D4 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-08-12 02:27:27)
> 
> Dear clock maintainers,
> 
> Below is a request to pull Amlogic clock updates for v5.4.
> 
> The main changes in this PR are the migration to the new parent
> description method and DVFS support on g12, based on notifiers.
> 
> Kevin requested a tag to test DVFS so sending the PR now so he can use
> it well. We may send additional changes later on.
> 
> Cheers
> Jerome
> 
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
> 
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-1
> 
> for you to fetch changes up to 1d97657a4794ab23b47bd9921978ddd82569fcf4:
> 
>   Merge branch 'v5.4/dt' into v5.4/drivers (2019-08-09 12:12:58 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
