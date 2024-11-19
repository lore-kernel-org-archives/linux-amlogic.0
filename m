Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12B2D44156
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Nov 2024 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMzh8PyS9g11eJ9V9fUXrd+5SQMld2j29oD3Er0xYQU=; b=T6ur5ttgIU4/b9
	Jfy1ctUdqkcGzz953OrVHQyhY8iUZe273lRtX64eYqq1ygF0ca4V/ue07kgV5AGUgmaEm7Nz3d2pF
	beMfO6unJ9VO1W7O5ON9pqqY8AcmVwjDqIf4UD/khxxVw0Yu7ptd7cF7ZC3Q/NS8rYRy62CozieDV
	vVVu3eiqWID8doRjpQSraZONeEa7mtaKsG6obreM5invBaqQb/JXsuk1tvsCqj6hOMwThvep8G7lO
	6tBWZ2UKNGugZ3e2pWTNa267Ssv/M9dRoGZfxBdH6zwmIwQETxQe6kTAlBzoFB8jDJy7aD+sBOaqq
	OPNoPyLOsfTApi/8UUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNho-0000000CPxM-05kt;
	Tue, 19 Nov 2024 12:51:44 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNhl-0000000CPwS-0Ogn;
	Tue, 19 Nov 2024 12:51:43 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 754AF10000A;
	Tue, 19 Nov 2024 15:51:35 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 754AF10000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1732020695;
	bh=Ii7nhdIGuTiZ2Cjp6gNaEeAPJj6qad8DWD7J3M9rl2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=V3a3QIqc1iepwiiqH1aWfprboJYKy+tnR6chs74FjkRi9un1lzCESgB2sigYqsgfJ
	 W74e9xhXtC17Po3WC5U7pu2oWMcB3pOftWJxDnFwBh/t/4/5Dwm34DRHuRtIZJjZBl
	 4HChdB9wOoMRWyYOgAmiOD76xPXdtxX5YpTGO0t4eyauoHqkhpsxgZg/sB4i6ElURn
	 i+hOPRKiHjVIpvRq8tQHijglvNu3uzltqa1zfUSiyrv1gSBMBz1xihOSnZDRF3JqBQ
	 dt3YccXGJ+XJrvZOE0E+IxLUt01Z4H34BenH3wd+QuMGSlP6I8hYPCNjxADh1NYGq4
	 XgKUi+NpIqMQQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 19 Nov 2024 15:51:35 +0300 (MSK)
Message-ID: <ed5cdef1-aaa7-4ff3-a427-87eae4c90f18@salutedevices.com>
Date: Tue, 19 Nov 2024 15:51:34 +0300
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
 <f08513c8-56d6-4551-8ac6-84641c134552@salutedevices.com>
 <l5xvdndysdvtil472it6ylthcfam5jp7lh3son45mezq7dh2yk@3yj557k2o5k5>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <l5xvdndysdvtil472it6ylthcfam5jp7lh3son45mezq7dh2yk@3yj557k2o5k5>
