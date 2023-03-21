Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B94C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGwVLD7r3oy44IKQhRGpOE4wpOhALC2L84UUvygam7w=; b=faCVMc+Juvz23A
	MD7YDCQzSywRkqx2S0CuF/7Wiv6fxrpZ3MxgDhWmeGpx42H2WlRFwVg2+pKdZlrGT6JiHUUOzgLOh
	7RQTNCUgZGxJo9bplZaITJaeG4PJ76rvNrJNm/ygEge5o70S1ajUhDtLcBRQemhVGjYb+Z1N7eN3n
	TFnDsVyc6mr36M/AuXCQpZYKbBYe9gEb6uO3EXYW0UsOhDllts6K2mpoQkMhtUYvjoIv9mgACi0yD
	wDIVvr3p9drCexSbH4wFWD67v81lpZO4QyKGih4RfqLKxWO6vEE5T3r2VD28WtMnYaIOgh/+zQCNC
	NgRSQB2K3HwRE7YBFbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pebnh-00CTWX-2E;
	Tue, 21 Mar 2023 13:13:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pebnf-00CTVP-0E;
	Tue, 21 Mar 2023 13:13:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A063CB8169C;
	Tue, 21 Mar 2023 13:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D874C433EF;
	Tue, 21 Mar 2023 13:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679404392;
	bh=Ie0I6DspmqUGmFzLY8M9p06FQQUjb9WBd6Z2Y5RxFMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCELKUAO4DmRhWUevMaHTsfdWUOjmOwX6QDGRTGx8cr2tDflzYANu1EphfFEiuacN
	 73IJBFv8dFoFgJspV1c2kimtV/h9RslHEeXTHNU71iV2EBgXhherzoHszVgFNDN0Y+
	 SQEdUjvv4ttww2/mSl2jf4bmNKcGUD/3FSuCmYCoXHhZK3ojjR3yc8cHxkZ2MdqGDw
	 6zp/6BorvlCFtxWIlglrzjZLZjn8khx+muMaJjNKTzhW6I/CZ5/1CJX4uQLO80aQO2
	 T6Wec1E+zo0rJmtBFFf3unDCUrY/YYGRwClwRdqzpnsbNM7/shgpSK1BcTieLe2ZLh
	 4e8zFbiwUOlmw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pebox-000683-A5; Tue, 21 Mar 2023 14:14:36 +0100
Date: Tue, 21 Mar 2023 14:14:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/meson: fix missing component unbind on bind errors
Message-ID: <ZBmtu4klxYwQyN7R@hovoldconsulting.com>
References: <20230306103533.4915-1-johan+linaro@kernel.org>
 <CAFBinCBsC+P=zvh6RF3UKiPnferUYU0QZvZfnn1oS5xWX-65Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCBsC+P=zvh6RF3UKiPnferUYU0QZvZfnn1oS5xWX-65Jw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_061315_261790_6F9C45C1 
X-CRM114-Status: GOOD (  14.27  )
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

T24gVGh1LCBNYXIgMDksIDIwMjMgYXQgMTA6NDE6MThQTSArMDEwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKCj4gT24gTW9uLCBNYXIgNiwgMjAyMyBhdCAxMTozNeKAr0FNIEpvaGFuIEhv
dm9sZCA8am9oYW4rbGluYXJvQGtlcm5lbC5vcmc+IHdyb3RlOgo+IFsuLi5dCj4gPiBAQCAtMzI1
LDIzICszMjUsMjMgQEAgc3RhdGljIGludCBtZXNvbl9kcnZfYmluZF9tYXN0ZXIoc3RydWN0IGRl
dmljZSAqZGV2LCBib29sIGhhc19jb21wb25lbnRzKQo+ID4KPiA+ICAgICAgICAgcmV0ID0gbWVz
b25fZW5jb2Rlcl9oZG1pX2luaXQocHJpdik7Cgo+IEknbSB3b25kZXJpbmcgaWYgY29tcG9uZW50
X2JpbmRfYWxsKCkgY2FuIGJlIG1vdmVkIGZ1cnRoZXIgZG93bi4KPiBSaWdodCBub3cgaXQncyBi
ZXR3ZWVuIG1lc29uX2VuY29kZXJfY3Zic19pbml0KCkgYW5kCj4gbWVzb25fZW5jb2Rlcl9oZG1p
X2luaXQoKS4gU28gaXQgc2VlbXMgdGhhdCBlbmNvZGVycyBkb24ndCByZWx5IG9uCj4gY29tcG9u
ZW50IHJlZ2lzdHJhdGlvbi4KClBlcmhhcHMgaXQgY2FuLCBidXQgdGhhdCB3b3VsZCBiZSBhIHNl
cGFyYXRlIGNoYW5nZSAodW5sZXNzIHRoZXJlIGlzCnNvbWV0aGluZyBpbmhlcmVudGx5IHdyb25n
IHdpdGggdGhlIGN1cnJlbnQgaW5pdGlhbGlzYXRpb24gb3JkZXIpLgogCj4gVW5mb3J0dW5hdGVs
eSBJIGFtIGFsc28gbm90IGZhbWlsaWFyIHdpdGggdGhpcyBhbmQgSSdtIGhvcGluZyB0aGF0Cj4g
TmVpbCBjYW4gY29tbWVudCBvbiB0aGlzLgoKQW55IGNvbW1lbnRzIG9uIHRoaXMgb25lLCBOZWls
PwoKSm9oYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
