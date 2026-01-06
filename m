Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A54C47BE3
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 10:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqlXlEAZ2twWbjHpI5pGEcNoLWf5+t69O0zJ2QSIFuM=; b=qNLqg9UqQG4njH
	cwLOkolJEoQQ2/wBCaGD1h62GKV+NA5WL1H4IoVTJDDaOV1amR7Vis3FimfuCynyrQ2ZnNqY8uDN1
	8vrXCsC9rt2vFTX+6XCN3YPUv2/14XT/DzMBKVyIjzguXrgZPPAYAnXoTSZ2OBG2g4SMbzoVyPm8G
	JZT/g5i6Utr+3um9X6M6jia2lOZRcQSC//eUmUZVvrdDgT3do3+H9U9MaH7QmuWPCi8yo1AplCPOB
	xrd5KeIUoJSfCfOzabkOLgRMZc0QyZ6E+/imr+2kO47TyjJkh3nuGkkIOGCNFG2ghGe5QI1k761g+
	5EI+8H9xNm4XC6rN7Fow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Ua-0000000CoaR-0Gb0;
	Tue, 06 Jan 2026 10:40:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4UY-0000000CoZq-0JeB
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 10:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EFEB60150
	for <linux-amlogic@lists.infradead.org>; Tue,  6 Jan 2026 10:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A29C2BC86
	for <linux-amlogic@lists.infradead.org>; Tue,  6 Jan 2026 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767696044;
	bh=t4ddXhA7JhrJytwJ6SG59Nok1jm7v4ErHkDUWq3UJj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mSieI+pFor5cLkViqqo0XupaQknJKW4qXwhxNKsnkhZBXp0cZu8oWKcIyXbTMMSMk
	 gwGxE0lWhvaYyl3XQ2fhPHVXLbTvOER30qdGQHHdh+iMU6JsL+GxtwgzfovULoc99F
	 mXbWKynoFgcnB6G2pamlI14uuRo2at3NV73Lay6ERyiIqCocu687OMS37AGr0X1kLg
	 Rd7aDSUBKEM6yFr0ceS/+75FpdrSVc6SLSGo84a3Ni38ciQVYaUWclKrEPBkvMx/MY
	 lNrATBByqJQhebSfhOKinJ2eZz02PGnlKXrmJJAPvRdst4qc+lptjsHXsSh99WRVNb
	 /8V3vfzwc31oA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b67388c9cso515991e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 02:40:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRjDBAIUd+HtwdvPmGDWJ71701ZwVS0yNRkMMFMpeNzqLCLADTKwxHEnkYfA81s6yTDgH/zo6XaYdC1rS3@lists.infradead.org
X-Gm-Message-State: AOJu0YwIXmR2APBmj+N3kKBFQyInp5fB3T6dqgwRgDhFTlXJ5wWBSAb4
	GtAqS5L7ArjQMo24OqufaSbuUdk+bmPJASOhhYHT7j6DjbqV4n6L5c5ScZ+OnDy9Vgvud12+Kff
	V0BVs4wDxn8olBGYXjHn9ZJ1SH6B5NymJD19HAf2Brg==
X-Google-Smtp-Source: AGHT+IGjEVOXW8CYG+0OH4S7sVxLtDmjVtqmU3wU1q5QsPBg5CO1iHEaU9Sc0XqZ9TEkG2QTbcPfX+ONV8l5hR9iWrc=
X-Received: by 2002:a05:6512:3d18:b0:594:27dd:2700 with SMTP id
 2adb3069b0e04-59b652e62e7mr943934e87.47.1767696043393; Tue, 06 Jan 2026
 02:40:43 -0800 (PST)
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
 <10d5df9b-842c-45d3-8821-d4ca0c364e97@linaro.org> <7dc8a830-5863-412c-bcf3-498f47b35615@amlogic.com>
In-Reply-To: <7dc8a830-5863-412c-bcf3-498f47b35615@amlogic.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 11:40:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me+mgRZ4thXnYFUv42hQBV36hM5DUckM8U_VQa8chNehw@mail.gmail.com>
X-Gm-Features: AQt7F2r1rD5CkKYlWA8KJJCMMCqY-jVpyYiin_uV38wrHGuoHuGV7M0VqD8OJdI
Message-ID: <CAMRc=Me+mgRZ4thXnYFUv42hQBV36hM5DUckM8U_VQa8chNehw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCAxMDozMuKAr0FNIFhpYW53ZWkgWmhhbyA8eGlhbndlaS56
aGFvQGFtbG9naWMuY29tPiB3cm90ZToKPgo+IEhpIEJhcnRvc3osCj4gICAgIENvdWxkIHlvdSBl
eHBsYWluIHRoZSByZXByb2R1Y3Rpb24gbWV0aG9kIGZvciB0aGlzIHByb2JsZW0gPwo+CgpQbGVh
c2UgZG9uJ3QgdG9wLXBvc3Qgb24gdGhlIG1haWxpbmcgbGlzdC4KCklmIHlvdSBoYXZlIGEgcGlu
IHNoYXJlZCBieSBtdWx0aXBsZSBkZXZpY2VzIGluIGRldmljZS10cmVlLCBpdCB3aWxsCm5vdyBn
byB0aHJvdWdoIGEgZGVkaWNhdGVkIGdwaW8tc2hhcmVkLXByb3h5IGRyaXZlci4gSXQgd2lsbCB1
c2UgYQpsb2NraW5nIG1lY2hhbmlzbSBkZXBlbmRpbmcgb24gdGhlIGNhbl9zbGVlcCBmbGFnIG9m
IHRoZSBHUElPCmNvbnRyb2xsZXIgZGV2aWNlIC0gc3BpbmxvY2sgb3IgbXV0ZXguIElmIHRoZSBm
bGFnIGlzIHdyb25nIC0gbGlrZSBpcwp0aGUgY2FzZSBoZXJlIC0gaXQgbWF5IGhhcHBlbiB0aGF0
IHdlIHRha2UgYSBzcGlubG9jayBhbmQgdGhlbiBkZXNjZW5kCmludG8gcGluY3RybCB3aGVyZSBh
IG11dGV4IGlzIHRha2VuIHJlc3VsdGluZyBpbiBhIGxvY2tkZXAgc3BsYXQuCgpCYXJ0CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
