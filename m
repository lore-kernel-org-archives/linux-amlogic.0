Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA2AC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mwadz0S8klZYHJQsbX/bHzgfJvD4th/3LJmdmPKD6M=; b=cBxmVmXjAESCvW
	r4UMV4u/SzND6zXORttQqs1aPSBGWp3BkWVDsf2Q8aDtDcAKplpZUK59DYyULecrqPgSditI/sVdf
	0k918yblNhRafi4gc3pNzhtH4XEoce5ywaLsanGfN7eXJGb0YqvgWT1Dn2E5/JwCZTR2YDvgGbe6I
	ZanA5dKI4l5lXXMWH1M+24x/Z4vY6YsK8UXjVm4lA3ngJ9NVy6fIRicivEgrvuGpR18QRMS2zjf1b
	YXSEu7mGs3xBH56U4CH08sZ160rcO5dvlh+FFFh4kHThkHzmXT2cm4mKvVmsjflyJuqRkJlykL/5V
	bBaG70dYAymKzvXqlMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxF0-00FP4z-Aa; Tue, 01 Mar 2022 07:48:14 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxEk-00FOyV-2Z; Tue, 01 Mar 2022 07:47:59 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 1 Mar
 2022 15:47:53 +0800
Message-ID: <96dc5932-7a4c-4f92-b33b-bfd7fc4477e8@amlogic.com>
Date: Tue, 1 Mar 2022 15:47:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, kernel test robot <lkp@intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
References: <20220228135530.6918-1-yu.tu@amlogic.com>
 <29b34655-f820-39c9-4363-878481cd3f63@baylibre.com>
 <Yh087tJhakKHs88e@kroah.com>
 <8747c5c6-a129-3a26-8ebb-9e21a18236ec@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <8747c5c6-a129-3a26-8ebb-9e21a18236ec@baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_234758_181569_873DAD9F 
X-CRM114-Status: GOOD (  11.17  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTmVpbCwKCk9uIDIwMjIvMy8xIDE1OjIzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBbIEVY
VEVSTkFMIEVNQUlMIF0KPiAKPiBIaSBHcmVnLAo+IAo+IExlIDI4LzAyLzIwMjIgw6AgMjI6MjEs
IEdyZWcgS3JvYWgtSGFydG1hbiBhIMOpY3JpdMKgOgo+PiBPbiBNb24sIEZlYiAyOCwgMjAyMiBh
dCAwMzoxMzo0OFBNICswMTAwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+
IE9uIDI4LzAyLzIwMjIgMTQ6NTUsIFl1IFR1IHdyb3RlOgo+Pj4+IERlc2NyaWJlcyB0aGUgY2Fs
Y3VsYXRpb24gb2YgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIHVzaW5nIGEgY2xvY2sKPj4+PiBm
cmFtZS4gRm9yZ290IHRvIGFkZCBpbiBLY29uZmlnIGtlcm5lbCB0ZXN0IFJvYm90IGNvbXBpbGF0
aW9uIGVycm9yCj4+Pj4gZHVlIHRvIENPTU1PTl9DTEsgZGVwZW5kZW5jeS4KPj4+Pgo+Pj4+IEZp
eGVzOiAoInR0eTogc2VyaWFsOm1lc29uOiBEZXNjcmliZXMgdGhlIGNhbGN1bGF0aW9uIG9mIHRo
ZSBVQVJUIAo+Pj4+IGJhdWQgcmF0ZSBjbG9jayB1c2luZyBhIGNsb2NrIGZyYW1l4oCcKQo+Pj4K
Pj4+IEFzIEkgYWxyZWFkeSByZXBsaWVkIG9uIFYyIG9mIHRoaXMgcGF0Y2gsIHlvdSdyZSBpbnZp
dGVkIHRvIGFwcGx5IAo+Pj4gdGhlc2UgZml4ZXMgZGlyZWN0bHkKPj4+IG9uIHRoZSBuZXh0IHZl
cnNpb24gb2YgeW91ciAiVXNlIENDRiB0byBkZXNjcmliZSB0aGUgVUFSVCBiYXVkIHJhdGUgCj4+
PiBjbG9jayIgcGF0Y2hzZXQKPj4+IGFuZCBub3QgYXMgYSBzZXBhcmF0ZSBwYXRjaC4KPj4KPj4g
Tm8sIHRoaXMgaXMgYnJva2VuIGluIGxpbnV4LW5leHQgbm93IGFzIHRoZSBwYXRoIGxpc3RlZCBo
ZXJlIGlzIGluIG15Cj4+IHRyZWUgcmlnaHQgbm93Lgo+IAo+IE9oLCBJIHdhc24ndCBhd2FyZSB5
b3UgdG9vayB0aGlzIHBhdGNoc2V0Lgo+IAo+Pgo+PiBJIG5lZWQgYSBmaXggZm9yIGl0LCBvciBJ
IGNhbiByZXZlcnQgdGhlIG9yaWdpbmFsLgo+IAo+IFBsZWFzZSByZXZlcnQgdGhlIHdob2xlIHBh
dGNoc2V0LCBpdCdzIG5vdCByZWFkeSB5ZXQsIG5laXRoZXIgZnVsbHkgCj4gcmV2aWV3ZWQgYW5k
cyBidWdneQo+IG9uIG9sZCBTb0NzLgpJIGhhdmUgdGVzdGVkIHRoYXQgdGhlcmUgaXMgbm8gcHJv
YmxlbSB3aXRoIEcxMkEgYW5kIFM0IGJvYXJkcy4gQ2FuIEkgCm1lcmdlIHRoZW0gZmlyc3QgYW5k
IGZpeCB0aGVtIGxhdGVyIGlmIHRoZXJlIGlzIGFueSBwcm9ibGVtPwo+IAo+IFRoYW5rcywKPiBO
ZWlsCj4gCj4+Cj4+IHRoYW5rcywKPj4KPj4gZ3JlZyBrLWgKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
