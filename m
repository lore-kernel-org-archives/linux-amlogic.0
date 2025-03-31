Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F07C36014
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Mar 2025 20:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAP0wfAkg/GJMIFKDqO37j82Gbcb01LUTcvH5FPx6S0=; b=vcBH3hGyB4fxn6
	0g+Gj2Z9YEmcZb27FyzkcRnKzntaB3ibPbxwE5QK+m7lFBYFXJcbXdRuHmgHvkV7CLiNVWMGO3izP
	KmndvR/23QFyMjSM5HljBsjbD8ZJGC3PRKFvURFzw8rSR19JNL6o3Q7pkZWlSB+Brh09AgGTIyWJy
	GdipxvIobc2uE6JU/7TAVR+Ok7m9gpihJVaazGInUzNlujQVRUISkvmlLF3rEB6A8L9Yv1S3ujl2e
	rAYPUE6KHv5QF8xrtcQwaPMG2vabvJplqrL8FsvMT07epwYSsAHtoRt+iC3rDs02x2E2zOCDo3enF
	5n1JU9fIs5Trg/Se9MeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzLmb-00000001K4N-389P;
	Mon, 31 Mar 2025 20:30:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzLmY-00000001K3M-2fsK;
	Mon, 31 Mar 2025 20:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bwgUmQ/Ln+vl6Ggzqf2YmSZ7HB+LoNBmRfI1Y27KDkA=; b=Up4u0ZtG1+H47e4FsrNKSaV3o8
	3eDeJC82AW9n1sRD92fm7KDWTFxTlKyVYZkALIOZ8v3lqVlbgS4tKxO6tohdct1W0suaUXUPBw/vy
	nK+4MK+9EMi1TY9eDu0nvxRN4EbMm1sLlZQ3F3an+fF2Unme7J1RP2aW1qxVbw+U/yaqOgyRb9VER
	t7CcYkvNr02rp6F5f/P7MUBu0xpg7Yfk56v3d3IEvx15X2xJjSdunMDG9w8AvtwNWSCGR+LuXkJKw
	AvRUAYvC/r3H9c5G6KWGnYgiWy3Q/2qrZ6zZIlDzU6/LmAhDX3sjUVbomWh95H2aII31UVfXXTBBr
	wlHheixQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59730)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzLmQ-0004lN-2S;
	Mon, 31 Mar 2025 21:30:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzLmN-0001zI-1U;
	Mon, 31 Mar 2025 21:30:43 +0100
Date: Mon, 31 Mar 2025 21:30:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Da Xue <da@lessconfused.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Da Xue <da@libre.computer>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-amlogic@lists.infradead.org,
	Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
Message-ID: <Z-r7c1bAHJK48xhD@shell.armlinux.org.uk>
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
 <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch>
 <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
 <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_133054_674242_CE8A9851 
X-CRM114-Status: GOOD (  28.31  )
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

