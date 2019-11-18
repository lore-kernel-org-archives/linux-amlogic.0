Return-Path: <SRS0=GMFV=ZK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33ABFC432C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 15:56:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09B7E217F9
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 15:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jql4BwiG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09B7E217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuCIg9yvCzBnw3adW3/Vl978s9jfFmwjaB5n6v3+UTU=; b=Jql4BwiGkW9GaQ
	y1Y1KHdHrhQ12MgAelYV/fO1RPIxJc3BwJ6xNwbcDZH+i2p2A5m4iCreIijUFCwqVbnkHa9DSg8B6
	CBMZXwItq9MrrBc7MWLpWZobRat8YprxXXKyNuFQiuamz6sC2hyO6ZOMXpAphXDG0JRQoDhHD5ZIK
	ObA3+JjkfC8K7D3v9rMhxHzMa9yhS0icl+rdcxsy08GES6G02UygSvOEVTVC62SBVOzJMHwFINjYH
	FyZGanHF1duiDcDhDWEFaUegpDTez8iUqOzyBk4tyWTMPz4VkpInIpgVjA495A6/A6zirjC0++JTG
	5BEuPSt8QUPjcJC57CeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWjNY-0001E6-Qo; Mon, 18 Nov 2019 15:55:52 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWjNU-0001DC-J4; Mon, 18 Nov 2019 15:55:50 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id AC87E80BF;
 Mon, 18 Nov 2019 15:56:19 +0000 (UTC)
Date: Mon, 18 Nov 2019 07:55:39 -0800
From: Tony Lindgren <tony@atomide.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Sense of soc bus? (was: [PATCH] base: soc: Export
 soc_device_to_device() helper)
Message-ID: <20191118155539.GB35479@atomide.com>
References: <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com>
 <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
 <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de>
 <c8572f70-5550-8cee-4381-fd7de7ae5af0@baylibre.com>
 <CAMuHMdWOWWQoJh5=07VMRhtrFR_Gc_qNhjTV4tCsvwvMn0kYfA@mail.gmail.com>
 <a0a6d71f-4fb7-51ce-fe33-74f9e588b791@suse.de>
 <CAMuHMdU7EYHWRAR+s3ee4Wy6+6_MZON5xARszO7TDXZGyw8d5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdU7EYHWRAR+s3ee4Wy6+6_MZON5xARszO7TDXZGyw8d5w@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_075548_672972_798FC7FD 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-realtek-soc@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 boot-architecture@lists.linaro.org, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

KiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiBbMTkxMTE1IDE1OjUx
XToKPiBPbiBGcmksIE5vdiAxNSwgMjAxOSBhdCAxOjAxIFBNIEFuZHJlYXMgRsOkcmJlciA8YWZh
ZXJiZXJAc3VzZS5kZT4gd3JvdGU6Cj4gPiBBbSAxNS4xMS4xOSB1bSAwOTo1OCBzY2hyaWViIEdl
ZXJ0IFV5dHRlcmhvZXZlbjoKPiA+ID4gV2UgZG8gb3VyIGJlc3QgdG8gdXNlIGl0IHNvbGVseSBm
b3IgZGV0ZWN0aW5nIHF1aXJrcyBpbiBlYXJseSBTb0MgcmV2aXNpb25zLgo+ID4KPiA+IEdvdCBh
IHBvaW50ZXI/IEkgZmFpbCB0byBpbW1lZGlhdGVseSB1bmRlcnN0YW5kIGhvdyBzeXNmcyB3b3Vs
ZCBoZWxwCj4gPiBkcml2ZXJzIChhcyBvcHBvc2VkIHRvIHVzZXJzcGFjZSkgZGV0ZWN0IHF1aXJr
czogUGFyc2luZyBzdHJpbmdzIGJhY2sKPiA+IGRvZXNuJ3Qgc291bmQgZWZmaWNpZW50LCBhbmQg
SSBkb24ndCBzZWUgeW91IGV4cG9ydGluZyBhbnkgY3VzdG9tIEFQSXMKPiA+IGluIGRyaXZlcnMv
c29jL3JlbmVzYXMvcmVuZXNhcy1zb2MuYz8KPiAKPiBXZSB1c2Ugc29jX2RldmljZV9tYXRjaCgp
LCBpbnNpZGUga2VybmVsIGRyaXZlcnMuCj4gRXhwb3N1cmUgdGhyb3VnaCBzeXNmcyBpcyBhIHNp
ZGUtZWZmZWN0IG9mIHVzaW5nIHNvY19kZXZpY2VfcmVnaXN0ZXIoKSwKPiBhbmQgd2VsY29tZWQs
IGFzIGl0IGFsbG93cyB0aGUgdXNlciB0byBmaW5kIG91dCBxdWlja2x5IHdoaWNoIFNvQyBhbmQK
PiByZXZpc2lvbiBpcyBiZWluZyB1c2VkLgoKRm9yIHRoZSBvbWFwIHZhcmlhbnRzIHRvbywgd2Un
dmUgc28gZmFyIGdvdHRlbiBhd2F5IHdpdGggZWFybHkgU29DCmRldGVjdGlvbiBmb3IgcGxhdGZv
cm0gY29kZSwgYW5kIHRoZW4gdXNlIHNvY19kZXZpY2VfbWF0Y2goKSBpbiBmZXcKY2FzZXMgZm9y
IGRyaXZlcnMgYXQgcHJvYmUgdGltZSBpZiBuZWVkZWQuCgpSZWdhcmRzLAoKVG9ueQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
