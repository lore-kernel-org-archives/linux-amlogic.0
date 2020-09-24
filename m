Return-Path: <SRS0=il4G=DB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61A1C4363D
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2020 17:01:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43952220C
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2020 17:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h5n7zBHH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OGaeaq59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B43952220C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iU0cRm9CstWnmBunFvfHIEb8i7a8uS5q9FD29s7uhCE=; b=h5n7zBHHVrZV/LEhhtMtxekLT
	CB18IPlIYjCNyEuZqHokP9MSkStFYRk+hbos02dwBMXri4eXlTyc804+bG47DFHjbOXGf4rUudYY2
	Z0QUiG+ZHVPbEISKvyluTEczqv09vdkfe1YvgdNTUklb4B1Mbkp8mrh08tE+h5AWiXGf5KFbmUan7
	QrwWth4RBTUcOaqOtyvQ30LNb1md2i1+UXfWbhtC+kZn2dGert6IekPbZRC/oH6cugP9wLGldUmH4
	VuOacF9sTxq8lRZPqov/56VBmPa4RkEewlX0Tbh3Xx9MiHBWJRmKbAl8e4DO1H0tAtzoeIikDpL8o
	pr4oizBAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLUct-0007xi-R9; Thu, 24 Sep 2020 17:01:47 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLUcr-0007wr-Gl
 for linux-amlogic@lists.infradead.org; Thu, 24 Sep 2020 17:01:46 +0000
Received: by mail-pj1-x1041.google.com with SMTP id u3so17542pjr.3
 for <linux-amlogic@lists.infradead.org>; Thu, 24 Sep 2020 10:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wai6nrMcHMtaGESKTBMiyp6BzMJao/GERxFZZ1c+mrw=;
 b=OGaeaq59Tt/XijT63cFNXsWFUc7pRwS0n/R2QRbOGJnV7bvG3CXlKdq5J2kzaa78ME
 jbn6h+cKePv+nZUfj0dYZ/naRD1fpMeky67EjyNkTg//e+k2ICFEfpU8OpvLHodqmlsc
 e6Ly9/IjuYRLIh38hb9NRmaTWGZNwKnUqdSJcvhAoqJ+bkDsOq9MIKX2VARxrCjwg0q4
 3ou7RuM3Gjr8Xlz90Nu7tGCgohzhEADNN4nastiusrywUCf0Vc2eGX41ssiAock84bPQ
 FN7QmWmVC1S0RrKu5AL4uq0oDrScIks1DNrv6FZkIz5O5Zw4cWRsea78whS2daP/WxbN
 ZByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=wai6nrMcHMtaGESKTBMiyp6BzMJao/GERxFZZ1c+mrw=;
 b=osp4EaaRttsKD8mXbj5RfDYyqE6Q47y3AzIjrDIQy5tjmZWtX/WM8p64vcjxQ8wqbL
 SlYZGfJDuObrx+EoM/Pt18c6sOszVhkQiRBw07ZbXjSvhXcZINA58hk6rlJgJsqLKW6Y
 VH/gWcxxeNxR9rUoJ2CEniqylnftctGl5LhppTKip7gll5IqIKCYAn3VZWbnb4SfW3sm
 Kj6CcJM2mb5o/wPFvUQZji9hxtfkaANHRvM3BHav84WYmRBg29I44D7hFr4M4y+0pDxW
 ZdoL6lp24/oweNH6L4ZmTh/+S/tNYfDA0AV6AgFpIxKQeM1KcNFv9y7SVuWaDbsKcOyl
 dK0w==
X-Gm-Message-State: AOAM5332/yZTbSS2TZw5lvL+FujPt8FKUnznXI3NXc4/MRVazWpUSHUn
 ayfd42oKk4Nhm7pIuRwzdPp9GwWR8snM2N0d
X-Google-Smtp-Source: ABdhPJyB4E6oTZ+1qw0qVBGbrUxEy2hRIRjCoD2OsburrUv+ugcG2SoS9sHIe6Pl0ettoc5fKwLfFg==
X-Received: by 2002:a17:90a:c20f:: with SMTP id
 e15mr102859pjt.163.1600966902382; 
 Thu, 24 Sep 2020 10:01:42 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y13sm51996pfr.141.2020.09.24.10.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 10:01:41 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Brad Harper <bjharper@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-mmc@vger.kernel.org
Subject: Re: [PATCH] mmc: host: meson-gx-mmc: fix possible deadlock condition
 for preempt_rt
