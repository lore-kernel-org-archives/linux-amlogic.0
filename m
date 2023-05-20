Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38776C77B7D
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 May 2023 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/QxUQhnkhI/MbLwCZVD2UoSvs1JJ/BVwdae4+gL0ks=; b=2yJBHeOWf1Q+71
	ULIjA/OcGfcbindjGnlqk34jH9HoKHR13j9oL7PxgQs26dWLXLnRzcwEgQ3ME8VzjtaU+xtNE8J50
	GeQxBn1c0B9mzt1AnXBcT3U9q6fzp/DAmMVE/73x6CE2LTcDccJ/GGrgMdiQPeDDbc6wDdroajjae
	9LGR77oTrIUbc7UmZPOEPjh00jgW13z75kNwuPw6GAXHPHCxVc5l1sE2llR7GW1xS+guKuQe8lbFf
	mfXRMPyepXN4+2uCdDONHoLJhdEToaqAhbYDHFD3rS6atfm5xYEs4NZ4CKMq4MzkXIShtw+3HuHul
	Vij6nTFuGBdPj6F0ihOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0OX8-001mEz-1Y;
	Sat, 20 May 2023 15:30:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0OX5-001mEC-17;
	Sat, 20 May 2023 15:30:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C1E760B04;
	Sat, 20 May 2023 15:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C482FC433D2;
	Sat, 20 May 2023 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684596610;
	bh=I0/PYCkSOLHKSNHXu0txjdVY6Bmb7+j9J1Y+CWmldhw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aDoEEmHZpAqFLAowx9ND3W5CE9XrVubLboXGte0hddEMGEcF3hCFdNREo5UzQ289k
	 5Rg1ZQ/HdJZe2YK5XD5+3tk6SoOzbkGWwhOSbgIHrbnHPSQ979IVy9Qe3O7Qjmv13S
	 m3Kdc/kBOu87bYqO3WUNkexGhMgxGPyMEbq3BlyeuIcgNO30lV2Wynrlc78quhQwz2
	 ruAnC0ZAvwc4+qHeCTWWK0touTiXNcxDMJUqrTQ5BDs/1Jl3OhE8xPTjSwuEmAcCE9
	 XCwIuokDpzPFCwMCuQCPtMl9+pkthh0ehCi5kDKnA5LB+ubH3uS8lSEqeLzxcMGWMk
	 8ivitMZ9wdr6Q==
Date: Sat, 20 May 2023 16:46:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: =?UTF-8?B?0KHRgtCw0YDQuiDQk9C10L7RgNCz0LjQuSDQndC40LrQvtC70LDQtdCy0Lg=?=
 =?UTF-8?B?0Yc=?= <GNStark@sberdevices.ru>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "lars@metafoo.de" <lars@metafoo.de>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "khilman@baylibre.com" <khilman@baylibre.com>,
 "jbrunet@baylibre.com" <jbrunet@baylibre.com>, "andy.shevchenko@gmail.com"
 <andy.shevchenko@gmail.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
 <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
Message-ID: <20230520164618.08f26fd9@jic23-huawei>
In-Reply-To: <f0966e95-43c7-e6f6-8aeb-05f27691cec3@sberdevices.ru>
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
	<CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
	<f0966e95-43c7-e6f6-8aeb-05f27691cec3@sberdevices.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_083011_434057_393AD75E 
X-CRM114-Status: GOOD (  20.77  )
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

