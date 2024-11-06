Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE24D44D75
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2024 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vfyx3m0MWeTDDQkKLB/rX+2HN8amv6E289J/QLNJ+jE=; b=dPH0/Y+QjHFp2k
	Vuk5Q3AgEEcwLzd5gYP/kFQBG2+a4rSB0OD0PXiIc2MpSUfLvwEu70t3AbLNrNYTc7bMBM5IaKqEo
	1YLA2qpQ0HlteXUel8FjCFaEMJQelLS/0FuCqCVv1gijhICOCuEvlX3T/uVIei4aYQxHqTROqJO6a
	vdXj6cIqVN7CBONp/ONCl6NHO7iXH96SGD2URz/anOJeEmsxsAzvvuLpUvoo13bpwHixqYQAku/a6
	xpo3JXTFqAtb7abmQ2kO+/DyJuNgOozcDnPa+UEaMXq7rVtv4UumPSxEWuBjYXELX2fplbjIPAG+R
	D79QUJpikrA5UXRXU2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gjH-00000003Xty-0Pc8;
	Wed, 06 Nov 2024 14:09:51 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gUk-00000003VJO-11Uw;
	Wed, 06 Nov 2024 13:54:54 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CC512100027;
	Wed,  6 Nov 2024 16:54:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CC512100027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730901282;
	bh=TamoRQHVz3CLLV4TriCaXhJ6JFCj9iwTzd2ELzYslvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=ftP6I8KI+D0QkunWuobJM9R6/TLFnROf1F1QNLBw6FPYpuIo6tY4d3yl3W9LMy4L1
	 pe+Z6mmHZGG9cDWB+GaWLZsp8W708Cv+E4Nxq5TjF8SrudxCEbW9ikIAnTWEMrbOJf
	 2VUhYXX/AIUGMe2zxIJnKxohEqC5Yjw2jmewuVDMx9NgMT30ACU3zLm+LXueCVLeFa
	 Q8MSFaAJt4t3WPtpvZDVP07WJucipz1r+ImTxYCOSxkCuCJk7tOiGv0gDdqnhFlP8k
	 R8mkR8NcSwfxW9HcKtebB7e/FyukW3kWRvm2CR6yF2J9DZidXV1iuSslXStARAM96t
	 iAG3vPqk8zEEg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  6 Nov 2024 16:54:42 +0300 (MSK)
Message-ID: <f08513c8-56d6-4551-8ac6-84641c134552@salutedevices.com>
Date: Wed, 6 Nov 2024 16:54:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] pwm: meson: Support constant and polarity bits
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
CC: <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <20241016152553.2321992-1-gnstark@salutedevices.com>
 <20241016152553.2321992-3-gnstark@salutedevices.com>
 <w3igi2jmva6mfa7anlieyp3iiwfzhsvi3t37wwcqqtzdy42fqn@btmdsfsmpw7r>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <w3igi2jmva6mfa7anlieyp3iiwfzhsvi3t37wwcqqtzdy42fqn@btmdsfsmpw7r>
