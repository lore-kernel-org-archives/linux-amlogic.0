Return-Path: <SRS0=7v4i=DN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAF6C46466
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2020 06:34:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A94BF206DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2020 06:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bIbjI2aF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A94BF206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4AdWdBh/X0auRkx9Gffw7R3RJKEFdJIrRbtf5vsvl4=; b=bIbjI2aFHLwjaMq99hL/Dg3AFd
	/1vjxUCQQlkYywx2NDpensN6K1WY5PVoKzBDqXGnXyJgRT3TXhEI+hnWRsDLg2q5hLdcd8F3T7ndA
	0+bXdBT9JTmdGmwgZYvPQonW3p6PFAdc83sb5ncpOg7T5/UmWCXci3iHJcmhdr8ihZ2PrYGwGnQ1Y
	dw4/jTKU8+dky9tUUyDC8Jvyr/39QxWBRJbFtE9HysVxWDNdnPbC8ohInmR9UB9mk8LmKWJC2Py6u
	A9Vttu6W4coB1NzaDo6sdkVEU9MPtdt2TCgQFn0xK+X+gCZtUZETU1uA7RZwETacDPWbe7Pxn/L3W
	4aOabkuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPgYY-0000MP-1H; Tue, 06 Oct 2020 06:34:38 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPgYU-0000Le-UL; Tue, 06 Oct 2020 06:34:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 9C9A630D1;
 Tue,  6 Oct 2020 08:34:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXRxBl68g992; Tue,  6 Oct 2020 08:34:31 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 0387C3D26; Tue,  6 Oct 2020 08:34:29 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Date: Tue, 06 Oct 2020 08:34:23 +0200
