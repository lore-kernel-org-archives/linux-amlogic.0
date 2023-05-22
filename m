Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45DDC7EE26
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 May 2023 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Fi3snfEQjLdfvwaFyWQHiX71hBUVjyuFBAKOCnCCKY=; b=qTk4QD4/XfZSXj
	hxbjSzf7jZX/XmGRZ+2j039uM1IAcsLQjpAHvXar+HWawJ2W+MEdkBH1pzkeXMH/7Qozff/udbTCz
	lt+wTy1i0aQhtcLiF2xcNvmLinmoHxeQIE34UTYwFXxcT8Zw3f1wKQeAX+As/Nk70rH2aEVCjXTm9
	hx62CL+RDXhvFa4Nd5UNh2lkhNDtdhVM+ZXabTaeUlZp2ZEvnoYMcGosdd8lrXk8SCe82V6OfaNCY
	/KRhbozMdQh4pfSckWqGuW9vsQWVs2DXK4gzI2wUac/GeBUntWYOhgmXteBJThkSVD0aKIrpSN7Is
	pi9f9W9KX8rcdP29op1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q159e-006a7R-21;
	Mon, 22 May 2023 13:00:50 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q159a-006a4a-2n;
	Mon, 22 May 2023 13:00:49 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C31025FD58;
	Mon, 22 May 2023 16:00:39 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1684760439;
	bh=T6WKzzi3geeqvAy+HEhZbkW5M1xIRqiwgNjBVb8OkRo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=aHg2wtT4t/YN+m4Hm0+/DjlM7GcCu0BxVK16ZlSnw3gvWKJI/NzF36myC7IqP4Y2f
	 vE9xnUnxtI6pIAo7ih/uPeyKffuh2qI1ecqFdomMfc0Ny+WuXQTuvYDgbXi4Cs+Opx
	 ftwwtpVUpMWH3bGl+LXPpzfrOL2Izh+WaY0sNBAhj68J77x82Iw8NSQQxglHUNE4x/
	 lU20fYZqzzr/LkdS9ySyJ2Dj1loK83Mr9A48dHdiFcRcfYnNAc18xjYKj0kCHOvdxR
	 uuQ3SX8BFMDdBC55gOrZziq8P1Wt94Tgwde5Qp6oMvOxiq5+0dCH4gvQwyaAWIqxO4
	 jyfqGm0CvLjDA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 22 May 2023 16:00:38 +0300 (MSK)
Date: Mon, 22 May 2023 16:00:33 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<khilman@baylibre.com>, <jian.hu@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v15 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <20230522130033.a47vlybocme66rev@CAB-WSD-L081021>
References: <20230517133309.9874-1-ddrokosov@sberdevices.ru>
 <20230517133309.9874-6-ddrokosov@sberdevices.ru>
 <CAFBinCC3kQ9Nz3R2W-Qj9tbPJfS8JsB_4AkmPgS6xpQ96DBy2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCC3kQ9Nz3R2W-Qj9tbPJfS8JsB_4AkmPgS6xpQ96DBy2w@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/22 08:14:00 #21365129
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_060047_603141_62F88DB0 
X-CRM114-Status: GOOD (  20.93  )
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

