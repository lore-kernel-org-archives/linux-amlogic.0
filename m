Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA2FC10F16
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2024 07:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0S57ozYBSHalhRLD6efCalA6GGkjbiFqJ+pkCoK/l8=; b=y3VODKZR1Csqbv
	f32mndqcnZRXCoj/YYUSw2foy+HlNqYH9bBmCGXJfeqvX8IL84YBCvKtu18jG0At95lC0LtkoRFmI
	J5yJFoLjGe4e0G9C6bNjz71nWqWugZur/h1XvO2fSA2WVUgdg9tlnIleerKuM5qrJtPA2Lht+4tOO
	3FItOlJdPUdFUmdXSniRx2tuFy8WONp6fogQe/jzBXjLL5/CqAqeVayJpH0QhvmsYJ57SKLIIrN0p
	a+uHzYzitWtk22tT53nRJvq+KiHJEGHqZL8rKWjOtUsDQ4thyxOmuY/BY5TT1LHPwMn8E9rQZe4OV
	MBbwc/h/B9Iy4Se+sNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0cPd-0000000F3Mn-1FD8;
	Sat, 27 Apr 2024 07:23:57 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0cPa-0000000F3Lq-0eWb
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Apr 2024 07:23:55 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3c84bb69c6fso1592794b6e.3
        for <linux-amlogic@lists.infradead.org>; Sat, 27 Apr 2024 00:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714202631; x=1714807431; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X6/zlDycsKlLm9oMWJCj8T6cyudX5ggjd/VxiVnvZxs=;
        b=fPj90s1kPaYviNXslzpeGYeV0zY8X35YYF5pBdxXSSLRSa7zMReN4+zsIWCr675+lR
         XEx/h49FHSqRwzHYo5F/UkFrmtqQ88vLpf6vD1Jxkjd8B/6nOKMPSVDeA9+VSn3yQXVk
         3QJfihPrnjZDBef6eTQr/saBhrcwb09htWNI+A9k/fBZupDe+LPigC3mlxQE2OghGlLG
         T6E5vs2AUvXbCgggBAJNL9Nr4SguIeXGiSCoYSe+E8NpBjS+6fQjMVA2OEG0JKBhYtFA
         5yB3rOz4i4UxZjgmWfjKChoqpbwgSsvFeCuZwOghHdhRhf0FDA9mA2xs7rNA07VTO98z
         hr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714202631; x=1714807431;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6/zlDycsKlLm9oMWJCj8T6cyudX5ggjd/VxiVnvZxs=;
        b=sYKeUWLiSLsXlgr8g+p2Co/m764KNjPdj4K6mctszIlxLYxZzZbMhQY+yHiBdcfINY
         INEY1ODyHMREseG503QbHtpKM9kpQtMxs2FznApQWc9rq8ByfNoYgLdiYdq9hPXC2QMy
         OegnjwOwCIE9dtQ42xVqKm0MZIfvAPa7hw8Xfx06bD+uPGMxsh+KUModPIevalEmbptP
         ewUen6pphekT3di2V9eZxp43+3xkns+hvJaSJ5LkoZ9Ss/epuuTp2JwIkLG+z+tUkkgz
         wtHnTAO0UrSKue0BiylauKRNRP5tSWJlYbMni26+wyN5Qnjc1mk4pElhDTeTF8HrRYrE
         vsqw==
X-Forwarded-Encrypted: i=1; AJvYcCVRdhQglr2ZBPh3N4uVS5MHj8p8IILPjnC+KDqlA+Dlh8wnKlkZUkN6JlGIeAOhUsjnq0TdmTor2h+XUNHObAYeQm0s6AvrGdQ6aLbblGIlP58=
X-Gm-Message-State: AOJu0Ywj9OT4I9IwuTqdirFbiZnymEtm/JmXWmcKHiARRBCZR/tZEQ9L
	S1QtzVMN7bM+DzuF6KxgEJn8iVZdaX7WNM1Agme2soHSRnGE3fe3gjuK7kS7DA==
