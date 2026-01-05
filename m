Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2EEC79FA5
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70zwI2U632f+O9l07DqtBzVvaE0zWlzELN/u14gXQ7Y=; b=ZunhfmX4GOdjPT
	fmtFN+rSfCYCGSwaFmrnBzR/YCBrh3iyFev/SoXPBAUiztRzcAvgyUZ8vnCYyduPNCkCzuN2k6cbR
	LQDw+x4jOt0LXfietweLdDBVsAI22n/UN8946lgqxbCVfASerHDO2JovgKzXomboocJJL2cm4Xsw/
	ADs81pW6wgXZyLxwjZJ5Rt2CGK6XUJut8/24tUXEeXta+RmD4LF2gvJS19KdDyHP6k7B6jP3FYCt6
	tzQw2lwah6uEg3m9Uv8E2w6Tc8bTQVjpYeps2AdIRh9jbl0IFvQezbhHYoUdklal/GFgHvHj5MvF5
	FN21IbTkbgoadU8orvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnld-0000000BlKb-1ucF;
	Mon, 05 Jan 2026 16:49:17 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnlZ-0000000BlJT-03Wz
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 16:49:16 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0bae9aca3so830625ad.3
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 08:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767631752; x=1768236552; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1p5G3xJb8go3voJ/ska7MmknNqjaKO20ee89C7s96SI=;
        b=P+6sBBGM2bUKyVWfIaFmkegs9rnqx5G9Mo0vlPhBNEB+yHrkYP8DKI3wZz7pFCaheI
         F6Q4vmmGda8UV6orVix+yHsnpDNAd/fN7IFOGNE12NrS2Ubg+Ssn4uqovHG6wIciGjS1
         +V+vhS6XiVLulgjCeLFLYHKogaO3QHgmpeUVfD4F2fZBRUMvH5wKMxidaQ43oe+QUpic
         LKoyMc4Tl0e7ZcaI+nzAalGBjl+DmTWRbivlWIkC/8HA2Z43/SWhKXxE+58OPtXUMwho
         Xk0oMwSSUByrIEkaMaPAAXbKIoRe7n635i2mcPqe/V6PchTQY1E1MKnAjzMB4YXaJBM8
         JEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767631752; x=1768236552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1p5G3xJb8go3voJ/ska7MmknNqjaKO20ee89C7s96SI=;
        b=PdfLDNkrZT6WIPTQIRhcfWFxp1wN5JJWHy58gDrtBmBOnKvtP6pIOfbmC8mDsBsGVJ
         AvxgJm9rRCYqzZIA+LRNGU/AOjEn3HT8ZXwEJ74CbGufrPPwDZA+JF34kbHeURKstk4v
         Ik5KMVnTS39xnex/NfH/CNisyWTHs/uvWEGBjLb148lFJzxHMlYzu1nWA+hOO1qzz+sh
         D19zjSkb+xYkdX4+oSS9KkX+TLXt0JB8GbpLgbPFomv38pwdTCmX3Jo8gRFfTfHZrD9n
         UyUE5qPo8fcXJPd5F9mOFgoC1C6ndnI7Z9TpXVWrPN2acfHZup4crAMFP+q2gsP5LEvn
         1ZNw==
X-Forwarded-Encrypted: i=1; AJvYcCUIpPTZ0GjdgF9ZQZq1iBl+YsHXgd0sjZYITUW8WwrBckU5u4wPM6JtuSdSPHASV5xaAGSCxS1OtHQDWR9e@lists.infradead.org
X-Gm-Message-State: AOJu0YxZxz7LkkFV443Vl/JLaSkr/Z58fiyeNHFI9vyShR/rlqd1dlUF
	anryxHX6wYA7sSfz97+eeNO8AoEhOUCjRyeRrnOGbtryDCXDOIRaxaZiRfp4J4cE7WVhxNc88sh
	+b9BTwnW4nq781n2KS+sZawQCwK2thWE=
X-Gm-Gg: AY/fxX6UlfqPVqOvkDqARGcw8tVcfwq1xFx9fcBRXvh80o3Sn2hzkXhkEucuSRy754R
	YI1grEUBYCnsod0ggubt/N/5CFtMji0FxVV/zH1KraeDylu2iUmLdn8qPhBVM53VVuLohZ21Dp+
	6ygYfB2OsAEQ1+XWDlMUGDQ/3MoGeijN2pnEfXkKsZbE9eHQqEJ8pQfzCr8NCcFZIQ+pqy7aHRY
	w0waEIn1Txi9Smsbkcr6OQVI2XKhG7OdvYbqkg93cCvqfj1iDqICIrCa/+0SI12x+25+k/PAQlX
	QxYcEBFZ73nrUMdeyihma6+QeP/P
