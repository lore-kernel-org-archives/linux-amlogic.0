Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E10C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Feb 2022 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwLcnz+4sbaZ2flyjnoXkxnoahdbQHC6wlzRAFviu+s=; b=fF0cYfJqK85M4EY9dqK/zSYgJO
	NsCHD8IK258i2PFwA3J6hIuCAh6tzaBLNrF58V93QsnBzJ1C1YrXGhJ7fb3hasTRdr2w710tsMxYV
	02wujs7mbA+f6rjFbnBRGh83XUtAKUlG3qxXJ7WN6ql2GXDDI3pEfllxl+DDbrN2BxVf+S/RPonLO
	KCypY4KtUqigkORlle+0JKYHj/XNDLKT9MuFnXlIzTL/HFHHtkTPx3G+Q8kn7UUoG7jZd9Ykl2nZm
	FlO917eLRnt5/5Xl5voCwmbV/1wK5dgkV5ZSIbNBo0UFSepC0lSua8WMt50lN+x/VsQ4fhUjgoXJJ
	/5cwJj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFcYV-001UYt-9N; Thu, 03 Feb 2022 13:53:47 +0000
Received: from mx.msync.work ([2001:41d0:d:357f:aaaa::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFcYR-001UWu-Hu
 for linux-amlogic@lists.infradead.org; Thu, 03 Feb 2022 13:53:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CDA38223F6; Thu,  3 Feb 2022 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1643896418; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=k9g+wTO5HqK7jJ0OX3kvaKZizS1QpshMgr7ugDUIQZY=;
 b=NsYsd5RSmAuBkO1EISfM+GyC0nnUOZNQvvNXBfekmwKHuww5OdZsPqfgA9KixiSP9CfKRo
 7L41IEs9vMQhuyN1fgEd3xGTlol8TBAL03q5KDreBRVNLQFO7lXso/VZQKFkW5pcJwsJRW
 Tk37mfLtnTEFqKVIUT7ObyjCleAarhUSpeXV+jnjVGPnJjm+Wbbuxw9ts9RGY5SA5/pRfe
 jtTMP/o3CiFAm5Af3PD4i7AmJkRsOipbdVTFtjtBxuzyNPl2gx1k4xQi20y3lBgemzpLEW
 v3exAnHLtL+TSkVgGnffqI+IJEuaKCcrwbxs60TV57gBSY91qFZyndVdlrdm7w==
Message-ID: <358698b4-1da5-8af5-8c33-c7b2350c0ac1@lexina.in>
Date: Thu, 3 Feb 2022 16:53:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: net: stmmac: dwmac-meson8b: interface sometimes does not come up
 at boot
Content-Language: ru
To: Erico Nunes <nunes.erico@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jose Abreu <joabreu@synopsys.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org
References: <CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com>
From: Vyacheslav <adeep@lexina.in>
In-Reply-To: <CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_055343_760376_A19C817B 
X-CRM114-Status: GOOD (  22.72  )
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

Hi

I have same problem with meson8b on S905W Amlogic SoC.
"ethtool -r" fixes problem after start

02.02.2022 23:18, Erico Nunes wrote:
> Hello,
> 
> I've been tracking down an issue with network interfaces from
> meson8b-dwmac sometimes not coming up properly at boot.
> The target systems are AML-S805X-CC boards (Amlogic S805X SoC), I have
> a group of them as part of a CI test farm that uses nfsroot.
> 
> After hopefully ruling out potential platform/firmware and network
> issues I managed to bisect this commit in the kernel to make a big
> difference:
> 
>    46f69ded988d2311e3be2e4c3898fc0edd7e6c5a net: stmmac: Use resolved
> link config in mac_link_up()
> 
> With a kernel before that commit, I am able to submit hundreds of test
> jobs and the boards always start the network interface properly.
> 
> After that commit, around 30% of the jobs start hitting this:
> 
>    [    2.178078] meson8b-dwmac c9410000.ethernet eth0: PHY
> [0.e40908ff:08] driver [Meson GXL Internal PHY] (irq=48)
>    [    2.183505] meson8b-dwmac c9410000.ethernet eth0: Register
> MEM_TYPE_PAGE_POOL RxQ-0
>    [    2.200784] meson8b-dwmac c9410000.ethernet eth0: No Safety
> Features support found
>    [    2.202713] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
>    [    2.209825] meson8b-dwmac c9410000.ethernet eth0: configuring for
> phy/rmii link mode
>    [    3.762108] meson8b-dwmac c9410000.ethernet eth0: Link is Up -
> 100Mbps/Full - flow control off
>    [    3.783162] Sending DHCP requests ...... timed out!
>    [   93.680402] meson8b-dwmac c9410000.ethernet eth0: Link is Down
>    [   93.685712] IP-Config: Retrying forever (NFS root)...
>    [   93.756540] meson8b-dwmac c9410000.ethernet eth0: PHY
> [0.e40908ff:08] driver [Meson GXL Internal PHY] (irq=48)
>    [   93.763266] meson8b-dwmac c9410000.ethernet eth0: Register
> MEM_TYPE_PAGE_POOL RxQ-0
>    [   93.779340] meson8b-dwmac c9410000.ethernet eth0: No Safety
> Features support found
>    [   93.781336] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
>    [   93.788088] meson8b-dwmac c9410000.ethernet eth0: configuring for
> phy/rmii link mode
>    [   93.807459] random: fast init done
>    [   95.353076] meson8b-dwmac c9410000.ethernet eth0: Link is Up -
> 100Mbps/Full - flow control off
> 
> This still happens with a kernel from master, currently 5.17-rc2 (less
> frequently but still often hit by CI test jobs).
> The jobs still usually get to work after restarting the interface a
> couple of times, but sometimes it takes 3-4 attempts.
> 
> Here is one example and full dmesg:
> https://gitlab.freedesktop.org/enunes/mesa/-/jobs/16452399/raw
> 
> Note that DHCP does not seem to be an issue here, besides the fact
> that the problem only happens since the mentioned commit under the
> same setup, I did try to set up the boards to use a static ip but then
> the interfaces just don't communicate at all from boot.
> 
> For test purposes I attempted to revert
> 46f69ded988d2311e3be2e4c3898fc0edd7e6c5a on top of master but that
> does not apply trivially anymore, and by trying to revert it manually
> I haven't been able to get a working interface.
> 
> Any advice on how to further debug or fix this?
> 
> Thanks
> 
> Erico
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
