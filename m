Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7410DCDC17D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vH9uSq0ujXcOG1+gzGq0iClFJkpO94ffsURfmFKX0q4=; b=sZOnd8S7PIGkJR
	ZsLLmrEH19w++3bGKifRal0o10I6dehfcrCsa9zRbwg9p+hqK/4Yj9RpphRER1HR7SBObA3dDgiBU
	/baSIhHcfelOd0DVppa3OmEnpGm5QYoxSAIMK8a11u3ELfdHoXm8uNi0Ga2c2QkL+ISHe2n4cOWdy
	37tNFWZJv+wgVoxuBS4x94sTMxi5cNsSI2jXkGTGwc3S2RpBbCZvLJSUIhzXyAdQpBudknnyyMFho
	tmb6ffpoP2QcrYUhCaGfqGsI3dggfojJicPIgq/p8wcgRe0NbLTCoAAdJQ/DZw7HapNkGkg5OiP7j
	BzPmMah/zRLBCqefEpdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5tj-0000000Cy2y-1233;
	Tue, 06 Jan 2026 12:10:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5tf-0000000Cy1y-1Etz
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 12:10:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a0a95200e8so7506405ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 04:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767701446; x=1768306246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu4UdpjKL0W6oqeLyvjU5YjPqjVIJexotO7ZxwODpnY=;
        b=e8/VB7fhdcVacbhW1cWyyrRdmr0NHZH5gBfJTdSMyS41Way7GP7s7bqSnZ2Efzf9RU
         wfXFhHEkAVAZKkq6c08IIuKwbV2K7zzv9BrFjyGTBsAuuCSe5aRZzdcavIpfxHtYeivr
         YQr1PMpf8WWOyyWJ2zwu7OY7HU7TPgpy6D2mxZBFiwpa2K6dz3OBGbWsJzmqYVRLDCLT
         6GYglPvmZcm4U/77tLr6zFOV4KKKqQrhaBLGqlEA7joNwTd/RyGCGtrRhmnjdxjfm8Ji
         +VcE2ymZ4JP02r/9up0Y8IxTjU0KTrrxkz3sekdtWSg5VZoG425KkaO9FcEe/3hqpFbU
         MT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767701446; x=1768306246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu4UdpjKL0W6oqeLyvjU5YjPqjVIJexotO7ZxwODpnY=;
        b=mIp1Pt7F0kj4pz6WhfjYbq1OPKxHSbfYgSm0jUSDvx0fNfseCkZKpWJtWTG0qIkRbF
         hUkp+bmX2ei8eixLgnNEAicXZNHQ9iCWg0rNR1ERocCOGFqtdiEcZHMbjeqOGsoUSdz3
         HgwVB7EraplQ82nFZnDaULWQCiolgSd8IHcVrq41Keln/K9j9GN07lokW2RB391IU5j+
         HoWvOTvZ4TxLAi559ApZEC7R8pCVs7I5tNt6yaBg1h7SWyvg0T0xRnlNz+agBQMZczwM
         0PjMKL5pITp2J40v9oIppNr4YHjNcIRxcCnWGMt9jqwbhjhyiWaccvvEIlFvGgzUCAqF
         Z4Xg==
X-Gm-Message-State: AOJu0YwWA3ejOfRHqyIIKUJ9ALiHf1IHs1V2/s7imyb9Rpusv1XGH2Ae
	qNrosMyJg2BcZHsb4jzsqpoLFsM3sRlCYMg5pjHTNHLUbAJ/Nnqp81pz9KA4KkCM4s/CGEwtakS
	dLlxNnXjx7MBc46dA5a++0qXwkfi0iNxIgQ==
