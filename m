Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38A3C43444
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 08:02:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830152173B
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 08:02:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mPhi11TA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830152173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7qD31zmfnfhklq6W/N3u6KTcMfRDHG8B/HsiEGJXgQ=; b=mPhi11TArNO4RE
	Jy1+uRZNHHlJmMkfxNuJKAbn+y+qqkEZcrPqe9WEbd/gSZX3rXzspQ7Uqaql1GHGtnZ/2KamJwUpc
	vyTSPj8Hv8+EZGopr+b1S6t5XjK7dTt0ydJM8AoAWaZJ/73M9kl8iBRgTLikjmWf3QXGCY/1NBNFF
	QKOi6LgzjSgpm0Sz7TOxVWdHInBbi/9aaV1vqwuvdoN1xlULJlvahpU8FVlbEcTDnw6OQwZFrurF2
	523jW2ICnaFHSMsrv85wE4dHyIsrGqAuL9DpJ8OOutaBJ5NNK8x4OpUGPMof+kZkx6sYL9qQmLdQF
	uUgzwwxzPK+VuUdUmNqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghVI5-0006xQ-PJ; Thu, 10 Jan 2019 08:02:13 +0000
Received: from mx.socionext.com ([202.248.49.38])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghVI0-0006wf-KY; Thu, 10 Jan 2019 08:02:12 +0000
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
 by mx.socionext.com with ESMTP; 10 Jan 2019 17:02:05 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
 by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 61CF660062;
 Thu, 10 Jan 2019 17:02:05 +0900 (JST)
Received: from 10.213.24.1 (10.213.24.1) by m-FILTER with ESMTP;
 Thu, 10 Jan 2019 17:02:05 +0900
Received: from SOC-EX01V.e01.socionext.com (10.213.24.21) by
 SOC-EX02V.e01.socionext.com (10.213.24.22) with Microsoft SMTP Server (TLS)
 id 15.0.995.29; Thu, 10 Jan 2019 17:01:53 +0900
Received: from SOC-EX01V.e01.socionext.com ([10.213.24.21]) by
 SOC-EX01V.e01.socionext.com ([10.213.24.21]) with mapi id 15.00.0995.028;
 Thu, 10 Jan 2019 17:01:53 +0900
