Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C8CC369B9
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Apr 2025 08:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6i7D8VHDrQbpHlwxRybEKIOq74D5ISxCSxWsDUuSCs=; b=UVixVJmkQdIVQs
	03eAmNmlyhqn+Y2f5tsPRi1RmZ+JztKZiWmvWKW6C6gypwi71nFhAonWYDmDbJt2CjEnEc3LDe3pD
	s9+ujv8GhPg4jMFYM2ewWT6CHOPyD3gxQKJUSa9UG6Qq9qaY9M42jJKTKFrcVDvj4v+uanGplt0KX
	UDmhKClUebcD+VQmRqTEE3QTnErus+wqnULeXc8geCyhP46p8JnFrHQ+TqcfS1QykYCqIFSXsC99x
	2PLlMGO7oa2gMDdhTCPkGkvGl8yILUup9L95KvsmUp5tNaWpLsZUZJE6IcbrAvC5nrVkmEolrOsHy
	BRzBgyWq7Sk+QDj2qOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bEO-00000004uh3-03NA;
	Tue, 15 Apr 2025 08:01:20 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b1i-00000004rZ3-2iAI
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Apr 2025 07:48:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54963160818so6418896e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Apr 2025 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703293; x=1745308093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDqE3ZdpGrwEFvKaxNwZCihWc5F/am4cZdY0BZmxrg8=;
        b=pQkh0gIb2XH76CYFJERnukuaTo+StfUM4Qdy+B4Fisptzpuj3hPZlwIy/WgpSKWod+
         xq6lLftyaWMh7MR9jEwFi0lAz8UxGIOErGEjONyvhCMENjbS/KZrb+UkSvRDipqKeAwC
         3eRojxDK4O/UCkSxFaDAgg13L8A9RsV0dtYFXyGXGMowu9u6b/eE41v7Cwtz81W0AiiZ
         Lel4rQxwQNbtd9r2IDPaHymFSB5uMY46sK5415Nh924M9InkRTuN2tKq0RMsoLyP0yVj
         d97bwuB1BEH34jHFtFV6P1oe6LGju8/OzRXYkvOe5owcwNZH3Vi7MFcHtl4WB6meUZuM
         9ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703293; x=1745308093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDqE3ZdpGrwEFvKaxNwZCihWc5F/am4cZdY0BZmxrg8=;
        b=WeDI8ffqgMLCA0dtDrH9dR/KJFpvEG5IzmBq2u/5sf3zy6D5PaPjoO8biG7vyMkeeU
         wCFjGPwNwXnhKXh8PAN5lE6P03bWs4yIKxFDf3+IN0Myy6GfpG58K/fAP90hbGk6zZAf
         XAaGCVsEbzVkXlzqQNobORxfGE7Crbh1qmlHpM09rfV1rjWZ0bwjP16EzJqX/MrZTu1i
         4p5KbK9zDrTzkWD9NiQ6WX+53dTg3xn+UKbtLCjaQ4AW2qhsnFi4PWm1740wwLyEJdmW
         o60Oz2aoL0gdq17aTKaPw9K8eSPs3Y76EGmocTodSPFUcJw3SmQOvyxNvlG9ILvJyAON
         wW5w==
X-Gm-Message-State: AOJu0YxSwuK8Yk1RWZca59oYoU2N5wnnE3YwblAf2Hh7vLmUnJSXVftt
	5SGTCWii4LV4x9XaofWc7z0D0bs/U6VwQPI/qovBLbXIbA1h7a6hNaWwZBiuswOhR5ffGikhR16
	V18Akyl92Wdhlw9u2+wfNw/X+RVyXe/x7ZVUXPg==
X-Gm-Gg: ASbGncuA2p4rBTarc73YIPh4Rz08/dGyMOfA+C5m5RQ2PCTCKyvZI38n/wZqnlfZklF
	W7v0NgJoY4is6dvuE7JYBC6T544IXaUBg4gwYL/Bbz6K1L6zD3TNaF9ctJAuiNMPE4LXKpAK+K7
	fcXR3JyfHEUkuIGfsdhL69gQ==
X-Google-Smtp-Source: AGHT+IFby36R+QGppxoSzbZCjMCamLL2J2djIjQfwLtsJH1weaTQ78Om7gEcgpbdZzAsB23OqHqRE0OJYLAWIGrBLG4=
X-Received: by 2002:a05:6512:398d:b0:549:48c6:2a9a with SMTP id
 2adb3069b0e04-54d452ca0f3mr4196820e87.40.1744703292632; Tue, 15 Apr 2025
 00:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:48:00 +0200
X-Gm-Features: ATxdqUEhHhTQTxPlC1zh833yjXc_zv64fmsQYIEONqwjdaMf0Kb9zmn31Y6MG6w
Message-ID: <CACRpkdbSouYkMHvuVoAeFUiqTVvZwN1thzuewqWYUYMuRGYuBA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: define the pull up/down resistor value as
 60 kOhm
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_004814_684208_A728685A 
X-CRM114-Status: GOOD (  10.19  )
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

T24gU2F0LCBNYXIgMjksIDIwMjUgYXQgODowMeKAr1BNIE1hcnRpbiBCbHVtZW5zdGluZ2wKPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgcHVibGljIGRh
dGFzaGVldHMgb2YgdGhlIGZvbGxvd2luZyBBbWxvZ2ljIFNvQ3MgZGVzY3JpYmUgYSB0eXBpY2Fs
Cj4gcmVzaXN0b3IgdmFsdWUgZm9yIHRoZSBidWlsdC1pbiBwdWxsIHVwL2Rvd24gcmVzaXN0b3I6
Cj4gLSBNZXNvbjgvOGIvOG0yOiBub3QgZG9jdW1lbnRlZAo+IC0gR1hCQiAoUzkwNSk6IDYwIGtP
aG0KPiAtIEdYTCAoUzkwNVgpOiA2MCBrT2htCj4gLSBHWE0gKFM5MTIpOiA2MCBrT2htCj4gLSBH
MTJCIChTOTIyWCk6IDYwIGtPaG0KPiAtIFNNMSAoUzkwNUQzKTogNjAga09obQo+Cj4gVGhlIHB1
YmxpYyBHMTJCIGFuZCBTTTEgZGF0YXNoZWV0cyBhZGRpdGlvbmFsbHkgc3RhdGUgbWluIGFuZCBt
YXgKPiB2YWx1ZXM6Cj4gLSBtaW4gdmFsdWU6IDUwIGtPaG0gZm9yIGJvdGgsIHB1bGwtdXAgYW5k
IHB1bGwtZG93bgo+IC0gbWF4IHZhbHVlIGZvciB0aGUgcHVsbC11cDogNzAga09obQo+IC0gbWF4
IHZhbHVlIGZvciB0aGUgcHVsbC1kb3duOiAxMzAga09obQo+Cj4gVXNlIDYwIGtPaG0gaW4gdGhl
IHBpbmN0cmwtbWVzb24gZHJpdmVyIGFzIHdlbGwgc28gaXQncyBzaG93biBpbiB0aGUKPiBkZWJ1
Z2ZzIG91dHB1dC4gSXQgbWF5IG5vdCBiZSBhY2N1cmF0ZSBmb3IgTWVzb244LzhiLzhtMiBidXQg
aW4gcmVhbGl0eQo+IDYwIGtPaG0gaXMgY2xvc2VyIHRvIHRoZSBhY3R1YWwgdmFsdWUgdGhhbiAx
IE9obS4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpQYXRjaCBhcHBsaWVkIGZvciBmaXhlcyEKCllvdXJz
LApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