X-Originating-IP: [185.8.126.20]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188995 [Nov 06 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/06 12:26:00 #26826484
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_055452_579186_F6C539CD 
X-CRM114-Status: GOOD (  26.11  )
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

SGVsbG8gVXdlCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpPbiAxMS80LzI0IDEyOjMyLCBVd2Ug
S2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBHZW9yZ2UsCj4gCj4gdGhlcmUgYXJlIHR3byBt
aW5vciB0aGluZ3MgSSBkaXNsaWtlIGluIHRoaXMgcGF0Y2gvZHJpdmVyLiBCdXQgSSdtIG5vdAo+
IHN1cmUgdGhlIGFsdGVybmF0aXZlcyBhcmUgb2JqZWN0aXZlbHkgY29uc2lkZXJhYmx5IGJldHRl
ci4gU2VlIGJlbG93IGFuZAo+IGp1ZGdlIHlvdXJzZWxmLgoKLi4uCgo+PiBAQCAtNjgsNiArNzIs
OCBAQCBzdGF0aWMgc3RydWN0IG1lc29uX3B3bV9jaGFubmVsX2RhdGEgewo+PiAgIAl1OAkJY2xr
X2Rpdl9zaGlmdDsKPj4gICAJdTgJCWNsa19lbl9zaGlmdDsKPj4gICAJdTMyCQlwd21fZW5fbWFz
azsKPj4gKwl1MzIJCWNvbnN0X2VuX21hc2s7Cj4+ICsJdTMyCQlpbnZfZW5fbWFzazsKPj4gICB9
IG1lc29uX3B3bV9wZXJfY2hhbm5lbF9kYXRhW01FU09OX05VTV9QV01TXSA9IHsKPj4gICAJewo+
PiAgIAkJLnJlZ19vZmZzZXQJPSBSRUdfUFdNX0EsCj4+IEBAIC03NSw2ICs4MSw4IEBAIHN0YXRp
YyBzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWxfZGF0YSB7Cj4+ICAgCQkuY2xrX2Rpdl9zaGlmdAk9
IE1JU0NfQV9DTEtfRElWX1NISUZULAo+PiAgIAkJLmNsa19lbl9zaGlmdAk9IE1JU0NfQV9DTEtf
RU5fU0hJRlQsCj4+ICAgCQkucHdtX2VuX21hc2sJPSBNSVNDX0FfRU4sCj4+ICsJCS5jb25zdF9l
bl9tYXNrCT0gTUlTQ19BX0NPTlNUQU5UX0VOLAo+PiArCQkuaW52X2VuX21hc2sJPSBNSVNDX0Ff
SU5WRVJUX0VOLAo+PiAgIAl9LAo+PiAgIAl7Cj4+ICAgCQkucmVnX29mZnNldAk9IFJFR19QV01f
QiwKPj4gQEAgLTgyLDYgKzkwLDggQEAgc3RhdGljIHN0cnVjdCBtZXNvbl9wd21fY2hhbm5lbF9k
YXRhIHsKPj4gICAJCS5jbGtfZGl2X3NoaWZ0CT0gTUlTQ19CX0NMS19ESVZfU0hJRlQsCj4+ICAg
CQkuY2xrX2VuX3NoaWZ0CT0gTUlTQ19CX0NMS19FTl9TSElGVCwKPj4gICAJCS5wd21fZW5fbWFz
awk9IE1JU0NfQl9FTiwKPj4gKwkJLmNvbnN0X2VuX21hc2sJPSBNSVNDX0JfQ09OU1RBTlRfRU4s
Cj4+ICsJCS5pbnZfZW5fbWFzawk9IE1JU0NfQl9JTlZFUlRfRU4sCj4+ICAgCX0KPj4gICB9Owo+
IAo+IFNvIHRoZSBnZW5lcmljIHJlZ2lzdGVyIGRlc2NyaXB0aW9uIGRlc2NyaWJlcyB0aGUgY29u
c3QgYW5kIGludmVydCBiaXRzLAo+IGJ1dCBpdCBkb2Vzbid0IGFwcGx5IHRvIGFsbCBJUHMuIFRo
aW5raW5nIGFib3V0IHRoYXQsIEkgd29uZGVyIHdoeSB0aGlzCj4gc3RydWN0IGV4aXN0cyBhdCBh
bGwuIEkgd291bGQgaGF2ZSBkb25lIHRoaXMgYXMgZm9sbG93czoKPiAKPiAJI2RlZmluZSBNRVNP
Tl9QV01fUkVHX1BXTShjaGFuKQkJKDAgKyA0ICogKGNoYW4pKQo+IAo+IAkjZGVmaW5lIE1FU09O
X1BXTV9SRUdfTUlTQwkJKDgpCj4gCSNkZWZpbmUgTUVTT05fUFdNX1JFR19NSVNDX0VOKGNoYW4p
CQlCSVQoY2hhbikKPiAJI2RlZmluZSBNRVNPTl9QV01fUkVHX01JU0NfQ0xLX1NFTChjaGFuKQlH
RU5NQVNLKDUgKyAyICogKGNoYW4pLCA0ICsgMiAqIChjaGFuKSkKPiAJLi4uLgo+IAo+IGFuZCB0
aGVuIHVzZSB0aGVzZSBjb25zdGFudHMgZGlyZWN0bHkgKHdpdGggcHdtLT5od3B3bSBhcyBwYXJh
bWV0ZXIgaWYKPiBuZWVkZWQpIGluIHRoZSBjb2RlLiBJIHdvdWxkIGV4cGVjdCB0aGlzIHRvIHJl
c3VsdCBpbiBtb3JlIGVmZmljaWVudCBhbmQKPiBzbWFsbGVyIGNvZGUuCgpJJ3ZlIGJlZW4gbG9v
a2luZyBpbnRvIHRoaXMgZHJpdmVyIGZvciBtb3JlIHRoYW4gYSB5ZWFyIGFuZCBnb3QgdXNlZCB0
bwppdCBzbyBtdWNoIHNvIG5ldmVyIHRob3VnaHQgYWJvdXQgY2hhbmdpbmcgdGhlIGZvdW5kYXRp
b25zIDopIEFsdGhvdWdoIAppdCdzIGFuIGludGVyZXN0aW5nIHRob3VnaHQuCgoxLiBJIHRvb2sg
bWVzb25fcHdtX2VuYWJsZSgpIHdpdGhvdXQKY29uc3QgcGF0Y2hlcyBhbmQgcmVpbXBsZW1lbnRl
ZCBpdCB1c2luZyBvbmx5IGRlZmluZXMgKGUuZy4gdy9vIGxvY2FsCnZhciBjaGFubmVsX2RhdGEp
IGFuZCBvYmpkdW1wZWQgY3VycmVudCBhbmQgbmV3IHZlcnNpb25zLiBOZXcgdmVyc2lvbgp0dXJu
ZWQgb3V0IHRvIGJlIG9uZSBpbnN0cnVjdGlvbiBsb25nZXIgKGFybTY0LCBnY2MsIGRlZmF1bHQg
LU8yKS4gU28gCnRvdGFsIGRpZmZlcmVuY2UgaW4gZXhlY3V0YWJsZSBjb2RlIG1heSBiZSBub3Qg
dGhhdCBzaWduaWZpY2FudCBhbHRob3VnaAp3ZSBjYW4gd2luIGluIEMtY29kZSBsaW5lIGNvdW50
LgoKMi4gVGhpbmdzIGxpa2UKI2RlZmluZSBNSVNDX0JfRU4JCUJJVCgxKQojZGVmaW5lIE1JU0Nf
QV9FTgkJQklUKDApCmlzIG1vcmUgc3RyYWlnaHRmb3J3YXJkIGFuZCBjYW4gYmUgbWF0Y2hlZCB0
byB0aGUgZGF0YXNoZWV0IGVhc2llcgpjb21wYXJpbmcgdG8gKGEgKyBiICogKGNoYW4pKSB0aGlu
Z3MuCgpTbyBJJ20gbm90IHN1cmUgZWl0aGVyLgoKPj4gQEAgLTIyNyw2ICsyNTIsMTUgQEAgc3Rh
dGljIHZvaWQgbWVzb25fcHdtX2VuYWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBw
d21fZGV2aWNlICpwd20pCj4+ICAgCj4+ICAgCXZhbHVlID0gcmVhZGwobWVzb24tPmJhc2UgKyBS
RUdfTUlTQ19BQik7Cj4+ICAgCXZhbHVlIHw9IGNoYW5uZWxfZGF0YS0+cHdtX2VuX21hc2s7Cj4+
ICsKPj4gKwlpZiAobWVzb24tPmRhdGEtPmhhc19jb25zdGFudCkKPj4gKwkJbWVzb25fcHdtX2Fz
c2lnbl9iaXQoJnZhbHVlLCBjaGFubmVsX2RhdGEtPmNvbnN0X2VuX21hc2ssCj4+ICsJCQkJICAg
ICBjaGFubmVsLT5jb25zdGFudCk7Cj4gCj4gUGVyc29uYWxseSBJJ2QgcHJlZmVyOgo+IAo+IAl2
YWx1ZSAmPSB+TUVTT05fUFdNX1JFR19NSVNDX0NPTlNUX0VOKHB3bS0+aHdwd20pOwo+IAlpZiAo
bWVzb24tPmRhdGEtPmhhc19jb25zdGFudCAmJiBjaGFubmVsLT5jb25zdGFudCkKPiAJCXZhbHVl
IHw9IE1FU09OX1BXTV9SRUdfTUlTQ19DT05TVF9FTihwd20tPmh3cHdtKTsKPiAKPiBldmVuIHRo
b3VnaCB5b3VyIHZhcmlhbnQgb25seSBtZW50aW9ucyB0aGUgbWFzayBvbmNlLiBXaGlsZSBpdCBo
YXMgdGhpcwo+IHJlcGV0aXRpb24sIGl0J3MgY2xlYXIgd2hhdCBoYXBwZW5zIHdpdGhvdXQgaGF2
aW5nIHRvIGtub3cgd2hhdAo+IG1lc29uX3B3bV9hc3NpZ25fYml0KCkgZG9lcy4gTWF5YmUgdGhh
dCdzIHN1YmplY3RpdmU/Cj4gCgpBY3R1YWxseSBJIGFsc28gZG9uJ3QgbGlrZSBtZXNvbl9wd21f
YXNzaWduX2JpdCgpIHRvbyBtYXRjaCBhbmQgSSdtCnN1cnByaXNlZCB0aGVyZSdzIG5vIHNvbWV0
aGluZyBsaWtlIHRoaXMgaW4gdGhlIGtlcm5lbCBhbHJlYWR5LgpJIGFnYWluIG9iamR1bXBlZCB2
ZXJzaW9ucyBtZXNvbl9wd21fYXNzaWduX2JpdCgpIHZzIGRvdWJsZSBtYXNrIApyZXBldGl0aW9u
LiBVbmNvbmRpdGlvbmFsIGJpdCBjbGVhcmluZyB0YWtlcyBvbmx5IGEgc2luZ2xlIGluc3RydWN0
aW9uOgoKLy8gdmFsdWUgJj0gfmNoYW5uZWxfZGF0YS0+Y29uc3RfZW5fbWFzazsKOWFjOgkwYTI1
MDA0MCAJYmljCXcwLCB3MiwgdzUKClNvIGluIHRoZSBjdXJyZW50IHNlcmllcyBJIGNvdWxkIGRy
b3AgbWVzb25fcHdtX2Fzc2lnbl9iaXQoKSBhbmQgdXNlOgoKdmFsdWUgJj0gfmNoYW5uZWxfZGF0
YS0+Y29uc3RfZW5fbWFzazsKaWYgKG1lc29uLT5kYXRhLT5oYXNfY29uc3RhbnQgJiYgY2hhbm5l
bC0+Y29uc3RhbnQpCgl2YWx1ZSB8PSBjaGFubmVsX2RhdGEtPmNvbnN0X2VuX21hc2s7CgpJZiBp
dCdzIGRlY2lkZWQgbm93IG9yIGxhdGVyIHRvIGRyb3AgbWVzb25fcHdtX2NoYW5uZWxfZGF0YSB0
aGVuCndcbyBtZXNvbl9wd21fYXNzaWduX2JpdCgpIGZ1dHVyZSBwYXRjaCB3aWxsIGJlIGxpbmUt
dG8tbGluZSBjaGFuZ2UuCgpXaGF0IHlvdSB0aGluaz8KCj4gQmVzdCByZWdhcmRzCj4gVXdlCgot
LSAKQmVzdCByZWdhcmRzCkdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
