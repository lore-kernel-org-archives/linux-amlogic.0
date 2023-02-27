Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BFEC64ED8
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 18:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TlhEiScps6as+KQq2EkMVmnhLAeK1DXwp825nVnZSU=; b=a0XN/QW26MbhGl
	MBrRmk3n3ATyO6thcCQ5FthvBkbL0pA3YAXBmKD/XwPzmXRiCEllla2l49+wt7OpMSVFpX5cHB2BP
	PLvohHU48dRyDYkn6w2B5mAuvbwS38WEfVW0doSG99DWkL1jX6mueqd6DFkOdTb1P9sLyGByQ4QVv
	E9Eqso7kO8P0+1vh872R1/xlJMdlBk+icemm/htv/hTT/liUKHOno2/B6kzamFBLrLbNFSvST+6yB
	5LSyjcCSVGnPF/VQNDW+Pbrax4jLEGgGQFlQftdwORJ2tnbb+Bcgd2n/AibFpiXM/dLkaqrhllfXF
	0/QeW+mfaRVHVPflZn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiYx-00AnXI-5o; Mon, 27 Feb 2023 18:49:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiYu-00AnVx-HV; Mon, 27 Feb 2023 18:49:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DDC94B80D38;
	Mon, 27 Feb 2023 18:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02C9C4339C;
	Mon, 27 Feb 2023 18:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677523760;
	bh=eJ8MvIHkEpCJVPtYBOWxQns0jpeoupbRfcPhZeOjCEw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pkN5HEDL1t8XoUycV0JdtD7MDdEm+8RjOWzwxuHlu/44qNKOyqdnQOrP7NMJf8pZV
	 hjVejLNF7YfqsRNfeom0U4EyhU5W40bjQz3GjjGJK/KtHEJ4hX9pG1hHFlX2C4ih4Y
	 /L0FMn3Yh0ebQFesLQKMClBZ7vuHrITKe7jxA+ar4I+SjdUle7Vh5pgb8c+ZLQQWyJ
	 Lw+wfDIK+8u+tQj9xV053s9uKtYzRtQWf6yW3H/gfEuxFs6wJVHLhQ7PDTvUBIish4
	 xE4qPM7+UGffHIiXJcJHRwdnEGj8oTecLw8XBhmQkBUGs24DqQnwWLg4VXWAzd3+7c
	 9aa2tkfdfTTBA==
Date: Mon, 27 Feb 2023 10:49:18 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Woojung Huh
 <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Andrew Lunn
 <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Wei Fang
 <wei.fang@nxp.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Arun.Ramadoss@microchip.com,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>
Subject: Re: [PATCH net-next v8 5/9] net: phy: add
 genphy_c45_ethtool_get/set_eee() support
Message-ID: <20230227104918.6ceccf90@kernel.org>
In-Reply-To: <Y/yqwifeQBC3sSaD@sirena.org.uk>
References: <20230211074113.2782508-1-o.rempel@pengutronix.de>
	<20230211074113.2782508-6-o.rempel@pengutronix.de>
	<Y/ufuLJdMcxc6f47@sirena.org.uk>
	<20230227055241.GC8437@pengutronix.de>
	<Y/yqwifeQBC3sSaD@sirena.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_104924_768989_74359A5C 
X-CRM114-Status: UNSURE (   9.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyNyBGZWIgMjAyMyAxMzowNjoxMCArMDAwMCBNYXJrIEJyb3duIHdyb3RlOgo+IFRo
ZXkgc2VlbSB0byB3b3JrLCB0aGFua3MhICBJIGhhZCBmb3VuZCBhbmQgdHJpZWQgdGhlIHNlY29u
ZCBwYXRjaCBidXQKPiBpdCBkb2Vzbid0IGFwcGx5IHdpdGhvdXQgdGhlIGZpcnN0IHNlcmllcy4g
IFdpbGwgdGhvc2UgcGF0Y2hlcyBiZSBnb2luZwo+IHRvIExpbnVzIGZvciAtcmMxPyAgSXQncyBw
cmV0dHkgZGlzcnVwdGl2ZSB0byBhIGJ1bmNoIG9mIHRoZSB0ZXN0Cj4gaW5mcmFzdHJ1Y3R1cmUg
dG8gbm90IGJlIGFibGUgdG8gTkZTIGJvb3QuCgpTaG91bGQgYmUgaW4gTGludXMncyB0cmVlIGxh
dGVyIHRvZGF5IPCfpJ7vuI8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
