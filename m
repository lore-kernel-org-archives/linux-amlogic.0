Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BF2C4345F
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2024 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZJGoDEGpVhXHQGxOdI08hxipn3Jlq6sGeM9pOLsX4c=; b=LDt+0XchbFbtdv
	/SK9LfgDXa8nn/n1fw7RPaMToxMSlZkx6ZBiELRczNsWZbtxxX/6lXWh7XKjl2UIwielE1Kmb2RTL
	aZWCvtErXUN8cu2XvO4k/jzi1CLVzY+TVJvfU0GYTMeEYWdOCjrfhw87/k3Vnv2cHq97S800Sjo+f
	2tR6Bc0st6twEPmn0+1HvmwvWi0FycPqHig7ty5ACHQbPyW71feeTmeI2ZSXiqYqAhDwC0Y+/2WDl
	Gmp4ald34SjlOHnRcL9Tgxkrl24nI/7DeZiDaWZYZm6bNHeyg8Iru5pqNfvYfAeMs2qGWK7HOSUCA
	GTtDxzSPvfkRCOJMd2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0bmk-0000000Eyyv-3u8Q;
	Sat, 27 Apr 2024 06:43:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0bmi-0000000Eyy1-2HeP
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Apr 2024 06:43:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e3c9300c65so25863775ad.0
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 23:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714200222; x=1714805022; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eTGnh4hJsxF2w2JcjcnIEUBbWbOx1xRb7gasYjxARjc=;
        b=P1x3ge+sHGlVBxQ5lD1hvQthQnyvcunqdpJ0npM2+dX6UzeYkRhcn12eIjCTIo30Uu
         GqVjMYLzhySU3il2N+nVOYsBhI+B4oZtMWG8PhFhfkkEcKcJwAx0ZrkJU3kMLnt+iZZt
         w12B2dglJBuvHqSOR9R0FYn0K12AQaT9Z6Ijmh1AGSRAMBaiLaI2Cc3J0WFbiayfECat
         7CoAM9vb6mva4Jx4ZpnmNs37WI40I5PaO/n0EK4bmY/BKjMckhGDRPpX12dbflbELTzV
         fVUbKt+3l+zAmUJb8BTbRkX0RPcf9Dcfar2PNu0gpNRE2t2Fisb7BldMiS/Y41fzRoDf
         XSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714200222; x=1714805022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTGnh4hJsxF2w2JcjcnIEUBbWbOx1xRb7gasYjxARjc=;
        b=HW29odzrqa5umVRNgRocGsqwOQ/LrpH6+JYZAn3K8+T3Ia0NLHknc5vI7T2Y9LXEk2
         vL1YENXERHwyHApWu3lGIA8z9tbWVTLeH20Cz3P/37UDTRGsxnsrXWOHn9iERR3INiwE
         5dpn0zYN54Z2Dw5K0ReqGYtVwY01r0ZuT0xcRWUh+hRH0LuRcWU9QNfpO4wQKsfp3pQp
         3MVa4nZ8vGeL7S0UFvpjpFb8E288KFPA3FNa0VnfUGzrmUzUD3sd2Le1h/ZKT2cGvW9a
         wH6Z8+NBp8tyScdpKFxpMRt7OLCcXvFtdQUaW5AWSQtHElmNqe/jtSxho7sh01LcpjfD
         oBCA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Y1Z7NuNsXJQToOh2xPpfDvCDfkm6AZTjrLsMxavszh8z0iESF3+2gH63m9IAqwpcezhOJoSHKEkKXPjC/sQqYygt0z9D3ST2pRbzPQ+13sg=
X-Gm-Message-State: AOJu0Yx17fk8a1mTPEpAf5B6CSB9nRzkbqQyDI9L3yjQXwn8hPmeGY3Q
	iS5lJBmZNpPbie/GuHkj+yb5wmDpMwOAbaocu9ccbwjQ+vP1MUzfb9++Hx0qgQ==
X-Google-Smtp-Source: AGHT+IHUmT02EuAP4GA34txQXaVB3I9YqYCabXLgvXGRga6DshOVeDQbPJbpV0gl5wTwZcs3Pq2Smg==
X-Received: by 2002:a17:903:240a:b0:1e9:6609:37d4 with SMTP id e10-20020a170903240a00b001e9660937d4mr6065899plo.9.1714200222300;
        Fri, 26 Apr 2024 23:43:42 -0700 (PDT)
Received: from thinkpad ([120.60.53.237])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d89500b001e44578dccasm16507119plz.254.2024.04.26.23.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 23:43:41 -0700 (PDT)
Date: Sat, 27 Apr 2024 12:13:29 +0530
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
Subject: Re: [PATCH v2 3/4] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <20240427064329.GB1981@thinkpad>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423172208.2723892-4-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_234344_621183_0CE2DD34 
X-CRM114-Status: GOOD (  21.52  )
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

