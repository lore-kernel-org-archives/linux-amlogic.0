Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54439C5518F
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Aug 2026 08:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jscFHOtpJpxjoqY5dIgHtjrmYGLalbildw5U0T2m+eU=; b=Vph17NGewjF8yE
	4iLLKrDSG41IWpYjNvc1csPkr4bwM9Z5hyT5giIjRfVoM08zrSO5lVFtCGelcSM5Z5NV/6mLc2+nQ
	UsKUrXwl66fko86ljDaYcZihiqshgh6CqadV2KteqT3fus22lwGK1XJyQjzivX9qiB+SQi/WPsIqo
	P2FP1KYuF0+ivsHEjyRnAu8CB67elju2B3Bs5UmKnJq21d89I+NQRSnOd58n+hg0w17IrkhV9z5Bt
	zKSduSV5Les43WBegF0ql/JuPXAMeDlpv5O3SWOW/M2qKycUmSge7Wtepy09LN8QEFNRnjqlu/AMI
	TDP0n91CzeSlTZB55NfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAYd-00000001LjV-0hJp;
	Tue, 04 Aug 2026 08:31:31 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAYa-00000001Liw-2jOu;
	Tue, 04 Aug 2026 08:31:30 +0000
Message-ID: <42363af0-a2af-4f8b-8ad2-834539c979b0@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1785832273;
	bh=p2hRbF6OR9u6soQD8uwd3KG20dyyAPFIEut3UyAAn20=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TxqyMj3z1Lg2uE0F//7bjxqsXG1z7qyHSQ/66bPbAUtMFaPEBrytueMpUZpuZy/Qc
	 mRmdKvaYJ5Fvb1d8aVSO1M2Bct0I0AbM9nlq/Q7ynqP7UZAka/+kXnAxSBBf24+YpH
	 oJo6XkMgCCF0ivRjz7XUkw654IL4NXB8uGzEVmF8=
Date: Tue, 4 Aug 2026 10:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v8 0/8] Add VIM4 MCU/FAN support
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
 <713c728a-f68f-41fa-a64b-09ccecef9157@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <713c728a-f68f-41fa-a64b-09ccecef9157@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_013129_128353_7CCA382E 
X-CRM114-Status: GOOD (  13.88  )
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

T24gNy84LzI2IDM6NDIgUE0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+IE9uIDcvMi8yNiAxMTo1
NSwgUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJlbGF5IHdyb3RlOgo+PiBUaGUgS2hhZGFzIFZJTTQg
Ym9hcmQgZmVhdHVyZXMgYSBkaWZmZXJlbnQgTUNVIHZhcmlhbnQgY29tcGFyZWQgdG8KPj4gcHJl
dmlvdXMgVklNIGJvYXJkcy4KPj4gV2hpbGUgaXQgc2hhcmVzIHRoZSBzYW1lIEkyQy1iYXNlZCBj
b21tdW5pY2F0aW9uIG1vZGVsLAo+PiBpdCBkaWZmZXJzIGluIHNvbWUgd2F5czoKPj4KPj4gwqDC
oCAtIEEgZGlzdGluY3QgcmVnaXN0ZXIgbWFwIHdpdGggaXRzIG93biB2b2xhdGlsZS93cml0ZWFi
bGUgcmVnaXN0ZXIgc2V0Cj4+IMKgwqAgLSBBIGZhbiBjb250cm9sIHdpdGggMOKAkzEwMCBsZXZl
bHMgaW5zdGVhZCBvZiB0aGUgMOKAkzMgbGV2ZWxzIHByZXZpb3VzbHkKPiAKPiBUaGF0IG1lYW5z
IGZvciBhIGVnLiAxMDAgbXMgcG9sbGluZywgdGhlIGZpcnN0IG9uZSB0YWtlcyAxMHMgdG8gcmVh
Y2gKPiB0aGUgbWF4IHNwZWVkLCB3aGlsZSB0aGUgc2Vjb25kIHRha2VzIDMwMG1zLCByaWdodCA/
Cj4gCgpTb3JyeSBmb3IgdGhlIGRlbGF5LgpZZXMgSSBkZWZpbmVkIGxldmVscyAzMC0xMDAgaW4g
dGhlIERUIGFzIHRoZSBNQ1UgcmVnaXN0ZXIgZGVzY3JpcHRpb24Kc3RhdGVkIHRoYXQ6CmBOb3Rl
OiB0aGUgcGFyYW1ldGVyIHZhbHVlIG9mIGZhbiBub3JtYWxseSBvcGVuIGlzIDB4MUV+MHg2NGAK
CkkgZGlkbid0IGZpbmQgYW55IGlzc3VlIHdpdGggdGhlIHN0cmVzcyB0ZXN0LCBidXQgSSB3aWxs
IGFkZHJlc3MgeW91cgpjb25jZXJuIHdpdGggYSBzbWFsbGVyIGxpc3QuCgo+PiDCoMKgIC0gQSBm
YW4gcG93ZXIgc3VwcGx5IGdhdGVkIHRocm91Z2ggYSByZWd1bGF0b3IKPj4KPj4gVGhpcyBzZXJp
ZXMgYWRkcyBzdXBwb3J0IGZvciB0aGlzIG5ldyB2YXJpYW50IGJ5Ogo+Pgo+PiDCoMKgIDEuIFJl
ZmFjdG9yaW5nIHRoZSBraGFkYXMtbWN1IE1GRCBkcml2ZXIgdG8gdXNlIHBlci12YXJpYW50IGRh
dGEKPj4gwqDCoMKgwqDCoCBzdHJ1Y3R1cmVzIChyZWdtYXAgY29uZmlnLCBjZWxscywgZmFuIHBs
YXRmb3JtIGRhdGEpLAo+PiDCoMKgwqDCoMKgIGFuZCBhZGRpbmcgdGhlIGtoYWRhcyx2aW00LW1j
dSBjb21wYXRpYmxlIHN0cmluZy4KPj4KPj4gwqDCoCAyLiBFeHRlbmRpbmcgdGhlIGZhbiB0aGVy
bWFsIGRyaXZlciB0byByZXRyaWV2ZSB0aGUgZmFuIHJlZ2lzdGVyCj4+IMKgwqDCoMKgwqAgYW5k
IG1heGltdW0gbGV2ZWwgZnJvbSBwbGF0Zm9ybV9kYXRhLAo+PiDCoMKgwqDCoMKgIGFuZCB0byBv
cHRpb25hbGx5IG1hbmFnZSBhIHBvd2VyIHJlZ3VsYXRvciBmb3IgdGhlIGZhbiBzdXBwbHkuCj4g
Cj4gVGhyb3VnaCB3aGljaCB0cmVlIGRvIHlvdSBleHBlY3QgcGF0Y2ggNS84IHRvIGdvID8KPiAK
Ck1GRCBzZWVtcyBhIGdvb2QgY2FuZGlkYXRlIGFzIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBpdC4K
Ci0tIApCZXN0IHJlZ2FyZHMsClJvbmFsZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
