Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEDAEB8FAF
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Sep 2023 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94fD59tCRxNJASSqdI5RuP0bLSSG9tHQx/ZxQfN5sEE=; b=TgTDY5yT7lvVts
	/zUpl9FSDmAERyOQu7jtFZdLmylGhthUfTiV7jKcElC24g6WYSNZy/dg+7xa9/sMsb4oISJd2dPs8
	hYIk76pDbMk+718XeMqPQY4dZ3iq0cEtqUv6ZtchOGI0SwOYhpd1tyIMzVCTfTKNvCqBuZs7fsa0M
	rwHee7tqVa+Pwwjf/CHgDL0mLTxnEQO/dP1wjh13s7g06D3ilYpnhF+r/FW9PAT/8zZyGcmlurK4g
	67QOEpkTKs/9zQph3gwnQdkeTniLV0I03mCSf3QAfQLPwrk926HIFfl38aZnZg9h8Aey4tIDel0Ju
	lZrsIviE5J0fL9qbgM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qds6f-009kdb-0C;
	Wed, 06 Sep 2023 12:58:05 +0000
Received: from gofer.mess.org ([88.97.38.141])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qds6c-009kYw-0h;
	Wed, 06 Sep 2023 12:58:03 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 21513100091; Wed,  6 Sep 2023 13:57:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1694005077; bh=EzwDXWT6RpEhAc2cQpSOJAWS31npZoM+FGVnLWWuX9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9dpcAeZ8pOOKfDQlDukibXcSb39g0CeRKcpIy35MfnsTxdyYiTEwIg8fjelsyAQW
	 lH+0vHDb6epJkF5GocbsehtwH79cfzQa0H0NrezjfO0iMMhcOBTZ+JPuephisjoWCw
	 L0fye1+e73KQxlYmasyYkYKACdEVl3HzwnpyCxQDbz+hAqy0pW/H8alirSDdhCW9G7
	 sOftvW9N77Irr1nTP6+k5HNkA7Rs+MLn86MIK7lFmhXE3Ju1ILauWDMIikAs43VSQG
	 Ya0qmAEXiMvlncVkYDq46rnpCYRDfd/nzc9fWA3a80EZoCpwCYw6o3nbNq7/roQglX
	 htXrXNSv9bTdw==
Date: Wed, 6 Sep 2023 13:57:57 +0100
From: Sean Young <sean@mess.org>
To: Zelong Dong <Zelong.Dong@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
	kelvin.zhang@amlogic.com
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
Message-ID: <ZPh3VXPzosk3i3lS@gofer.mess.org>
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <ZO2gvMl2IS70ve3T@gofer.mess.org>
 <b6e9fc91-0c99-5635-235b-76bc6db55f75@amlogic.com>
 <ZPGahNKlq/31MXbh@gofer.mess.org>
 <448f6dab-4cfe-c840-8c70-adfa217cc7f3@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <448f6dab-4cfe-c840-8c70-adfa217cc7f3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_055802_398067_6AF31018 
X-CRM114-Status: GOOD (  11.74  )
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

T24gV2VkLCBTZXAgMDYsIDIwMjMgYXQgMDY6Mzc6NDFQTSArMDgwMCwgWmVsb25nIERvbmcgd3Jv
dGU6Cj4g5ZyoIDIwMjMvOS8xIDE2OjAyLCBTZWFuIFlvdW5nIOWGmemBkzoKPiA+IFRoZXJlIGFy
ZSBvdGhlciBkcml2ZXJzIHRvbyB3aGljaCBjYW4gZG8gaGFyZHdhcmUgZGVjb2RpbmcgYW5kIHNv
ZnR3YXJlCj4gPiBkZWNvZGluZy4gSWRlYWxseSB3ZSBzaG91bGQgaGF2ZSBhIG1lY2hhbmlzbSB0
byBzd2l0Y2ggYmV0d2VlbiB0aGVtIGF0Cj4gPiBydW50aW1lLCBidXQgYXMtaXMgcmMtY29yZSBk
b2VzIG5vdCBwcm92aWRlIGZvciB0aGlzLgo+IEFueXRoaW5nIGVsc2UgSSBzaG91bGQgdXBkYXRl
IGZvciB0aGlzIHBhdGNoc2V0PwoKSSBkb24ndCB0aGluayBzby4KCkkgd2FzIGp1c3Qgc2F5aW5n
IHRoYXQgaXQgd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSBydW50aW1lIHN3aXRjaGluZyBpbiB0aGUK
ZnV0dXJlLgoKVGhhbmtzLAoKU2VhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
