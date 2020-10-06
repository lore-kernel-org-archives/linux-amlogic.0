Return-Path: <SRS0=7v4i=DN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B360C41604
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2020 22:28:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 935CF206FC
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2020 22:28:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SmAKKZzd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 935CF206FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zFPbR54POLi84MsLSBJfVfdl5jwVrp1dL194NLtFKEc=; b=SmAKKZzdptUwZZVGbtM6UXXGd
	9YZZ8G4pGn2BccO5s+ZbafwZBxiu5OuID1i8wHIQ7ZMJ3K9dpa6o3OuxiDXxuWkn6/AMmyDREBcQH
	A4Fbvhqlm1362NutWdYL7NkXfHh8ukR4m3knoMpTetzqIyZ80OJNHwjDWb6fMcqfeLPv5QRapeXn5
	pLYYAVNg/q5jxIb/o8Tu6ZIWBbj51NdDI0dvZON+fabgrUeXzZP3SlzjZizkL/Wz8jGnbrIUZ6k1K
	wXUc7JvOnELRwQxEn2cEgxRb2QrbuEesY/RDvPsyXp38B7reEwMOyqJhaQ35l8KYWgUw+2hKerJFJ
	QftmKCqPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPvRB-0001Q0-Ae; Tue, 06 Oct 2020 22:28:01 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPvR6-0001P2-I3; Tue, 06 Oct 2020 22:27:57 +0000
Received: by mail-ot1-f66.google.com with SMTP id m13so363699otl.9;
 Tue, 06 Oct 2020 15:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bIxfwcUKhwWi5PXEHY2oibtjWm53f5qOOJ6d+hhSij8=;
 b=HozXsYWDOf70k3Llyl+k2lXcw5LLGTtbPOBuhKVkWCcYjLevyJ4cLIxJJPW/bvSkfC
 mq5CKczAb/TADgZr3Avr+JaErX5W87bLcy2Vsrs54NdMCTKY7iwK5HAd8VtVJFkXWlq4
 74EhS8wA4Bz+mZ8h+BUmwl7seBb5eQL/HAem4mhihAPhxrc2/uU0zUCSthj/kApOv6Ce
 D312JD0HvRqV6zjbCTGqw7rIt87eF4AZKOIxbwl4jCij6Tutw53H2i/bXdmd65OjYwYB
 +F62+iz9UZtFJFSdo7aP6ool6vU50/6ClygEfv5czluv1zwxn40OSA5fp37CZqL/1Vys
 YjFg==
X-Gm-Message-State: AOAM532Pk4Y8e+51ZdFAmBK6CnM4LLGnGYyFKjZ8jmXqAQfhVQp37sTN
 jKA8kANKnBojrsmIsvSJ0Q==
X-Google-Smtp-Source: ABdhPJxRwMszI2DlfXiX8dwjERn3YfMK8ci9QTyyCK5c1CqJYSx11XCGap5FgjPbZZOpuJCAn1RIGg==
X-Received: by 2002:a05:6830:138f:: with SMTP id
 d15mr85548otq.342.1602023275282; 
 Tue, 06 Oct 2020 15:27:55 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t5sm96136otl.22.2020.10.06.15.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 15:27:54 -0700 (PDT)
Received: (nullmailer pid 2969307 invoked by uid 1000);
 Tue, 06 Oct 2020 22:27:53 -0000
Date: Tue, 6 Oct 2020 17:27:53 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Message-ID: <20201006222753.GA2965477@bogus>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
 <20201006021729.GA4822@labundy.com> <3367098.sbkyfNuaKI@ada>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3367098.sbkyfNuaKI@ada>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_182756_608489_D7D9A388 
