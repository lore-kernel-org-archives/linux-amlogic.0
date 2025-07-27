Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795F8C87FCE
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jul 2025 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddDbSwWLqgyRFVjxIj/UXu8Uhg8aZZqixTVWgd7lf5E=; b=wB4MuTLVwrlVOF
	DaWMi+ktWSHT3ca7sNt7U3/N/ImbOoXhxsDDVMzwomeyAwYhvsgP/UfHzxfuEFH5gcP3lf//DA87f
	fyaj6j9GUFIVeXheicePi9cAAiZMmFjH7e5FbAELaCxwvFScIJmnE4b0/Tzesy1a7pEhOvynJj7tj
	l+faVcW7MI707lL4SCVvz0Wfwjf9ptkJGcfvArcOOs55zyGlsk1YgtWvxeQDzifYDxOtc9bkwcHm6
	/w+Ac/31YygazCRjTwqC21souqOKbDXVpqRfeKiwVsZ8Fp2+e90E3loLja1b0Kb84m7XjmeC6z5d+
	VxH/IwNMwZccjq94a7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug17N-0000000Cj96-37dD;
	Sun, 27 Jul 2025 13:08:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug17L-0000000Cj8g-1AS2;
	Sun, 27 Jul 2025 13:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A928418C9;
	Sun, 27 Jul 2025 13:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4FBC4CEEB;
	Sun, 27 Jul 2025 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753621722;
	bh=hN9LDjd6CLq5G10VnQYY9Dgif1+I33fW6zwuL/KlJ70=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NXaDpZkGOTrdczLzZtFLw5a5TR8K0054fptr52ejiMIh1u4w9pSTseGI5EM4ABgBI
	 KFEGCpfdanCIdw4ssb8+lXrAxDEZH6PMFvAyOo8d63kNZs0+YAnKq9LMdy4RrngvVI
	 BWUiXIe9yz3irGRVtZiy2dzWcTogwYzAz+X3CraVX+FXuWBeMXnK8qtT+9cjkbvs8m
	 sDkT32CjuFhHf4Ftpfk1qvX4vHGSy3R44Y3gmk21n/6zqAIMgygoGGfvZ5sqhlw1+i
	 84Hx8Q54byOG/8Y97zfDS30QwogWcARAyel32hT+Rp/BGSN5r18AzUKP6JuDoDfnPq
	 9cxXOLprtOFfA==
Date: Sun, 27 Jul 2025 14:08:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sanjay Suthar <sanjaysuthar661996@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ribalda@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML
 docs
Message-ID: <20250727140828.4893fc51@jic23-huawei>
In-Reply-To: <8f4358e8-ecd6-4d86-8326-25d21c3a4ea2@gmail.com>
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
	<20250724111247.669d6955@jic23-huawei>
	<8f4358e8-ecd6-4d86-8326-25d21c3a4ea2@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_060843_337561_67FBC9F1 
X-CRM114-Status: GOOD (  19.47  )
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

