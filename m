Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167EDE7718B
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2024 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOMHhwHy5dGK9O+OmlCiqH3B5OCtzVNasW0An3tPDC4=; b=c0Ena96fk47xOJ
	j8qhhRltLis5qmodFYhcG0j9NVYHxM50oPTZmVlmre7qbXEIgt12t4xxCi8LlT7cW7E71ypT7oapP
	2ZO1CLcMqokVrUk7VCiM/CM6HDfDGo7wh85IH1I2Wswoq4EcaS4ltb5LfdUL6c6i0lP2/8CSDy4JJ
	fQp3M1wRDiG5LivSFzup5Sq0Vk1bqVwpd2AfKjqz3ApncgIey+FLuOcbeOAH4tWmAjLlyaB0JgfDK
	5EdBZqX88IkXLIRNLkuu83/g/lxk3diy2RxPO8Z5b1mylVweb4KUfAOEGcBWuB1MgvOoKCrmqid9q
	6h2bbNYX9OQ3DJf+A7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQWc3-0000000ED71-1S22;
	Wed, 25 Dec 2024 19:00:07 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQWbw-0000000ED5Z-3EhO;
	Wed, 25 Dec 2024 19:00:05 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DA1BE100004;
	Wed, 25 Dec 2024 21:59:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DA1BE100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1735153190;
	bh=77AplkoSGCxoTa1YkDUJlVHZqj2RtqiABDMyhY8HDtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=SkYsd/lBBBshTX1D8P5pOKUu03fMbligVrL9aP8uV2FYgPqxq8GF3wvnCgMQamiuV
	 SylXfpKuJ4N8qcSCMd5KmWpONJWgCToRO0E+i3YqbbrJ848wjADpm0BTbLLPNu4MtO
	 JF9ivBrh/JvxEQSunmHIuMYxs6//Y89V/0+9mLMox/rAF6pduCPV/zb6R7VOGBbwqt
	 u0NCHfCcTypM0n1lJ+wlwbEUT3lj9scbR3s+WkQgmtbBltM089sPtrCemHoX2Yl4Qq
	 0AGeiWeFSinucUFi+TThX3vaKg9BU+8MDnnDp9yvdoIeS56H7e7gw78BpZoGxYaEvz
	 q7jeTtW22vUFw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 25 Dec 2024 21:59:50 +0300 (MSK)
Message-ID: <55de8bd9-7fbd-460b-b6d1-3b4b9e288f2c@salutedevices.com>
Date: Wed, 25 Dec 2024 21:59:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] iio: adc: meson: consistently use bool/enum in
 struct meson_sar_adc_param
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<neil.armstrong@linaro.org>, <lars@metafoo.de>, <jic23@kernel.org>,
	<linux-amlogic@lists.infradead.org>, "kernel@salutedevices.com"
	<kernel@salutedevices.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Zelong
 Dong <zelong.dong@amlogic.com>
References: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
 <20240323231309.415425-3-martin.blumenstingl@googlemail.com>
 <37cb9bc9-88c0-4e2b-8f46-0f67b91bc5be@salutedevices.com>
 <CAFBinCBxsv92t_B_T3vBDJJ1K5BwUbV=as6sy-KyQYz+2jur2g@mail.gmail.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <CAFBinCBxsv92t_B_T3vBDJJ1K5BwUbV=as6sy-KyQYz+2jur2g@mail.gmail.com>