From: <yamada.masahiro@socionext.com>
To: <robh@kernel.org>, <arm@kernel.org>
Subject: RE: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Thread-Topic: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Thread-Index: AQHUqFoPwZlgCUSeDkSxOmzH7nYu1aWoIxIA
Date: Thu, 10 Jan 2019 08:01:52 +0000
Message-ID: <8e2a312104924025ad4d37afa40d147d@SOC-EX01V.e01.socionext.com>
References: <20190109202934.29304-1-robh@kernel.org>
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-securitypolicycheck: OK by SHieldMailChecker v2.5.2
x-shieldmailcheckerpolicyversion: POLICY180220
x-originating-ip: [10.213.24.1]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_000209_055505_EED0DB62 
X-CRM114-Status: GOOD (  15.29  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: nm@ti.com, andrew@lunn.ch, heiko@sntech.de, maxime.ripard@bootlin.com,
 liviu.dudau@arm.com, david.brown@linaro.org, thierry.reding@gmail.com,
 xuwei5@hisilicon.com, manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
 linux-renesas-soc@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-rockchip@lists.infradead.org, khilman@baylibre.com,
 gregory.clement@bootlin.com, magnus.damm@gmail.com, michal.simek@xilinx.com,
 krzk@kernel.org, jonathanh@nvidia.com, linux-samsung-soc@vger.kernel.org,
 wens@csie.org, kgene@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, orsonzhai@gmail.com,
 tsahee@annapurnalabs.com, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, jason@lakedaemon.net, antoine.tenart@bootlin.com,
 rjui@broadcom.com, rrichter@cavium.com, horms@verge.net.au,
 linux-mediatek@lists.infradead.org, jnair@caviumnetworks.com,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, will.deacon@arm.com,
 sbranden@broadcom.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
 chanho.min@lge.com, dhdang@apm.com, linux-kernel@vger.kernel.org,
 t-kristo@ti.com, dinguyen@kernel.org, Jisheng.Zhang@synaptics.com,
 sudeep.holla@arm.com, jun.nie@linaro.org, sebastian.hesselbarth@gmail.com,
 shawnguo@kernel.org, afaerber@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgW21h
aWx0bzpyb2JoQGtlcm5lbC5vcmddDQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDEwLCAyMDE5
IDU6MzAgQU0NCj4gVG86IGFybUBrZXJuZWwub3JnDQo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQW5kcmVhcw0KPiBGw6RyYmVy
IDxhZmFlcmJlckBzdXNlLmRlPjsgTWFuaXZhbm5hbiBTYWRoYXNpdmFtDQo+IDxtYW5pdmFubmFu
LnNhZGhhc2l2YW1AbGluYXJvLm9yZz47IFRzYWhlZSBaaWRlbmJlcmcNCj4gPHRzYWhlZUBhbm5h
cHVybmFsYWJzLmNvbT47IEFudG9pbmUgVGVuYXJ0IDxhbnRvaW5lLnRlbmFydEBib290bGluLmNv
bT47DQo+IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+OyBDaGVuLVl1
IFRzYWkgPHdlbnNAY3NpZS5vcmc+Ow0KPiBEaW5oIE5ndXllbiA8ZGluZ3V5ZW5Aa2VybmVsLm9y
Zz47IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+Ow0KPiBEdWMgRGFuZyA8ZGhk
YW5nQGFwbS5jb20+OyBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT47IFN1ZGVlcCBI
b2xsYQ0KPiA8c3VkZWVwLmhvbGxhQGFybS5jb20+OyBMb3JlbnpvIFBpZXJhbGlzaSA8bG9yZW56
by5waWVyYWxpc2lAYXJtLmNvbT47DQo+IFJheSBKdWkgPHJqdWlAYnJvYWRjb20uY29tPjsgU2Nv
dHQgQnJhbmRlbiA8c2JyYW5kZW5AYnJvYWRjb20uY29tPjsNCj4gYmNtLWtlcm5lbC1mZWVkYmFj
ay1saXN0QGJyb2FkY29tLmNvbTsgUm9iZXJ0IFJpY2h0ZXINCj4gPHJyaWNodGVyQGNhdml1bS5j
b20+OyBKYXlhY2hhbmRyYW4gQyA8am5haXJAY2F2aXVtbmV0d29ya3MuY29tPjsgS3VramluDQo+
IEtpbSA8a2dlbmVAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVs
Lm9yZz47IFdlaSBYdQ0KPiA8eHV3ZWk1QGhpc2lsaWNvbi5jb20+OyBDaGFuaG8gTWluIDxjaGFu
aG8ubWluQGxnZS5jb20+OyBKYXNvbiBDb29wZXINCj4gPGphc29uQGxha2VkYWVtb24ubmV0Pjsg
QW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPjsgR3JlZ29yeSBDbGVtZW50DQo+IDxncmVnb3J5
LmNsZW1lbnRAYm9vdGxpbi5jb20+OyBTZWJhc3RpYW4gSGVzc2VsYmFydGgNCj4gPHNlYmFzdGlh
bi5oZXNzZWxiYXJ0aEBnbWFpbC5jb20+OyBNYXR0aGlhcyBCcnVnZ2VyDQo+IDxtYXR0aGlhcy5i
Z2dAZ21haWwuY29tPjsgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT47
DQo+IEpvbmF0aGFuIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+OyBBbmR5IEdyb3NzDQo+
IDxhbmR5Lmdyb3NzQGxpbmFyby5vcmc+OyBEYXZpZCBCcm93biA8ZGF2aWQuYnJvd25AbGluYXJv
Lm9yZz47IFNpbW9uDQo+IEhvcm1hbiA8aG9ybXNAdmVyZ2UubmV0LmF1PjsgTWFnbnVzIERhbW0g
PG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IEhlaWtvDQo+IFN0dWVibmVyIDxoZWlrb0BzbnRlY2gu
ZGU+OyBZYW1hZGEsIE1hc2FoaXJvL+WxseeUsCDnnJ/lvJgNCj4gPHlhbWFkYS5tYXNhaGlyb0Bz
b2Npb25leHQuY29tPjsgT3Jzb24gWmhhaSA8b3Jzb256aGFpQGdtYWlsLmNvbT47DQo+IEJhb2xp
biBXYW5nIDxiYW9saW4ud2FuZ0BsaW5hcm8ub3JnPjsgQ2h1bnlhbiBaaGFuZw0KPiA8emhhbmcu
bHlyYUBnbWFpbC5jb20+OyBKaXNoZW5nIFpoYW5nIDxKaXNoZW5nLlpoYW5nQHN5bmFwdGljcy5j
b20+Ow0KPiBUZXJvIEtyaXN0byA8dC1rcmlzdG9AdGkuY29tPjsgTmlzaGFudGggTWVub24gPG5t
QHRpLmNvbT47IEp1biBOaWUNCj4gPGp1bi5uaWVAbGluYXJvLm9yZz47IFNoYXduIEd1byA8c2hh
d25ndW9Aa2VybmVsLm9yZz47DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsNCj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1zYW1zdW5nLXNv
Y0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7
IGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtcm9ja2No
aXBAbGlzdHMuaW5mcmFkZWFkLm9yZzsgTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNv
bT47DQo+IFdpbGwgRGVhY29uIDx3aWxsLmRlYWNvbkBhcm0uY29tPjsgTWljaGFsIFNpbWVrIDxt
aWNoYWwuc2ltZWtAeGlsaW54LmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBhcm02NDogZHRzOiBS
ZW1vdmUgaW5jb25zaXN0ZW50IHVzZSBvZiAnYXJtLGFybXY4Jw0KPiBjb21wYXRpYmxlIHN0cmlu
Zw0KPiANCj4gVGhlICdhcm0sYXJtdjgnIGNvbXBhdGlibGUgc3RyaW5nIGlzIG9ubHkgZm9yIHNv
ZnR3YXJlIG1vZGVscy4gSXQgYWRkcw0KPiBsaXR0bGUgdmFsdWUgb3RoZXJ3aXNlIGFuZCBpcyBp
bmNvbnNpc3RlbnRseSB1c2VkIGFzIGEgZmFsbGJhY2sgb24gc29tZQ0KPiBwbGF0Zm9ybXMuIFJl
bW92ZSBpdCBmcm9tIHRob3NlIHBsYXRmb3Jtcy4NCj4gDQo+IFRoaXMgZml4ZXMgd2FybmluZ3Mg
Z2VuZXJhdGVkIGJ5IHRoZSBEVCBzY2hlbWEuDQo+IA0KPiBSZXBvcnRlZC1ieTogTWljaGFsIFNp
bWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54LmNvbT4NCj4gQ2M6IE1hcmsgUnV0bGFuZCA8bWFyay5y
dXRsYW5kQGFybS5jb20+DQo+IENjOiBXaWxsIERlYWNvbiA8d2lsbC5kZWFjb25AYXJtLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gLS0tDQo+
IGFybXNvYyBmb2xrcywgUGxlYXNlIGFwcGx5IGRpcmVjdGx5Lg0KPiANCj4gTm90ZSB0aGF0IHRo
ZXJlJ3Mgc3RpbGwgYSBjYXNlIGxlZnQgaW4gbXNtODk5OCB0aGF0IG5lZWRzIGEgbmV3DQo+IGNv
bXBhdGlibGUgc3RyaW5nLg0KPiANCj4gUm9iDQoNCls+IF0gDQoNCj4gIC4uLi9ib290L2R0cy9z
b2Npb25leHQvdW5pcGhpZXItbGQxMS5kdHNpICAgICB8ICAgNCArLQ0KPiAgLi4uL2Jvb3QvZHRz
L3NvY2lvbmV4dC91bmlwaGllci1sZDIwLmR0c2kgICAgIHwgICA4ICstDQo+ICAuLi4vYm9vdC9k
dHMvc29jaW9uZXh0L3VuaXBoaWVyLXB4czMuZHRzaSAgICAgfCAgIDggKy0NCg0KDQpGb3IgdW5p
cGhpZXIsDQoNCkFja2VkLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Np
b25leHQuY29tPg0KDQoNCkJUVywgZG8geW91IGhhdmUgYSBwbGFuIHRvIGZpeCBmaWxlcyB1bmRl
cg0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzLyA/DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