X-CRM114-Status: GOOD (  29.20  )
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
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-omap@vger.kernel.org,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 Jeff LaBundy <jeff@labundy.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMDYsIDIwMjAgYXQgMDg6MzQ6MjNBTSArMDIwMCwgQWxleGFuZGVyIERhaGwg
d3JvdGU6Cj4gSGVsbG8gSmVmZiwKPiAKPiBBbSBEaWVuc3RhZywgNi4gT2t0b2JlciAyMDIwLCAw
NDoxNzoyOSBDRVNUIHNjaHJpZWIgSmVmZiBMYUJ1bmR5Ogo+ID4gSGkgQWxleGFuZGVyLAo+ID4g
Cj4gPiBPbiBNb24sIE9jdCAwNSwgMjAyMCBhdCAxMDozNDo0MlBNICswMjAwLCBBbGV4YW5kZXIg
RGFobCB3cm90ZToKPiA+ID4gVGhlIG5vZGUgbmFtZXMgZm9yIGRldmljZXMgdXNpbmcgdGhlIHB3
bS1sZWRzIGRyaXZlciBmb2xsb3cgYSBjZXJ0YWluCj4gPiA+IG5hbWluZyBzY2hlbWUgKG5vdyku
ICBQYXJlbnQgbm9kZSBuYW1lIGlzIG5vdCBlbmZvcmNlZCwgYnV0IHJlY29tbWVuZGVkCj4gPiA+
IGJ5IERUIHByb2plY3QuCj4gPiA+IAo+ID4gPiAgIERUQyAgICAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsZS5kdC55YW1sCj4gPiA+ICAgQ0hFQ0sg
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC5leGFtcGxlLmR0
LnlhbWwKPiA+ID4gCj4gPiA+IC9ob21lL2FsZXgvYnVpbGQvbGludXgvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsCj4gPiA+IGUuZHQueWFtbDogcHdt
bGVkczogJ3BhbmVsJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6Cj4gPiA+ICde
bGVkKC1bMC05YS1mXSspPyQnLCAncGluY3RybC1bMC05XSsnPiAKPiA+ID4gICAgICAgICBGcm9t
IHNjaGVtYToKPiA+ID4gICAgICAgICAvaG9tZS9hbGV4L3NyYy9saW51eC9sZWRzL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzLwo+ID4gPiAgICAgICAgIGxlZHMtcHdtLnlh
bWw+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgRGFobCA8cG9zdEBsZXNwb2NreS5k
ZT4KPiA+ID4gLS0tCj4gPiA+IAo+ID4gPiBOb3RlczoKPiA+ID4gICAgIHY2IC0+IHY3Ogo+ID4g
PiAgICAgICAqIGFkZGVkIHdhcm5pbmcgbWVzc2FnZSB0byBjb21taXQgbWVzc2FnZSAoS3J6eXN6
dG9mIEtvemxvd3NraSkKPiA+ID4gICAgIAo+ID4gPiAgICAgdjY6Cj4gPiA+ICAgICAgICogYWRk
ZWQgdGhpcyBwYXRjaCB0byBzZXJpZXMKPiA+ID4gIAo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFtbCB8IDUgKysrLS0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFt
bAo+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4Lnlh
bWwgaW5kZXgKPiA+ID4gNTQxYjA2ZDgwZTczLi45MmRjNDhhOGRmYTcgMTAwNjQ0Cj4gPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LnlhbWwKPiA+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFt
bAo+ID4gPiAKPiA+ID4gQEAgLTkwLDEwICs5MCwxMSBAQCBleGFtcGxlczoKPiA+ID4gICAgICAg
ICAgICAgIH07Cj4gPiA+ICAgICAgCj4gPiA+ICAgICAgfTsKPiA+ID4gCj4gPiA+IC0gICAgcHdt
bGVkcyB7Cj4gPiA+ICsgICAgbGVkLWNvbnRyb2xsZXIgewo+ID4gPiAKPiA+ID4gICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAicHdtLWxlZHMiOwo+ID4gPiAKPiA+ID4gLSAgICAgICAgICAgIHBh
bmVsIHsKPiA+ID4gKyAgICAgICAgICAgIGxlZC0xIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgbGFiZWwgPSAicGFuZWwiOwo+ID4gPiAKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgcHdt
cyA9IDwmaXFzNjIwYV9wd20gMCAxMDAwMDAwPjsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
bWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKPiA+ID4gICAgICAgICAgICAgIAo+ID4gPiAgICAgICAg
ICAgICAgfTsKPiA+IAo+ID4gSSBsaWtlIHRoZSBjb25zaXN0ZW5jeSB0aGlzIGJyaW5ncy4gTXkg
b25seSBmZWVkYmFjayBpcyB0aGF0IGluIHRoZSBvdGhlcgo+ID4gZXhhbXBsZXMgSSBmb3VuZCAo
Y29tbW9uLnlhbWwgYW5kIGxlZHMtZ3Bpby55YW1sKSwgdGhlIGNoaWxkcmVuIGNvdW50IG9mZgo+
ID4gZnJvbSAwIChlLmcuIGxlZC0wKSBpbnN0ZWFkIG9mIDEgYXMgeW91ciBzZXJpZXMgYXBwZWFy
cyB0by4KPiAKPiBZb3UncmUgcmlnaHQuICBBbmQgdGhhdCdzIGFsc28gdGhlIHNhbWUgaW4gbGVk
cy1scDUweHgueWFtbCBhbmQg4oCmIHdlbGwgSSBkaWQgCj4gbm90IGxvb2sgY2xvc2UgZW5vdWdo
LCBtYXliZSB0aGUgbnVtYmVyaW5nIHNjaGVtZSBvbiB0aGUgUENCIG9uIG15IGRlc2sgCj4gY29u
ZnVzZWQgbWUuCgpJZiB5b3UgY2FuIHRpZSB0aGUgbnVtYmVyaW5nIHRvIHRoZSBQQ0IsIHRoZW4g
ZG8gdGhhdC4KCj4gT2theSwgd2UgYXJlIGFscmVhZHkgdGFsa2luZyBhYm91dCBzdGFydGluZyBp
bmRleC4gIFdoYXQgYWJvdXQgdGhlIHBhcmVudCAKPiBub2RlJ3MgImxlZC1jb250cm9sbGVyIiB0
aGVuIGluIGNhc2UgdGhlcmUgYXJlIG1vcmUgdGhhbiBvbmU/ICBJSVJDIFJvYiAKPiBhY2tub3ds
ZWRnZWQgc3RhcnRpbmcgZnJvbSAxIGxpa2UgImxlZC1jb250cm9sbGVyLTEiLCAibGVkLWNvbnRy
b2xsZXItMiIgYW5kIAo+IHNvIG9uLgoKTm8sIEknZCBhc3N1bWUgd2Ugc3RhcnQgYXQgMC4KCj4g
PiBUaGF0J3Mgbm90IGEgaHVnZSBkZWFsOyBpdCBzaW1wbHkgc2VlbXMgbW9yZSBjb25zaXN0ZW50
IHRvIGNvdW50IGZyb20gdGhlCj4gPiBmaXJzdCBpbmRleCBhbGxvd2VkIGJ5IHRoZSByZWdleCAo
MCkuIFRoZSBwYXRjaCBpcyBzdGlsbCBmaW5lLCBhbmQgc286Cj4gPiAKPiA+IEFja2VkLWJ5OiBK
ZWZmIExhQnVuZHkgPGplZmZAbGFidW5keS5jb20+Cj4gCj4gVGhhbmtzLgo+IAo+IEknbSBub3Qg
c3VyZSBob3cgbWFueSBtb3JlIGl0ZXJhdGlvbnMgb2YgdGhpcyBzZXJpZXMgd2Ugd2lsbCBuZWVk
LCBhdCBsZWFzdCAKPiBvbmUgZm9yIHRoZSBiaW5kaW5nIGxpY2Vuc2UgYWNrcyBJIGd1ZXNzLCBz
byBJIGNvdWxkIGFsc28gYWRhcHQgdGhlIGNoaWxkIG5vZGUgCj4gaW5kZXhlcyBpbiBzY2hlbWEg
YW5kIGFjdHVhbCBkdHMgZmlsZXMgaW4gdjggb3Igc28uCj4gCj4gR3JlZXRzCj4gQWxleAo+IAo+
IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
