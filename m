Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579DCC5B572
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Aug 2026 04:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEcTaHIHF3D+H10cQAWZz4z4PO0PFDPx+Fvl1Ot1F1s=; b=VvCRsFM99AilaN
	itjqWhkTFYdL7f1BoP8gWqt6Za8UNMOUJ/iJvxTJI68Hjf7fQUo3DQQgp8wPRTEzbhcVMTlN0BeDu
	84voknH+4rU8SZ1ZH3bh5D0s6OzbCN/jAtRJ0Nxj4mZKFPsCOjSXMnMWDx19Weuao++UPIUXPD3bJ
	FcJM6KC8dWqB/Sh64SZnWdtLw1e2kz4bJISsIvIOm773D7edtH4EAbWao0pB6vS8Vq/3CazhmkHzR
	YdoF/b5lnlqjP4hdIKVgbW0AMzj55V3btbq7AOs21DATmXhN8bm/99pYX7vZTiudPl5WKPly+RZuO
	Rffl/ZjFDkvhENJx0Eww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNW0-0000000HNr1-2WmA;
	Thu, 13 Aug 2026 04:58:04 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNVy-0000000HNqY-1xIW
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Aug 2026 04:58:03 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cace91f112so3995255ad.0
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 21:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786597081; cv=none;
        d=google.com; s=arc-20260327;
        b=CoMhdZVTz2u7QwNu8MJW1nabMYoQ6ufLoQvzfHdSYvZGFutSpw9wvnM3Yv6YVjNPUd
         NhVGDVU2gJHYPm2W6MCOuWdWUiRBCaMZQk2HGeLCOLFepU2gWebFhu0xxVyKzw4r6N6o
         SLUkECMRnn7tcaEQwrGHeguAOBWtIcmYFqeAU4B+QVuGzHQhgeWMFB/khp/04MBPRoM9
         l/RjF4YFwd/UA4QS/U9o/MKKCSHNLyhKaGI0AsZulRC2TtExQ6qPYKQR91gu51CDNjLn
         80+g3IgzqaaTPFctgU7zfZTZScZ7yDIHau8eMeqAeYH3t4krDkCvaNuDB7h29voXqtpE
         CyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUsbAPNc68aIG4OQfMUsvANEsU1GLxgtxRCXnCqwe0w=;
        fh=q/VIuGxPA4EWn1dbubnw84LdTM18niznS6lF0cMBn2w=;
        b=Y85oAWVw8bSCc2Q0++UkmIOQhpdyJn6+ebpp5gzP30vX8oT+yozvyNWMafmznt3asp
         4/m28W4phPgZBGnRUcHxmXE+4TauYgVzDaO8hwmLM3ffgdumVcuhhawOCU8GzFh9jdOW
         /kT+0O3kbr7eHcNZi56laQNygpUcqwP84LH/rch3XYHLqm/8QNERQN7rPA8nK+q7jqWl
         miGeWkd2V4s1q1FHb0I3d4qzp3+fEJMqiyot0AK8tZ/K296/ikEl1dnvkoIM1w1z3Qvp
         6fEJIIYKMaEEUxAMHi3C+CpOlBzWD6HvDvfTG4BASCO8GLsGbtS2hEnqrED+1ov/aPS1
         M9/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786597081; x=1787201881; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SUsbAPNc68aIG4OQfMUsvANEsU1GLxgtxRCXnCqwe0w=;
        b=mTZsh6+30D6wZOydSUGYMNqJtDu6mMBMzrmGhjBeLxXzqRF7X6PyE+/UoPIJyzlouD
         nypH5Xg1El1RQwMEKN4UNMoAlZfMywW55xoPsSSZdohEjcNi8Qw0S7b5RM5bfxPdIOX9
         G8JPZbvBJVvSSONcYlkYwhc92GguJDrJNyn1vBCry/tOVJqYk6ZLcYRPUxFAPJBWmtgJ
         rbuBlQjGqAtzDpglJqDm96RsS18pAvDqVuI8nco/ebzNz2GRJujzLap2Js6tKiAewRgd
         RHj0jRuH8Y7fl5CM0um9gBPl93yG8vcObaU8bGbY7/ROQ4mtBmKlkDTQGzyQSwDMEMh3
         luzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786597081; x=1787201881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUsbAPNc68aIG4OQfMUsvANEsU1GLxgtxRCXnCqwe0w=;
        b=ddEcroPR07s3nHKVewFCI8EtdrIMVvUxKYDnY6yFddyVMu4T7dtFVjFUolXyG/DtAh
         OcyQrAc7yeM6iUNWAYOA7eyCljx4PU6gz9IHJ8Dq+WBMdp70OmNc8kdwqBUNVSC+zQRV
         tu6C324sira4qgsnTgGujS7zaS3vJEHmhTIMbYfIU8uxG6TOborCG2LwsKVzhyI7RbzX
         2L88wtWFj8+CqBBE/7j+oqeII8is3CC+eiPrtkfkWJKSr1auqCHAfJO0nY7dJcFlwe8N
         F77DuwnBYAfgEKfkmoJJP3GZuNPpUv1RgTeHybs+/zdvKThVYv1a957x4zcZBiBYoM7V
         MWJw==
