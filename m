Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547B3C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 07:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nSA/3MqQrwq+5zNlfsnzIaQ9Plrsa7JKcqIMNKWqk4=; b=3muxzRd3hkVKRi
	8Oat3CcfluvmV5Jmc2fsTB9Xw2fO8IiU2iTK9qYX/edlfx++xxXHUCk8yC7b7Y/3Sb/ZLIX+24tSM
	n7h1yRZyy/KdnWAoXsqNNJeaPq0BNDMuBXKTH8RjjR6NqhGhLgPsw9a8ar6ynOA4xgVHBuMbm9t+3
	D0kyV2pffgZN7fZpEbywC63a9ulgtmOi5BB5/NRzEzE7ZGW5t3s6ubVhgmytF6pEz9Sm5AGEXsF/w
	+Dtd7oe6wf9fo8CsXUz+jyOtCt95o5+BdNC/og6/To6cGd4Jwu1mPX9JuHmS+BYKZCGDnQh9BkEk2
	svSbJDtehCnlG3vxi1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ6fX-00BOEK-28; Tue, 29 Mar 2022 07:53:35 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ6fT-00BOCz-3n; Tue, 29 Mar 2022 07:53:32 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 727F580F9;
 Tue, 29 Mar 2022 07:51:24 +0000 (UTC)
Date: Tue, 29 Mar 2022 10:53:27 +0300
From: Tony Lindgren <tony@atomide.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <YkK691VG6ON/6Ysn@atomide.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_005331_237669_383133D7 
X-CRM114-Status: GOOD (  18.53  )
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

Hi,

* Daniel Palmer <daniel@0x0f.com> [220328 08:53]:
> Hi Ansuel
> 
> On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
> >
> > Hi,
> > as the title say, the intention of this ""series"" is to finally categorize
> > the ARM dts directory in subdirectory for each oem.
> 
> While I agree with this change and think it's for the good (browsing
> the ARM dts directory at the moment is frustrating..) I think
> buildroot and others need to be told about this as it'll potentially
> break their kernel build scripting for ARM and probably messes up the
> configs they have for existing boards.

Yeah.. And ideally this would be done in smaller steps as these will
conflict with all the other pending patches.

For example, I have a pile of pending omap clock clean-up dts patches
posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
redoing or fixing up the patches with sed :)

What I'd like to have see is that at some point when suitable we move
one machine at a time with a script if possible.. Maybe the dtb files
generated would need to remain in the current directory until all of
the machine dts files are moved? That should help with the build
scripting too probably :)

In general I like the idea though and I think we should do it.

Regards,

Tony

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
