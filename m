Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCF9CA5FCF
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2026 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+NpR85CBFVkxG4HIW279GB6LzkT0QCGsTmcIxPZSWo=; b=SNiI4o/UUkxTyU
	YpJ67Zpslh1iKvyhIb8oy8zwtcKElCsVr/f9MYq35sRCX19x7gjfeowfJC8TseduQEfhLvawxf4JS
	SYinBiby95zg3f3GHeuv4oR/ZckMh0nCSPrXGKSBgF7mzJVCz8MhfqYY4h1MkFarpv0Bh/YKDym2B
	jrlvyT8GyAneGOwsrq9liD66Otd9jeumD4sE8KbilQP6KMsLaLBaVkvKFep0v09nE3dlHw25BkOtY
	a+llqivkyNoCWyPm5qw1aUF9VgfYs9dfiihHA98q+O5Ff1HFFMi8ypxBVh3gYgtccbXpH6If2Vflk
	ZbYS6pIefT8JWRkxKQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDPu-00000008QLx-3iOh;
	Thu, 01 Oct 2026 09:49:30 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDPq-00000008QIl-1Nmn;
	Thu, 01 Oct 2026 09:49:29 +0000
Message-ID: <cb8a33f0-2aa3-4ec1-9efc-af78eaa4b435@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1790848157;
	bh=OfzALKUKErDnTeV6+Scy6LOty9NGQxM9etrLaViB0jA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=YducBsFgeTVWLgaNUEqqiArMeOdjw49nO470W2tuk25ONR6sR62oPwPLiXoDrRjla
	 7uw9c3Hu2p51okugWypnlZkwCRXxCqtXjGERkf8r7rCfxtdBpi3aAn0ei/FPtoMcJj
	 6f1VSsbp6XBQ61/Pz3tl8ESa7xr+rK4XVpLlIOAY=
Date: Thu, 1 Oct 2026 11:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: amlogic: Add core clock for S4
 like
To: Chuan Liu <chuan.liu@amlogic.com>, Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
 <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
 <20260928-cardiac-relax-cdccdecdd4c2@spud>
 <1bf03811-40f8-4c85-bf45-e48c5545c3e1@amlogic.com>
Content-Language: en-US
In-Reply-To: <1bf03811-40f8-4c85-bf45-e48c5545c3e1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_024926_986834_06440188 
X-CRM114-Status: GOOD (  21.07  )
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

