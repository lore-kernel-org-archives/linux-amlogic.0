Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0338C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Mar 2022 07:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTOVSwLcNJjGB8qq/cqT6GoBNp5ZjcE3sk0/sM8uIpw=; b=m07RR6IwUF4y1Q
	mKf89VffoH7/Op4p95cjCI1OqPGUTz6zx6zIDZHysBi3WMlqiFLRB1R9iaI5PzGI2DF1tdsm9kCPI
	SyYIBpggsfzYwHbiFIgcbaY71/jeENMSjA84iT2ub6+XAfyMgXo4H8UUTJ/hefh2tXVPWzM9pLW/p
	GRtWipTWlA+C7+OFIzzTVNxUzEW9piA4FoHAU9svP4Qu15Xytm5k3nvY+wqkshhGV3S+yhMOGVHbo
	4UiLC7Eu1AjmUEtTB0zXKkTF5t6NfpmxhufLK2F1JfZTy67BDU/ip8dvakFTQJyYQZbEL41IU72wi
	Fa0i9ZXS0zU0OiT9zVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYk0g-007evO-K3; Mon, 28 Mar 2022 07:41:54 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYk0S-007esZ-LP; Mon, 28 Mar 2022 07:41:41 +0000
Received: by mail-oi1-f177.google.com with SMTP id v75so14771077oie.1;
 Mon, 28 Mar 2022 00:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NSmS9k73z1IP3D2QdHYwh4TDW9fTJmU9UMoo6xsufQI=;
 b=AIjNpFdQuRAxMGiXOLx4wAhMGntn6V06usY6G3wXy0ZcImYtuafAubkNd6a/zyTzgZ
 0/s++opN5M9tOK2szaZVMXUwEVW5F/Y9qJ4pmV9xybe1NM093uSDOy/nKgTJxfLwMR1a
 cohKUTGToyAlZB9IEucX8TurG+4ANtU6Bw8ApyS6Udp3JH9Md8LXABolnyZaKNHp01Wg
 89e6ActE+sUI5v7uM8ND75HQGEEC9DQZF8lt92iXk0VkMFgSAujhEzUkjRiV/M3vl4U9
 8x5Ss5VuDmMltIKylreZgHvL6nth2wbQsGJnUZrJQdDsb4LFXIPsGBlbUaVa9aa1+igV
 aXNA==
X-Gm-Message-State: AOAM530qrzt9Lrl5utiwme6Y98G8Uf/7pLL0OzmJJgsTZRZipb/abSwP
 xpmia6TbFMw2tNClqgnbrbHZuRVc55g7Ag==
X-Google-Smtp-Source: ABdhPJyBo6a3AnIoXd/CIIE1mVGoEoduinRGeAtXsmCuVRtMlQaLP7KQgNCGreWIHcBd0VNspZqRRw==
X-Received: by 2002:a05:6808:309c:b0:2da:6291:769b with SMTP id
 bl28-20020a056808309c00b002da6291769bmr11123513oib.85.1648453298439; 
 Mon, 28 Mar 2022 00:41:38 -0700 (PDT)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com.
 [209.85.161.45]) by smtp.gmail.com with ESMTPSA id
 m187-20020aca58c4000000b002ef721352easm6897779oib.14.2022.03.28.00.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 00:41:38 -0700 (PDT)
Received: by mail-oo1-f45.google.com with SMTP id
 p34-20020a4a95e5000000b003248d73d460so2436652ooi.1; 
 Mon, 28 Mar 2022 00:41:38 -0700 (PDT)
X-Received: by 2002:a05:6902:101:b0:633:ccde:cfca with SMTP id
 o1-20020a056902010100b00633ccdecfcamr20853450ybh.207.1648452936744; Mon, 28
 Mar 2022 00:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Mar 2022 09:35:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJo=XWNLKpFFe65fx-c7oPXmydvXxiPzGicNaxYthGbg@mail.gmail.com>
Message-ID: <CAMuHMdXJo=XWNLKpFFe65fx-c7oPXmydvXxiPzGicNaxYthGbg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] gpiolib: Introduce gpiochip_count() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_004140_711171_0C836131 
X-CRM114-Status: GOOD (  20.70  )
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

SGkgQW5keSwKCk9uIEZyaSwgTWFyIDI1LCAyMDIyIGF0IDk6MDQgUE0gQW5keSBTaGV2Y2hlbmtv
CjxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IFRoZSBncGlvY2hp
cF9jb3VudCgpIGhlbHBlciBpdGVyYXRlcyBvdmVyIHRoZSBkZXZpY2UgY2hpbGQgbm9kZXMgdGhh
dCBoYXZlCj4gdGhlICJncGlvLWNvbnRyb2xsZXIiIHByb3BlcnR5IHNldC4gSXQgcmV0dXJucyB0
aGUgbnVtYmVyIG9mIHN1Y2ggbm9kZXMKPiB1bmRlciBnaXZlbiBkZXZpY2UuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNv
bT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCj4gLS0tIGEvaW5jbHVkZS9saW51eC9ncGlvL2Ry
aXZlci5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9ncGlvL2RyaXZlci5oCj4gQEAgLTc1MCw0ICs3
NTEsMTcgQEAgc3RhdGljIGlubGluZSB2b2lkIGdwaW9jaGlwX3VubG9ja19hc19pcnEoc3RydWN0
IGdwaW9fY2hpcCAqZ2MsCj4gIH0KPiAgI2VuZGlmIC8qIENPTkZJR19HUElPTElCICovCj4KPiAr
c3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgZ3Bpb2NoaXBfY291bnQoc3RydWN0IGRldmljZSAq
ZGV2KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqY2hpbGQ7Cj4gKyAgICAg
ICB1bnNpZ25lZCBpbnQgY291bnQgPSAwOwo+ICsKPiArICAgICAgIGRldmljZV9mb3JfZWFjaF9j
aGlsZF9ub2RlKGRldiwgY2hpbGQpIHsKPiArICAgICAgICAgICAgICAgaWYgKGRldmljZV9wcm9w
ZXJ0eV9yZWFkX2Jvb2woY2hpbGQsICJncGlvLWNvbnRyb2xsZXIiKSkKCmVycm9yOiBwYXNzaW5n
IGFyZ3VtZW50IDEgb2Yg4oCYZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbOKAmSBmcm9tCmluY29t
cGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNd
CgpTbyBJJ20gYWZyYWlkIEkgY2Fubm90IHRlc3QgcGF0Y2ggMy81IHlldCA7LSkKCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY291bnQrKzsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1
cm4gY291bnQ7Cj4gK30KPiArCj4gICNlbmRpZiAvKiBfX0xJTlVYX0dQSU9fRFJJVkVSX0ggKi8K
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
