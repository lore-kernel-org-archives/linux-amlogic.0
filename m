Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869A3CAC5B0
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Oct 2025 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXyk89xmwpxNDdvA8G3+CUCAAh1lAn1L5Y61osUMLuI=; b=2xAAak8iLtwqI6
	jaJabIt29VMopgYacB7nBVHfrCMERhDijSUb5so8kK/LTugOD/Bx7LOZ7+xeRp1dO2mgKB1vHJJbQ
	MwMegqhkwDDMOiYkJODm95BEAvsL9SpUh4dyvIoqJ5kgBogGRW7PfgUSPwBMjxogGq2m44DrE84tk
	VYW0YqEtf2UcgaGuDS4B8Unq7hQletSAnQqW0nsHkBlcOHeFximMoLhxif4T1bGDz14PWwqAHwezb
	s+Zfb6LA9l775UjYWZy0omKHQ36qAehseTxnU3dGnDzPvnX0X4FvEiY/rTpRGk8LHWY43Uiw/OF71
	Ay03nZKrVVQ51nr4uYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58JF-0000000DySI-2MYY;
	Sat, 04 Oct 2025 19:52:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58JD-0000000DyRv-0b5m
	for linux-amlogic@lists.infradead.org;
	Sat, 04 Oct 2025 19:52:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2697899a202so31000565ad.0
        for <linux-amlogic@lists.infradead.org>; Sat, 04 Oct 2025 12:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759607566; x=1760212366; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAybQmudTYzSK/tcY3PtMZl0JJzvR+yKSsKri3KtNgc=;
        b=IZBbo7JhE/T9mc7wZxXeO2UTElPOgZxZw2oigdSsdtjznCKeMG7AJFTT0BI5IrGzNk
         N6taWycfbtGE0JRE17iSr9giNkvnT/fnHAf24uZ+OfJU92hMSz2dIRnOoXV3/woayGmZ
         CBveu1VkitKSaJGeEJk0v2fgkf/+DlK3VN7GDNjcMY2S/uzwqY76uobQwZI4/kMXvLia
         paU4KrtfPV5uOmPLajAfSBVtg5IVHXbhd/VJ5jW/11ZYLiT0Dh0gYbhpU3PvQrw8pVSs
         aaWmMzWw1XHDkqfFblKIwVrri3HM2JiXEutWJr0gsqeAYqr9w1h+faMP3ZPIE847nLCw
         DMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759607566; x=1760212366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAybQmudTYzSK/tcY3PtMZl0JJzvR+yKSsKri3KtNgc=;
        b=ShsUdDPF8AOxpUwb5rziu6RM4HwhAihi7d618wuf+BeFe43E8r7fj+B/fAIb0hA1Wh
         GCj0hW+MQg+AFTkDcoxoWMP4DG16ZOT13BWGC9TeKNhVBYwlvvvX3BcQuJeXyLZKEDJ6
         BYIBV9rodGWMHUeRGuUr1QyLDrpq6LIgr4AolNeve0+p+Tlm9DHkBc+IdicHf58ifNtQ
         F0VtqxfZVnhBydMpCTCbl+AlhvwJwnzwvhyYvmcNljv2oP+49I2AXmEyHJa7iCbZKj1I
         h2l00hS3mcl/dfBmTRAjjK2buuKdCV4LU41RYmv0/zx3gMXvehuTGg1bdn9J/gVEn/tx
         L/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO20BCIN+0hy7DGyRhuYv918OJCwRfgp5pMg6tVPPFZZoMP72ifBOdFh+zJ5J4o1GAudUaKPVf8eotqhms@lists.infradead.org
X-Gm-Message-State: AOJu0YxU1LW0W2xL4PFSr4uXUf2cTzLgEXyzF5NtFDba9cS3tU+LT8yh
	GMmI+rep0E6HL7gG1ax6vWbzB7N6deWK1+9JAaLMGxiv6HOxnqh9SH/iAwERs0HKt5yIKX4qYlc
	EVbAmHOC1mohMhjvLTZGO7kbz4ss30vU=
X-Gm-Gg: ASbGnctd2QJCOrgkPhbn3SEBDcFsrMG7OzobTh0Nxbsp5yxmP6EOCwpuzYKLB3dNGzJ
	6DqEeQhNr0DCvhGDzfDWNYlXeqFSYNMJa9a2awLRvZg8DqIJ9NbMq/Yk5ANK7ADNzFPrysDEaTX
	gB0UjbqrRD+1izJowzXeqZhigb7cptQJHnb9kppUoD607fDCye39BEcYO+jJTyANTk2TxtBK0GT
	xMwuQP+QrhE4L3dr28V4W+FCnqZRZgGsSKZwYYN/HBAvsFAzfbY7Z96zIopZIvjVZGbPvBMGXc=