SGkgQ2h1YW4sCgpPbiA5LzMwLzI2IDk6MTMgQU0sIENodWFuIExpdSB3cm90ZToKPiBIaSBSb25h
bGQsIENjIENvbm9yLAo+IAo+IE9uIDkvMjkvMjAyNiAxMjo0NiBBTSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+PiBPbiBTdW4sIFNlcCAyNywgMjAyNiBhdCAwNDoyODoxNVBNICswMjAwLCBSb25hbGQg
Q2xhdmVhdSB2aWEgQjQgUmVsYXkKPj4gd3JvdGU6Cj4+PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8
bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPj4+Cj4+PiBUaGUgVDcsIEExLCBDMywgYW5kIFM0
IFBXTSBjb250cm9sbGVycyBoYXZlIGEgc3lzdGVtIGNsb2NrIGluCj4+PiBhZGRpdGlvbiB0byB0
aGUgdHdvIGlucHV0IGNsb2NrcyBvZiBjaGFubmVscyBBIGFuZCBCLgo+Pj4KPj4+IFRoZSBjaGFu
bmVsIGNsb2NrcyBhcmUgYWNxdWlyZWQgYnkgaW5kZXggaW4gdGhlIHB3bSBkcml2ZXIsCj4+PiB3
aGVyZSB0aGUgY29yZSBjbG9jayBpcyBmZXRjaGVkIGJ5IG5hbWUsIHdpdGggb3B0aW9uYWwgZ2V0
Cj4+PiB3aGljaCBpcyBzaWxlbnQgd2hlbiBub3QgcHJvdmlkZWQuCj4+Pgo+Pj4gUmVxdWlyZSBj
bG9jay1uYW1lcyBhbmQgbWluaW11bSAzIGl0ZW1zIGZvciBTNCwgYW5kIGRldmljZXMKPj4+IHdo
aWNoIGZhbGxiYWNrIHRvIFM0LCB3aGVyZSB0aGUgUFdNIGRldmljZXMgZG8gbm90IHdvcmsKPj4+
IHdpdGhvdXQgYWxsIDMgY2xvY2tzLgo+Pj4KPj4+IEFkZCBhbiBleGFtcGxlIHNob3dpbmcgVDcg
dXNhZ2Ugd2l0aCBpdHMgZmFsbGJhY2sgdG8KPj4+IGFtbG9naWMsbWVzb24tczQtcHdtLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVs
LmZyPgo+Pj4gLS0tCj4+PiDCoCAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLWFtbG9n
aWMueWFtbMKgwqDCoMKgwqDCoMKgIHwgMjEgKysrKysrKysrKwo+Pj4gKysrKysrKystLS0KPj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3
bS1hbWxvZ2ljLnlhbWwKPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3
bS9wd20tYW1sb2dpYy55YW1sCj4+PiBpbmRleCBjMzM3ZDg1ZGE0MGYxLi5lOWNkNWYxZmRmMjY0
IDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9w
d20tYW1sb2dpYy55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcHdtL3B3bS1hbWxvZ2ljLnlhbWwKPj4+IEBAIC02Miw3ICs2Miw3IEBAIHByb3BlcnRpZXM6
Cj4+PiDCoCDCoMKgwqAgY2xvY2stbmFtZXM6Cj4+PiDCoMKgwqDCoMKgIG1pbkl0ZW1zOiAxCj4+
PiAtwqDCoMKgIG1heEl0ZW1zOiAyCj4+PiArwqDCoMKgIG1heEl0ZW1zOiAzCj4+PiDCoCDCoMKg
wqAgcG93ZXItZG9tYWluczoKPj4+IMKgwqDCoMKgwqAgbWF4SXRlbXM6IDEKPj4+IEBAIC0xNDMs
OSArMTQzLDE1IEBAIGFsbE9mOgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpdGVtczoKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IGlucHV0IGNsb2NrIG9m
IFBXTSBjaGFubmVsIEEKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZGVzY3JpcHRp
b246IGlucHV0IGNsb2NrIG9mIFBXTSBjaGFubmVsIEIKPj4+IC3CoMKgwqDCoMKgwqDCoCBjbG9j
ay1uYW1lczogZmFsc2UKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246
IGdhdGUgY2xvY2sgZm9yIHRoZSBQV00gY29udHJvbGxlcgo+IAo+IFRoaXMgaXMgdGhlIEFQQiBi
dXMgY2xvY2sgZ2F0ZSBmb3IgdGhlIFBXTSBjb250cm9sbGVyLiBJZiB0aGlzIGNsb2NrIGlzCj4g
ZGlzYWJsZWQsIHRoZSBDUFUgY2FuIG5vIGxvbmdlciBhY2Nlc3MgdGhlIFBXTSBjb250cm9sbGVy
J3MgcmVnaXN0ZXJzLgo+IAo+IFRoaXMgY2xvY2sgc2VydmVzIHRoZSBzYW1lIHB1cnBvc2UgYXMg
dGhlICJidXMiIGNsb2NrIGluIHRoZSB0aGVybWFsCj4gc2Vuc29yIHBhdGNoIHlvdSBzdWJtaXR0
ZWQgcHJldmlvdXNseSBbMV0uCj4gCj4gQnkgdGhlIHdheSwgaW4gdGhlIEFtbG9naWMgY2xvY2sg
ZHJpdmVyLCBtYW55IHN5c19jbGsvY2xrODEgY2xvY2tzIGFyZQo+IHVzZWQgdG8gcHJvdmlkZSB0
aGUgY2xvY2sgZm9yIHRoZSBBUEIgYnVzIG9mIGluZGl2aWR1YWwgY29udHJvbGxlcnMuCj4gU29t
ZSBvZiB0aGVtIGFsc28gcHJvdmlkZSB0aGUgZnVuY3Rpb25hbCBjbG9jayBmb3IgdGhlIGNvbnRy
b2xsZXIsIHN1Y2gKPiBhcyBJMkMuCj4gCj4gVGhlcmVmb3JlLCB3b3VsZCBpdCBiZSByZWFzb25h
YmxlIHRvIGtlZXAgdGhlIGRlc2NyaXB0aW9uIGhlcmUKPiBjb25zaXN0ZW50IHdpdGggdGhlIGRl
c2NyaXB0aW9uIGluIHRoZSB0aGVybWFsIGR0LWJpbmRpbmcgbWVudGlvbmVkIGFib3ZlPwo+IAo+
IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA5MjMtZml4LXQ3LXRoZXJtYWwt
Y2xvY2stdjItMS0KPiBiZmY3YTA5ZWI0ODdAYWxpZWwuZnIvCj4gCgpUaGFua3MgZm9yIHlvdXIg
aGVscCBhbmQgeW91ciBmZWVkYmFjayBvbiB0aGlzIHNlcmllcy4gSSB3aWxsIHJlbmFtZSBhbmQK
Y2hhbmdlIHRoZSBkZXNjcmlwdGlvbiBpbiB2NC4KCj4+PiArwqDCoMKgwqDCoMKgwqAgY2xvY2st
bmFtZXM6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGl0ZW1zOgo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLSBjb25zdDogY2hhbm5lbC1hCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAt
IGNvbnN0OiBjaGFubmVsLWIKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGNv
cmUKPiAKPiBTaW1pbGFybHksIHdvdWxkIGl0IGJlIG1vcmUgYXBwcm9wcmlhdGUgdG8gbmFtZSB0
aGlzIGNsb2NrICJidXMiIGFzIHdlbGw/Cj4gCj4+PiDCoMKgwqDCoMKgwqDCoCByZXF1aXJlZDoK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNsb2Nrcwo+Pj4gK8KgwqDCoMKgwqDCoMKgIC0gY2xv
Y2stbmFtZXMKPj4+IMKgIMKgwqDCoCAtIGlmOgo+Pj4gwqDCoMKgwqDCoMKgwqAgcHJvcGVydGll
czoKPj4+IEBAIC0xNzksNiArMTg1LDE1IEBAIGV4YW1wbGVzOgo+Pj4gwqDCoMKgwqDCoCBwd21A
MTAwMCB7Cj4+PiDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tczQt
cHdtIjsKPj4+IMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDEwMDAgMHgxMD47Cj4+PiAtwqDCoMKg
wqDCoCBjbG9ja3MgPSA8JnB3bV9zcmNfYT4sIDwmcHdtX3NyY19iPjsKPj4+ICvCoMKgwqDCoMKg
IGNsb2NrcyA9IDwmcHdtX3NyY19hPiwgPCZwd21fc3JjX2I+LCA8JnB3bV9zcmNfY29yZT47Cj4+
PiArwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJjaGFubmVsLWEiLCAiY2hhbm5lbC1iIiwgImNv
cmUiOwo+Pj4gK8KgwqDCoMKgwqAgI3B3bS1jZWxscyA9IDwzPjsKPj4+ICvCoMKgwqAgfTsKPj4+
ICvCoCAtIHwKPj4+ICvCoMKgwqAgcHdtQDYwMDAwIHsKPj4KPj4gSWYgeW91IHJlc3BpbiwgZHJv
cCB0aGUgc2Vjb25kIGV4YW1wbGUgcGxlYXNlLCBzaW5jZSBpdCBkb2Vzbid0IGFjdHVhbGx5Cj4+
IGRvIGFueXRoaW5nIGRpZmZlcmVudCBhbnltb3JlLgo+PgoKSSB3aWxsIGRyb3AgdGhpcyBleGFt
cGxlIGluIHRoZSBtZWFuIHRpbWUuCgo+PiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4KPj4gcHctYm90OiBub3QtYXBwbGljYWJsZQo+Pgo+Pj4gK8Kg
wqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LXB3bSIsICJhbWxvZ2ljLG1lc29uLXM0
LXB3bSI7Cj4+PiArwqDCoMKgwqDCoCByZWcgPSA8MHg2MDAwMCAweDI0PjsKPj4+ICvCoMKgwqDC
oMKgIGNsb2NrcyA9IDwmY2hhbm5lbF9hPiwgPCZjaGFubmVsX2I+LCA8JmNvcmU+Owo+Pj4gK8Kg
wqDCoMKgwqAgY2xvY2stbmFtZXMgPSAiY2hhbm5lbC1hIiwgImNoYW5uZWwtYiIsICJjb3JlIjsK
Pj4+IMKgwqDCoMKgwqDCoMKgICNwd20tY2VsbHMgPSA8Mz47Cj4+PiDCoMKgwqDCoMKgIH07Cj4+
Pgo+Pj4gLS3CoAo+Pj4gMi40OS4wCj4+Pgo+Pj4KPiAKCgotLSAKQmVzdCByZWdhcmRzLApSb25h
bGQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