T24gV2VkLCAxNyBNYXkgMjAyMyAxNjo0Nzo1OSArMDAwMArQodGC0LDRgNC6INCT0LXQvtGA0LPQ
uNC5INCd0LjQutC+0LvQsNC10LLQuNGHIDxHTlN0YXJrQHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToK
Cj4gT24gNS8xNi8yMyAyMjowOCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiA+IEhpIEdl
b3JnZSwKPiA+Cj4gPiB0aGFuayB5b3UgZm9yIHRoaXMgcGF0Y2ghCj4gPgo+ID4gT24gTW9uLCBN
YXkgMTUsIDIwMjMgYXQgMTE6MDbigK9QTSBHZW9yZ2UgU3RhcmsgPGduc3RhcmtAc2JlcmRldmlj
ZXMucnU+IHdyb3RlOiAgCj4gPj4gRnJvbTogR2VvcmdlIFN0YXJrIDxHTlN0YXJrQHNiZXJkZXZp
Y2VzLnJ1Pgo+ID4+Cj4gPj4gQWNjb3JkaW5nIHRvIGRhdGFzaGVldHMgb2Ygc3VwcG9ydGVkIG1l
c29uIFNPQ3MKPiA+PiBsZW5ndGggb2YgQURDX0NMS19ESVYgZmllbGQgaXMgNiBiaXRzIGxvbmcg
IAo+ID4gSSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgdGhpcyBzZW50ZW5jZSB3aGljaCBkb2Vzbid0
IGFmZmVjdCB0aGlzIHBhdGNoCj4gPiAtIGl0J3Mgb25seSBhYm91dCBtYW5hZ2luZyBleHBlY3Rh
dGlvbnM6Cj4gPiBXaGljaCBTb0MgYXJlIHlvdSByZWZlcnJpbmcgdG8/Cj4gPiBUaGlzIGRpdmlk
ZXIgaXMgb25seSByZWxldmFudCBvbiBvbGRlciBTb0NzIHRoYXQgcHJlZGF0ZSBHWEJCIChTOTA1
KS4KPiA+IFRvIG15IGtub3dsZWRnZSBhbGwgU29DcyBmcm9tIEdYQkIgb253YXJkcyBwbGFjZSB0
aGUgZGl2aWRlciBpbiB0aGUKPiA+IG1haW4gb3IgQU8gY2xvY2sgY29udHJvbGxlciwgc28gdGhp
cyBiaXRtYXNrIGlzIGlycmVsZXZhbnQgdGhlcmUuICAKPiAKPiBIZWxsbyBNYXJ0aW4KPiAKPiBJ
J3ZlIGNoZWNrZWQgZGF0YXNoZWV0cyBvZiBhbGwgY2hpcHMgbGlzdGVkIGluIG1lc29uX3Nhcl9h
ZGNfb2ZfbWF0Y2ggYXJyYXkgaW4gbWVzb25fc2FyYWRjLmMgYW5kIGV2ZXJ5d2hlcmUgdGhpcyBm
aWVsZCBpcyA2IGJpdHMgbG9uZy4gQWNjb3JkaW5nIHRvIGRyaXZlciBjb2RlIGFuZCBleGlzdGlu
ZyBkdHMgZmlsZXMgdGhpcyBwYXRjaCBhZmZlY3RzIGFsbCBzdXBwb3J0ZWQgY2hpcHMgZXhjZXB0
IG1lc29uOC4KCk9uIHRoYXQgbm90ZSwgZG8gd2Ugd2FudCB0byBhZGQgYW55IGNsYXJpZnlpbmcg
dGV4dCBvbiB0aGUgc2NvcGUgdG8gdGhlCmNvbW1pdCBtZXNzYWdlPwoKSm9uYXRoYW4KCj4gCj4g
QmVzdCByZWdhcmRzCj4gR2VvcmdlCj4gCj4gCj4gPj4gRml4ZXM6IDNhZGJmMzQyNzMzMCAoImlp
bzogYWRjOiBhZGQgYSBkcml2ZXIgZm9yIHRoZSBTQVIgQURDIGZvdW5kIGluIEFtbG9naWMgTWVz
b24gU29DcyIpCj4gPj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIFN0YXJrIDxHTlN0YXJrQHNiZXJk
ZXZpY2VzLnJ1PiAgCj4gPiBTaW5jZSBteSBxdWVzdGlvbiBhYm92ZSBkb2Vzbid0IGFmZmVjdCB0
aGlzIHBhdGNoOgo+ID4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5i
bHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gPiAgCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