X-Gm-Gg: AY/fxX4u8m40aObTnCbx+8PEAm7BRNzwvmtusQtKlirieWE0bzcinr+8Hv5gfaYORrL
	upCMWKu3w/gplKL7fxOrvUcgouhxIPq5Df4JRqy55ghVy/1OtTMI+gElEE1ChjhD6u23bxOBb4P
	gIDFZ58xczvPm/6aC0a4tcJejVrT6hL/Y9JhfbNndCb1LUfcrK3YqFToKmpxqcuW6LmbY42OF+I
	xKwPVgHI/NzQWTYtUV+JeqRzv2ifzM1HaP8qj6J2N2LX7fPcYuWdJcHowHATp8TdL8aLptMQCS5
	wckvwrwMJICL4pwRmTi9O5dMAvk=
X-Google-Smtp-Source: AGHT+IERFxDvDyxM58p44igbMDmAinSOq4k8E/VpLs0ECbN/nL2j5w231U1e4IjWyRKHGXv8g0yfXLtUOkPrS0reals=
X-Received: by 2002:a17:903:1b0c:b0:2a0:92a6:955 with SMTP id
 d9443c01a7336-2a3e2ca5661mr29241295ad.23.1767701446433; Tue, 06 Jan 2026
 04:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com> <1jfr8jdomn.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jfr8jdomn.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 13:10:35 +0100
X-Gm-Features: AQt7F2rhaIwEaER7uzhe61Gje-3tMQEv-Jz_Lw7J4PipXub8W6EZ-9ebNWcXzOY
Message-ID: <CAFBinCALRXSmYQEXWWfOhXWUEKC8sYC5vg2=G0K+P=UK+TJhgw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jian.hu@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_041048_515568_FBDFEFF1 
X-CRM114-Status: GOOD (  12.58  )
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

SGkgSmVyb21lLAoKT24gVHVlLCBKYW4gNiwgMjAyNiBhdCAxMToyNeKAr0FNIEplcm9tZSBCcnVu
ZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToKWy4uLl0KPiA+IE1hcnRpbiBCbHVtZW5z
dGluZ2wgKDMpOgo+ID4gICBjbGs6IG1lc29uOiBneGJiOiBMaW1pdCB0aGUgSERNSSBQTEwgT0Qg
dG8gLzQgb24gR1hML0dYTSBTb0NzCj4gPiAgIGNsazogbWVzb246IGcxMmE6IExpbWl0IHRoZSBI
RE1JIFBMTCBPRCB0byAvNAo+ID4gICBjbGs6IG1lc29uOiBneGJiOiB1c2UgdGhlIGV4aXN0aW5n
IEhISV9IRE1JX1BMTF9DTlRMMyBtYWNybwo+Cj4gTG9va3MgZ29vZC4KPgo+IEknZCBsaWtlIHRv
IGFkZCBhIGNvbW1lbnQgbGlrZSB0aGlzIGluIHRoZSBjb2RlCj4KPiArLyoKPiArICogR1hMIGhk
bWkgT0QgZGl2aWRlcnMgYXJlIFBPV0VSX09GX1RXTyBkaXZpZGVycyBidXQgbGltaXRlZCB0byAv
NC4KPiArICogQSBkaXZpZGVyIHZhbHVlIG9mIDMgc2hvdWxkIG1hcCB0byAvOCBidXQgaW5zdGVh
ZCBtYXAgLzQgc28gaWdub3JlIGl0Lgo+ICsgKi8KPgo+IChhbmQgYSBzaW1pbGFyIG9uZSBmb3Ig
dGhlIEcxMikuIElzIHRoaXMgT2sgd2l0aCB5b3UgPwpTdXJlLCBJJ20gaGFwcHkgdG8gZWl0aGVy
IGhhdmUgeW91IGFkZCB0aGUgY29tbWVudCB3aGVuIGFwcGx5aW5nIG9yIG1lCmRvaW5nIGl0IGFu
ZCBzZW5kaW5nIGEgdjIgLSB3aGljaGV2ZXIgeW91IHByZWZlci4KCkJlc3QgcmVnYXJkcywKTWFy
dGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
