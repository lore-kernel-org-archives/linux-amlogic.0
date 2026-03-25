Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F1FEA830
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2026 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlC7DSCLQGQ16N9HVWz182NRzyUOxYjor0cqEzt+H8M=; b=odnq4aZ4F9bK5T
	8WnUd17QRPpzmMMh/ING4kW4mYBlUMqzeRd8rCa8UBfqfTN/KAnoLdP6qMAu8XNferlPvLW/T4crK
	+a9vKChDV5PQDbh65fSde6swRXOZ5lWiRgRmj4f1HgKxinf7YgexVgcpuu7ds3CDkYADg1eTjiJre
	1vl/c1YYlsNfNkOesM49f9sLqEyGRu7wSaD32alMDy1afoFERHErADsxeaZQR6EZz2+8lwpxCSK03
	QqQCZ2S6mypDmwoeptWNgzjGJSkG0Yw6xQ97GJrseHZ9DxcM1LP9d9BRLfZ9iflQmxBxag9m/aTN4
	MvfjAgUJ+9HhWIggNdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Js4-00000002yeW-44bX;
	Wed, 25 Mar 2026 08:45:48 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jry-00000002ydv-3AdO;
	Wed, 25 Mar 2026 08:45:46 +0000
Message-ID: <2c63a66c-8562-48d5-ac25-50359de3ad8b@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774428337;
	bh=EbpGoxqQXt+Kk2/8U5yoMgWyFVaTQNOoOx8b2j6G0us=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=QoTeywTx0cyBayxdpZrL++1gsw2TV/mGYRha6OoPqh2MWI4qe86v7yv0IaGWjfsgD
	 vUHRmtZyEyZ+HLcQw8qqsDlx1zxXOXLy8hQWTFHQg6WzvuXNK4giOmZKw/+zavaxT8
	 q9S9AX8y/ZNWIRI0QT0BWC0Pfe1Wn7//P/Qpnh3Y=
Date: Wed, 25 Mar 2026 09:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v3 2/9] dt-bindings: mmc: amlogic: Add compatible for T7
 mmc
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
 <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
 <c01c4e7e-1c0c-4bbf-b126-831160c8e32b@amlogic.com>
Content-Language: en-US
In-Reply-To: <c01c4e7e-1c0c-4bbf-b126-831160c8e32b@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_014545_006984_D4DDF671 
X-CRM114-Status: GOOD (  12.51  )
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

T24gMy8yNS8yNiAzOjM4IEFNLCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4gSGkgUm9uYWxkLAo+IAo+
IE9uIDIwMjYvMy8yMyAxNzo1NSwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4+IEFkZCBhbWxvZ2lj
LHQ3LW1tYyBjb21wYXRpYmxlIHN0cmluZywgZmFsbGluZyBiYWNrIHRvIGFtbG9naWMsbWVzb24t
Cj4+IGF4Zy1tbWMKPj4gYXMgdGhlIFQ3IE1NQyBjb250cm9sbGVyIGlzIGNvbXBhdGlibGUgd2l0
aCB0aGUgQVhHIGltcGxlbWVudGF0aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xh
dmVhdTxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgo+PiAtLS0KPj4gwqAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9hbWxvZ2ljLG1lc29uLWd4LW1tYy55YW1sIHwgNQo+
PiArKysrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQKPj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbW1jL2FtbG9naWMsbWVzb24tZ3gtbW1jLnlhbWwKPj4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tZ3gtbW1jLnlhbWwKPj4gaW5kZXggNTc2
NDY1NzVhMTNmOC4uNDBkY2NmOTcxNTc4MSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9hbWxvZ2ljLG1lc29uLWd4LW1tYy55YW1sCj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYW1sb2dpYyxtZXNvbi1neC1t
bWMueWFtbAo+PiBAQCAtMTksNyArMTksMTAgQEAgYWxsT2Y6Cj4+IMKgIHByb3BlcnRpZXM6Cj4+
IMKgwqDCoCBjb21wYXRpYmxlOgo+PiDCoMKgwqDCoMKgIG9uZU9mOgo+PiAtwqDCoMKgwqDCoCAt
IGNvbnN0OiBhbWxvZ2ljLG1lc29uLWF4Zy1tbWMKPj4gK8KgwqDCoMKgwqAgLSBpdGVtczoKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtIGFtbG9naWMsdDctbW1jCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogYW1sb2dp
YyxtZXNvbi1heGctbW1jCj4gCj4gSXQgc2VlbXMgdGhhdCBicmVhayBBUEkgaGVyZS4KPiBPbmUg
aXRlbSBzaG91bGQgYmUgYWRkZWQgaGVyZSBpbnN0ZWFkIG9mIGJlaW5nIHJlcGxhY2VkLgo+IAoK
VGhhbmtzIFhpYW53ZWksIG9rIEkgd2lsbCBjaGFuZ2UgdGhhdCBpbiBhIG5ldyB2ZXJzaW9uLgoK
Pj4gwqDCoMKgwqDCoMKgwqAgLSBpdGVtczoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNv
bnN0OiBhbWxvZ2ljLG1lc29uLWd4LW1tYwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29u
c3Q6IGFtbG9naWMsbWVzb24tZ3hiYi1tbWMKPj4KPj4gLS0gCj4+IDIuNDkuMAoKCi0tIApCZXN0
IHJlZ2FyZHMsClJvbmFsZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
