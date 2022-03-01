Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9B6C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 21:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+CdFXbujDi31/98hE3ISnzkOzH+E08w7sqDdYLRRTs=; b=QaKTe8mmQoheu+
	2j3M/8aCZIi5lC71FiHKQr5HmsE00o6fXSMgCde7JEaW7/i5hY5Bvn2tb4GfBbvBtfKXu4lQY91fj
	ldfx6Qo0G4/duPyzPFHCaKIWkqiNhwD9EQWksmfgvQSw0E4MIxXt0Lz+olPaxi4fnY5+CZy1bTtgF
	jwefP2FpvDC8V6xql+iYaTfaw5hFt6nFn7cWpF/Y3e3dfqFmBwyEfgWBnbrCi4bnOFeRH2ptxGsxF
	LVZj92DiSpe8Chnxz413xrTFN5E/XlrWVtNLhpo20JLNV+6ZpUvvTJecSnsJqgy+7EFJ/j3qQHDVa
	mLwIm+zXGImxyapY28Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP9hS-000ZT4-3E; Tue, 01 Mar 2022 21:06:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP9hP-000ZSF-Tw; Tue, 01 Mar 2022 21:06:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EB0860FD8;
 Tue,  1 Mar 2022 21:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6658BC340EF;
 Tue,  1 Mar 2022 21:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646168782;
 bh=LUH6Agnh4EUwm1WPKWlvIKHHlNsF7Xd6XjQCsPhHrhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ebjrozWnpXJYbhUq6pS5tgtAdOyzvGpvvtFgBn11LUQER2RwtyZGmPGWEcrgFxo91
 BUhjMNUPJVa4r04dAzAXFcqC7ybum5Qj8XuXzOBIRUXeQmy2KmdIpxJ/VQzZbf1qJM
 AHugB0VuyM8LIcyZkK0Q7Vkzkfro/uSCUn0VGGSE=
Date: Tue, 1 Mar 2022 22:06:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH V3] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Message-ID: <Yh6KzOU4xsSB0lRf@kroah.com>
References: <20220228135530.6918-1-yu.tu@amlogic.com>
 <29b34655-f820-39c9-4363-878481cd3f63@baylibre.com>
 <Yh087tJhakKHs88e@kroah.com>
 <8747c5c6-a129-3a26-8ebb-9e21a18236ec@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8747c5c6-a129-3a26-8ebb-9e21a18236ec@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_130624_039858_727C18CF 
X-CRM114-Status: GOOD (  19.67  )
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

T24gVHVlLCBNYXIgMDEsIDIwMjIgYXQgMDg6MjM6MjZBTSArMDEwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGkgR3JlZywKPiAKPiBMZSAyOC8wMi8yMDIyIMOgIDIyOjIxLCBHcmVnIEtyb2Fo
LUhhcnRtYW4gYSDDqWNyaXTCoDoKPiA+IE9uIE1vbiwgRmViIDI4LCAyMDIyIGF0IDAzOjEzOjQ4
UE0gKzAxMDAsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IE9u
IDI4LzAyLzIwMjIgMTQ6NTUsIFl1IFR1IHdyb3RlOgo+ID4gPiA+IERlc2NyaWJlcyB0aGUgY2Fs
Y3VsYXRpb24gb2YgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIHVzaW5nIGEgY2xvY2sKPiA+ID4g
PiBmcmFtZS4gRm9yZ290IHRvIGFkZCBpbiBLY29uZmlnIGtlcm5lbCB0ZXN0IFJvYm90IGNvbXBp
bGF0aW9uIGVycm9yCj4gPiA+ID4gZHVlIHRvIENPTU1PTl9DTEsgZGVwZW5kZW5jeS4KPiA+ID4g
PiAKPiA+ID4gPiBGaXhlczogKCJ0dHk6IHNlcmlhbDptZXNvbjogRGVzY3JpYmVzIHRoZSBjYWxj
dWxhdGlvbiBvZiB0aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNpbmcgYSBjbG9jayBmcmFtZeKA
nCkKPiA+ID4gCj4gPiA+IEFzIEkgYWxyZWFkeSByZXBsaWVkIG9uIFYyIG9mIHRoaXMgcGF0Y2gs
IHlvdSdyZSBpbnZpdGVkIHRvIGFwcGx5IHRoZXNlIGZpeGVzIGRpcmVjdGx5Cj4gPiA+IG9uIHRo
ZSBuZXh0IHZlcnNpb24gb2YgeW91ciAiVXNlIENDRiB0byBkZXNjcmliZSB0aGUgVUFSVCBiYXVk
IHJhdGUgY2xvY2siIHBhdGNoc2V0Cj4gPiA+IGFuZCBub3QgYXMgYSBzZXBhcmF0ZSBwYXRjaC4K
PiA+IAo+ID4gTm8sIHRoaXMgaXMgYnJva2VuIGluIGxpbnV4LW5leHQgbm93IGFzIHRoZSBwYXRo
IGxpc3RlZCBoZXJlIGlzIGluIG15Cj4gPiB0cmVlIHJpZ2h0IG5vdy4KPiAKPiBPaCwgSSB3YXNu
J3QgYXdhcmUgeW91IHRvb2sgdGhpcyBwYXRjaHNldC4KPiAKPiA+IAo+ID4gSSBuZWVkIGEgZml4
IGZvciBpdCwgb3IgSSBjYW4gcmV2ZXJ0IHRoZSBvcmlnaW5hbC4KPiAKPiBQbGVhc2UgcmV2ZXJ0
IHRoZSB3aG9sZSBwYXRjaHNldCwgaXQncyBub3QgcmVhZHkgeWV0LCBuZWl0aGVyIGZ1bGx5IHJl
dmlld2VkIGFuZHMgYnVnZ3kKPiBvbiBvbGQgU29Dcy4KClllcywgd2lsbCBnbyBkbyBzbyBub3cs
IHRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93IGFuZCBzb3JyeSBhYm91dCBhbGwKb2YgdGhpcy4K
CmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
