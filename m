Return-Path: <SRS0=ZEtl=4N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58911C35DF8
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Feb 2020 07:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28AF721744
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Feb 2020 07:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dilmvao5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28AF721744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hpbUujXDuIhPsGEQllEjgrPt0JfuXpL6ak1+jUttJ+I=; b=Dilmvao5KVGlI1JEY3SXGr4F2
	dXF2pzgub8DTNiWRYnZPQNffUb5mqmWUId3uBJhHdn3F1YKp1MIxBmXxXt96sJQNZWZqmeOPpCCu2
	PRnuJsTFHgZLrg16V9IB9Tmw6zlPJRUsMNw9SlKJ6OXDO2W68W2/vrpOPMwO4IwfrRHdf0RwBuoap
	k+MrIV7Si3v0dzhfqgMnL4pfjjduEdOXmLKcPLHSSqYyihLj3bq4pmsg3Odd21MMj3OpTTojT/GqH
	sb2W2eSuTysx/Z55ZZ5vCmqXqyxeFskuTnGppQEqvMK6JJxjMjPCWv6j0cUfBXxR6QFultr78ruFM
	IzIJIgSaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6UtI-0003g9-H1; Tue, 25 Feb 2020 07:44:28 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6UtG-0003fb-6F
 for linux-amlogic@lists.infradead.org; Tue, 25 Feb 2020 07:44:27 +0000