X-Forwarded-Encrypted: i=1; AHgh+RoA1K23ELHhqhdd8aF8jTa9tx6p75o/JPbMOwHSCSNCnAhqRgpg4fkZAw6uXAyCmNma3A4iXB/i4Q6vh0nB@lists.infradead.org
X-Gm-Message-State: AOJu0YxFTGwsF4oN/btKumzRav6PWn1sd27rnKTpRtYJ0i1vxeUafP9d
	QGF/zeqHerSNCa0x/0WRWZMGFEXfyukvCC7SGQn5OcBazWvfc6e/bjDgh7K/uPaXsX4CTZ4OGZP
	YUMK5gGznmreJDw3SZvlZp0SBIF4ga9Y=
X-Gm-Gg: AR+sD12Ez5DMru6/yZQ2Q1Tckg88oK+FunjAeCGv0jR5BO9EDQUGb2BtxGhT2+GYFdX
	SPggrwsRJ1WEVakmCRyRhIy6q9QrLfJekiL2Qu9S7P9mxx0U3+7EZPyAX9cGmk4yPxKTyPWm1Jn
	J3f9anJLFZ3e58vzD5GBjWaXoBBpbs77VtewuaNTzeIjb3DrtCTneDnzdCMYlwcffHRgp+NyNFR
	DZtbiyRIxgro3C8Ix0cUXBeFzayiNVTwvJPhHRAOUr5cjPUl/uQNc2gfimVbKpUfz4GKCMu2hYS
	O0srfK0/22pwHYCd09jTPlWLp0zfQpbhGelHjh/0WvEkMdXeyiY7U1u8t9IQqyvXKVAg5dEZ03x
	IdQUqvHZrcaUbB20YtBWABo0iOcy0O/IJpMiWolFVmcfrEddXk1D9ksWL
X-Received: by 2002:a17:902:f64c:b0:2c9:d8c6:1dc3 with SMTP id
 d9443c01a7336-2d37d189f9emr36563835ad.0.1786597081398; Wed, 12 Aug 2026
 21:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260812112023.42254-1-phucduc.bui@gmail.com> <20260812112023.42254-3-phucduc.bui@gmail.com>
 <20260812114711.8641E1F00A3A@smtp.kernel.org>
In-Reply-To: <20260812114711.8641E1F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 13 Aug 2026 11:57:50 +0700
X-Gm-Features: AUfX_mykwCkincg2687zWGdDRSSrfKTd8N6RDJWLSmR0UYOP0VRifiRp-JErN1o
Message-ID: <CAABR9nHBt=+5C54vDzhvnZ2EsSTbA_raTq_q_K7EXoxhst_H2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: davinci: Handle errors from optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_215802_511950_7770FD08 
X-CRM114-Status: GOOD (  13.93  )
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

