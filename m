Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AA9C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 06:27:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D25F022D3E
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 06:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D25F022D3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yPrraD8APQjBTy1EF4acQmIjqF1mAdC5OJcRZeVb4ps=; b=TyiNAnYSYswmsW+PowaJ20Xrp
	luHS7yWn+RWzvXYTK0Q23UJCwo1dJ6u6YDC8jhEHZPaUk3FzN3MnMOXQO0zv2YsJ7arYFgNG8M/Vl
	A02/tO86LxLIaRuz7ojch+j/RBgNlA5OTuHL/QnrJdeJuO9gYMTovas7bTg5opM2xi5A121BYQ8sy
	DVJ1+qx6qPrFkmFIfTtBabjFvoPdAr5iw02KQh2nNq9dr/rWl9lC7kgD+iGU3aO20yE7Ylioqax+e
	l/DvR5rUZYuG/WuxBKMjm1c5ahjsrFL7cC4NlSqVyBpXtrfTCn29aQDPHczOKAtm6XImKsWUHEHvS
	Lz7sTt4FA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klR23-0008GT-1v; Sat, 05 Dec 2020 06:26:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klR21-0008G7-91
 for linux-amlogic@lists.infradead.org; Sat, 05 Dec 2020 06:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607149616;
 bh=xh2ELT50oSaVLdd5L5L9+Aywd9ZFOZnSLphqXQRx0VI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=AK4VPZOjUiRAV/aIe4Wl8+ooY4U6Zkj2CRo4N6qz4nnuXgowtaK5Q8A1UaYWMm878
 qsrcjT730d/P0/zmFFBerCepRthRCruTRWuZVXcckoPueZa7VQ2zYYmyj50H1x7qiu
 vHY6X83fR+JPGf7J/KE6NkLpKBCWnVb8LvKnjO+ecvsTFIRwdUjoVVEE6xS0X8eTpa
 00R1pG3xZ1ddB0x7vDmNnUfCi2T2LzHz79SoIKDlv4E+3Yhza8EdIOEL+2mPtpfL+A
 vt7F9BOmLImgdaTsyR6tgVMgSLW3I22JJRLWx5CIYcKD5VKRNZoD5gdplsNlX68vVv
 SqJO7vk+WCP0Q==
MIME-Version: 1.0
In-Reply-To: <1jtut7yjj3.fsf@starbuckisacylon.baylibre.com>
References: <1jtut7yjj3.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic updates for v5.11
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 04 Dec 2020 22:26:54 -0800
Message-ID: <160714961471.1580929.6506196779990620974@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_012657_400117_D1B44833 
X-CRM114-Status: UNSURE (   9.31  )
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

Quoting Jerome Brunet (2020-11-29 12:50:40)
> 
> Hi Stephen,
> 
> Here are the updates for amlogic clocks for v5.11. This is based on your
> clk-hw branch, instead of the usual rc1, since it depends on clk_hw
> stuff you've already applied.
> 
> Please Pull.
> Thx.

Ok. Where do I pull from!?

:)

> 
> Cheers
> Jerome
> 
> ----------------------------------------------------------------
> Amlogic clock changes for v5.11
> 
> * Add MIPI DSI clocks for axg and g12
> * Make it possible to build controllers as modules
> * Fix Video PLL clock dependency
> 
> ----------------------------------------------------------------
> Jerome Brunet (2):
>       Merge branch 'v5.11/headers' into integ
>       Merge branch 'v5.11/headers' into v5.11/drivers
> 
> Kevin Hilman (2):
>       clk: meson: Kconfig: fix dependency for G12A
>       clk: meson: enable building as modules
> 
> Neil Armstrong (6):
>       dt-bindings: clk: axg-clkc: add Video Clocks
>       dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
>       clk: meson: axg: add Video Clocks
>       clk: meson: axg: add MIPI DSI Host clock
>       dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
>       clk: meson: g12a: add MIPI DSI Host Pixel Clock
> 
>  drivers/clk/meson/Kconfig             |   7 +-
>  drivers/clk/meson/axg-aoclk.c         |   5 +-
>  drivers/clk/meson/axg.c               | 824 +++++++++++++++++++++++++++++++++-
>  drivers/clk/meson/axg.h               |  23 +-
>  drivers/clk/meson/g12a-aoclk.c        |   5 +-
>  drivers/clk/meson/g12a.c              |  79 +++-
>  drivers/clk/meson/g12a.h              |   3 +-
>  drivers/clk/meson/gxbb-aoclk.c        |   5 +-
>  drivers/clk/meson/gxbb.c              |   5 +-
>  drivers/clk/meson/meson-aoclk.c       |   4 +
>  drivers/clk/meson/meson-eeclk.c       |   3 +
>  include/dt-bindings/clock/axg-clkc.h  |  25 ++
>  include/dt-bindings/clock/g12a-clkc.h |   2 +
>  13 files changed, 979 insertions(+), 11 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
