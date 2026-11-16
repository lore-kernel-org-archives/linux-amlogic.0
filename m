Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D7606A323
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 00:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GCBPvzHn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJwZzzTy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MGNzbHbeIZKXVwqbV/OFOxsaq6LNRbwH+v7iyXfvMxI=; b=GCBPvzHndatV3fT8AsC0cIgSZG
	6x42l7lK2TrHXWaQatxzV9oMGNNYuZ7HU80E4b5M7O1XbsRiTl64XJXCt8607XWYgf5Dz1kvUhmnm
	orzAKUZLwF8mPK5T3BnQAi2n4lRQwHDhJrXySpK3PdqR2ciDtDFnamPNK/OS4WFBVzKyIv0NarXgt
	YF36sACDu5r6XsXZ1H6ewDte2SjEinP/Tx0IRn/Q9pnaxLwcPlwJG6JRZ+Lw/L71KMGRT9P4wvXKJ
	F75/Y7zAh/Ffln3IBXdmTLbJGsuqWBiO0p+cbS5cgSYMAtpdNdhrS3h/pE0eXV3G791/77VKvOhtR
	22KVyoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkgT-00000000o7z-38IY;
	Mon, 16 Nov 2026 00:34:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkgT-00000000o7r-1Qv6
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Nov 2026 00:34:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C958C4019A;
	Mon, 16 Nov 2026 00:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508C31F000C4;
	Mon, 16 Nov 2026 00:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794789296;
	bh=ZQ5s77pt7WuhcJMDWqyrTloAIFM7HridzheIVDA1k58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nJwZzzTyNB66BirWxEE1oKdQIhm54SYu6xYMbQlMdJ3NBYiE03VdBGWwxDpGJ5yJM
	 2r6DPGz262tpLViy4FmOg1esO04NCuu7s2kPCmGpRR/woVF5Z8ZuB4ICBOY7T0UnWn
	 ZZKOc+tDEcFFKH9+sHtk//sjIG8oRHop/PRcMknD70B3OiCJvS9tNt0+DED0BGr6Kt
	 HR8qitmtH87475dH4RgWfTwWoKWSHoz2hs4N4b2m2GF3IJJZf9dWM7RY4Bi8MsGqS4
	 9DNBZC35yiYA8lnon7jO+R1kcHHnDBAk83AVg7uNwH/qeGAhmjR47e1fhQgORznl6V
	 HybfHQAyU/hFQ==
Message-ID: <sashiko-outbox-215957@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] dt-bindings: rtc: Add linux,wakeup-states
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261116-b4-alarmtimer-rtc-priority-v2-6-b2c69721e489@iav.lv>
References: <20261116-b4-alarmtimer-rtc-priority-v2-0-b2c69721e489@iav.lv>
 <20261116-b4-alarmtimer-rtc-priority-v2-6-b2c69721e489@iav.lv>
