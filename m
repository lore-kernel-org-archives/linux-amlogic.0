Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4C8C46CD2
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jan 2024 23:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJp/q+/3pSVfWPmbfi60hx/FnRYgGoTMMRAwl+e/mPc=; b=grkFyZeQf+dL32
	yLxy9e3xJ26J53dezNGhYXbxzYwzyfEuns4d63Yzy/qRN1y8UcSSTZyjqNKhGzQKW9t57SD8K8V14
	grhvUl95fjUre+RiBqemPI3hAiM/3gmN2jG4LICzEjHhYMut4GAQSJ2Dv+6/outq2AxUN63GxjbFT
	FC/gDxKp1I+DoxIUnXdt/ZVn3DZZGBYgs1X/g79CGyr8lUW1oMPD1QCdAPSYql6Gum7ZfgZsh6SzO
	0Yh0C+tnIR4SLirhr/jemWtKJI+OVxhbRyoWD7OKYUjKvVhucII0xQsNudQlz+apVztboFsZ6DICx
	1lJo5l3OKRG6bDYaaWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKoH0-009JKx-1D;
	Tue, 02 Jan 2024 23:34:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKoGx-009JK7-0O
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jan 2024 23:34:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BD27612B3;
	Tue,  2 Jan 2024 23:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D17C433CA;
	Tue,  2 Jan 2024 23:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704238450;
	bh=WdepfEda+YXgv03KGYsOVF0L11R3Jotno5U9Y+c+TAw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h3ZE47LjM5boSq4RLVHmKErAtycl4JyTdvNrZ3PxDxYKvwG4TPvt4O4aNmSw5TLgC
	 AcSP/MYVa6BITFIehFgFK0hSo3RyInNOWVG67+DfMDaJcW0xlITSwcoPnszCdppSBS
	 YFWIPEsCPiepqqFN2OoFDAO1zmBCdz45egLiFwrN3KE3xqlZfpJD/XyVzmrD6K1wSS
	 C3jeTXS25kPl9t6q2AM2mQGgcg98FVguHpelPMH0rh+s75IU8wW1I/3KVO/65p+KgN
	 0trbD8rDBghJfn7RGkPJLcoGQIzOHBBZ6mPZP16fFM+t/93VVjCu/21xNzpkw+Mr8a
	 WCB137KrVv5GA==
Message-ID: <6276336e185b0c347a17722b9582edbd.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jzfy28qdf.fsf@starbuckisacylon.baylibre.com>
References: <1jzfy28qdf.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic clock updates for v6.8
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 02 Jan 2024 15:34:07 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_153411_812155_24BA3FDF 
X-CRM114-Status: UNSURE (   8.04  )
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

Quoting Jerome Brunet (2023-12-22 02:41:11)
> 
> Hi Stephen,
> 
> Here are the amlogic clock updates for v6.8.
> It adds few new clocks on the g12 SoC family, for DSI, CSI and the ISP.
> 
> Cheers
> Jerome
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.8-1
> 
> for you to fetch changes up to 5205628ab0bfe64952974d476ee001f6c7e0ef7f:
> 
>   clk: meson: g12a: add CSI & ISP gates clocks (2023-11-24 18:08:48 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
