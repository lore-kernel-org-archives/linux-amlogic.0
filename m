Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8257AC10F1A
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2024 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssfAeDscmxJSycjVRrgZWUapZaOHW7FLjvSlVDQUlYw=; b=2aZoXptfnYMWWe
	7kTM8AzwAL7T9TqEXeDwkXX3iEcTTf1Du/qUx2zCWbPvGJY0FsHGKUlGJbPzf86oc5glbnAx82baG
	2Li1eJ4awtBcTe1faB0e/NwgMBhyiITqNVkXX5ntlv/li01hyhsYTJ04zPRwZKPbhEyi7fKn0dbdy
	vKSZ/WGvkVhxi4f8AU6T26lENarN3QJD4ltPzwGG3giMh72x8nSEp/a8T0lJ6/PFvV7VDcPSbjy4g
	maiA77Y2niJeglMr4w43F4o5jxO4SKawrIyrYMdsxwlDi8VEuQv3pzTiPWN/7h7ihxltQoJ3q9/Ht
	1aZN5m4OhENrk67IT7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hcc-0000000ARY4-3QVW;
	Tue, 07 May 2024 10:00:30 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HcZ-0000000ARW8-1LYv
	for linux-amlogic@lists.infradead.org;
	Tue, 07 May 2024 10:00:28 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so3372692276.1
        for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2024 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715076023; x=1715680823; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFSMri8IOp5B1+IxovMpqNQnX2FTTBoMbN3fnBfN5fs=;
        b=lIqNSr6faLRb9aKuSzT+BYwTiNGBy9drMZOcetKmJNi1Gs6cS2luiiLIXoCZXE+J6Q
         OnzaGFTLRdIYVI4lkmFQotsaGGGKA5k9/yH/wKvdIsgJ+rI89aO4KdDpJ/fwrsJ3fvAN
         bLXYXP0YSWwPSpORWFr2Z5H8r8r4Q4JhX3Ym589IGfA+uuPiOKOkFGfYmyDwJHtfqBxW
         Tp/pk+9OSodcHWZMB6Anwgi1sxi/I8pS4I7uQ/6RMSfKEvPn0xFm6LHwX7fuIViBRojj
         4cc5BIAqst1KKyUdQy33Ov8QaL9Foaf3zEwFPA04nMDd8uV9D6dZ7suG4kUgSydb/EHS
         Py8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076023; x=1715680823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFSMri8IOp5B1+IxovMpqNQnX2FTTBoMbN3fnBfN5fs=;
        b=o9lHez/7uvZ1tAGJSN+ZohvvfACq2ZQQFkxaJ8830+7WRFwPveKwCFPc8Xnrtn2E5t
         4dB0VzlslN3B8Lc4pc97BpipgoeVmkuLGZ6UEMwMfBdS9sn5EoK7QHcBmfFIjuMAOlDb
         i48Xfe6cLMWCcMO61bq8DIGUVMehGzQ8dJfVlxxWz2yRKNegD1X+/75tHFW3qyf3LqXA
         Ei/MF4493qPv+TTwOyzp6Fxh+cc+CT0LLZS4LmTMWImaeQ6ikvddEgBCdauR0Nztla02
         RFmits5lm026PBGniomTbuYAaNF2slNcv+UXNz7SvVGIL/8PlsYm+gs8cyaz1hNbxY2g
         8y0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHApJOI90GbvOPlcHIVqobyOoKhz5b6PpAvLFxA8Ln0YQ8qIjxHHJ3eR0Gg0bGVzyX77cVnoVMIZjF5GXgabBSAt5O21pPKx3Y0UpeqyFraWY=
X-Gm-Message-State: AOJu0YyfSxmSm9afW4yr5/XqiPl8VR+Gj756mA5hYTheAZEzJjZmHk8i
	v9Ilu03/b1oOT1xHAFK0Zb9pb0lxNnhDC24MM0rs9NzCRv6EAaVanHAW4nTwICbz5VcrwoiC7Jl
	kMSsSZ/shU68j1CNTz/KW5vpZ/C6dMkcN08Syqg==
X-Google-Smtp-Source: AGHT+IFwCUGgYvRH4J64zcFI4z7cn36AwbaF/MAmzgEqtWvJFvM8pD+cROZ0JOlTC9klXAeFg/VLQQiya7Dx8lrV/5s=
X-Received: by 2002:a25:8e04:0:b0:de8:9348:b219 with SMTP id
 p4-20020a258e04000000b00de89348b219mr12156380ybl.6.1715076023009; Tue, 07 May
 2024 03:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
 <20240507081441.GA6025@thinkpad> <20240507082822.GA6659@thinkpad>