X-Originating-IP: [176.57.76.73]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189267 [Nov 19 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/19 08:41:00 #26886618
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_045141_473885_11BE1541 
X-CRM114-Status: GOOD (  17.68  )
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

SGVsbG8gVXdlCgpPbiAxMS83LzI0IDExOjQxLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBP
biBXZWQsIE5vdiAwNiwgMjAyNCBhdCAwNDo1NDo0MVBNICswMzAwLCBHZW9yZ2UgU3Rhcmsgd3Jv
dGU6Cj4+IE9uIDExLzQvMjQgMTI6MzIsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+Pj4+IEBA
IC02OCw2ICs3Miw4IEBAIHN0YXRpYyBzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWxfZGF0YSB7Cj4+
Pj4gICAgCXU4CQljbGtfZGl2X3NoaWZ0Owo+Pj4+ICAgIAl1OAkJY2xrX2VuX3NoaWZ0Owo+Pj4+
ICAgIAl1MzIJCXB3bV9lbl9tYXNrOwo+Pj4+ICsJdTMyCQljb25zdF9lbl9tYXNrOwo+Pj4+ICsJ
dTMyCQlpbnZfZW5fbWFzazsKPj4+PiAgICB9IG1lc29uX3B3bV9wZXJfY2hhbm5lbF9kYXRhW01F
U09OX05VTV9QV01TXSA9IHsKPj4+PiAgICAJewo+Pj4+ICAgIAkJLnJlZ19vZmZzZXQJPSBSRUdf
UFdNX0EsCj4+Pj4gQEAgLTc1LDYgKzgxLDggQEAgc3RhdGljIHN0cnVjdCBtZXNvbl9wd21fY2hh
bm5lbF9kYXRhIHsKPj4+PiAgICAJCS5jbGtfZGl2X3NoaWZ0CT0gTUlTQ19BX0NMS19ESVZfU0hJ
RlQsCj4+Pj4gICAgCQkuY2xrX2VuX3NoaWZ0CT0gTUlTQ19BX0NMS19FTl9TSElGVCwKPj4+PiAg
ICAJCS5wd21fZW5fbWFzawk9IE1JU0NfQV9FTiwKPj4+PiArCQkuY29uc3RfZW5fbWFzawk9IE1J
U0NfQV9DT05TVEFOVF9FTiwKPj4+PiArCQkuaW52X2VuX21hc2sJPSBNSVNDX0FfSU5WRVJUX0VO
LAo+Pj4+ICAgIAl9LAo+Pj4+ICAgIAl7Cj4+Pj4gICAgCQkucmVnX29mZnNldAk9IFJFR19QV01f
QiwKPj4+PiBAQCAtODIsNiArOTAsOCBAQCBzdGF0aWMgc3RydWN0IG1lc29uX3B3bV9jaGFubmVs
X2RhdGEgewo+Pj4+ICAgIAkJLmNsa19kaXZfc2hpZnQJPSBNSVNDX0JfQ0xLX0RJVl9TSElGVCwK
Pj4+PiAgICAJCS5jbGtfZW5fc2hpZnQJPSBNSVNDX0JfQ0xLX0VOX1NISUZULAo+Pj4+ICAgIAkJ
LnB3bV9lbl9tYXNrCT0gTUlTQ19CX0VOLAo+Pj4+ICsJCS5jb25zdF9lbl9tYXNrCT0gTUlTQ19C
X0NPTlNUQU5UX0VOLAo+Pj4+ICsJCS5pbnZfZW5fbWFzawk9IE1JU0NfQl9JTlZFUlRfRU4sCj4+
Pj4gICAgCX0KPj4+PiAgICB9OwoKLi4uCgo+Pj4gUGVyc29uYWxseSBJJ2QgcHJlZmVyOgo+Pj4K
Pj4+IAl2YWx1ZSAmPSB+TUVTT05fUFdNX1JFR19NSVNDX0NPTlNUX0VOKHB3bS0+aHdwd20pOwo+
Pj4gCWlmIChtZXNvbi0+ZGF0YS0+aGFzX2NvbnN0YW50ICYmIGNoYW5uZWwtPmNvbnN0YW50KQo+
Pj4gCQl2YWx1ZSB8PSBNRVNPTl9QV01fUkVHX01JU0NfQ09OU1RfRU4ocHdtLT5od3B3bSk7Cj4+
Pgo+Pj4gZXZlbiB0aG91Z2ggeW91ciB2YXJpYW50IG9ubHkgbWVudGlvbnMgdGhlIG1hc2sgb25j
ZS4gV2hpbGUgaXQgaGFzIHRoaXMKPj4+IHJlcGV0aXRpb24sIGl0J3MgY2xlYXIgd2hhdCBoYXBw
ZW5zIHdpdGhvdXQgaGF2aW5nIHRvIGtub3cgd2hhdAo+Pj4gbWVzb25fcHdtX2Fzc2lnbl9iaXQo
KSBkb2VzLiBNYXliZSB0aGF0J3Mgc3ViamVjdGl2ZT8KPj4KPj4gQWN0dWFsbHkgSSBhbHNvIGRv
bid0IGxpa2UgbWVzb25fcHdtX2Fzc2lnbl9iaXQoKSB0b28gbWF0Y2ggYW5kIEknbQo+PiBzdXJw
cmlzZWQgdGhlcmUncyBubyBzb21ldGhpbmcgbGlrZSB0aGlzIGluIHRoZSBrZXJuZWwgYWxyZWFk
eS4KPj4gSSBhZ2FpbiBvYmpkdW1wZWQgdmVyc2lvbnMgbWVzb25fcHdtX2Fzc2lnbl9iaXQoKSB2
cyBkb3VibGUgbWFzayByZXBldGl0aW9uLgo+PiBVbmNvbmRpdGlvbmFsIGJpdCBjbGVhcmluZyB0
YWtlcyBvbmx5IGEgc2luZ2xlIGluc3RydWN0aW9uOgo+Pgo+PiAvLyB2YWx1ZSAmPSB+Y2hhbm5l
bF9kYXRhLT5jb25zdF9lbl9tYXNrOwo+PiA5YWM6CTBhMjUwMDQwIAliaWMJdzAsIHcyLCB3NQo+
Pgo+PiBTbyBpbiB0aGUgY3VycmVudCBzZXJpZXMgSSBjb3VsZCBkcm9wIG1lc29uX3B3bV9hc3Np
Z25fYml0KCkgYW5kIHVzZToKPj4KPj4gdmFsdWUgJj0gfmNoYW5uZWxfZGF0YS0+Y29uc3RfZW5f
bWFzazsKPj4gaWYgKG1lc29uLT5kYXRhLT5oYXNfY29uc3RhbnQgJiYgY2hhbm5lbC0+Y29uc3Rh
bnQpCj4+IAl2YWx1ZSB8PSBjaGFubmVsX2RhdGEtPmNvbnN0X2VuX21hc2s7Cj4+Cj4+IElmIGl0
J3MgZGVjaWRlZCBub3cgb3IgbGF0ZXIgdG8gZHJvcCBtZXNvbl9wd21fY2hhbm5lbF9kYXRhIHRo
ZW4KPj4gd1xvIG1lc29uX3B3bV9hc3NpZ25fYml0KCkgZnV0dXJlIHBhdGNoIHdpbGwgYmUgbGlu
ZS10by1saW5lIGNoYW5nZS4KPj4KPj4gV2hhdCB5b3UgdGhpbms/Cj4gCj4gU291bmRzIHNlbnNp
YmxlLgoKV2hpbGUgY2hhbmdpbmcgdGhlIHBhdGNoIHRvIGRyb3AgbWVzb25fcHdtX2Fzc2lnbl9i
aXQoKSBvbmUgdGhpbmcKY29uY2VybmVkIG1lIG9uIHRoZSBhcHByb2FjaDoKCnZhbHVlICY9IH5j
aGFubmVsX2RhdGEtPmNvbnN0X2VuX21hc2s7CmlmIChtZXNvbi0+ZGF0YS0+aGFzX2NvbnN0YW50
ICYmIGNoYW5uZWwtPmNvbnN0YW50KQoJdmFsdWUgfD0gY2hhbm5lbF9kYXRhLT5jb25zdF9lbl9t
YXNrOwoKdGhhdCB3ZSByZXNldCBiaXQgaW4gdGhlIHZhbHVlIHZhciBldmVuIGlmIHRoYXQgYml0
IGlzIG5vdCBzdXBwb3J0ZWQgb24KdGhlIGN1cnJlbnQgU29DLiBJIGNoZWNrZWQgc2V2ZXJhbCBk
YXRhc2hlZXRzIGZvciBvbGQgU29DcyBhbmQgdGhvc2UgCmJpdHMgYXJlIG1hcmtlZCBhcyB1bnVz
ZWQgKG5vdCBldmVuIHJlc2VydmVkKSBhbmQgSSd2ZSBuZXZlciBzZWVuIHRob3NlCmJpdHMgc2V0
LiBTdGlsbCBJJ2Qgb2ZmZXIgdG8gdXNlIHByZWNpc2UgY29uZGl0aW9uIGZvciBjaGFuZ2luZyB0
aG9zZSAKYml0LiBJJ2xsIHNlbmQgdjMgbGV0J3MgZGlzY3VzcyBpdCBhZ2FpbiBpZiB5b3UgdGhp
bmsgSSBib3RoZXIgdG9vIG11Y2guCgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKLS0gCkJlc3Qg
cmVnYXJkcwpHZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