In-Reply-To: <24a844c3-c2e0-c735-ccb7-83736218b548@gmail.com>
References: <24a844c3-c2e0-c735-ccb7-83736218b548@gmail.com>
Date: Thu, 24 Sep 2020 10:01:41 -0700
Message-ID: <7hk0wj9ki2.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_130145_590607_CE87D9BA 
X-CRM114-Status: GOOD (  19.96  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-rt-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQnJhZCwKCkJyYWQgSGFycGVyIDxiamhhcnBlckBnbWFpbC5jb20+IHdyaXRlczoKCj4gRm9y
Y2UgdGhyZWFkZWQgaW50ZXJydXB0cyBmb3IgbWVzb25fbW1jX2lycSB0byBwcmV2ZW50IHBvc3Np
YmxlIGRlYWRsb2NrIAo+IGNvbmRpdGlvbgo+IGR1cmluZyBtbWMgb3BlcmF0aW9ucyB3aGVuIHVz
aW5nIHByZWVtcHRfcnQgd2l0aCA1LjkuMC1yYzMtcnQzIHBhdGNoZXMgCj4gb24gYXJtNjQuCj4K
PiBVc2luZyBtZXNvbi1neC1tbWMgd2l0aCBhbiBlbW1jIGRldmljZSBvbiBIYXJka2VybmVsIE9k
cm9pZCBOMisgCj4gY29uZmlndXJlZCB3aXRoCj4gcHJlZW1wdF9ydCByZXN1bHRlZCBpbiB0aGUg
c29jIGJlY29taW5nIHVucmVzcG9uc2l2ZS7CoCBXaXRoIGxvY2sgCj4gY2hlY2tpbmcgZW5hYmxl
ZAo+IHRoZSBiZWxvdyBpbmNvbnNpc3RlbnQgbG9jayBzdGF0ZSB3YXMgb2JzZXJ2ZWQgZHVyaW5n
IGJvb3QuCj4KPiBBZnRlciBzb21lIGRpc2N1c3Npb25zIHdpdGggdGdseCBpbiBJUkMgI2xpbnV4
LXJ0IHRoZSBhdHRhY2hlZCBwYXRjaCB3YXMgCj4gc3VnZ2VzdGVkCj4gdG8gcmVtb3ZlIElSUUZf
T05FU0hPVCBmcm9tIHJlcXVlc3RfdGhyZWFkZWRfaXJxLgo+IFRoaXMgaGFzIGJlZW4gdGVzdGVk
IGFuZCBjb25maXJtZWQgYnkgbWUgdG8gcmVzb2x2ZSBib3RoIHRoZSAKPiB1bnJlc3BvbnNpdmUg
c29jIGFuZAo+IHRoZSBpbmNvbnNpc3RlbnQgbG9jayBzdGF0ZSB3YXJuaW5nIHdoZW4gdXNpbmcg
NS45LjAtcmMzLXJ0MyBvbiBhcm02NCAKPiBPZHJvaWQgTjIrLgo+Cj4gRnVydGhlciByZXZpZXcg
YW5kIHRlc3RpbmcgaXMgcmVxdWlyZWQgdG8gZW5zdXJlIHRoZXJlIGFyZSBubyBhZHZlcnNlIAo+
IGltcGFjdHMgb3IKPiBjb25jZXJucyBhbmQgdGhhdCBpcyB0aGUgY29ycmVjdCBtZXRob2QgdG8g
cmVzb2x2ZSB0aGUgcHJvYmxlbS7CoCBJIHdpbGwgCj4gY29udGludWUKPiB0byB0ZXN0IG9uIHZh
cmlvdXMgYW1sb2dpYyBkZXZpY2VzIHdpdGggYm90aCBzdGFuZGFyZCBtYWlubGluZSBsb3cgCj4g
bGF0ZW5jeSBrZXJuZWwKPiBhbmQgcHJlZW1wdF9ydCBrZXJuZWwgd2l0aCAtcnQgcGF0Y2hlcy4K
ClRoaXMgbG9va3MgcmlnaHQgdG8gbWUsIHRoYW5rcyBmb3Igc2VuZGluZyBhIGZpeC4KCkZvciBi
cm9hZGVyIHRlc3RpbmcsIEkgY2FuIGFkZCB0aGlzIHRvIG15IHRlc3RpbmcgYnJhbmNoIHNvIGl0
IGdldHMKYm9vdGVkIG9uIGEgYnVuY2ggbW9yZSBwbGF0Zm9ybSBpbiBLZXJuZWxDSSBhbHNvLgoK
SG93ZXZlci4uLgoKWy4uLl0KCj4gU2lnbmVkLW9mZi1ieTogQnJhZCBIYXJwZXIgPGJqaGFycGVy
QGdtYWlsLmNvbT4KPiAtLS0KPiAgwqBkcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jIHwg
MiArLQo+ICDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgCj4gYi9kcml2
ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4gaW5kZXggMDhhM2IxYzA1Li4xMzBhYzEzNGQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwo+ICsrKyBiL2Ry
aXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPiBAQCAtMTEzOSw3ICsxMTM5LDcgQEAgc3Rh
dGljIGludCBtZXNvbl9tbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAKPiAqcGRldikK
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBob3N0LT5yZWdzICsgU0RfRU1NQ19JUlFf
RU4pOwo+Cj4gIMKgwqDCoMKgwqDCoMKgIHJldCA9IHJlcXVlc3RfdGhyZWFkZWRfaXJxKGhvc3Qt
PmlycSwgbWVzb25fbW1jX2lycSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lc29uX21tY19pcnFfdGhyZWFkLCBJ
UlFGX09ORVNIT1QsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZXNvbl9tbWNfaXJxX3RocmVhZCwgMCwKPiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2X25hbWUoJnBkZXYtPmRldiksIGhvc3QpOwo+ICDCoMKgwqDCoMKgwqDCoCBp
ZiAocmV0KQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfaW5pdF9j
bGs7CgpUaGlzIHBhdGNoIGhhcyBiZWVuIG1hbmdsZWQgYnkgeW91ciBtYWlsZXIsIHNvIGl0IGRv
ZXNuJ3QgYXBwbHkgY2xlYW5seS4KSWYgeW91J3JlIHVzaW5nIHRoZSBnbWFpbCB3ZWIgVUksIHRo
aXMgaXMgYSBjb21tb24gcHJvYmxlbS4KCkkgc3Ryb25nbHkgcmVjb21tZW5kIHVzaW5nIGdpdC1z
ZW5kLWVtYWlsIHRvIHNlbmQgZGlyZWN0bHkgdmlhIGdtYWlsClNNVFAuICBUaGUgZ2l0LXNlbmQt
ZW1haWwgZG9jc1sxXSBnaXZlIHNvbWUgZXhhbXBsZXMgb24gaG93IHRvIHNldCB0aGlzCnVwLgoK
S2V2aW4KClsxXSBodHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LXNlbmQtZW1haWwjX2V4YW1w
bGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