Message-ID: <3367098.sbkyfNuaKI@ada>
In-Reply-To: <20201006021729.GA4822@labundy.com>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de> <20201006021729.GA4822@labundy.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_023435_930745_60D1E034 
X-CRM114-Status: GOOD (  22.92  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gSmVmZiwKCkFtIERpZW5zdGFnLCA2LiBPa3RvYmVyIDIwMjAsIDA0OjE3OjI5IENFU1Qg
c2NocmllYiBKZWZmIExhQnVuZHk6Cj4gSGkgQWxleGFuZGVyLAo+IAo+IE9uIE1vbiwgT2N0IDA1
LCAyMDIwIGF0IDEwOjM0OjQyUE0gKzAyMDAsIEFsZXhhbmRlciBEYWhsIHdyb3RlOgo+ID4gVGhl
IG5vZGUgbmFtZXMgZm9yIGRldmljZXMgdXNpbmcgdGhlIHB3bS1sZWRzIGRyaXZlciBmb2xsb3cg
YSBjZXJ0YWluCj4gPiBuYW1pbmcgc2NoZW1lIChub3cpLiAgUGFyZW50IG5vZGUgbmFtZSBpcyBu
b3QgZW5mb3JjZWQsIGJ1dCByZWNvbW1lbmRlZAo+ID4gYnkgRFQgcHJvamVjdC4KPiA+IAo+ID4g
ICBEVEMgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LmV4
YW1wbGUuZHQueWFtbAo+ID4gICBDSEVDSyAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvaXFzNjJ4LmV4YW1wbGUuZHQueWFtbAo+ID4gCj4gPiAvaG9tZS9hbGV4L2J1aWxk
L2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LmV4YW1w
bAo+ID4gZS5kdC55YW1sOiBwd21sZWRzOiAncGFuZWwnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0
aGUgcmVnZXhlczoKPiA+ICdebGVkKC1bMC05YS1mXSspPyQnLCAncGluY3RybC1bMC05XSsnPiAK
PiA+ICAgICAgICAgRnJvbSBzY2hlbWE6Cj4gPiAgICAgICAgIC9ob21lL2FsZXgvc3JjL2xpbnV4
L2xlZHMvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvCj4gPiAgICAgICAg
IGxlZHMtcHdtLnlhbWw+IAo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIERhaGwgPHBvc3RA
bGVzcG9ja3kuZGU+Cj4gPiAtLS0KPiA+IAo+ID4gTm90ZXM6Cj4gPiAgICAgdjYgLT4gdjc6Cj4g
PiAgICAgICAqIGFkZGVkIHdhcm5pbmcgbWVzc2FnZSB0byBjb21taXQgbWVzc2FnZSAoS3J6eXN6
dG9mIEtvemxvd3NraSkKPiA+ICAgICAKPiA+ICAgICB2NjoKPiA+ICAgICAgICogYWRkZWQgdGhp
cyBwYXRjaCB0byBzZXJpZXMKPiA+ICAKPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL2lxczYyeC55YW1sIHwgNSArKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC55YW1sCj4gPiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LnlhbWwgaW5kZXgKPiA+IDU0MWIw
NmQ4MGU3My4uOTJkYzQ4YThkZmE3IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFtbAo+ID4gCj4gPiBAQCAtOTAsMTAgKzkw
LDExIEBAIGV4YW1wbGVzOgo+ID4gICAgICAgICAgICAgIH07Cj4gPiAgICAgIAo+ID4gICAgICB9
Owo+ID4gCj4gPiAtICAgIHB3bWxlZHMgewo+ID4gKyAgICBsZWQtY29udHJvbGxlciB7Cj4gPiAK
PiA+ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInB3bS1sZWRzIjsKPiA+IAo+ID4gLSAgICAg
ICAgICAgIHBhbmVsIHsKPiA+ICsgICAgICAgICAgICBsZWQtMSB7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICBsYWJlbCA9ICJwYW5lbCI7Cj4gPiAKPiA+ICAgICAgICAgICAgICAgICAgICAgIHB3
bXMgPSA8JmlxczYyMGFfcHdtIDAgMTAwMDAwMD47Cj4gPiAgICAgICAgICAgICAgICAgICAgICBt
YXgtYnJpZ2h0bmVzcyA9IDwyNTU+Owo+ID4gICAgICAgICAgICAgIAo+ID4gICAgICAgICAgICAg
IH07Cj4gCj4gSSBsaWtlIHRoZSBjb25zaXN0ZW5jeSB0aGlzIGJyaW5ncy4gTXkgb25seSBmZWVk
YmFjayBpcyB0aGF0IGluIHRoZSBvdGhlcgo+IGV4YW1wbGVzIEkgZm91bmQgKGNvbW1vbi55YW1s
IGFuZCBsZWRzLWdwaW8ueWFtbCksIHRoZSBjaGlsZHJlbiBjb3VudCBvZmYKPiBmcm9tIDAgKGUu
Zy4gbGVkLTApIGluc3RlYWQgb2YgMSBhcyB5b3VyIHNlcmllcyBhcHBlYXJzIHRvLgoKWW91J3Jl
IHJpZ2h0LiAgQW5kIHRoYXQncyBhbHNvIHRoZSBzYW1lIGluIGxlZHMtbHA1MHh4LnlhbWwgYW5k
IOKApiB3ZWxsIEkgZGlkIApub3QgbG9vayBjbG9zZSBlbm91Z2gsIG1heWJlIHRoZSBudW1iZXJp
bmcgc2NoZW1lIG9uIHRoZSBQQ0Igb24gbXkgZGVzayAKY29uZnVzZWQgbWUuCgpPa2F5LCB3ZSBh
cmUgYWxyZWFkeSB0YWxraW5nIGFib3V0IHN0YXJ0aW5nIGluZGV4LiAgV2hhdCBhYm91dCB0aGUg
cGFyZW50IApub2RlJ3MgImxlZC1jb250cm9sbGVyIiB0aGVuIGluIGNhc2UgdGhlcmUgYXJlIG1v
cmUgdGhhbiBvbmU/ICBJSVJDIFJvYiAKYWNrbm93bGVkZ2VkIHN0YXJ0aW5nIGZyb20gMSBsaWtl
ICJsZWQtY29udHJvbGxlci0xIiwgImxlZC1jb250cm9sbGVyLTIiIGFuZCAKc28gb24uCgo+IFRo
YXQncyBub3QgYSBodWdlIGRlYWw7IGl0IHNpbXBseSBzZWVtcyBtb3JlIGNvbnNpc3RlbnQgdG8g
Y291bnQgZnJvbSB0aGUKPiBmaXJzdCBpbmRleCBhbGxvd2VkIGJ5IHRoZSByZWdleCAoMCkuIFRo
ZSBwYXRjaCBpcyBzdGlsbCBmaW5lLCBhbmQgc286Cj4gCj4gQWNrZWQtYnk6IEplZmYgTGFCdW5k
eSA8amVmZkBsYWJ1bmR5LmNvbT4KClRoYW5rcy4KCkknbSBub3Qgc3VyZSBob3cgbWFueSBtb3Jl
IGl0ZXJhdGlvbnMgb2YgdGhpcyBzZXJpZXMgd2Ugd2lsbCBuZWVkLCBhdCBsZWFzdCAKb25lIGZv
ciB0aGUgYmluZGluZyBsaWNlbnNlIGFja3MgSSBndWVzcywgc28gSSBjb3VsZCBhbHNvIGFkYXB0
IHRoZSBjaGlsZCBub2RlIAppbmRleGVzIGluIHNjaGVtYSBhbmQgYWN0dWFsIGR0cyBmaWxlcyBp
biB2OCBvciBzby4KCkdyZWV0cwpBbGV4CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