T24gVHVlLCBBcHIgMjMsIDIwMjQgYXQgMDg6MTk6MDZQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IFRoZSBvZl9ncGlvLmggaXMgZ29pbmcgdG8gYmUgcmVtb3ZlZC4gSW4gcHJlcGFy
YXRpb24gb2YgdGhhdCBjb252ZXJ0Cj4gdGhlIGRyaXZlciB0byB0aGUgYWdub3N0aWMgQVBJLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZh
bm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+CgotIE1hbmkKCj4gLS0tCj4gIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1pbXg2LmMgfCAzNyArKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktaW14Ni5jIGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWlteDYuYwo+IGluZGV4IDkxN2M2OWVkZWUx
ZC4uZDYyMGYxZTFhNDNjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaS1pbXg2LmMKPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktaW14Ni5j
Cj4gQEAgLTExLDE0ICsxMSwxMyBAQAo+ICAjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ICAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KPiAtI2lu
Y2x1ZGUgPGxpbnV4L2dwaW8uaD4KPiArI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nv
bi5oPgo+ICAjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi9pbXg2cS1pb211eGMtZ3ByLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uL2lteDctaW9tdXhjLWdwci5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+IC0jaW5jbHVkZSA8
bGludXgvb2ZfZ3Bpby5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPgo+ICAjaW5j
bHVkZSA8bGludXgvcGNpLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4K
PiBAQCAtMTA3LDcgKzEwNiw3IEBAIHN0cnVjdCBpbXg2X3BjaWVfZHJ2ZGF0YSB7Cj4gIAo+ICBz
dHJ1Y3QgaW14Nl9wY2llIHsKPiAgCXN0cnVjdCBkd19wY2llCQkqcGNpOwo+IC0JaW50CQkJcmVz
ZXRfZ3BpbzsKPiArCXN0cnVjdCBncGlvX2Rlc2MJKnJlc2V0X2dwaW9kOwo+ICAJYm9vbAkJCWdw
aW9fYWN0aXZlX2hpZ2g7Cj4gIAlib29sCQkJbGlua19pc191cDsKPiAgCXN0cnVjdCBjbGtfYnVs
a19kYXRhCWNsa3NbSU1YNl9QQ0lFX01BWF9DTEtTXTsKPiBAQCAtNzIxLDkgKzcyMCw4IEBAIHN0
YXRpYyB2b2lkIGlteDZfcGNpZV9hc3NlcnRfY29yZV9yZXNldChzdHJ1Y3QgaW14Nl9wY2llICpp
bXg2X3BjaWUpCj4gIAl9Cj4gIAo+ICAJLyogU29tZSBib2FyZHMgZG9uJ3QgaGF2ZSBQQ0llIHJl
c2V0IEdQSU8uICovCj4gLQlpZiAoZ3Bpb19pc192YWxpZChpbXg2X3BjaWUtPnJlc2V0X2dwaW8p
KQo+IC0JCWdwaW9fc2V0X3ZhbHVlX2NhbnNsZWVwKGlteDZfcGNpZS0+cmVzZXRfZ3BpbywKPiAt
CQkJCQlpbXg2X3BjaWUtPmdwaW9fYWN0aXZlX2hpZ2gpOwo+ICsJZ3Bpb2Rfc2V0X3Jhd192YWx1
ZV9jYW5zbGVlcChpbXg2X3BjaWUtPnJlc2V0X2dwaW9kLAo+ICsJCQkJICAgICBpbXg2X3BjaWUt
PmdwaW9fYWN0aXZlX2hpZ2gpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IGlteDZfcGNpZV9kZWFz
c2VydF9jb3JlX3Jlc2V0KHN0cnVjdCBpbXg2X3BjaWUgKmlteDZfcGNpZSkKPiBAQCAtNzcxLDEw
ICs3NjksMTAgQEAgc3RhdGljIGludCBpbXg2X3BjaWVfZGVhc3NlcnRfY29yZV9yZXNldChzdHJ1
Y3QgaW14Nl9wY2llICppbXg2X3BjaWUpCj4gIAl9Cj4gIAo+ICAJLyogU29tZSBib2FyZHMgZG9u
J3QgaGF2ZSBQQ0llIHJlc2V0IEdQSU8uICovCj4gLQlpZiAoZ3Bpb19pc192YWxpZChpbXg2X3Bj
aWUtPnJlc2V0X2dwaW8pKSB7Cj4gKwlpZiAoaW14Nl9wY2llLT5yZXNldF9ncGlvZCkgewo+ICAJ
CW1zbGVlcCgxMDApOwo+IC0JCWdwaW9fc2V0X3ZhbHVlX2NhbnNsZWVwKGlteDZfcGNpZS0+cmVz
ZXRfZ3BpbywKPiAtCQkJCQkhaW14Nl9wY2llLT5ncGlvX2FjdGl2ZV9oaWdoKTsKPiArCQlncGlv
ZF9zZXRfcmF3X3ZhbHVlX2NhbnNsZWVwKGlteDZfcGNpZS0+cmVzZXRfZ3Bpb2QsCj4gKwkJCQkJ
ICAgICAhaW14Nl9wY2llLT5ncGlvX2FjdGl2ZV9oaWdoKTsKPiAgCQkvKiBXYWl0IGZvciAxMDBt
cyBhZnRlciBQRVJTVCMgZGVhc3NlcnRpb24gKFBDSWUgcjUuMCwgNi42LjEpICovCj4gIAkJbXNs
ZWVwKDEwMCk7Cj4gIAl9Cj4gQEAgLTEyODUsMjIgKzEyODMsMTUgQEAgc3RhdGljIGludCBpbXg2
X3BjaWVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1cm4gUFRS
X0VSUihwY2ktPmRiaV9iYXNlKTsKPiAgCj4gIAkvKiBGZXRjaCBHUElPcyAqLwo+IC0JaW14Nl9w
Y2llLT5yZXNldF9ncGlvID0gb2ZfZ2V0X25hbWVkX2dwaW8obm9kZSwgInJlc2V0LWdwaW8iLCAw
KTsKPiAgCWlteDZfcGNpZS0+Z3Bpb19hY3RpdmVfaGlnaCA9IG9mX3Byb3BlcnR5X3JlYWRfYm9v
bChub2RlLAo+ICAJCQkJCQkicmVzZXQtZ3Bpby1hY3RpdmUtaGlnaCIpOwo+IC0JaWYgKGdwaW9f
aXNfdmFsaWQoaW14Nl9wY2llLT5yZXNldF9ncGlvKSkgewo+IC0JCXJldCA9IGRldm1fZ3Bpb19y
ZXF1ZXN0X29uZShkZXYsIGlteDZfcGNpZS0+cmVzZXRfZ3BpbywKPiAtCQkJCWlteDZfcGNpZS0+
Z3Bpb19hY3RpdmVfaGlnaCA/Cj4gLQkJCQkJR1BJT0ZfT1VUX0lOSVRfSElHSCA6Cj4gLQkJCQkJ
R1BJT0ZfT1VUX0lOSVRfTE9XLAo+IC0JCQkJIlBDSWUgcmVzZXQiKTsKPiAtCQlpZiAocmV0KSB7
Cj4gLQkJCWRldl9lcnIoZGV2LCAidW5hYmxlIHRvIGdldCByZXNldCBncGlvXG4iKTsKPiAtCQkJ
cmV0dXJuIHJldDsKPiAtCQl9Cj4gLQl9IGVsc2UgaWYgKGlteDZfcGNpZS0+cmVzZXRfZ3BpbyA9
PSAtRVBST0JFX0RFRkVSKSB7Cj4gLQkJcmV0dXJuIGlteDZfcGNpZS0+cmVzZXRfZ3BpbzsKPiAt
CX0KPiArCWlteDZfcGNpZS0+cmVzZXRfZ3Bpb2QgPQo+ICsJCWRldm1fZ3Bpb2RfZ2V0X29wdGlv
bmFsKGRldiwgInJlc2V0IiwKPiArCQkJaW14Nl9wY2llLT5ncGlvX2FjdGl2ZV9oaWdoID8gR1BJ
T0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XKTsKPiArCWlmIChJU19FUlIoaW14Nl9wY2llLT5y
ZXNldF9ncGlvZCkpCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGlteDZf
cGNpZS0+cmVzZXRfZ3Bpb2QpLAo+ICsJCQkJICAgICAidW5hYmxlIHRvIGdldCByZXNldCBncGlv
XG4iKTsKPiArCWdwaW9kX3NldF9jb25zdW1lcl9uYW1lKGlteDZfcGNpZS0+cmVzZXRfZ3Bpb2Qs
ICJQQ0llIHJlc2V0Iik7Cj4gIAo+ICAJaWYgKGlteDZfcGNpZS0+ZHJ2ZGF0YS0+Y2xrc19jbnQg
Pj0gSU1YNl9QQ0lFX01BWF9DTEtTKQo+ICAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVO
T01FTSwgImNsa3NfY250IGlzIHRvbyBiaWdcbiIpOwo+IC0tIAo+IDIuNDMuMC5yYzEuMTMzNi5n
MzZiNTI1NWEwM2FjCj4gCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCu
pOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