TWFydGluLAoKT24gRnJpLCBNYXkgMTksIDIwMjMgYXQgMTE6MDk6MjlQTSArMDIwMCwgTWFydGlu
IEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBLcnp5c3p0b2YgYW5kIERtaXRyeSwKPiAKPiBPbiBX
ZWQsIE1heSAxNywgMjAyMyBhdCAzOjMz4oCvUE0gRG1pdHJ5IFJva29zb3YgPGRkcm9rb3NvdkBz
YmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4gWy4uLl0KPiA+ICsgIGNsb2NrczoKPiA+ICsgICAgaXRl
bXM6Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogaW5wdXQgZml4ZWQgcGxsIGRpdjIKPiA+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBpbnB1dCBmaXhlZCBwbGwgZGl2Mwo+ID4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IGlucHV0IGZpeGVkIHBsbCBkaXY1Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjog
aW5wdXQgZml4ZWQgcGxsIGRpdjcKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBpbnB1dCBoaWZp
IHBsbAo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGlucHV0IG9zY2lsbGF0b3IgKHVzdWFsbHkg
YXQgMjRNSHopCj4gPiArCj4gPiArICBjbG9jay1uYW1lczoKPiA+ICsgICAgaXRlbXM6Cj4gPiAr
ICAgICAgLSBjb25zdDogZmNsa19kaXYyCj4gPiArICAgICAgLSBjb25zdDogZmNsa19kaXYzCj4g
PiArICAgICAgLSBjb25zdDogZmNsa19kaXY1Cj4gPiArICAgICAgLSBjb25zdDogZmNsa19kaXY3
Cj4gPiArICAgICAgLSBjb25zdDogaGlmaV9wbGwKPiA+ICsgICAgICAtIGNvbnN0OiB4dGFsCj4g
VGhpcyBJUCBibG9jayBoYXMgYXQgbGVhc3Qgb25lIGFkZGl0aW9uYWwgaW5wdXQgY2FsbGVkICJz
eXNfcGxsX2RpdjE2Ii4KPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlICJzeXNfcGxsX2Rp
djE2IiBjbG9jayBpcyBnZW5lcmF0ZWQgYnkgdGhlCj4gQ1BVIGNsb2NrIGNvbnRyb2xsZXIuIFN1
cHBvcnQgZm9yIHRoZSBDUFUgY2xvY2sgY29udHJvbGxlcgo+IChkdC1iaW5kaW5ncyBhbmQgYSBk
cml2ZXIpIHdpbGwgYmUgYWRkZWQgYXQgYSBsYXRlciB0aW1lIGJ5IERtaXRyeS4KPiBIb3cgY2Fu
IHdlIG1hbmFnZSBpbmNyZW1lbnRhbGx5IGltcGxlbWVudGluZyB0aGUgY2xvY2sgY29udHJvbGxl
cnM/Cj4gRnJvbSBhIGhhcmR3YXJlIHBlcnNwZWN0aXZlIHRoZSAic3lzX3BsbF9kaXYxNiIgaW5w
dXQgaXMgbWFuZGF0b3J5Lgo+IEhvdyB0byBtYW5hZ2UgdGhpcyBpbiB0aGUgLmR0cyBwYXRjaGVz
IHRoZW4gKGZvciBleGFtcGxlOiBkb2VzIHRoaXMKPiBtZWFuIHRoYXQgRG1pdHJ5IGNhbiBvbmx5
IGFkZCB0aGUgY2xvY2sgY29udHJvbGxlciB0byB0aGUgLmR0cyB3aGVuCj4gYWxsIGNsb2NrIGNv
bnRyb2xsZXIgYmluZGluZ3MgaGF2ZSBiZWVuIGltcGxlbWVudGVkIC0gb3IgaXMgdGhlcmUKPiBh
bm90aGVyIHdheSk/CgpZb3UncmUgYWJzb2x1dGVseSByaWdodDogY3VycmVudGx5LCBub3QgYWxs
IGlucHV0cyBhcmUgc3VwcG9ydGVkIGJlY2F1c2UKdGhlIENQVSBjbG9jayBjb250cm9sbGVyIGlz
bid0IHJlYWR5IHlldCDigJMgSSdtIHdvcmtpbmcgb24gaXQgYXQgdGhlCm1vbWVudC4KCkkgdW5k
ZXJzdGFuZCB5b3VyIGNvbmNlcm5zIGFib3V0IGJpbmRpbmdzIGFuZCBzY2hlbWEgZGVzY3JpcHRp
b24sIGJ1dAp0aGVyZSBpcyBhbiBpc3N1ZSB0byBiZSBjb25zaWRlcmVkLiBJJ20gZGV2ZWxvcGlu
ZyB0aGUgZW50aXJlIGNsb2NrCmNvbnRyb2xsZXIgQTEgc3Vic3lzdGVtIGluY3JlbWVudGFsbHkg
aW4gdGhyZWUgc3RhZ2VzOiBwZXJpcGhlcmFscyBhbmQKUExMLCBDUFUsIGFuZCBBdWRpby4gVGhp
cyBpcyBiZWNhdXNlIHRoZSBDUFUgY2FuIG9wZXJhdGUgYXQgYSBzdGF0aWMKZnJlcXVlbmN5IGFu
ZCB2b2x0YWdlLCBhbmQgdGhlIGJvYXJkIGJvb3RzIG5vcm1hbGx5IHdpdGhvdXQgdGhlIENQVQpj
bG9jayBjb250cm9sbGVyLCB0aGVybWFsIHNlbnNvciwgYW5kIE9QUCB0YWJsZS4gQXVkaW8gaXMg
YWxzbwppbXBvcnRhbnQsIGJ1dCBpdCdzIG9wdGlvbmFsLiBPbiB0aGUgb3RoZXIgaGFuZCwgd2l0
aG91dCBzZXR0aW5nIHVwIHRoZQpwZXJpcGhlcmFscyBhbmQgUExMIGNvbnRyb2xsZXJzLCB0aGUg
Ym9hcmQgd29uJ3QgZnVuY3Rpb24gYmVjYXVzZQp0aGV5J3JlIGZ1bmRhbWVudGFsLgoKUmlnaHQg
bm93LCB3ZSdyZSBpbiB0aGUgZmlyc3Qgc3RhZ2Ugb2YgdGhlIHBsYW4uIFVuZm9ydHVuYXRlbHks
IEkgY2FuJ3QKZGlzY2xvc2UgdGhlIGV4YWN0IG5hbWVzIGFuZCBudW1iZXIgb2YgY2xvY2sgYmlu
ZGluZ3MgZm9yIHRoZSBDUFUgYW5kCkF1ZGlvLCBhcyB0aGV5J3JlIHN0aWxsIGluIGRldmVsb3Bt
ZW50IGFuZCBvbmx5IGV4aXN0IGluIG15IGhlYWQgb3IKZHJhZnQgdmVyc2lvbnMuCgpJZiBwb3Nz
aWJsZSwgSSdkIHByZWZlciB0byBwcm92aWRlIHRoZSBuZXcgYmluZGluZ3MgYW5kIGNvbm5lY3Rp
b25zIG9uY2UKYWxsIHRoZSBhcHByb3ByaWF0ZSBkcml2ZXJzIGFyZSBmaW5hbGl6ZWQuCgotLSAK
VGhhbmsgeW91LApEbWl0cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