X-Google-Smtp-Source: AGHT+IHIGZbYkJ1SDHVdfJpS7K+FvOcrEyzv91AIf3qtubIlP9Lr0Nmn46Z8cwprgw4hxPvpGz40imPwq6+ElwKPvrU=
X-Received: by 2002:a17:903:acd:b0:27e:d66e:8729 with SMTP id
 d9443c01a7336-28e99a86748mr101512415ad.0.1759607565713; Sat, 04 Oct 2025
 12:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250926142454.5929-1-johan@kernel.org> <20250926142454.5929-2-johan@kernel.org>
In-Reply-To: <20250926142454.5929-2-johan@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Oct 2025 21:52:34 +0200
X-Gm-Features: AS18NWDU8ocZk0ezDCUadLBXAKIcA1Zy54NbZyjlAwDgH18dZXT8OTopz2n03m0
Message-ID: <CAFBinCBT+8aFH68gKja7PS6BtPUBcEfW4KRv8GFyADiK_QB7dw@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: amlogic: canvas: fix device leak on lookup
To: Johan Hovold <johan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Yu Kuai <yukuai3@huawei.com>, Markus.Elfring@web.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_125247_203431_6BF15457 
X-CRM114-Status: GOOD (  13.09  )
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

T24gRnJpLCBTZXAgMjYsIDIwMjUgYXQgNDoyNeKAr1BNIEpvaGFuIEhvdm9sZCA8am9oYW5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBNYWtlIHN1cmUgdG8gZHJvcCB0aGUgcmVmZXJlbmNlIHRha2Vu
IHRvIHRoZSBjYW52YXMgcGxhdGZvcm0gZGV2aWNlIHdoZW4KPiBsb29raW5nIHVwIGl0cyBkcml2
ZXIgZGF0YS4KPgo+IE5vdGUgdGhhdCBob2xkaW5nIGEgcmVmZXJlbmNlIHRvIGEgZGV2aWNlIGRv
ZXMgbm90IHByZXZlbnQgaXRzIGRyaXZlcgo+IGRhdGEgZnJvbSBnb2luZyBhd2F5IHNvIHRoZXJl
IGlzIG5vIHBvaW50IGluIGtlZXBpbmcgdGhlIHJlZmVyZW5jZS4KPgo+IEFsc28gbm90ZSB0aGF0
IGNvbW1pdCAyOGY4NTFlNmFmYTggKCJzb2M6IGFtbG9naWM6IGNhbnZhczogYWRkIG1pc3NpbmcK
PiBwdXRfZGV2aWNlKCkgY2FsbCBpbiBtZXNvbl9jYW52YXNfZ2V0KCkiKSBmaXhlZCB0aGUgbGVh
ayBpbiBhIGxvb2t1cAo+IGVycm9yIHBhdGgsIGJ1dCB0aGUgcmVmZXJlbmNlIGlzIHN0aWxsIGxl
YWtpbmcgb24gc3VjY2Vzcy4KPgo+IEZpeGVzOiBkNDk4Mzk4M2Q5ODcgKCJzb2M6IGFtbG9naWM6
IGFkZCBtZXNvbi1jYW52YXMgZHJpdmVyIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAg
ICAgICMgNC4yMDogMjhmODUxZTZhZmE4Cj4gQ2M6IFl1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+ClJldmll
d2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1h
aWwuY29tPgoKSSBoYXZlbid0IHVzZWQgdGhlIHNjb3BlLWJhc2VkIHJlc291cmNlIG1hbmFnZW1l
bnQgbXlzZWxmIGFzIHBvaW50ZWQKb3V0IGJ5IE1hcmt1cy4KVGhhdCBzYWlkLCBhcyBmYXIgYXMg
SSB1bmRlcnN0YW5kIGl0J3MgYSBmZWF0dXJlIGluIG5ld2VyIGtlcm5lbHMgYW5kCnRoaXMgcGF0
Y2ggbWF5IGJlIGJhY2twb3J0ZWQgdW50aWwgNS40IChvbGRlc3QgLXN0YWJsZSBrZXJuZWwgc3Rp
bGwKc3VwcG9ydGVkKS4KU28gbGV0J3MgZ28gd2l0aCB0aGlzIHNpbXBsZSBhcHByb2FjaCBmcm9t
IEpvaGFuIC0gd2UgY2FuIHN0aWxsCmltcHJvdmUgdGhpcyAod2l0aG91dCBoYXZpbmcgdG8gd29y
cnkgYWJvdXQgYmFja3BvcnRzKS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
