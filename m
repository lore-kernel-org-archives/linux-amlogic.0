Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C653C624D3
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2026 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4S12yIdq+wbi1ph9HhAIyXkNwdmvYKD+U3ZyiBNcso=; b=W0f7M9K39jhdD3
	RIkPuE87kTDBryEYchYsrvFhB8evebvqfmZh7H0mRANlY4J1oecWBGQb1sVocXg3RForq2d9jHUuQ
	enrs8Xw/5qEJOJRTnYpS3hiDiAqidoPeHPIIRxWWSDGtN5Yr6yJRfDS20TP8LFyTnO8YJMF6of+B4
	6UJgAKNiZDU7Ki2pH0RvuPIKRWZQi7OlFxuHmhNbcFd1Z2wYiT0mKPICQwcTwLC7CQxD07lUYLBEd
	MU5nhFAkaY2nFJMhcKd7c9dkaLu3UixtEll9w761lZry9iC+PocakdUCGQaQQcJKm68cMwRGv4/Sw
	gr1p/YBJkfSJXGOSVhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QX3-0000000CWYu-0DEP;
	Tue, 01 Sep 2026 15:36:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QX1-0000000CWYR-2Cdx
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Sep 2026 15:36:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 372194146F;
	Tue,  1 Sep 2026 15:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1DC1F000E9;
	Tue,  1 Sep 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276975;
	bh=MBxTqH70UcEsED2mvnquPrF2ubed/dpea68hJHUis/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qgqz5zMDT3zz0SzqLsNw2S8ueG9qARNDv2a4vEe54z0qARqFN/Zg32AbgXHEAO1PO
	 aeq6ryYrKqxtz2CZPvMSCB9FVZbmjd9jfcdIBys4OKBEnIj42YZD6+n8Wm5bM1xZi6
	 2jDyBXX/YpUlJf7EDymt54pngwU9sF2sjwXdXjA+N7gOXJCfsc/K9jchhbhEhvpYwA
	 8sNB50jo9yB9K2GYjQpMBpe8vtOo10hwT68sqQY/uWVNLYVMVe3U7RnsRJ7/IEQn0g
	 4c4k2nr1Go2MRNUV/FBQsHYLtlQdydf1EMk+aag7IG+a4WITnnYEPDCmduE8nNKHxg
	 nRZniAVD2o/JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-1-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-1-aecdb9955a30@aliel.fr>