Date: Mon, 16 Nov 2026 00:34:55 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHQtYmluZGluZ3M6IHJ0
YzogT1Mtc3BlY2lmaWMgbWVtX3NsZWVwIHN0YXRlcyBpbgogIGxpbnV4LHdha2V1cC1zdGF0ZXMK
LS0KCmNvbW1pdCAzN2UzOTcyMTgyMmVmYjJmM2FjM2U3NmFhZWMyNzFmZjBlZGJlMThiCkF1dGhv
cjogSWdvciBWZWxrb3YgPGlhdkBpYXYubHY+CgpkdC1iaW5kaW5nczogcnRjOiBBZGQgbGludXgs
d2FrZXVwLXN0YXRlcwoKVGhpcyBjb21taXQgYWRkcyBhIGxpbnV4LHdha2V1cC1zdGF0ZXMgcHJv
cGVydHkgdG8gdGhlIGdlbmVyaWMgUlRDIGJpbmRpbmcKc2NoZW1hIHRvIHNwZWNpZnkgd2hpY2gg
c3VzcGVuZCBzdGF0ZXMgYW4gUlRDIGFsYXJtIGNhbiB3YWtlIHRoZSBzeXN0ZW0KZnJvbSwgYW5k
IGFsbG93cyB0aGUgcHJvcGVydHkgaW4gdGhlIEFtbG9naWMgTWVzb24gVlJUQyBhbmQgTlhQIFBD
Rjg1NjMKYmluZGluZ3MuCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcnRjL2FtbG9naWMsbWVzb24tdnJ0Yy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3J0Yy9hbWxvZ2ljLG1lc29uLXZydGMueWFtbAo+IGluZGV4IGE4OTg2
NWZhNjc2YTYuLjUxY2NlNGIyYTdmZjMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3J0Yy9hbWxvZ2ljLG1lc29uLXZydGMueWFtbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvYW1sb2dpYyxtZXNvbi12cnRjLnlhbWwK
PiBAQCAtMzAsNiArMzAsOCBAQCBwcm9wZXJ0aWVzOgo+ICAgIHJlZzoKPiAgICAgIG1heEl0ZW1z
OiAxCj4gIAo+ICsgIGxpbnV4LHdha2V1cC1zdGF0ZXM6IHRydWUKPiArCj4gIHJlcXVpcmVkOgo+
ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gcmVnCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvbnhwLHBjZjg1NjMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvbnhwLHBjZjg1NjMueWFtbAo+IGluZGV4IDIyOTA5YTk2
MTIzZTUuLmU0NjQ0MzJlNDY5MGYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3J0Yy9ueHAscGNmODU2My55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ueHAscGNmODU2My55YW1sCj4gQEAgLTMyLDYgKzMyLDgg
QEAgcHJvcGVydGllczoKPiAgICBpbnRlcnJ1cHRzOgo+ICAgICAgbWF4SXRlbXM6IDEKPiAgCj4g
KyAgbGludXgsd2FrZXVwLXN0YXRlczogdHJ1ZQo+ICsKPiAgICBzdGFydC15ZWFyOiB0cnVlCj4g
ICAgd2FrZXVwLXNvdXJjZTogdHJ1ZQo+ICAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ydGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ydGMvcnRjLnlhbWwKPiBpbmRleCBlNDZkNTBiMTA2M2U0Li41NGY0MTg1OGRk
YTQ3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMv
cnRjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3J0
Yy55YW1sCj4gQEAgLTI2LDYgKzI2LDIzIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIDA6IG5vdCBj
aGFyZ2VhYmxlCj4gICAgICAgIDE6IGNoYXJnZWFibGUKPiAgCj4gKyAgbGludXgsd2FrZXVwLXN0
YXRlczoKPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmlu
Zy1hcnJheQo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIFN1c3BlbmQgc3RhdGVzIGFuIGFs
YXJtIG9mIHRoaXMgUlRDIHdha2VzIHRoZSBzeXN0ZW0gZnJvbSwgZ2l2ZW4KPiArICAgICAgdGhl
IGJvYXJkIGFuZCBpdHMgZmlybXdhcmUsIG5hbWVkIGFzIGluIC9zeXMvcG93ZXIvbWVtX3NsZWVw
LiBub25lLAo+ICsgICAgICBnaXZlbiBhbG9uZSwgbWVhbnMgdGhlIGFsYXJtIHdha2VzIHRoZSBz
eXN0ZW0gZnJvbSBubyBzdXNwZW5kCj4gKyAgICAgIHN0YXRlLiBBbiBSVEMgd2l0aG91dCB0aGlz
IHByb3BlcnR5IGlzIHRha2VuIHRvIHdha2UgdGhlIHN5c3RlbQo+ICsgICAgICBmcm9tIGV2ZXJ5
IHN1c3BlbmQgc3RhdGUuCj4gKyAgICBvbmVPZjoKPiArICAgICAgLSBpdGVtczoKPiArICAgICAg
ICAgIGVudW06Cj4gKyAgICAgICAgICAgIC0gczJpZGxlCj4gKyAgICAgICAgICAgIC0gc2hhbGxv
dwo+ICsgICAgICAgICAgICAtIGRlZXAKPiArICAgICAgLSBpdGVtczoKPiArICAgICAgICAgIC0g
Y29uc3Q6IG5vbmUKPiArCj4gICAgcXVhcnR6LWxvYWQtZmVtdG9mYXJhZHM6Cj4gICAgICBkZXNj
cmlwdGlvbjoKPiAgICAgICAgVGhlIGNhcGFjaXRpdmUgbG9hZCBvZiB0aGUgcXVhcnR6KHgtdGFs
KSwgZXhwcmVzc2VkIGluIGZlbXRvCgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyBsaW51eCx3YWtl
dXAtc3RhdGVzIGVuY29kZSBMaW51eC1zcGVjaWZpYyAvc3lzL3Bvd2VyL21lbV9zbGVlcCBsYWJl
bHMKYW5kIGluZm9ybWF0aW9uIGFscmVhZHkgZGVkdWNpYmxlIGZyb20gdGhlIGhhcmR3YXJlIGRl
c2NyaXB0aW9uIGludG8gdGhlCkRldmljZXRyZWUgQUJJPwoKSW4gcGFydGljdWxhciwgczJpZGxl
IGlzIGEgTGludXggc29mdHdhcmUgZnJlZXplIHN0YXRlIHdoZXJlIHdha2V1cApjYXBhYmlsaXR5
IGlzIGRldGVybWluZWQgYnkgd2hldGhlciB0aGUgUlRDIGhhcyBhbiBPUyBpbnRlcnJ1cHQgd2ly
ZWQgdmlhCmludGVycnVwdHMsIHJhdGhlciB0aGFuIGEgbGlzdCBvZiBzeXNmcyBzdGF0ZSBuYW1l
cy4gRm9yCmFtbG9naWMsbWVzb24tdnJ0Yywgd2FraW5nIHRoZSBzeXN0ZW0gb25seSBmcm9tIHBs
YXRmb3JtIHN1c3BlbmQgaXMKaW5oZXJlbnQgdG8gdGhlIGNvbXBhdGlibGUgc3RyaW5nIGJlY2F1
c2UgdGhlIGRldmljZSBpcyBhIHNjcmF0Y2ggcmVnaXN0ZXIKd3JpdHRlbiBkdXJpbmcgbWVzb25f
dnJ0Y19zdXNwZW5kKCkgZm9yIHRoZSBTQ1AgZmlybXdhcmUgYW5kIGhhcyBubyBPUwppbnRlcnJ1
cHQgbGluZS4gRmluYWxseSwgYWxsb3dpbmcgbm9uZSBkdXBsaWNhdGVzIHRoZSBhYnNlbmNlIG9m
IHRoZQpzdGFuZGFyZCB3YWtldXAtc291cmNlIHByb3BlcnR5IGFuZCBwZXJtaXRzIGNvbnRyYWRp
Y3RvcnkgY29tYmluYXRpb25zIHN1Y2gKYXMgc2V0dGluZyBib3RoIHdha2V1cC1zb3VyY2UgYW5k
IGxpbnV4LHdha2V1cC1zdGF0ZXMgPSAibm9uZSIgb24gdGhlIHNhbWUKbm9kZS4KCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTYt
YjQtYWxhcm10aW1lci1ydGMtcHJpb3JpdHktdjItMC1iMmM2OTcyMWU0ODlAaWF2Lmx2P3BhcnQ9
NgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