In-Reply-To: <20240507082822.GA6659@thinkpad>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 May 2024 12:00:10 +0200
Message-ID: <CACRpkdbHKPBT087WZ8PN4Mb6pLLAuFLufFw69vn5cimWJmwchA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] PCI: imx6: Convert to agnostic GPIO API
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_030027_540943_19997360 
X-CRM114-Status: GOOD (  21.93  )
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

T24gVHVlLCBNYXkgNywgMjAyNCBhdCAxMDoyOOKAr0FNIE1hbml2YW5uYW4gU2FkaGFzaXZhbQo8
bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDA3
LCAyMDI0IGF0IDAxOjQ0OjU2UE0gKzA1MzAsIE1hbml2YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToK
PiA+IE9uIE1vbiwgTWF5IDA2LCAyMDI0IGF0IDAyOjEwOjI0UE0gKzAyMDAsIExpbnVzIFdhbGxl
aWogd3JvdGU6Cj4gPiA+IE9uIE1vbiwgQXByIDI5LCAyMDI0IGF0IDEyOjI14oCvUE0gQW5keSBT
aGV2Y2hlbmtvCj4gPiA+IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiA+IFRoZSBvZl9ncGlvLmggaXMgZ29pbmcgdG8gYmUgcmVtb3ZlZC4gSW4g
cHJlcGFyYXRpb24gb2YgdGhhdCBjb252ZXJ0Cj4gPiA+ID4gdGhlIGRyaXZlciB0byB0aGUgYWdu
b3N0aWMgQVBJLgo+ID4gPiA+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IE1hbml2YW5uYW4gU2FkaGFz
aXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+Cj4gPiA+ID4gUmV2aWV3ZWQt
Ynk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFu
ZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgo+ID4gPgo+
ID4gPiBJIHRoaW5rIHRoZXJlIGlzIGEgYnVnIGhlcmUsIHRoZSBjb2RlIGlzIHJlc3BlY3Rpbmcg
dGhlIE9GIHByb3BlcnR5Cj4gPiA+ICJyZXNldC1ncGlvLWFjdGl2ZS1oaWdoIgo+ID4gPiBidXQg
dGhlIGNvZGUgaW4gZHJpdmVycy9ncGlvL2dwaW9saWItb2YuaCBhY3R1YWxseSBoYXMgYSBxdWly
ayBmb3IKPiA+ID4gdGhpcyBzbyB5b3UgY2FuIGp1c3QKPiA+ID4gZGVsZXRlIGFsbCB0aGUgYWN0
aXZlIGhpZ2ggaGFuZGxpbmcgYW5kIHJlbHkgb24gMSA9IGFzc2VydGVkIGFuZCAwID0KPiA+ID4g
ZGVhc3NlcnRlZCB3aGVuCj4gPiA+IHVzaW5nIEdQSU8gZGVzY3JpcHRvcnMuCj4gPiA+Cj4gPgo+
ID4gV293Li4uCj4gPgo+ID4gU28gdGhpcyBidWcgaXMgcHJlc2VudCBldmVuIGJlZm9yZSB0aGlz
IHNlcmllcywgcmlnaHQ/Cj4gPgo+ID4gPiBKdXN0IGRlbGV0ZSB0aGlzIHRoaW5nOgo+ID4gPiBp
bXg2X3BjaWUtPmdwaW9fYWN0aXZlX2hpZ2ggPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZXNldC1n
cGlvLWFjdGl2ZS1oaWdoIik7Cj4gPgo+ID4gQnV0IHRoaXMgaXMganVzdCBhIGJhbmRhaWQgSU1P
LiBUaGUgZmxhZyBmb3IgdGhlIFBFUlNUIyBHUElPIHNob3VsZCBiZSBwcm9wZXJseQo+ID4gc2V0
IGluIHRoZSBib2FyZCBkdHMgYXMgcGVyIHRoZSBib2FyZCBkZXNpZ24uCj4gPgo+Cj4gSG1tLCBu
by4gSSB3YXMgY29uZnVzZWQgYnkgdGhlIHByb3BlcnR5LiBCdXQgdGhpcyBxdWlyayBpbiBncGlv
bGliLW9mLmMgaXMgZ29pbmcKPiB0byBiZSBhcHBsaWVkIHdoaWxlIGNoYW5naW5nIHRoZSBHUElP
IHN0YXRlIGFsc28gb3IganVzdCBkdXJpbmcgcmVxdWVzdCB0aW1lPwoKSXQncyBhcHBsaWVkIHBl
cm1hbmVudGx0IGF0IHJlcXVlc3QgYW5kIHRoZW4gdGhlIGRlc2NyaXB0b3JzIG1haW50YWluIHRo
ZWlyCnBvbGFyaXR5IHN0YXRlIG92ZXIgdGhlIGNvdXJzZSBvZiB0aGVpciBsaWZldGltZS4KCllv
dXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