X-Google-Smtp-Source: AGHT+IHfipPHYlZH0dzUMyHUrOzKZyinCxBfDMz+pa+y5kowAJsMrQzIMhjdPr+G4bo6/Uiu7Lh6tA==
X-Received: by 2002:a05:6808:85:b0:3c7:4b27:57fb with SMTP id s5-20020a056808008500b003c74b2757fbmr5763377oic.29.1714202630707;
        Sat, 27 Apr 2024 00:23:50 -0700 (PDT)
Received: from thinkpad ([120.60.53.237])
        by smtp.gmail.com with ESMTPSA id i123-20020a639d81000000b005f7ff496050sm13702516pgd.76.2024.04.27.00.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 00:23:50 -0700 (PDT)
Date: Sat, 27 Apr 2024 12:53:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v2 4/4] PCI: kirin: Convert to agnostic GPIO API
Message-ID: <20240427072335.GC1981@thinkpad>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423172208.2723892-5-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_002354_256174_62333106 
X-CRM114-Status: GOOD (  27.53  )
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

T24gVHVlLCBBcHIgMjMsIDIwMjQgYXQgMDg6MTk6MDdQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IFRoZSBvZl9ncGlvLmggaXMgZ29pbmcgdG8gYmUgcmVtb3ZlZC4gSW4gcHJlcGFy
YXRpb24gb2YgdGhhdCBjb252ZXJ0Cj4gdGhlIGRyaXZlciB0byB0aGUgYWdub3N0aWMgQVBJLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWtpcmluLmMgfCAxMDUg
KysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25z
KCspLCA3MCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1raXJpbi5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1r
aXJpbi5jCj4gaW5kZXggZDU1MjNmMzAyMTAyLi4xNzUzYWI2M2E1NDEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1raXJpbi5jCj4gKysrIGIvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1raXJpbi5jCj4gQEAgLTEyLDEyICsxMiwxMCBAQAo+ICAj
aW5jbHVkZSA8bGludXgvY29tcGlsZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVw
dC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPgo+ICAjaW5jbHVkZSA8bGludXgv
b2YuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L29mX2dwaW8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29m
X3BjaS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgo+ICAjaW5jbHVkZSA8bGludXgv
cGNpLmg+Cj4gQEAgLTc4LDE2ICs3NiwxNiBAQCBzdHJ1Y3Qga2lyaW5fcGNpZSB7Cj4gIAl2b2lk
CQkqcGh5X3ByaXY7CS8qIG9ubHkgZm9yIFBDSUVfS0lSSU5fSU5URVJOQUxfUEhZICovCj4gIAo+
ICAJLyogRFdDIFBFUlNUIyAqLwo+IC0JaW50CQlncGlvX2lkX2R3Y19wZXJzdDsKPiArCXN0cnVj
dCBncGlvX2Rlc2MgKmlkX2R3Y19wZXJzdF9ncGlvOwo+ICAKPiAgCS8qIFBlci1zbG90IFBFUlNU
IyAqLwo+ICAJaW50CQludW1fc2xvdHM7Cj4gLQlpbnQJCWdwaW9faWRfcmVzZXRbTUFYX1BDSV9T
TE9UU107Cj4gKwlzdHJ1Y3QgZ3Bpb19kZXNjICppZF9yZXNldF9ncGlvW01BWF9QQ0lfU0xPVFNd
Owo+ICAJY29uc3QgY2hhcgkqcmVzZXRfbmFtZXNbTUFYX1BDSV9TTE9UU107Cj4gIAo+ICAJLyog
UGVyLXNsb3QgY2xrcmVxICovCj4gIAlpbnQJCW5fZ3Bpb19jbGtyZXE7Cj4gLQlpbnQJCWdwaW9f
aWRfY2xrcmVxW01BWF9QQ0lfU0xPVFNdOwo+ICsJc3RydWN0IGdwaW9fZGVzYyAqaWRfY2xrcmVx
X2dwaW9bTUFYX1BDSV9TTE9UU107Cj4gIAljb25zdCBjaGFyCSpjbGtyZXFfbmFtZXNbTUFYX1BD
SV9TTE9UU107Cj4gIH07Cj4gIAo+IEBAIC0zODEsMTUgKzM3OSwyMCBAQCBzdGF0aWMgaW50IGtp
cmluX3BjaWVfZ2V0X2dwaW9fZW5hYmxlKHN0cnVjdCBraXJpbl9wY2llICpwY2llLAo+ICAJcGNp
ZS0+bl9ncGlvX2Nsa3JlcSA9IHJldDsKPiAgCj4gIAlmb3IgKGkgPSAwOyBpIDwgcGNpZS0+bl9n
cGlvX2Nsa3JlcTsgaSsrKSB7Cj4gLQkJcGNpZS0+Z3Bpb19pZF9jbGtyZXFbaV0gPSBvZl9nZXRf
bmFtZWRfZ3BpbyhkZXYtPm9mX25vZGUsCj4gLQkJCQkJCSAgICAiaGlzaWxpY29uLGNsa2VuLWdw
aW9zIiwgaSk7Cj4gLQkJaWYgKHBjaWUtPmdwaW9faWRfY2xrcmVxW2ldIDwgMCkKPiAtCQkJcmV0
dXJuIHBjaWUtPmdwaW9faWRfY2xrcmVxW2ldOwo+ICsJCXBjaWUtPmlkX2Nsa3JlcV9ncGlvW2ld
ID0gZGV2bV9ncGlvZF9nZXRfaW5kZXgoZGV2LAo+ICsJCQkJCQkJImhpc2lsaWNvbixjbGtlbiIs
IGksCj4gKwkJCQkJCQlHUElPRF9BU0lTKTsKClBsZWFzZSBkb24ndCB1c2UgR1BJT0RfQVNJUyBl
dmVuIGlmIHRoZSBvbGQgY29kZSB3YXMgdXNpbmcgaXQuCgpGb3IgYWxsIDMgR1BJT3MgaW4gdGhp
cyBkcml2ZXIsIEdQSU9EX09VVF9MT1cgZmxhZyBzaG91bGQgYmUgdXNlZCBhcyB0aGUgZGVmYXVs
dApzdGF0ZSBpcyBhc3NlcnQgKGNvbnNpZGVyaW5nIHRoZSBmYWN0IHRoYXQgdGhlIERUIHVzZXMg
R1BJT19BQ1RJVkVfSElHSCkuCgotIE1hbmkKCj4gKwkJaWYgKElTX0VSUihwY2llLT5pZF9jbGty
ZXFfZ3Bpb1tpXSkpCj4gKwkJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihwY2ll
LT5pZF9jbGtyZXFfZ3Bpb1tpXSksCj4gKwkJCQkJICAgICAidW5hYmxlIHRvIGdldCBhIHZhbGlk
IGNsa2VuIGdwaW9cbiIpOwo+ICAKPiAgCQlwY2llLT5jbGtyZXFfbmFtZXNbaV0gPSBkZXZtX2th
c3ByaW50ZihkZXYsIEdGUF9LRVJORUwsCj4gIAkJCQkJCSAgICAgICAicGNpZV9jbGtyZXFfJWQi
LCBpKTsKPiAgCQlpZiAoIXBjaWUtPmNsa3JlcV9uYW1lc1tpXSkKPiAgCQkJcmV0dXJuIC1FTk9N
RU07Cj4gKwo+ICsJCWdwaW9kX3NldF9jb25zdW1lcl9uYW1lKHBjaWUtPmlkX2Nsa3JlcV9ncGlv
W2ldLAo+ICsJCQkJCXBjaWUtPmNsa3JlcV9uYW1lc1tpXSk7Cj4gIAl9Cj4gIAo+ICAJcmV0dXJu
IDA7Cj4gQEAgLTQwNywxMCArNDEwLDE2IEBAIHN0YXRpYyBpbnQga2lyaW5fcGNpZV9wYXJzZV9w
b3J0KHN0cnVjdCBraXJpbl9wY2llICpwY2llLAo+ICAJCWZvcl9lYWNoX2F2YWlsYWJsZV9jaGls
ZF9vZl9ub2RlKHBhcmVudCwgY2hpbGQpIHsKPiAgCQkJaSA9IHBjaWUtPm51bV9zbG90czsKPiAg
Cj4gLQkJCXBjaWUtPmdwaW9faWRfcmVzZXRbaV0gPSBvZl9nZXRfbmFtZWRfZ3BpbyhjaGlsZCwK
PiAtCQkJCQkJCSJyZXNldC1ncGlvcyIsIDApOwo+IC0JCQlpZiAocGNpZS0+Z3Bpb19pZF9yZXNl
dFtpXSA8IDApCj4gLQkJCQljb250aW51ZTsKPiArCQkJcGNpZS0+aWRfcmVzZXRfZ3Bpb1tpXSA9
IGRldm1fZndub2RlX2dwaW9kX2dldF9pbmRleChkZXYsCj4gKwkJCQkJCQkgb2ZfZndub2RlX2hh
bmRsZShjaGlsZCksCj4gKwkJCQkJCQkgInJlc2V0IiwgMCwgR1BJT0RfQVNJUywKPiArCQkJCQkJ
CSBOVUxMKTsKPiArCQkJaWYgKElTX0VSUihwY2llLT5pZF9yZXNldF9ncGlvW2ldKSkgewo+ICsJ
CQkJaWYgKFBUUl9FUlIocGNpZS0+aWRfcmVzZXRfZ3Bpb1tpXSkgPT0gLUVOT0VOVCkKPiArCQkJ
CQljb250aW51ZTsKPiArCQkJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihwY2ll
LT5pZF9yZXNldF9ncGlvW2ldKSwKPiArCQkJCQkJICAgICAidW5hYmxlIHRvIGdldCBhIHZhbGlk
IHJlc2V0IGdwaW9cbiIpOwo+ICsJCQl9Cj4gIAo+ICAJCQlwY2llLT5udW1fc2xvdHMrKzsKPiAg
CQkJaWYgKHBjaWUtPm51bV9zbG90cyA+IE1BWF9QQ0lfU0xPVFMpIHsKPiBAQCAtNDM0LDYgKzQ0
Myw5IEBAIHN0YXRpYyBpbnQga2lyaW5fcGNpZV9wYXJzZV9wb3J0KHN0cnVjdCBraXJpbl9wY2ll
ICpwY2llLAo+ICAJCQkJcmV0ID0gLUVOT01FTTsKPiAgCQkJCWdvdG8gcHV0X25vZGU7Cj4gIAkJ
CX0KPiArCj4gKwkJCWdwaW9kX3NldF9jb25zdW1lcl9uYW1lKHBjaWUtPmlkX3Jlc2V0X2dwaW9b
aV0sCj4gKwkJCQkJCXBjaWUtPnJlc2V0X25hbWVzW2ldKTsKPiAgCQl9Cj4gIAl9Cj4gIAo+IEBA
IC00NjMsMTQgKzQ3NSwxMSBAQCBzdGF0aWMgbG9uZyBraXJpbl9wY2llX2dldF9yZXNvdXJjZShz
dHJ1Y3Qga2lyaW5fcGNpZSAqa2lyaW5fcGNpZSwKPiAgCQlyZXR1cm4gUFRSX0VSUihraXJpbl9w
Y2llLT5hcGIpOwo+ICAKPiAgCS8qIHBjaWUgaW50ZXJuYWwgUEVSU1QjIGdwaW8gKi8KPiAtCWtp
cmluX3BjaWUtPmdwaW9faWRfZHdjX3BlcnN0ID0gb2ZfZ2V0X25hbWVkX2dwaW8oZGV2LT5vZl9u
b2RlLAo+IC0JCQkJCQkJICAicmVzZXQtZ3Bpb3MiLCAwKTsKPiAtCWlmIChraXJpbl9wY2llLT5n
cGlvX2lkX2R3Y19wZXJzdCA9PSAtRVBST0JFX0RFRkVSKSB7Cj4gLQkJcmV0dXJuIC1FUFJPQkVf
REVGRVI7Cj4gLQl9IGVsc2UgaWYgKCFncGlvX2lzX3ZhbGlkKGtpcmluX3BjaWUtPmdwaW9faWRf
ZHdjX3BlcnN0KSkgewo+IC0JCWRldl9lcnIoZGV2LCAidW5hYmxlIHRvIGdldCBhIHZhbGlkIGdw
aW8gcGluXG4iKTsKPiAtCQlyZXR1cm4gLUVOT0RFVjsKPiAtCX0KPiArCWtpcmluX3BjaWUtPmlk
X2R3Y19wZXJzdF9ncGlvID0gZGV2bV9ncGlvZF9nZXQoZGV2LCAicmVzZXQiLCBHUElPRF9BU0lT
KTsKPiArCWlmIChJU19FUlIoa2lyaW5fcGNpZS0+aWRfZHdjX3BlcnN0X2dwaW8pKQo+ICsJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihraXJpbl9wY2llLT5pZF9kd2NfcGVyc3Rf
Z3BpbyksCj4gKwkJCQkgICAgICJ1bmFibGUgdG8gZ2V0IGEgdmFsaWQgZ3BpbyBwaW5cbiIpOwo+
ICsJZ3Bpb2Rfc2V0X2NvbnN1bWVyX25hbWUoa2lyaW5fcGNpZS0+aWRfZHdjX3BlcnN0X2dwaW8s
ICJwY2llX3BlcnN0X2JyaWRnZSIpOwo+ICAKPiAgCXJldCA9IGtpcmluX3BjaWVfZ2V0X2dwaW9f
ZW5hYmxlKGtpcmluX3BjaWUsIHBkZXYpOwo+ICAJaWYgKHJldCkKPiBAQCAtNTUzLDcgKzU2Miw3
IEBAIHN0YXRpYyBpbnQga2lyaW5fcGNpZV9hZGRfYnVzKHN0cnVjdCBwY2lfYnVzICpidXMpCj4g
IAo+ICAJLyogU2VuZCBQRVJTVCMgdG8gZWFjaCBzbG90ICovCj4gIAlmb3IgKGkgPSAwOyBpIDwg
a2lyaW5fcGNpZS0+bnVtX3Nsb3RzOyBpKyspIHsKPiAtCQlyZXQgPSBncGlvX2RpcmVjdGlvbl9v
dXRwdXQoa2lyaW5fcGNpZS0+Z3Bpb19pZF9yZXNldFtpXSwgMSk7Cj4gKwkJcmV0ID0gZ3Bpb2Rf
ZGlyZWN0aW9uX291dHB1dF9yYXcoa2lyaW5fcGNpZS0+aWRfcmVzZXRfZ3Bpb1tpXSwgMSk7Cj4g
IAkJaWYgKHJldCkgewo+ICAJCQlkZXZfZXJyKHBjaS0+ZGV2LCAiUEVSU1QjICVzIGVycm9yOiAl
ZFxuIiwKPiAgCQkJCWtpcmluX3BjaWUtPnJlc2V0X25hbWVzW2ldLCByZXQpOwo+IEBAIC02MjMs
NDQgKzYzMiw2IEBAIHN0YXRpYyBpbnQga2lyaW5fcGNpZV9ob3N0X2luaXQoc3RydWN0IGR3X3Bj
aWVfcnAgKnBwKQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQga2lyaW5fcGNp
ZV9ncGlvX3JlcXVlc3Qoc3RydWN0IGtpcmluX3BjaWUgKmtpcmluX3BjaWUsCj4gLQkJCQkgICBz
dHJ1Y3QgZGV2aWNlICpkZXYpCj4gLXsKPiAtCWludCByZXQsIGk7Cj4gLQo+IC0JZm9yIChpID0g
MDsgaSA8IGtpcmluX3BjaWUtPm51bV9zbG90czsgaSsrKSB7Cj4gLQkJaWYgKCFncGlvX2lzX3Zh
bGlkKGtpcmluX3BjaWUtPmdwaW9faWRfcmVzZXRbaV0pKSB7Cj4gLQkJCWRldl9lcnIoZGV2LCAi
dW5hYmxlIHRvIGdldCBhIHZhbGlkICVzIGdwaW9cbiIsCj4gLQkJCQlraXJpbl9wY2llLT5yZXNl
dF9uYW1lc1tpXSk7Cj4gLQkJCXJldHVybiAtRU5PREVWOwo+IC0JCX0KPiAtCj4gLQkJcmV0ID0g
ZGV2bV9ncGlvX3JlcXVlc3QoZGV2LCBraXJpbl9wY2llLT5ncGlvX2lkX3Jlc2V0W2ldLAo+IC0J
CQkJCWtpcmluX3BjaWUtPnJlc2V0X25hbWVzW2ldKTsKPiAtCQlpZiAocmV0KQo+IC0JCQlyZXR1
cm4gcmV0Owo+IC0JfQo+IC0KPiAtCWZvciAoaSA9IDA7IGkgPCBraXJpbl9wY2llLT5uX2dwaW9f
Y2xrcmVxOyBpKyspIHsKPiAtCQlpZiAoIWdwaW9faXNfdmFsaWQoa2lyaW5fcGNpZS0+Z3Bpb19p
ZF9jbGtyZXFbaV0pKSB7Cj4gLQkJCWRldl9lcnIoZGV2LCAidW5hYmxlIHRvIGdldCBhIHZhbGlk
ICVzIGdwaW9cbiIsCj4gLQkJCQlraXJpbl9wY2llLT5jbGtyZXFfbmFtZXNbaV0pOwo+IC0JCQly
ZXR1cm4gLUVOT0RFVjsKPiAtCQl9Cj4gLQo+IC0JCXJldCA9IGRldm1fZ3Bpb19yZXF1ZXN0KGRl
diwga2lyaW5fcGNpZS0+Z3Bpb19pZF9jbGtyZXFbaV0sCj4gLQkJCQkJa2lyaW5fcGNpZS0+Y2xr
cmVxX25hbWVzW2ldKTsKPiAtCQlpZiAocmV0KQo+IC0JCQlyZXR1cm4gcmV0Owo+IC0KPiAtCQly
ZXQgPSBncGlvX2RpcmVjdGlvbl9vdXRwdXQoa2lyaW5fcGNpZS0+Z3Bpb19pZF9jbGtyZXFbaV0s
IDApOwo+IC0JCWlmIChyZXQpCj4gLQkJCXJldHVybiByZXQ7Cj4gLQl9Cj4gLQo+IC0JcmV0dXJu
IDA7Cj4gLX0KPiAtCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdfcGNpZV9vcHMga2lyaW5fZHdf
cGNpZV9vcHMgPSB7Cj4gIAkucmVhZF9kYmkgPSBraXJpbl9wY2llX3JlYWRfZGJpLAo+ICAJLndy
aXRlX2RiaSA9IGtpcmluX3BjaWVfd3JpdGVfZGJpLAo+IEBAIC02ODAsNyArNjUxLDcgQEAgc3Rh
dGljIGludCBraXJpbl9wY2llX3Bvd2VyX29mZihzdHJ1Y3Qga2lyaW5fcGNpZSAqa2lyaW5fcGNp
ZSkKPiAgCQlyZXR1cm4gaGkzNjYwX3BjaWVfcGh5X3Bvd2VyX29mZihraXJpbl9wY2llKTsKPiAg
Cj4gIAlmb3IgKGkgPSAwOyBpIDwga2lyaW5fcGNpZS0+bl9ncGlvX2Nsa3JlcTsgaSsrKQo+IC0J
CWdwaW9fZGlyZWN0aW9uX291dHB1dChraXJpbl9wY2llLT5ncGlvX2lkX2Nsa3JlcVtpXSwgMSk7
Cj4gKwkJZ3Bpb2RfZGlyZWN0aW9uX291dHB1dF9yYXcoa2lyaW5fcGNpZS0+aWRfY2xrcmVxX2dw
aW9baV0sIDEpOwo+ICAKPiAgCXBoeV9wb3dlcl9vZmYoa2lyaW5fcGNpZS0+cGh5KTsKPiAgCXBo
eV9leGl0KGtpcmluX3BjaWUtPnBoeSk7Cj4gQEAgLTcwNywxMCArNjc4LDYgQEAgc3RhdGljIGlu
dCBraXJpbl9wY2llX3Bvd2VyX29uKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gIAkJ
aWYgKElTX0VSUihraXJpbl9wY2llLT5waHkpKQo+ICAJCQlyZXR1cm4gUFRSX0VSUihraXJpbl9w
Y2llLT5waHkpOwo+ICAKPiAtCQlyZXQgPSBraXJpbl9wY2llX2dwaW9fcmVxdWVzdChraXJpbl9w
Y2llLCBkZXYpOwo+IC0JCWlmIChyZXQpCj4gLQkJCXJldHVybiByZXQ7Cj4gLQo+ICAJCXJldCA9
IHBoeV9pbml0KGtpcmluX3BjaWUtPnBoeSk7Cj4gIAkJaWYgKHJldCkKPiAgCQkJZ290byBlcnI7
Cj4gQEAgLTcyMywxMSArNjkwLDkgQEAgc3RhdGljIGludCBraXJpbl9wY2llX3Bvd2VyX29uKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gIAkvKiBwZXJzdCBhc3NlcnQgRW5kcG9pbnQg
Ki8KPiAgCXVzbGVlcF9yYW5nZShSRUZfMl9QRVJTVF9NSU4sIFJFRl8yX1BFUlNUX01BWCk7Cj4g
IAo+IC0JaWYgKCFncGlvX3JlcXVlc3Qoa2lyaW5fcGNpZS0+Z3Bpb19pZF9kd2NfcGVyc3QsICJw
Y2llX3BlcnN0X2JyaWRnZSIpKSB7Cj4gLQkJcmV0ID0gZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KGtp
cmluX3BjaWUtPmdwaW9faWRfZHdjX3BlcnN0LCAxKTsKPiAtCQlpZiAocmV0KQo+IC0JCQlnb3Rv
IGVycjsKPiAtCX0KPiArCXJldCA9IGdwaW9kX2RpcmVjdGlvbl9vdXRwdXRfcmF3KGtpcmluX3Bj
aWUtPmlkX2R3Y19wZXJzdF9ncGlvLCAxKTsKPiArCWlmIChyZXQpCj4gKwkJZ290byBlcnI7Cj4g
IAo+ICAJdXNsZWVwX3JhbmdlKFBFUlNUXzJfQUNDRVNTX01JTiwgUEVSU1RfMl9BQ0NFU1NfTUFY
KTsKPiAgCj4gLS0gCj4gMi40My4wLnJjMS4xMzM2LmczNmI1MjU1YTAzYWMKPiAKCi0tIArgrq7g
rqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
