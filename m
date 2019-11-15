Return-Path: <SRS0=o1hk=ZH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A6BC432C3
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Nov 2019 12:01:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D87A92073A
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Nov 2019 12:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pe/bVqGS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D87A92073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2+jAVIsEJPV9PzN5OQWBSHCP6HvbpOic0iWPWIEgI8=; b=pe/bVqGSYSbVwX
	HdWTOjpzWnxkbKVE8Om0p/Hy6e/rUZPs5qcN87XZohq4lzeno6QYofgEAj4vOZHJOP8OH5gzYplns
	cJfdOulScRr5Qq6TZ4rHS29KDSqcFjtcER/EOGh+jeOAR1GXxfrb6UhgHATbH5pOhLNZcCUNYxT2c
	C49dz8mYbaatK43LG5G6OjXWRL862NvTpx01Bx0u62ICYWTmZSTubKmfqMLmKYVgfCEyGD18wgXGg
	kw/fPoH7gPHAPMJ9YCelrZSW9v2hn4aGBePXOWq06QxDUyajK9pKHVnvyiEtK1LLDqCoY5UkrH1CZ
	5WKSP6ev0+AtWm3EPKYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVaHh-0000Kr-Vl; Fri, 15 Nov 2019 12:01:05 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVaHf-0000I7-Po; Fri, 15 Nov 2019 12:01:05 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17814ACB4;
 Fri, 15 Nov 2019 12:01:02 +0000 (UTC)
Subject: Re: Sense of soc bus? (was: [PATCH] base: soc: Export
 soc_device_to_device() helper)
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de> <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com>
 <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
 <aff81b8e-f041-73a5-6a95-d308fa07842c@suse.de>
 <c8572f70-5550-8cee-4381-fd7de7ae5af0@baylibre.com>
 <CAMuHMdWOWWQoJh5=07VMRhtrFR_Gc_qNhjTV4tCsvwvMn0kYfA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <a0a6d71f-4fb7-51ce-fe33-74f9e588b791@suse.de>
Date: Fri, 15 Nov 2019 13:00:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWOWWQoJh5=07VMRhtrFR_Gc_qNhjTV4tCsvwvMn0kYfA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_040103_983499_9BD8372F 
X-CRM114-Status: GOOD (  13.69  )
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
 linux-realtek-soc@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 boot-architecture@lists.linaro.org, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-omap@vger.kernel.org, Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgR2VlcnQsCgpBbSAxNS4xMS4xOSB1bSAwOTo1OCBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZl
bjoKPiBPbiBGcmksIE5vdiAxNSwgMjAxOSBhdCA5OjUyIEFNIE5laWwgQXJtc3Ryb25nIDxuYXJt
c3Ryb25nQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4+IE9uIDEyLzExLzIwMTkgMTE6NDcsIEFuZHJl
YXMgRsOkcmJlciB3cm90ZToKPj4+IEZvciBleGFtcGxlLCBSVEQxMjk1IHdpbGwgc3VwcG9ydCBM
U0FEQyBvbmx5IGZyb20gcmV2aXNpb24gQjAwCj4+PiBvbiAoYW5kIGl0J3Mgbm90IHRoZSBmaXJz
dCB0aW1lIEknbSBzZWVpbmcgc3VjaCB0aGluZ3MgaW4gdGhlIGluZHVzdHJ5KS4KPj4+IFNvIGlm
IGEgdXNlciBjb21wbGFpbnMsIGl0IHdpbGwgYmUgaGVscGZ1bCB0byBzZWUgdGhhdCBpbmZvcm1h
dGlvbi4KPj4+Cj4+PiBSZWZlcmVuY2luZyB5b3VyIEFtbG9naWMgcmV2aWV3LCB3aXRoIGFsbCBk
dWUgcmVzcGVjdCBmb3IgaXRzIGF1dGhvcnMsCj4+PiB0aGUgY29tbW9uIGZyYW1ld29yayBoZXJl
IGp1c3QgbGV0cyB0aGF0IGluZm9ybWF0aW9uIGV2YXBvcmF0ZSBpbnRvIHRoZQo+Pj4gZGVlcHMg
b2Ygc3lzZnMuCj4+Cj4+IEhvcGVmdWxseSB3ZSBuZXZlciBoYWQgdGhlIGNhc2Ugd2hlcmUgbmVl
ZGVkIHRvIHVzZSB0aGUgc29jIGluZm8gaW4gZHJpdmVycywKPj4gYnV0IG5vdyB3ZSBoYXZlIG9u
ZSBhbmQgaGF2aW5nIHN1Y2ggaW5mcmFzdHJ1Y3R1cmUgYWxyZWFkeSBpbi1wbGFjZSB3aWxsIGhl
bHAuCj4+Cj4+IFJlbmVzYXMgcGxhdGZvcm1zIG1ha2VzIGEgZXh0ZW5zaXZlIHVzYWdlIG9mIHRo
ZSBzb2MgaW5mbyBpbmZyYXN0cnVjdHVyZSB0bwo+PiBmaWd1cmUgb3V0IHBsZW50eSBvZiBIVyBw
YXJhbWV0ZXJzIGF0IHJ1bnRpbWUgYW5kIGxvd2VyIHRoZWlyIERUIGNoYW5nZXMuCj4gCj4gV2Ug
ZG8gb3VyIGJlc3QgdG8gdXNlIGl0IHNvbGVseSBmb3IgZGV0ZWN0aW5nIHF1aXJrcyBpbiBlYXJs
eSBTb0MgcmV2aXNpb25zLgoKR290IGEgcG9pbnRlcj8gSSBmYWlsIHRvIGltbWVkaWF0ZWx5IHVu
ZGVyc3RhbmQgaG93IHN5c2ZzIHdvdWxkIGhlbHAKZHJpdmVycyAoYXMgb3Bwb3NlZCB0byB1c2Vy
c3BhY2UpIGRldGVjdCBxdWlya3M6IFBhcnNpbmcgc3RyaW5ncyBiYWNrCmRvZXNuJ3Qgc291bmQg
ZWZmaWNpZW50LCBhbmQgSSBkb24ndCBzZWUgeW91IGV4cG9ydGluZyBhbnkgY3VzdG9tIEFQSXMK
aW4gZHJpdmVycy9zb2MvcmVuZXNhcy9yZW5lc2FzLXNvYy5jPwoKUmVnYXJkcywKQW5kcmVhcwoK
LS0gClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKR0Y6IEZlbGl4IEltZW5kw7ZyZmZlcgpIUkIgMzY4MDkg
KEFHIE7DvHJuYmVyZykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