Date: Tue, 01 Sep 2026 15:36:14 +0000
Message-Id: <20260901153614.9A1DC1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gSW50cm9kdWNpbmcgYSBi
ZXNwb2tlIHBsYXRmb3JtIGRhdGEgc3RydWN0dXJlIChgc3RydWN0IGtoYWRhc19tY3VfZmFuX3Bk
YXRhYCkgZm9yIHBhcmVudC1pbml0aWFsaXplZCBwcml2YXRlIHJlc291cmNlcyB2aW9sYXRlcyBN
RkQgZGVjb3VwbGluZyBndWlkZWxpbmVzLgotLQoKY29tbWl0IDhhOGI4ZmVmMjI3ODBkYjcwMzI4
MmU0YTI2N2I2NDRkNTMzOTE1N2EKQXV0aG9yOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVs
LWRldkBhbGllbC5mcj4KCm1mZDoga2hhZGFzLW1jdTogQWRkIHBlci12YXJpYW50IGNvbmZpZ3Vy
YXRpb24gaW5mcmFzdHJ1Y3R1cmUgYW5kIFZJTTQgc3VwcG9ydAoKVGhpcyBjb21taXQgYWRkcyBz
dHJ1Y3R1cmVzIGFuZCByZWdpc3RlcnMgdG8gc3VwcG9ydCBwZXItdmFyaWFudCBjb25maWd1cmF0
aW9uCmZvciB0aGUgS2hhZGFzIE1DVSwgc3BlY2lmaWNhbGx5IGFkZGluZyBWSU00IHN1cHBvcnQu
IEl0IGludHJvZHVjZXMgYW4gZW51bQpmb3IgZGV2aWNlIG1hdGNoaW5nIGFuZCBhIGN1c3RvbSBw
bGF0Zm9ybSBkYXRhIHN0cnVjdHVyZSB0byBwYXNzIGZhbgpjb25maWd1cmF0aW9uIGZyb20gdGhl
IHBhcmVudCB0byB0aGUgc3ViLWRyaXZlci4KCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
bWZkL2toYWRhcy1tY3UuaCBiL2luY2x1ZGUvbGludXgvbWZkL2toYWRhcy1tY3UuaAo+IGluZGV4
IGE5OWJhMmVkMGU0ZTAuLjdhOTk4MGVhNjNlN2UgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51
eC9tZmQva2hhZGFzLW1jdS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tZmQva2hhZGFzLW1jdS5o
CgpbIC4uLiBdCgo+IEBAIC04OCw0ICs5NSwyMSBAQCBzdHJ1Y3Qga2hhZGFzX21jdSB7Cj4gIAlz
dHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4gIH07Cj4gIAo+ICsvKioKPiArICogc3RydWN0IGtoYWRh
c19tY3VfZmFuX3BkYXRhIC0gZmFuIHN1Yi1kcml2ZXIgY29uZmlndXJhdGlvbgo+ICsgKiBAZmFu
X3JlZzogcmVnaXN0ZXIgYWRkcmVzcyB0byB3cml0ZSB0aGUgZmFuIGxldmVsCj4gKyAqIEBsZXZl
bHM6IHRhYmxlIG1hcHBpbmcgbG9naWNhbCBjb29saW5nLWRldmljZSBzdGF0ZXMgdG8gcmF3IGZh
biBsZXZlbHMKPiArICogQG5sZXZlbHM6IG51bWJlciBvZiBlbnRyaWVzIGluIEBsZXZlbHMKPiAr
ICovCj4gK3N0cnVjdCBraGFkYXNfbWN1X2Zhbl9wZGF0YSB7Cj4gKwl1bnNpZ25lZCBpbnQgZmFu
X3JlZzsKPiArCWNvbnN0IHVuc2lnbmVkIGludCAqbGV2ZWxzOwo+ICsJdW5zaWduZWQgaW50IG5s
ZXZlbHM7Cj4gK307CgpbU2V2ZXJpdHk6IExvd10KRG9lcyBpbnRyb2R1Y2luZyB0aGlzIGJlc3Bv
a2UgcGxhdGZvcm0gZGF0YSBzdHJ1Y3R1cmUgZm9yIHBhcmVudC1pbml0aWFsaXplZApwcml2YXRl
IHJlc291cmNlcyB2aW9sYXRlIE1GRCBkZWNvdXBsaW5nIGd1aWRlbGluZXM/CgpUaGUgcGFyZW50
IE1GRCBkcml2ZXIgaXMgZm9yY2VkIHRvIGhhbmRsZSBmYW4tc3BlY2lmaWMgY29uZmlndXJhdGlv
biAobGlrZQpyZWdpc3RlciBhZGRyZXNzZXMgYW5kIGxldmVscykgcmF0aGVyIHRoYW4gYmVpbmcg
bGltaXRlZCB0byBnZW51aW5lbHkgc2hhcmVkCmNvcmUgcmVzb3VyY2VzLiBUaGlzIGNyZWF0ZXMg
dGlnaHQgY291cGxpbmcgd2l0aCB0aGUgY2hpbGQgZHJpdmVyIGFuZAp2aW9sYXRlcyB0aGUgcmVx
dWlyZW1lbnQgdGhhdCBwcml2YXRlIHJlc291cmNlcyBiZSBpbml0aWFsaXplZCBkaXJlY3RseSBp
bgp0aGUgY2hpbGQuCgo+ICsKPiArZW51bSBraGFkYXNfbWN1X3R5cGUgewo+ICsJS0hBREFTX01D
VV9HRU5FUklDID0gMSwgLyogVklNMS8yLzMsIEVkZ2UsIEVkZ2UtViAqLwo+ICsJS0hBREFTX01D
VV9WSU00LAo+ICt9Owo+ICsKPiAgI2VuZGlmIC8qIE1GRF9LSEFEQVNfTUNVX0ggKi8KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5
MDEtYWRkLW1jdS1mYW4ta2hhZGFzLXZpbTQtdjEwLTAtYWVjZGI5OTU1YTMwQGFsaWVsLmZyP3Bh
cnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
