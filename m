Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DABCC5B572
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aqy3Y1KZF2PZeTk5u9qTym+4JNB9FlqFUeYEyQyJ1zw=; b=PvmAPY7p1OdwoL
	J5R6Ijwz1LBcPKiUL6mzZ/36O89/RLbnYcZnUc2ffHoNxpvs0oVMG9Be5IByxHH75VUVJzdlQPFw1
	uF1lLf51KcQYUm/XP4kcsVgAnX/NjPdGVTIlLwluS1T1sYyC0Ko3etEEY7ZmGjcfZKCwQKDK9vmwF
	gVlBVpp+9McMTjJGZCnJX5cfup5TX1ukCjXjheYpBBie9qX6xNaD+JTAtUigmM6m0HtYvTgpAwwMg
	L2nk4nv+/43qy8dZW8jG8pM7+tGPXhDJHWGHOUvAcxFIAkaE4N4Os6hrf02knLiZksLyB0f0eV54U
	NT5R8QAp7X2/zT5OLrDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwavP-00000009Dkl-096W;
	Wed, 19 Aug 2026 07:41:27 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwavL-00000009Djo-2Eyr;
	Wed, 19 Aug 2026 07:41:25 +0000
Message-ID: <ef9ca9f8-6cb0-437e-b73d-976059dc6f82@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1787125277;
	bh=L8oGbzvk2V4mXRjUq7cwdbEYnJjsfG23S7DPzRl86To=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=qKmMfScE5JTlY4Eeq4wPokXB0h4AnwPIaDvDXAUMzt7Be4I6uiG35n7+JUe+kGXqP
	 Km/Uw9FDV759IrI86dJ5RG5sZR+ovUxraZkswtTiBytqB9feg4nSeAs4Uaf7xDt3cj
	 E6V2AqegDBzwimHL63vAJWItPSyptRfLCtAEan8U=
Date: Wed, 19 Aug 2026 09:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v9 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, mfd@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-4-75df78710b9e@aliel.fr>
 <64e146aa-4907-495d-b394-7cecb1727816@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <64e146aa-4907-495d-b394-7cecb1727816@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_004124_041875_2207D978 
X-CRM114-Status: GOOD (  11.84  )
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

T24gOC83LzI2IDQ6MzQgQU0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+IE9uIDgvNS8yNiAxMDow
NiwgUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJlbGF5IHdyb3RlOgo+PiBGcm9tOiBSb25hbGQgQ2xh
dmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPj4KPj4gUmVwbGFjZSB0aGUgaGFyZGNv
ZGVkIE1BWF9MRVZFTCBjb25zdGFudCBhbmQgZmFuIHJlZ2lzdGVyCj4+IHdpdGggdmFsdWVzIHJl
YWQgZnJvbSBwbGF0Zm9ybV9kYXRhIChmYW5fcmVnLCBsZXZlbHNbXSBhbmQgbmxldmVscyksCj4+
IGFzIG5ldyBNQ1VzIG5lZWQgZGlmZmVyZW50IHZhbHVlcy4KPj4KPj4gVGhlIGNvb2xpbmcgZGV2
aWNlJ3Mgc3RhdGUgaXMgc3RvcmVkIGFzIGFuIGluZGV4IGludG8gbGV2ZWxzW10sCj4+IGFuZCBr
aGFkYXNfbWN1X2Zhbl9zZXRfbGV2ZWwoKSB3cml0ZXMgbGV2ZWxzW3N0YXRlXSB0byBmYW5fcmVn
LAo+PiByYXRoZXIgdGhhbiB3cml0aW5nIHRoZSByYXcgc3RhdGUgdmFsdWUgYXMgYmVmb3JlLgo+
Pgo+PiBPcHRpb25hbGx5IGFjcXVpcmUgYW5kIGVuYWJsZSBhICJmYW4iIHJlZ3VsYXRvciBzdXBw
bHkKPj4gYXQgcHJvYmUgdGltZSBhbmQgb24gcmVzdW1lLAo+PiBzbyBib2FyZHMgdGhhdCBnYXRl
IGZhbiBwb3dlciB0aHJvdWdoIGEgcmVndWxhdG9yIGFyZSBoYW5kbGVkLgo+Pgo+PiBSZXZpZXdl
ZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgo+PiAt
LS0KPiAKPiDCoCogVGhyb3VnaCB3aGljaCB0cmVlIHRoaXMgcGF0Y2ggc2hvdWxkIGdvID8gKGFz
c3VtaW5nIHRoZXJlIGlzIGEKPiBkZXBlbmRlbmN5IG9uIG90aGVyIHBhdGNoZXMpCj4gCgpJIHRo
aW5rIHRoaXMgcGF0Y2ggc2hvdWxkIGdvIHRocm91Z2ggTUZEIGFzIHRoaXMgcGF0Y2ggZGVwZW5k
cyBvbiBpdC4KCj4gwqAqIEhvdyB0aGlzIHdpbGwgYmVoYXZlIHdpdGggMTAwIGxldmVscyB3aXRo
IHRoZSBzdGVwIHdpc2UgZ292ZXJub3IgPwo+IEZvciBhIDEwMG1zIHBhc3NpdmUgZGVsYXkgYW5k
IDEwMCBzdGF0ZXMsIGl0IHdpbGwgdGFrZSAxMHMgYmVmb3JlCj4gcmVhY2hpbmcgdGhlIGZ1bGwg
c3BlZWQKClllcyB0aGUgVklNNCBNQ1UgYWNjZXB0IHZhbHVlcyBmcm9tIDAgdG8gMTAwLCBidXQg
aGVyZSBJJ20gZ2l2aW5nIGEgbGlzdAp3aGljaCBpcyAoMCwgMzAsIDQwLCA1NSwgNzUsIDEwMCks
IHNvIDUgc3RlcHMgdG8gZnVsbCBzcGVlZC4KCi0tIApCZXN0IHJlZ2FyZHMsClJvbmFsZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