X-Google-Smtp-Source: AGHT+IGDtOegmT/WubwoP9uhYGjEyI36HrbbD+HDLKKzlp50hnIAwbFpuvZJAMWfwWQ5Fu7mo4QOpgsR9wCZJW3kUe4=
X-Received: by 2002:a17:903:28f:b0:29f:5f5:fa91 with SMTP id
 d9443c01a7336-2a3e2cb39ffmr2973425ad.27.1767631752099; Mon, 05 Jan 2026
 08:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20251103221930.1831376-1-helgaas@kernel.org> <176603796183.17581.9416209133990924154.b4-ty@kernel.org>
In-Reply-To: <176603796183.17581.9416209133990924154.b4-ty@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 5 Jan 2026 17:49:00 +0100
X-Gm-Features: AQt7F2rVWmf5Npt8HCJJTiZdHZlTavXt7hjPiasOfQo5l2lbIUvVpU46LHb_LE8
Message-ID: <CAFBinCAPpiq=M00ZQXAB4Pu2Myjo8gpXC7DByKkGN6Z_Ahqafg@mail.gmail.com>
Subject: Re: [PATCH] PCI: meson: Remove meson_pcie_link_up() timeout, message,
 speed check
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Bjorn Helgaas <helgaas@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linnaea Lavia <linnaea-von-lavia@live.com>, 
	FUKAUMI Naoki <naoki@radxa.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, stable@vger.kernel.org, 
	Ricardo Pardini <ricardo@pardini.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_084914_562033_02587C7F 
X-CRM114-Status: GOOD (  12.44  )
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

SGkgTWFuaSwKCk9uIFRodSwgRGVjIDE4LCAyMDI1IGF0IDc6MDbigK9BTSBNYW5pdmFubmFuIFNh
ZGhhc2l2YW0KPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToK
Pgo+Cj4gT24gTW9uLCAwMyBOb3YgMjAyNSAxNjoxOToyNiAtMDYwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiA+IFByZXZpb3VzbHkgbWVzb25fcGNpZV9saW5rX3VwKCkgb25seSByZXR1cm5lZCB0
cnVlIGlmIHRoZSBsaW5rIHdhcyBpbiB0aGUKPiA+IEwwIHN0YXRlLiAgVGhpcyB3YXMgaW5jb3Jy
ZWN0IGJlY2F1c2UgaGFyZHdhcmUgYXV0b25vbW91c2x5IG1hbmFnZXMKPiA+IHRyYW5zaXRpb25z
IGJldHdlZW4gTDAsIEwwcywgYW5kIEwxIHdoaWxlIGJvdGggY29tcG9uZW50cyBvbiB0aGUgbGlu
ayBzdGF5Cj4gPiBpbiBEMC4gIFRob3NlIHN0YXRlcyBzaG91bGQgYWxsIGJlIHRyZWF0ZWQgYXMg
ImxpbmsgaXMgYWN0aXZlIi4KPiA+Cj4gPiBSZXR1cm5pbmcgZmFsc2Ugd2hlbiB0aGUgZGV2aWNl
IHdhcyBpbiBMMHMgb3IgTDEgYnJva2UgY29uZmlnIGFjY2Vzc2VzCj4gPiBiZWNhdXNlIGR3X3Bj
aWVfb3RoZXJfY29uZl9tYXBfYnVzKCkgZmFpbHMgaWYgdGhlIGxpbmsgaXMgZG93biwgd2hpY2gK
PiA+IGNhdXNlZCBlcnJvcnMgbGlrZSB0aGlzOgo+ID4KPiA+IFsuLi5dCj4KPiBBcHBsaWVkLCB0
aGFua3MhCj4KPiBbMS8xXSBQQ0k6IG1lc29uOiBSZW1vdmUgbWVzb25fcGNpZV9saW5rX3VwKCkg
dGltZW91dCwgbWVzc2FnZSwgc3BlZWQgY2hlY2sKPiAgICAgICBjb21taXQ6IDExNjQ3ZmM3NzJl
OTc3Yzk4MTI1OWE2M2M0YTJiN2UyYzMxMmVhMjIKTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRo
aXMgaXMgcXVldWVkIGZvciAtbmV4dC4KUmljYXJkbyAoQ2MnZWQpIHJlcG9ydGVkIHRoYXQgdGhp
cyBwYXRjaCBmaXhlcyBQQ0kgbGluayB1cCBvbiBoaXMgT2Ryb2lkLUhDNC4KSXMgdGhlcmUgYSBj
aGFuY2UgdG8gZ2V0IHRoaXMgcGF0Y2ggaW50byAtZml4ZXMsIHNvIGl0IGNhbiBiZSBwdWxsZWQK
YnkgTGludXMgZm9yIG9uZSBvZiB0aGUgbmV4dCAtcmM/CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
