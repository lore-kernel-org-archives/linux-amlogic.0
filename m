Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A883CA6019
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 12:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dli2km3x1kTTYq1EbKvw8m9vwqQKxUhcnPgGLT/WGKU=; b=zDN2sLGgLufYdh
	35/pL+gfg/KxhD1aiSx1ltFX7FNXK6zq3z3njeSY2U+fOet8+A6+wTS2xetQSIjK+3muO4fVlywuw
	ZmKFEvri2iqlml+Z+mDhC05hWYqG7gsEFeixkY1dgVBoHPKAxxKDKQK+JQGvICDN9HjfTp8dGOFPv
	dEYbCSiCBwtphZsr3u99EQT95cYDlMqpYqxyZHkob6aENiLMJCalGSU1ZbSNF9W2w+Pj66d4Szzps
	5KGYOB5atuOWJISPAExdX3MkxE7GY97wUtrepmgFCPXbSb9o7Aq1GSvOduU+uh4GDnLMWGMjp88GB
	ZHggJwOgp3T97EnntLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Tr-00000006Gd3-0lXX;
	Fri, 09 Oct 2026 12:13:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Tp-00000006GcS-2ctK;
	Fri, 09 Oct 2026 12:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=iYqcn+lw0qC/zQadO5fheUsN/NkKlBYECjVpCgptZMM=; b=tz
	eHbJbfn2hJXhR7bctqrOQsxWGFsATvqH5M7FqEGjCw/KIWeIC4TlP70keu4PnxMShE7R1Ghh/x90I
	4T5wSY81La24TnQgk+SKelca7e0mnBsktaMOF1VvENjiTXcdre/8LuPXR37vafMP1+H1RTzD2lY6Y
	X4HQUO3qpsENWVI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xF9TY-009mY5-CL; Fri, 09 Oct 2026 14:13:24 +0200
Date: Fri, 9 Oct 2026 14:13:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
Message-ID: <3a037c87-e4c5-4a4e-9522-cf505e1c6399@lunn.ch>
References: <20261007082627.63807-1-tanure@linux.com>
 <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
 <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_051341_663261_54374FBA 
X-CRM114-Status: GOOD (  18.25  )
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

T24gRnJpLCBPY3QgMDksIDIwMjYgYXQgMDY6NTk6NDlBTSArMDEwMCwgTHVjYXMgVGFudXJlIHdy
b3RlOgo+IE9uIFdlZCwgT2N0IDcsIDIwMjYgYXQgMjowMeKAr1BNIEFuZHJldyBMdW5uIDxhbmRy
ZXdAbHVubi5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBPY3QgMDcsIDIwMjYgYXQgMDk6MjY6
MjBBTSArMDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gPiBUaGUgVDcgcGFpcnMgYSBTeW5v
cHN5cyBnaWdhYml0IE1BQyB3aXRoIHRoZSBzYW1lIGdsdWUgcmVnaXN0ZXJzIHRoZQo+ID4gPiBH
MTJBIGhhcywgYnV0IG5vdGhpbmcgZGVzY3JpYmVkIGl0LiBUaGlzIGFkZHMgdGhlIGJpbmRpbmcs
IHRoZSBkcml2ZXIKPiA+ID4gc3VwcG9ydCBhbmQgdGhlIGRldmljZSB0cmVlIG5vZGVzLCBhbmQg
ZW5hYmxlcyB0aGUgcG9ydCBvbiB0aGUgS2hhZGFzCj4gPiA+IFZJTTQuCj4gPiA+Cj4gPiA+IFVu
bGlrZSB0aGUgRzEyQSwgdGhlIGNvbnRyb2xsZXIgcmVhY2hlcyBEUkFNIHRocm91Z2ggYSBwaXBl
bGluZSBzdGFnZQo+ID4gPiB3aXRoIGEgZ2F0ZSBvZiBpdHMgb3duLCBzeXNfYW1waXBlX2V0aC4g
Tm90aGluZyBlbHNlIGNsYWltcyBpdCwgc28KPiA+ID4gY2xrX2Rpc2FibGVfdW51c2VkIHN3aXRj
aGVzIGl0IG9mZiBhbmQgdHJhbnNmZXJzIHN0b3AuCj4gPiA+Cj4gPiA+IHYyIGNoYW5nZXMgdGhl
IFJHTUlJIGRlbGF5cywgYWZ0ZXIgcmV2aWV3LiBwaHktbW9kZSBkZXNjcmliZXMgdGhlCj4gPiA+
IGJvYXJkLCBub3Qgd2hpY2ggY2hpcCBhZGRzIHRoZSBkZWxheSwgc28gdGhpcyBib2FyZCBpcyBy
Z21paS1pZC4KPiA+ID4gZHdtYWMtbWVzb244YiBkaWQgdGhlIG9wcG9zaXRlLCBhbmQgaWdub3Jl
ZCB0aGUgKi1pbnRlcm5hbC1kZWxheS1wcwo+ID4gPiBwcm9wZXJ0aWVzLiBQYXRjaCAxIGZpeGVz
IHRoYXQuIFRoZSBWSU00IG5lZWRzIGl0IGJlY2F1c2UgdGhlIFJUTDgyMTFGCj4gPiA+IHRyYW5z
bWl0IGRlbGF5IGRvZXMgbm90IHdvcmsgaGVyZS4KPiA+Cj4gPiBXaGF0IGlzIHNwZWNpYWwgYWJv
dXQgdGhlIFJUTDgyMTFGPwo+IE1heWJlIG5vdGhpbmcsIGl0IG1heSBiZSB0aGlzIGJvYXJkLiBJ
IGNhbm5vdCB0ZWxsIGZyb20gaGVyZS4KClllcywgbG9vayBhdCBteSBvdGhlciByZXBseS4gVGhl
IFJUTDgyMTFGIGlzIHZlcnkgbGlrZWx5IGNvcnJlY3QuIEl0CmlzIHRoZSBNQUMgZHJpdmVycyBo
YW5kbGluZyBvZiBkZWxheXMgd2hpY2ggaXMgYnJva2VuLiBZb3UgZ2V0IHRvIGZpeAppdCBmb3Ig
dGhpcyBuZXcgZGV2aWNlLgoKICAgQW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
