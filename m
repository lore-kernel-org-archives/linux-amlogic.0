Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E37C77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJRC6HIPH+xX9e8hJSoere9iM2XnypCa4pjVwXJjz08=; b=y/5iT50z7W5at/
	Eif7X7jshYp2rSYeT40vzCHBeDFztQTR1tWk7CQ7ghDD6+j04FZnkFPQHUhBVPTL9gAjmW5aQXneQ
	2OujDjUVmgMMwebv+Eh6zL9jlIzEjNXtoLPjK4/lC3h9mU/xVgCSoSxU8Gu+eAXLxdG5y7W/vJ9Pk
	vCdhmv9FdrYpNFOJs1J5J49YGddKZu/e2jYrX9MfsQbK97EgHLGLlYKxFPBcTOmXI/MWQE7MngVSY
	PwWjApTmcXp0fdFVPYI1mwWJLZVBPR+oyzGNBvDNzgBxCxI5oDTFCD43K8+VV0fCt0vUZdr/4IbPx
	UJHNYjTE2S/zz3vSpTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6am-008v3N-2h;
	Thu, 11 May 2023 13:44:24 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px6aj-008v2O-0D;
	Thu, 11 May 2023 13:44:22 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id E1E575FD13;
	Thu, 11 May 2023 16:44:17 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683812657;
	bh=zpRN19wKJWL95Pe9rYSROAJmHnQ4rR4hEcVtgRpKk68=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=LsEa5uuVVpI5U5qf/kO9mz6Kw6h0QV+TV7C0pfu4gmnlhZtecj13b0HrjlJiXZt4H
	 XyL1v97e/SEtUCc1XXnFJcz1YQOrHokYsQS1x7qU3/ctsNcJEMRklgMSVdZSXXyjpJ
	 h3E5o30imO2R1t17JImKYhIDzByfDqYeBQ3TQaucGshvbxSSQwQ8gNnHoEzZYXDXgx
	 CpCFVGiUWsgZ9925kr0fMd2Z85SWnnedNpDnrBDRHay8mHx4nlRlRDzBMH5B1z/BGS
	 +tPjXRY7yjpGklbGqC7V1K+reqsgmBoOjHGRpWRD43DIGuUdqk/OQ9OopDjOgCdQx8
	 RKuOkISUjTWBg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 11 May 2023 16:44:17 +0300 (MSK)
Date: Thu, 11 May 2023 16:44:16 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v14 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <20230511134416.pw4led274g72z7e6@CAB-WSD-L081021>
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-6-ddrokosov@sberdevices.ru>
 <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 10:21:00 #21259776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_064421_280699_BA7C61BA 
X-CRM114-Status: GOOD (  15.44  )
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

SGVsbG8gTWFydGluLAoKU29ycnkgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlIGFzIEkgd2FzIG9u
IHZhY2F0aW9uIHdpdGhvdXQgbGFwdG9wLgoKT24gTW9uLCBNYXkgMDEsIDIwMjMgYXQgMDg6NTE6
MzBQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBEbWl0cnksCj4gCj4g
T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTE6NTjigK9BTSBEbWl0cnkgUm9rb3Nvdgo+IDxkZHJv
a29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+ID4KPiA+IEFkZCB0aGUgZG9jdW1lbnRhdGlv
biBmb3IgQW1sb2dpYyBBMSBQZXJpcGhlcmFscyBjbG9jayBkcml2ZXIsCj4gPiBhbmQgQTEgUGVy
aXBoZXJhbHMgY2xvY2sgY29udHJvbGxlciBiaW5kaW5ncy4KPiBNYXliZSBhIG5hdGl2ZSBFbmds
aXNoIHNwZWFrZXIgY2FuIGNvbW1lbnQgb24gd2hldGhlciBpdCdzCj4gInBlcmlwaGVyYWwiIG9y
ICJwZXJpcGhlcmFscyIuCj4gCgpPawoKPiBbLi4uXQo+ID4gU2lnbmVkLW9mZi1ieTogSmlhbiBI
dSA8amlhbi5odUBhbWxvZ2ljLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBSb2tvc292
IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+Cj4gPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9jbG9jay9hbWxvZ2lj
LGExLWNsa2MueWFtbCAgICAgICB8ICA3MyArKysrKysrKysrKwo+ID4gIC4uLi9iaW5kaW5ncy9j
bG9jay9hbWxvZ2ljLGExLXBsbC1jbGtjLnlhbWwgICB8ICAgNSArLQo+ID4gIGluY2x1ZGUvZHQt
YmluZGluZ3MvY2xvY2svYW1sb2dpYyxhMS1jbGtjLmggICB8IDExNCArKysrKysrKysrKysrKysr
KysKPiBJIGhhdmUgc2VlbiB0aGF0IFl1IFR1IG5hbWVkIHRoZSBTNCBwZXJpcGhlcmFsIGNsb2Nr
IGNvbnRyb2xsZXIKPiBiaW5kaW5nIGFuZCBkcml2ZXIgInM0LXBlcmlwaGVyYWxzLWNsa2MiIFsw
XS4KPiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gYXBwbHkgdGhlIHNhbWUgbmFtaW5nIGhlcmUgYXMg
d2VsbD8KClllcywgaXQgbWFrZXMgc2Vuc2UuIEkgd2lsbCBwcmVwYXJlIGEgbmV3IHZlcnNpb24g
d2l0aCB0aGUgbmVjZXNzYXJ5CnJlbmFtaW5nLgoKPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWFy
dGluCj4gCj4gCj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAy
MzA0MTcwNjUwMDUuMjQ5NjctMy15dS50dUBhbWxvZ2ljLmNvbS8KCi0tIApUaGFuayB5b3UsCkRt
aXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
