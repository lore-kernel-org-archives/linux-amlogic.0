Return-Path: <SRS0=FIcl=46=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9619FC10DCE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2020 16:13:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 688FD2072C
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2020 16:13:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ME5Cl7aJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 688FD2072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rYEOBT1983tf6nM6Xp7a4ajj0R01ND8TFlsJ2rkcVo8=; b=ME5Cl7aJ6Y/21mmNqMvlRtMfK
	vtCz6nBhVv+V1/1ESpLJ+0Dtl+3zrq2tJhvxZcuF9ujbEPzxot8gb2UDo7mtAlHDes5XY3ZRoD5Ka
	tqB2iOL4M+Fob3jJMbZx3e2gk2SUejTNCS2kFe12uStVkttOWevysFQe1Sar9fd3gQj4mxxam0pzX
	mWWzY9EtrSyR/JikqZEjfBKzQB5c1D/w71Z0sRU+Cn8CqdR+tzkvsGdQ00DZEG3or/wHaeKWmvHwZ
	h22dG5hW7Ita1rHB2EPnRwKlz7EJqP99vQA4yKLiQRzvlZ2aS+44VyCLCvlwIA2JJIizZ9sX5CXDE
	ha+yi4Q2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCmvh-0005KD-Kc; Fri, 13 Mar 2020 16:12:57 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCmvf-0005JR-4m
 for linux-amlogic@lists.infradead.org; Fri, 13 Mar 2020 16:12:56 +0000
Received: from [10.28.90.144] (10.28.90.144) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Sat, 14 Mar 2020
 00:13:10 +0800
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To: Julius Werner <jwerner@chromium.org>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus>
 <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net>
 <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
 <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com>
 <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
 <1326f594-3cfd-c03d-4f2c-50eeb75724b2@amlogic.com>
 <CAODwPW8WwntWb_=dg2J3AMy-gHw2QvNj_g98SufN13+AuGnUSg@mail.gmail.com>
 <b4ba821a-eef6-4aea-1eba-897171b92c41@amlogic.com>
 <CAKz_xw2T1UceCwFZnBxg6WVp2D4+MziyvQPdU6tEnR_BdLh-PQ@mail.gmail.com>
 <ad28aa47-0490-937f-898f-0e4695ef6ec6@amlogic.com>
 <CAODwPW9oxx33hkO3kv2_G8YyLWvigVHkfJU7xUHLVgB7QU2i3Q@mail.gmail.com>
From: Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <6e846246-dfd5-c002-cd61-41c2d11a2e54@amlogic.com>
Date: Sat, 14 Mar 2020 00:13:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAODwPW9oxx33hkO3kv2_G8YyLWvigVHkfJU7xUHLVgB7QU2i3Q@mail.gmail.com>
Content-Language: en-GB
X-Originating-IP: [10.28.90.144]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_091255_186811_600A41A4 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Evan Benn <evanbenn@chromium.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Yonghui Yu <yonghui.yu@amlogic.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksIEp1bGl1cwoKT24gMjAyMC8zLzEyIDM6MjQsIEp1bGl1cyBXZXJuZXIgd3JvdGU6Cj4+IC0g
Kl9JTklUIGFuZCAqR0VUVElNRU9VVC4gICAgICBBbHRob3VnaCB5b3VyIGRyaXZlciBkb2VzIG5v
dCBuZWVkIHRoZW0sIGNvdWxkIHlvdSB0YWtlIHRoZW0gYXMgb3B0aW9ucyBpbiB5b3VyIGRyaXZl
ciA/Cj4gVGhlIGRyaXZlciBhbHJlYWR5IGhhcyBTTUNXRF9JTkZPIHdoaWNoIGlzIHVzZWQgZHVy
aW5nIHByb2JlIHRvCj4gcmV0cmlldmUgdGhlIG1pbmltdW0gYW5kIG1heGltdW0gdGltZW91dCB2
YWx1ZXMgc3VwcG9ydGVkIGJ5IHRoZQo+IGhhcmR3YXJlIGF0IHByb2JlIHRpbWUuIE1heWJlIGl0
IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gcmVuYW1lIHRoYXQgdG8KPiBJTklUICh3aGljaCB3b3VsZCBz
dGlsbCByZXR1cm4gdGhvc2UgdmFsdWVzLCBidXQgY2FuIGFsc28gZG8gd2hhdGV2ZXIKPiBpbml0
aWFsaXphdGlvbiBuZWVkcyB0byBiZSBkb25lIGluIFRGKT8KWWVz77yMSU5JVCB3b3VsZCBtYWtl
IHNlbnNlIGZvciBtZS4KPiBHRVRUSU1FTEVGVCBJIGFncmVlIHdlIGNhbgo+IGltcGxlbWVudCBv
cHRpb25hbGx5LCBhbmQgb3RoZXIgcGxhdGZvcm1zIHdvdWxkIGp1c3QgcmV0dXJuIGEKPiBQU0NJ
X1JFVF9OT1RfU1VQUE9SVEVEIGZvciB0aGF0Lgo+Cj4+IC0gKl9SRVNFVE5PVy4gICAgICBJdCBp
cyB1c2VkIHRvIHJlc2V0IHRoZSBzeXN0ZW0gcmlnaHQgbm93LCBzaW1pbGFyIHRvIHlvdXIgU09G
VCBSRVNFVC4gY291bGQgeW91IHJlc2VydmUgYW4gb3BlcmF0aW9uIGluZGV4IGluIEFURiA/Cj4g
SnVzdCBjdXJpb3VzLCB3aHkgZG8geW91IG5lZWQgdGhpcz8gU2hvdWxkbid0IHlvdSB1c2UgdGhl
IFBTQ0kKPiBzdGFuZGFyZCBTWVNURU1fUkVTRVQgU01DIGZvciB0aGF0PyAoSWYgeW91IHdhbnQg
dG8gY29udHJvbCBleGFjdGx5Cj4gaG93IHRoZSBwbGF0Zm9ybSBpcyByZXNldCwgeW91IGNvdWxk
IGFsc28gdXNlIFNZU1RFTV9SRVNFVDIgd2l0aCBhCj4gdmVuZG9yLWRlZmluZWQgcmVzZXRfdHlw
ZS4pCkkganVzdCB3YW50ZWQgaXQgdG8gYmUgY29tcGF0aWJsZSB3aXRoIG90aGVyIE9T77yMYW5k
IEnCoCB0aGluayBpdCBvdmVyLCAKbWF5YmUgSSBjYW4gYWxzbyB1c2UgdGhlClBTQ0kgaW50ZXJm
YWNlIHRvIGV4ZWN1YXRlIHRoZSBzeXN0ZW0gcmVzZXQgb24gdGhlIG90aGVyIE9TLiBBbnl3YXks
IApwbGVhc2UgaWdub3JlIHRoaXMgcmVxdWVzdC4KClRoYW5rcy4KPgo+IC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