T24gVGh1LCAyNCBKdWwgMjAyNSAyMjozODoxNCArMDUzMApTYW5qYXkgU3V0aGFyIDxzYW5qYXlz
dXRoYXI2NjE5OTZAZ21haWwuY29tPiB3cm90ZToKCj4gT24gMjQvMDcvMjUgMTU6NDIsIEpvbmF0
aGFuIENhbWVyb24gd3JvdGU6Cj4gPiBPbiBUdWUsIDIyIEp1bCAyMDI1IDIyOjM1OjEzICswNTMw
Cj4gPiBTYW5qYXkgU3V0aGFyIDxzYW5qYXlzdXRoYXI2NjE5OTZAZ21haWwuY29tPiB3cm90ZToK
PiA+ICAKPiA+PiBGaXggbWlub3IgZ3JhbW1hdGljYWwgaXNzdWVzIGJ5IHJlbW92aW5nIGR1cGxp
Y2F0ZWQgImlzIiBpbiB0d28gZGV2aWNldHJlZQo+ID4+IGJpbmRpbmcgZG9jdW1lbnRzOgo+ID4+
Cj4gPj4gLSBuZXQvYW1sb2dpYyxtZXNvbi1kd21hYy55YW1sCj4gPj4gLSBpaW8vZGFjL3RpLGRh
Yzc2MTIueWFtbAo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogU2FuamF5IFN1dGhhciA8c2FuamF5
c3V0aGFyNjYxOTk2QGdtYWlsLmNvbT4gIAo+ID4gSSdkIGhhdmUgbm8gcHJvYmxlbSB3aXRoIHRo
ZSBhcmd1bWVudCB0aGF0IHRoaXMgY2FuIGdvIHRocm91Z2ggZWl0aGVyCj4gPiB0cmVlIGlmIHRo
ZXJlIHdhcyBhbnkgaW50ZXJhY3Rpb24gYmV0d2VlbiB0aGUgZmlsZXMgb3IgdGhlIGNoYW5nZXMs
IGJ1dAo+ID4gaGVyZSB0aGVyZSBpc24ndC4gVGhpcyBpcyBqdXN0IGNhdXNpbmcgcG90ZW50aWFs
IG1lc3MgaWYgZWl0aGVyIHRyZWUgZW5kcwo+ID4gdXAgd2l0aCBvdGhlciBjaGFuZ2VzIG92ZXJs
YXBwaW5nIHRoaXMgZm9yIG5vIGJlbmVmaXQuICBQbGVhc2Ugc3BsaXQgaW50bwo+ID4gdHdvIHBh
dGNoZXMsIG9uZSBmb3IgZWFjaCBzdWJzeXN0ZW0uICBZb3Ugc2hvdWxkIGJlIGZpbmUgdG8ga2Vl
cCB0aGUKPiA+IHZhcmlvdXMgdGFncyBnaXZlbiBoZXJlIGZvciB0aGUgbmV3IHBhdGNoZXMuICAK
PiAKPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4gcmVn
YXJkaW5nIHNwbGl0dGluZyB0aGUgCj4gY2hhbmdlcy4gTXkgaW50ZW50aW9uIHdhcyB0aGF0LCBz
aW5jZSB0aGUgZml4IGlzIGEgdHJpdmlhbCBhbmQgaWRlbnRpY2FsIAo+IGdyYW1tYXRpY2FsIGNv
cnJlY3Rpb24gYWNyb3NzIGJvdGggc3Vic3lzdGVtcywgaXQgZGlkbuKAmXQgc2VlbSBuZWNlc3Nh
cnkgCj4gdG8gc2VwYXJhdGUgdGhlbS4KPiAKPiBIb3dldmVyLCBJ4oCZbSBvcGVuIHRvIGVpdGhl
ciBhcHByb2FjaCDigJQga2VlcGluZyBpdCBhcyBhIHNpbmdsZSBwYXRjaCBvciAKPiBzcGxpdHRp
bmcgaXQgaWYgdGhhdCdzIHByZWZlcnJlZC4gQXMgSeKAmW0gc3RpbGwgbmV3IHRvIHRoaXMgcHJv
Y2VzcywgSeKAmWxsIAo+IGRlZmVyIHRvIEBrcnp5c3p0b2YgYW5kIHRoZSBEVCBtYWludGFpbmVy
cyBmb3IgdGhlIGZpbmFsIGNhbGwgb24gaG93IAo+IHRoaXMgc2hvdWxkIGJlIGhhbmRsZWQuCj4g
Cj4gUGxlYXNlIGxldCBtZSBrbm93IHRoZSBwcmVmZXJyZWQgZGlyZWN0aW9uLCBhbmQgSeKAmWxs
IGJlIGhhcHB5IHRvIHVwZGF0ZSAKPiBhY2NvcmRpbmdseS4KCkRUIGJpbmRpbmdzIHVsdGltYXRl
bHkgZ28gdGhyb3VnaCB0aGUgc3Vic3lzdGVtIHRyZWVzIChpbiB2YXN0IG1ham9yaXR5IG9mCmNh
c2VzKSB0byBhdm9pZCBjaHVybiBpc3N1ZXMgYW5kIGtlZXAgdGhlbSBhbGlnbmVkIHdpdGggZHJp
dmVyIGNoYW5nZXMuClNvIHNwbGl0IGl0LgoKVGhhbmtzCgpKb25hdGhhbgoKPiAKPiBCZXN0IHJl
Z2FyZHMsCj4gCj4gU2FuamF5IFN1dGhhcgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
