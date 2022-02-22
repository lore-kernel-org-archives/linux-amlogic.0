Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4C8C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGCYVt5XRWlDWbLPinqHkwcK7l/JOhPT9kxE/y5Bgrs=; b=MSwCd16SSFPl92
	3oBwdzpr1pm6GqHNauTVTNLMcj7T5FqslF5v7yoP5o5+RtbOr6kvL2fW+wQVqkgLkzprshVJ09yqg
	VTWDDurbDyLRO7BCMVi/jUb4wjSiM4PeKGvM1Xy++P7KZLB6F1K6InCMQHfY1yIxLaWlbKv1MYN7D
	GyZ08sQYncxh5KQOomy0hUZDgVmm7Kx4zhq1Hr9wwncN30ipyugFIudE/ThMipTPR5eLhBzug5Rmy
	Rn3wlUFEBZcRi8gJrcv+AkK9ufhMCJLslOw24lCYYqqUaGlpcbTY6wc3iKlWMtB2P/+cMxErsPky+
	yFZgwUzC5wACPDZUffkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMU8f-009Y6L-Da; Tue, 22 Feb 2022 12:19:29 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMU8b-009Y54-Tu; Tue, 22 Feb 2022 12:19:27 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91C1621119;
 Tue, 22 Feb 2022 12:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645532364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8Aq0Ckoy74UZCe6DtMgK4l1xKOMqpQJP0j1u4pDmBA=;
 b=nyEYrnboomUbw6rCwTPb7I0dekr6bEn9xChtG9zRkJR3sbUzbhVFb6D5+asxxxpZMdvzo8
 ByBGxYkf7C12/StskBQvJB2EgHYlOF8NDsGM7pqKJb9Ke9F/XCKIdWr+DHmNUJQizA8hW6
 39kbTbS2mSaJ1aN94DYWqsIDBEVVC7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645532364;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8Aq0Ckoy74UZCe6DtMgK4l1xKOMqpQJP0j1u4pDmBA=;
 b=ncMPLE1l+dm8/do9nyZnyHtQiSxSCh69BhwyWgnVTFpHWnSlnn2IjQjLF8KEpr5KO3DJoO
 RMrYwA3l+zhiiLCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4760113C1E;
 Tue, 22 Feb 2022 12:19:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7FpJEMzUFGJsOQAAMHmgww
 (envelope-from <afaerber@suse.de>); Tue, 22 Feb 2022 12:19:24 +0000
Message-ID: <9b229724-9715-f8cd-6a2e-d7373893f021@suse.de>
Date: Tue, 22 Feb 2022 13:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
 <CANiq72ko6=dYBvbRc5T7Qq_2mxRtq1NpvcV_saMbTDfz0PK1aw@mail.gmail.com>
 <d8baa907-a8c8-17d3-e724-df490a0fff83@gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
In-Reply-To: <d8baa907-a8c8-17d3-e724-df490a0fff83@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_041926_138503_DE822830 
X-CRM114-Status: GOOD (  12.45  )
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

T24gMjEuMDIuMjIgMjM6NTcsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPiBPbiAyMS4wMi4yMDIy
IDIzOjEwLCBNaWd1ZWwgT2plZGEgd3JvdGU6Cj4+IE9uIE1vbiwgRmViIDIxLCAyMDIyIGF0IDk6
MTkgUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pgo+
Pj4gdjI6Cj4+PiAtIChyZS0pYWRkIEFuZHJlYXMnIFNvQiB0byB0d28gcGF0Y2hlcwo+Pgo+PiBC
dXQgdGhvc2Ugd2VyZSBhbHNvIGRldmVsb3BlZCBieSB5b3UgdG9vLCByaWdodD8gaS5lLiBpdCBz
aG91bGQgaGF2ZSBhCj4+IENvLWRldmVsb3BlZC1ieSB0b28sIG90aGVyd2lzZSBpdCBsb29rcyBs
aWtlIHlvdSBvbmx5IGhhbmRsZWQgdGhlCj4+IHBhdGNoOgo+Pgo+IAo+IFJpZ2h0LCBhYm91dCBo
YWxmIG9mIHRoZSBvcmlnaW5hbCBjb2RlIHdhcyByZXdvcmtlZC4gTGV0J3Mgc2VlIHdoZXRoZXIg
YW5kCj4gd2hpY2ggZmVlZGJhY2sgY29tZXMgZm9yIHYyLiBJZiBhIHYzIHNob3VsZCBiZSBuZWVk
ZWQsIEknbGwgZm9sbG93IHlvdXIKPiBzdWdnZXN0aW9uLgoKVGhlIGRpc3B1dGUgaXMgdGhhdCBo
ZSBhcHBhcmVudGx5IG9ubHkgbG9va2VkIGF0IG15IFJGQyBidXQgZGlkbid0IGFzawptZSBvciBj
aGVjayBoaW1zZWxmIGZvciBuZXdlciBjb2RlLCB3aGljaCB0aGVyZSB3YXMuCgpSZWdhcmRzLApB
bmRyZWFzCgotLSAKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQpHRjogSXZvIFRvdGV2CkhSQiAzNjgwOSAo
QUcgTsO8cm5iZXJnKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