X-Originating-IP: [172.28.128.238]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190063 [Dec 25 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;github.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/12/25 17:49:00
X-KSMG-LinksScanning: Clean, bases: 2024/12/25 17:49:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/25 17:59:00 #26917053
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_110003_100589_C7091A77 
X-CRM114-Status: GOOD (  21.93  )
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

SGVsbG8gTWFydGluCgpPbiAxMi8yNC8yNCAxNzozNywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90
ZToKPiBIaSBHZW9yZ2UsCj4gCj4gT24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgMTo0MeKAr0FNIEdl
b3JnZSBTdGFyayA8Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbT4gd3JvdGU6Cj4gWy4uLl0KPj4+
ICAgIGVudW0gbWVzb25fc2FyX2FkY19hdmdfbW9kZSB7Cj4+PiAgICAgICAgTk9fQVZFUkFHSU5H
ID0gMHgwLAo+Pj4gICAgICAgIE1FQU5fQVZFUkFHSU5HID0gMHgxLAo+Pj4gQEAgLTMyMSwxMyAr
MzI2LDEzIEBAIHN0cnVjdCBtZXNvbl9zYXJfYWRjX3BhcmFtIHsKPj4+ICAgICAgICB1OCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVtcGVyYXR1cmVfdHJpbW1pbmdfYml0
czsKPj4+ICAgICAgICB1bnNpZ25lZCBpbnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVt
cGVyYXR1cmVfbXVsdGlwbGllcjsKPj4+ICAgICAgICB1bnNpZ25lZCBpbnQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGVtcGVyYXR1cmVfZGl2aWRlcjsKPj4+IC0gICAgIHU4ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkaXNhYmxlX3JpbmdfY291bnRlcjsKPj4+ICsg
ICAgIGJvb2wgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkaXNhYmxlX3Jpbmdf
Y291bnRlcjsKPj4+ICAgICAgICBib29sICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaGFzX3JlZzExOwo+Pj4gICAgICAgIGJvb2wgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBoYXNfdnJlZl9zZWxlY3Q7Cj4+PiAtICAgICB1OCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdnJlZl9zZWxlY3Q7Cj4+PiAtICAgICB1OCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY212X3NlbGVjdDsKPj4+IC0gICAgIHU4ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGNfZW9jOwo+Pgo+Pgo+PiBUaGUgcmVhc29u
IHRvIGNob29zZSB1OCB0eXBlIG92ZXIgYm9vbCB3YXMgdGhhdCB0aG9zZSBhcmUgbm90IGFjdHVh
bGx5Cj4+IGJvb2wgdmFsdWVzIGJ1dCBkaXJlY3QgdmFsdWVzIG9mIGh3IHJlZ2lzdGVyIGJpdHMu
IFdlIGhhdmUgbGl0dGxlCj4+IGluZm9ybWF0aW9uIGFib3V0IHJlYWwgbWVhbmluZyBvZiB0aGVz
ZSBiaXRzIHNvIGl0IHdvbid0IGhlbHAgbXVjaCB0bwo+PiBhZGQgYm9vbCBsYXllciBhbmQga2Vl
cCByZWFsIHZhbHVlcyBpbiB0aGUgaW5pdCBjb2RlIGluc3RlYWQgb2YgcGFyYW0KPj4gc2VjdGlv
biAoYWRjX2VvYywgY212X3NlbGVjdCkuCj4+IGJvb2wgZGlzYWJsZV9yaW5nX2NvdW50ZXIgd2ls
bCBsb29rIGRlY2VwdGl2ZSB0b28gYmVjYXVzZSBpdCBkb2Vzbid0Cj4+IHNheSB3aGV0aGVyIGRp
c2FibGUgcmluZ19jb3VudGVyIG9yIG5vdCAod2UgYWx3YXlzIGRpc2FibGUgaXQpIGJ1dAo+PiBo
b3cgdG8gZGlzYWJsZSBpdCAod3JpdGUgMCBvciAxKQo+IERvIHlvdSBoYXZlIGFueSBjb250YWN0
IGF0IEFtbG9naWMgdGhhdCBjYW4gaGVscCBleHBsYWluIHRoZSBwdXJwb3NlCj4gb2YgdGhlc2Ug
Yml0cz8KCkkgcmVtZW1iZXIgSSB3YXMgZGlnZ2luZyB0aHJ1IHZlbmRvciBrZXJuZWwgYW5kIHVi
b290IGNvZGUgdG8gdW5kZXJzdGFuZCAKdGhlIG1lYW5pbmcgb2YgdGhvc2UgYml0cyB3aGVuIHBy
ZXBhcmVkIG15IGFkYyBwYXRjaGVzLiBJJ2xsIGNoZWNrIGl0IAphZ2FpbiBhYm91dCB0aGVzZSBh
bmQgYmVsbG93IGJpdHMgYW5kIHdpbGwgbGV0IHlvdSBrbm93IGlmIEkgZmluZCAKYW55dGhpbmcg
d29ydGh3aGlsZS4KCj4gSSB0cmllZCByZWFjaGluZyBvdXQgdG8gbXkgY29udGFjdCBvZmYtbGlz
dCBidXQgZGlkIG5vdCBnZXQgYW55IGFuc3dlcnMuCj4gCj4gSSBhbHNvIGhhdmUgbW9yZSBxdWVz
dGlvbnMgYWJvdXQgdGhlIFNBUkFEQyBJUCBibG9jayBvbiB0aGUgR1hMWCBTb0MuCj4gV2UgKENo
cmlzdGlhbiBhbmQgSSkgaGF2ZSBhIHBhdGNoIHByZXBhcmVkIHRvIGZpeCBhdWRpbyAob3IgcmF0
aGVyIHRoZQo+IE1QTEwgY2xvY2tzKSBvbiB0aGUgR1hMWCBTb0MgKHNlZSBbMF0pLiBVbmZvcnR1
bmF0ZWx5IHRoZXJlIHNlZW1zIHRvCj4gYmUgbm9ib2R5IHRoYXQncyBhbnN3ZXJpbmcgbWUgd2l0
aCBlbm91Z2ggaW5mbyBzbyB3ZSBjYW4gdXBzdHJlYW0gdGhhdAo+IHBhdGNoLgo+IAo+IFNvIGlm
IHlvdSBoYXZlIGFueSBjb250YWN0IG9yIGluc2lnaHRzIGludG8gZGF0YXNoZWV0cyAtIHBsZWFz
ZSBjaGVjawo+IGFuZCBzZWUgaWYgeW91IGNhbiBwcm92aWRlIGluZm9ybWF0aW9uIHNvIHdlIGNh
biBpbXByb3ZlIHRoZSBuYW1pbmcgb2YKPiB0aGVzZSBiaXRzIGFuZCBob3BlZnVsbHkgZ2V0IEdY
TFggU29DIHN1cHBvcnQgZml4ZWQuCj4gCj4gQWxzbyArQ2MgWGluZ3l1IENoZW4gYW5kIFplbG9u
ZyBEb25nIC0gSSBmb3VuZCB5b3VyIG5hbWVzIGluCj4gZG93bnN0cmVhbSBwYXRjaGVzIHRvIHRo
ZSBTQVJBREMgZHJpdmVyIFsxXS4KPiAKPiAKPiBUaGFuayB5b3UgYW5kIGJlc3QgcmVnYXJkcywK
PiBNYXJ0aW4KPiAKPiAKPiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dp
Yy8yMDI0MDYwNDA1NTQzMS4zMzEzOTYxLTItY2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20vCj4g
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9raGFkYXMvbGludXgvY29tbWl0LzEzMzIxZDIzMjMxYTdh
NGQwOGY0ZmVmZWJjZWYxMWIzNzk0NzVhMzcKCi0tIApCZXN0IHJlZ2FyZHMKR2VvcmdlCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