T24gTW9uLCBNYXIgMzEsIDIwMjUgYXQgMDM6MDk6MDBQTSAtMDQwMCwgRGEgWHVlIHdyb3RlOgo+
IE9uIE1vbiwgTWFyIDMxLCAyMDI1IGF0IDk6NTXigK9BTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkK
PiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIE1hciAzMSwg
MjAyNSBhdCAwMzo0MzoyNlBNICswMjAwLCBBbmRyZXcgTHVubiB3cm90ZToKPiA+ID4gT24gTW9u
LCBNYXIgMzEsIDIwMjUgYXQgMDc6NDQ6MjBBTSArMDAwMCwgQ2hyaXN0aWFuIEhld2l0dCB3cm90
ZToKPiA+ID4gPiBGcm9tOiBEYSBYdWUgPGRhQGxpYnJlLmNvbXB1dGVyPgo+ID4gPiA+Cj4gPiA+
ID4gVGhpcyBiaXQgaXMgbmVjZXNzYXJ5IHRvIGVuYWJsZSBwYWNrZXRzIG9uIHRoZSBpbnRlcmZh
Y2UuIFdpdGhvdXQgdGhpcwo+ID4gPiA+IGJpdCBzZXQsIGV0aGVybmV0IGJlaGF2ZXMgYXMgaWYg
aXQgaXMgd29ya2luZywgYnV0IG5vIGFjdGl2aXR5IG9jY3Vycy4KPiA+ID4gPgo+ID4gPiA+IFRo
ZSB2ZW5kb3IgU0RLIHNldHMgdGhpcyBiaXQgYWxvbmcgd2l0aCB0aGUgUEhZX0lEIGJpdHMuIFUt
Ym9vdCBhbHNvCj4gPiA+ID4gc2V0cyB0aGlzIGJpdCwgYnV0IGlmIHUtYm9vdCBpcyBub3QgY29t
cGlsZWQgd2l0aCBuZXR3b3JraW5nIHN1cHBvcnQKPiA+ID4gPiB0aGUgaW50ZXJmYWNlIHdpbGwg
bm90IHdvcmsuCj4gPiA+ID4KPiA+ID4gPiBGaXhlczogOWEyNGUxZmY0MzI2ICgibmV0OiBtZGlv
OiBhZGQgYW1sb2dpYyBneGwgbWRpbyBtdXggc3VwcG9ydCIpOwo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0ZXI+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+Cj4gPiA+ID4gLS0tCj4g
PiA+ID4gUmVzZW5kaW5nIG9uIGJlaGFsZiBvZiBEYSBYdWUgd2hvIGhhcyBlbWFpbCBzZW5kaW5n
IGlzc3Vlcy4KPiA+ID4gPiBDaGFuZ2VzIHNpbmNlIHYxIFswXToKPiA+ID4gPiAtIFJlbW92ZSBi
bGFuayBsaW5lIGJldHdlZW4gRml4ZXMgYW5kIFNvQiB0YWdzCj4gPiA+ID4gLSBTdWJtaXQgd2l0
aG91dCBtYWlsIHNlcnZlciBtYW5nbGluZyB0aGUgcGF0Y2gKPiA+ID4gPiAtIE1pbm9yIHR3ZWFr
cyB0byBzdWJqZWN0IGxpbmUgYW5kIGNvbW1pdCBtZXNzYWdlCj4gPiA+ID4gLSBDQyB0byBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4KPiA+ID4gPiBbMF0gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFtbG9naWMvcGF0Y2gvQ0FDcXZSVWJ4LUtzck13Q0hZ
UVM2ZUdYQm9oeW5EOFExQ1F4PTg9OVZocVppMTNCQ1FRQG1haWwuZ21haWwuY29tLwo+ID4gPiA+
Cj4gPiA+ID4gIGRyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgtbWVzb24tZ3hsLmMgfCAzICsrLQo+
ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
PiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1tZXNv
bi1neGwuYyBiL2RyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgtbWVzb24tZ3hsLmMKPiA+ID4gPiBp
bmRleCAwMGM2NjI0MDEzNmIuLmZjNTg4MzM4NzcxOCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL25ldC9tZGlvL21kaW8tbXV4LW1lc29uLWd4bC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9u
ZXQvbWRpby9tZGlvLW11eC1tZXNvbi1neGwuYwo+ID4gPiA+IEBAIC0xNyw2ICsxNyw3IEBACj4g
PiA+ID4gICNkZWZpbmUgIFJFRzJfTEVEQUNUICAgICAgICAgICAgICAgR0VOTUFTSygyMywgMjIp
Cj4gPiA+ID4gICNkZWZpbmUgIFJFRzJfTEVETElOSyAgICAgICAgICAgICAgR0VOTUFTSygyNSwg
MjQpCj4gPiA+ID4gICNkZWZpbmUgIFJFRzJfRElWNFNFTCAgICAgICAgICAgICAgQklUKDI3KQo+
ID4gPiA+ICsjZGVmaW5lICBSRUcyX1JFU0VSVkVEXzI4ICBCSVQoMjgpCj4gPiA+Cj4gPiA+IEl0
IG11c3QgaGF2ZSBzb21lIG1lYW5pbmcsIGl0IGNhbm5vdCBiZSByZXNlcnZlZC4gU28gbGV0cyB0
cnkgdG8gZmluZAo+ID4gPiBhIGJldHRlciBuYW1lLgo+ID4KPiA+IEluZGVlZCwgdGhhdCB3YXMg
bXkgdGhvdWdodHMgYXMgd2VsbCwgYnV0IEFuZHJldyBnb3QgaGlzIHJlcGx5IGluCj4gPiBiZWZv
cmUgSSBnb3QgYXJvdW5kIHRvIHJlcGx5aW5nIQo+IAo+IFRoZSBkYXRhc2hlZXRzIGRvbid0IGhh
dmUgbXVjaCBpbiB0aGUgd2F5IG9mIGluZm9ybWF0aW9uIGFib3V0IHRoaXMKPiByZWdpc3RlciBi
aXQuIFRoZSBBbWxvZ2ljIEdYTCBkYXRhc2hlZXQgaXMgbm90b3Jpb3VzbHkgaW5hY2N1cmF0ZS4K
PiAKPiBFVEhfUkVHMiAwWEM4ODM0NTU4Cj4gMjk6MjggUiAweDEgcmVzZXJ2ZWQKPiAKPiBJdCBj
bGFpbXMgdGhlIGJpdCBpcyByZWFkIG9ubHkgd2hpbGUgdGhlIEJTUCBoYXJkIGNvZGVzIHRoZSBz
ZXR0aW5nIG9mCj4gdGhpcyByZWdpc3Rlci4gSSBhbSBvcGVuIHRvIGFueSBuYW1lIGZvciB0aGlz
IHJlZ2lzdGVyIGJpdC4KPiBUaGlzIGlzIHRoZSBvbmx5IHRoaW5nIGhvbGRpbmcgdXAgZGlzdHJv
IG5ldGJvb3RpbmcgZm9yIHRoZXNlIHZlcnkKPiBwb3B1bGFyIGNoaXAgZmFtaWx5LgoKV2hpY2gg
aW50ZXJmYWNlIG1vZGUgZG8gd2UgdGhpbmsgdGhpcyBhZmZlY3RzPwoKQXMgYSBzdWdnZXN0aW9u
LCBtYXliZSBjYWxsIGl0OgoKUkVHMl88aW50ZXJmYWNlbW9kZT5fRU4KCmFuZCBwb3NzaWJseSBh
ZGQgYSBjb21tZW50ICJUaGlzIGJpdCBpcyBkb2N1bWVudGVkIGFzIHJlc2VydmVkLCBidXQKbmVl
ZHMgdG8gYmUgc2V0IHNvIHRoYXQgPGludGVyZmFjZW1vZGU+IGNhbiBwYXNzIHRyYWZmaWMuIFRo
aXMgaXMKYW4gdW5vZmZpY2lhbCBuYW1lLiIKCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBz
Oi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4
ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