Received: from [10.28.90.149] (10.28.90.149) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Tue, 25 Feb 2020
 15:44:21 +0800
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
From: Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <b4ba821a-eef6-4aea-1eba-897171b92c41@amlogic.com>
Date: Tue, 25 Feb 2020 15:44:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAODwPW8WwntWb_=dg2J3AMy-gHw2QvNj_g98SufN13+AuGnUSg@mail.gmail.com>
Content-Language: en-GB
X-Originating-IP: [10.28.90.149]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_234426_235840_2A19CF5B 
X-CRM114-Status: GOOD (  13.06  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 linux-watchdog@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Yonghui Yu <yonghui.yu@amlogic.com>,
 Evan Benn <evanbenn@chromium.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "open
 list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksIEp1bGl1cwoKT24gMjAyMC8yLzI1IDk6MjMsIEp1bGl1cyBXZXJuZXIgd3JvdGU6Cj4+IFRo
ZSBTTUMgZnVuY3Rpb24gSUQgbWF5IGJlIHNvbHZlZCBieSB0aGUgRFRTLCBidXQgdGhlIHdkdCBp
bmRleHMoRWc6Cj4+IFNNQ1dEX0lORk8pIGFyZSBhbHNvIGRpZmZlcmVudAo+PiBmb3IgZWFjaCB2
ZW5kb3IuIFRoZSBpbXhfc2Nfd2R0LmMgaXMgYWxzbyB1c2UgdGhlIFNNQyB0byBvcGVyYXRlIHRo
ZQo+PiBXRFQsIGJ1dCB0aGUgd2R0IGluZGV4cyhFZzogSU1YX1NJUF9USU1FUl9TVEFSVF9XRE9H
KQo+PiBhcmUgZGlmZmVyZW50IGZyb20gb3Vycy4gSU1PLCBJZiB0aGUgQVRGIGNhbiBpbXBsZW1l
bnQgYSBjb21tb24gaGFsCj4+IGludGVyZmFjZSBhbmQgaW5kZXggZm9yIHdhdGNoZG9nLCB0aGVu
IHdyaXRpbmcgYQo+PiBjb21tb24gc21jIHdkdCBkcml2ZXIgd2lsbCBiZSBlYXNpZXIgdG8gY29t
cGF0aWJsZSB3aXRoIGFsbCB2ZW5kb3JzLgo+IFRoZSBNZWRpYVRlayBkcml2ZXIgaXMgc3RpbGwg
aW4gZmx1eCAoZS5nLiBzdGlsbCBiZWluZyByZXZpZXdlZCBpbgo+IFRydXN0ZWQgRmlybXdhcmUg
aGVyZToKPiBodHRwczovL3Jldmlldy50cnVzdGVkZmlybXdhcmUub3JnL2MvVEYtQS90cnVzdGVk
LWZpcm13YXJlLWEvKy8zNDA1KSwKPiB3ZSBjYW4gc3RpbGwgY2hhbmdlIGl0LiBTbyBpZiB3ZSBj
YW4gbm93IGRlY2lkZSBvbiBtYWtpbmcgdGhpcyBhCj4gInN0YW5kYXJkIiBkcml2ZXIsIHdlIGNh
biBjaGFuZ2UgdGhlIE1lZGlhVGVrIGludGVyZmFjZSB0byBtYXRjaCBJTVgKPiBhbmQgc3RhbmRh
cmRpemUgb24gdGhhdC4gKFRoZXJlIGFyZSBleGlzdGluZyBDaHJvbWVib29rcyBzaGlwcGVkIHdp
dGgKPiBhIGRpZmZlcmVudCBpbnRlcmZhY2UsIGJ1dCB3ZSBjb3VsZCBoYW5kbGUgdGhvc2Ugc2Vw
YXJhdGVseSB3aXRoCj4gZG93bnN0cmVhbSBwYXRjaGVzLiBJIHRoaW5rIGhhdmluZyBhIHVuaWZp
ZWQgaW50ZXJmYWNlIHRoYXQgd2lsbAo+IHByZXZlbnQgdGhpcyBwcm9ibGVtIGluIHRoZSBmdXR1
cmUgd291bGQgYmUgd29ydGggc29tZSBleHRyYQo+IGNvbXBsaWNhdGlvbiByaWdodCBub3cuKQpJ
ZiB0aGUgQVRGIHByb3ZpZGVzIGEgY29tbW9uIHdhdGNoZG9nIGhhbCBpbnRlcmZhY2UgYW5kIGlu
ZGV4LCBJIGFtIApoYXBweSB0byBtYXRjaAp0aGUgZ2VuZXJpYyBzZWMgd2R0IGRyaXZlci4gQ29t
cGFyZWQgdG8gdGhlIGN1cnJlbnQgTVRLIHdkdCBpbmRleCBbMF0sIAp0aGUgZm9sbG93aW5nCmlu
ZGV4ZXMgbmVlZCB0byBiZSBzdXBwb3J0ZWQgZm9yIG1lc29uIHdkdCBbMV0uCi0gKl9JTklULgot
ICpfR0VUVElNRU9VVC4KLSAqX1JFU0VUTk9XLsKgIEl0IGlzIHVzZWQgdG8gcmVzZXQgdGhlIHN5
c3RlbSByaWdodCBub3csIHNpbWlsYXIgdG8geW91ciAKU09GVCBSRVNFVC4KCkZvciBhbm90aGVy
IHBsYXRmb3JtLXNwZWNpZmljIHBhcmFtZXRlciAiU01DIGZ1bmN0aW9uIElEIiwgdGhlIGdlbmVy
aWMgCnNlYyB3ZHQgZHJpdmVyIGNhbiBnZXQgaXQgZnJvbSB0aGUgZHRzLCBidXQgaWYKdGhlIGRy
aXZlciB3YW50IHRvIGNvbXBhdGlibGUgd2l0aCBtb3JlIHZlbmRvcnMgaW4gdGhlIGZ1dHVyZSwg
bWF5YmUgd2UgCnNob3VsZCBjb25zaWRlciBHdWVudGVyJ3Mgc3VnZ2VzdGlvbiBhdCBbMl0KClsw
XTogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTM5NTU3OS8KWzFdOiBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMzMxMjcxLwpbMl06IApodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC13YXRjaGRvZy8yMDIwMDIyMDE1NTE1OS5HQjI5NjU4QHJvZWNr
LXVzLm5ldC9ULyNtZDAwMzI4NTQ4MjIyOTY1MDU0Y2QxOWVjN2RkYTA3NGY4ZmMwOWZlMgoKQmVz
dCBSZWdhcmRzCj4gLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