PiBbU2V2ZXJpdHk6IEhpZ2hdCj4gRG9lcyB0aGlzIGRpcmVjdCByZXR1cm4gbGVhayB0aGUgY2xv
Y2sgcmVmZXJlbmNlPwo+Cj4gRWFybGllciBpbiBkYXZpbmNpX21tY3NkX3Byb2JlKCksIHRoZSBj
bG9jayBpcyBwcmVwYXJlZCBhbmQgZW5hYmxlZDoKPgo+ICAgICAgICAgcmV0ID0gY2xrX3ByZXBh
cmVfZW5hYmxlKGhvc3QtPmNsayk7Cj4gICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gcmV0Owo+Cj4gSWYgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIHJldHVybnMg
YW4gZXJyb3IgbGlrZSAtRVBST0JFX0RFRkVSLCByZXR1cm5pbmcKPiBkaXJlY3RseSBoZXJlIGJ5
cGFzc2VzIHRoZSBjbGVhbnVwIGxhYmVscyBhdCB0aGUgZW5kIG9mIHRoZSBmdW5jdGlvbiB0aGF0
Cj4gY2FsbCBjbGtfZGlzYWJsZV91bnByZXBhcmUoaG9zdC0+Y2xrKS4gVGhpcyBjYW4gZW5kbGVz
c2x5IGluY3JlYXNlIHRoZQo+IGNsb2NrIHJlZmVyZW5jZSBjb3VudCBvbiBwcm9iZSByZXRyaWVz
LCBwZXJtYW5lbnRseSBwcmV2ZW50aW5nIHRoZSBjbG9jayBmcm9tCj4gYmVpbmcgZGlzYWJsZWQg
Zm9yIHBvd2VyIG1hbmFnZW1lbnQuCj4KPiBTaG91bGQgdGhpcyB1c2UgYSBnb3RvIGxhYmVsIChs
aWtlIHBhcnNlX2ZhaWwgb3IgZG1hX3Byb2JlX2RlZmVyKSBpbnN0ZWFkPwo+Cj4gPiArICAgICBp
ZiAocmV0ID4gMCkKPiA+ICsgICAgICAgICAgICAgaG9zdC0+c2Rpb19pcnEgPSByZXQ7Cj4gPgo+
ID4gICAgICAgaWYgKGhvc3QtPnVzZV9kbWEpIHsKPiA+ICAgICAgICAgICAgICAgcmV0ID0gZGF2
aW5jaV9hY3F1aXJlX2RtYV9jaGFubmVscyhob3N0KTsKPgoKCllvdSBhcmUgcmlnaHQuIEkgb3Zl
cmxvb2tlZCB0aGUgZnVsbCBjb250ZXh0IG9mIHRoZSBmdW5jdGlvbi4KSeKAmWxsIGFkZCB0aGUg
Z290byBwYXJzZV9mYWlsIGNsZWFudXAgcGF0aCBhbmQgYWRqdXN0IHRoZSBoYW5kbGluZyBhY2Nv
cmRpbmdseS4KVGhlcmUgaXMgYWxyZWFkeSBhIGNoZWNrIGZvciBob3N0LT5zZGlvX2lycSBiZWZv
cmUgZGV2bV9yZXF1ZXN0X2lycSgpCmF0IHRoZSBlbmQgb2YgdGhlIGZ1bmN0aW9uOgoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmlmIChob3N0LT5zZGlvX2lycSA+PSAwKSB7CiAg
ICAgICAgcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBob3N0LT5zZGlvX2lycSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtbWNfZGF2aW5j
aV9zZGlvX2lycSwgMCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtbWNfaG9zdG5hbWUobW1jKSwgaG9zdCk7Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQoKU28gSeKAmWxsIGhhbmRsZSB0aGUgb3B0aW9uYWwgSVJRIGxvb2t1cCBhcyBmb2xs
b3dzOgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KaG9zdC0+c2Rpb19pcnEgPSBw
bGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKHBkZXYsIDEpOwppZiAoaG9zdC0+c2Rpb19pcnEgPCAw
ICYmIGhvc3QtPnNkaW9faXJxICE9IC1FTlhJTykgewogICAgICAgIHJldCA9IGhvc3QtPnNkaW9f
aXJxOwogICAgICAgIGdvdG8gcGFyc2VfZmFpbDsKfQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQoKVGhpcyBwcmVzZXJ2ZXMgdGhlIGV4aXN0aW5nIGhhbmRsaW5nIG9mIC1FTlhJTyB3
aGlsZSBtYWtpbmcgc3VyZQpvdGhlciBlcnJvcnMgYXJlIHByb3BhZ2F0ZWQgdGhyb3VnaCB0aGUg
cHJvcGVyIGNsZWFudXAgcGF0aC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
