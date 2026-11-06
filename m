Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0B8606A328
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 07:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z9TTwx4H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4IMc5+K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qFP9heXTeuTXr9X8X3/lJIz8TnIp5V0jRmu73HzfG4s=; b=z9TTwx4HBest8vpmDgLGmDj6RP
	c2vCs3qO+6MPdpPJ56W2OnME24f/CU0RPFUTxagUOfwv/5gyyNKmcgN6J96EuxFcZFTsKuccdnB8v
	6rTBau5zNC08YczwvmIqHlYHgu5FfGnkYYddC/uLd4pXxqi/xehp1P3C/CiQxUa/hRvx5cssUMQkL
	r3fUHY2DsAh5Wv7H7UM4BjBeI8L+BXoriFnkYlcYz23uSQOSiSbvmikrnJ6gyOgm9+wqQbRxfowgd
	fdfPyBmiZ5lFDnxMgticINWP5dcFO+o64dL9lS9I0fakr/Qgpa4ep5Ur4N/Z+V4Cwe321Zn06Ujct
	NrtFlB2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEDY-0000000BQhn-14oM;
	Fri, 06 Nov 2026 07:18:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEDX-0000000BQhS-1Q4E
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 07:18:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A48B8412D9;
	Fri,  6 Nov 2026 07:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513D31F0089F;
	Fri,  6 Nov 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793949510;
	bh=5/54paWIL8ueAepMG2+NfLjyaw2eZDDP5C0HmY0jh3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A4IMc5+K7phD/whTZykDVmwmbGzkhU2XVfmzcY6Bf0O2+WFcUUI9fXMX3BAYHYvJg
	 GVByMIzPaX9CdL8MRBb+TyX/M95WWO9Pgdod5BhA/leQM9LfCsqcHyFLuLrCf3iXbP
	 wG40t7mlaeerekJ/0jMJbhRDETgaCfPakTKbvzqVOVS4i7TZ3yt9A6OlHRTOCFqVmX
	 N2j63aXUCJWGyfmJYdMvwCOCdpcHyQc8C+Px4V1+s4oON38/IrHsfFs+qaIDXm3Bg8
	 1QUh9Y+SFoF8M1M6yqF3HUspuHBgVIIdRw1cSeqeBJu7H8Z09u3SCbZGdzX8z5XVeG
	 FTRbl3v5fnAoA==
Message-ID: <sashiko-outbox-200985@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: amlogic: a4: Allow functions without groups
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
References: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
Date: Fri, 06 Nov 2026 07:18:29 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gcGluY3RybDogYW1sb2dp
YzogYTQ6IGJvZ3VzIElTX0VSUl9PUl9OVUxMKCkgY2hlY2sgaW4KICBhbWxfcGN0bF9wcm9iZV9k
dCgpCi0tCgpjb21taXQgNTI4NDhlM2QwZDAxNWVjNDIwMDYzZTAyZTAzMzcwNDBiOTVlNjIzNwpB
dXRob3I6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgoKcGluY3RybDog
YW1sb2dpYzogYTQ6IEFsbG93IGZ1bmN0aW9ucyB3aXRob3V0IGdyb3VwcwoKVGhpcyBjb21taXQg
YWxsb3dzIHBpbmN0cmwgZnVuY3Rpb24gbm9kZXMgaW4gdGhlIGRldmljZSB0cmVlIHRvIGhhdmUg
bm8KY2hpbGQgZ3JvdXBzIGFuZCBpZ25vcmVzIG5vbi1HUElPIGNoaWxkIG5vZGVzIHdpdGhvdXQg
YSAiZnVuYy0iIHByZWZpeC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZXNvbi9w
aW5jdHJsLWFtbG9naWMtYTQuYyBiL2RyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLWFtbG9n
aWMtYTQuYwo+IGluZGV4IDM5ZWI4Y2M3ZmMwZDEuLmQwZTNjZWMzZWFkMDMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtYW1sb2dpYy1hNC5jCj4gKysrIGIvZHJp
dmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtYW1sb2dpYy1hNC5jCgpbIC4uLiBdCgo+IEBAIC0x
MTI4LDcgKzExMzQsOCBAQCBzdGF0aWMgaW50IGFtbF9wY3RsX3Byb2JlX2R0KHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYsCj4gIAo+ICAJaW5mby0+YmFua3MgPSBkZXZtX2tjYWxsb2MoZGV2
LCBpbmZvLT5uYmFua3MsIHNpemVvZigqaW5mby0+YmFua3MpLCBHRlBfS0VSTkVMKTsKPiAgCj4g
LQlpZiAoIWluZm8tPmZ1bmN0aW9ucyB8fCAhaW5mby0+Z3JvdXBzIHx8ICFpbmZvLT5iYW5rcykK
PiArCWlmIChJU19FUlJfT1JfTlVMTChpbmZvLT5mdW5jdGlvbnMpIHx8IElTX0VSUl9PUl9OVUxM
KGluZm8tPmdyb3VwcykgfHwKPiArCSAgICBJU19FUlJfT1JfTlVMTChpbmZvLT5iYW5rcykpCj4g
IAkJcmV0dXJuIC1FTk9NRU07CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyBJU19FUlJfT1JfTlVM
TCgpIG1hdGNoIHdoYXQgZGV2bV9rY2FsbG9jKCkgcmV0dXJucyBoZXJlPwoKZGV2bV9rY2FsbG9j
KCkgcmV0dXJucyBOVUxMIG9uIGZhaWx1cmUgb3IgWkVST19TSVpFX1BUUiAoKHZvaWQgKikxNikg
Zm9yIGEKemVyby1zaXplZCBhbGxvY2F0aW9uLCBuZXZlciBhbiBFUlJfUFRSKCkuICBBbHRob3Vn
aCB0aGUgY29tbWl0IG1lc3NhZ2UKc3RhdGVzIHRoYXQgdGhpcyBjaGVja3MgZm9yIFpFUk9fU0la
RV9QVFIsIElTX0VSUl9PUl9OVUxMKFpFUk9fU0laRV9QVFIpCmlzIGZhbHNlLCBhbmQgcmVqZWN0
aW5nIFpFUk9fU0laRV9QVFIgd2l0aCAtRU5PTUVNIHdvdWxkIGZhaWwgcHJvYmluZwp3aGVuZXZl
ciBpbmZvLT5uZ3JvdXBzIG9yIGluZm8tPm5mdW5jdGlvbnMgaXMgemVyby4gIFRoZSBvcmlnaW5h
bCBOVUxMCmNoZWNrcyBhbHJlYWR5IGNhdWdodCBhbGxvY2F0aW9uIGZhaWx1cmVzIHdoaWxlIGFs
bG93aW5nIFpFUk9fU0laRV9QVFIuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA2LWRlYnVnLWluZm8tdjEtMS0wNjdjNWM1NTRm
OTFAYW1sb2dpYy5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
