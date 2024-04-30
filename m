Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68201C41513
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2024 05:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+yuE1tqRB2w+OB5Hq6TaPy1ROjSb8VVOlW6ztcqplQ=; b=J2LqPWhMgqZRXP
	s2un+467/ndzvESQm7WEgsqgo2J/9qOXYpxBsGVY+UCOnS7tPBeDXkBGvnEnO5LFvpWka3kj7h09E
	Dx3yReSn+pWhGM50GP/vHGh76c08egz+V7BWcDFlJG1q4+JXAF8EDuc0aHuWDbnZkGQgK04l+Cfol
	yuqPnAMAvWc7NPgL+yD+H1rs2+YFhypbZ4PCcNfVbwXpyULV+KHO5p4NT1iGU2qIm55gAN/cPXzbX
	UJkvbXLZ0KFTQwkSh9kP4JpD5cdYxlDcn2yrftoOzmHmhhaZy8LYH45eVad7hl469ksOp1U3MkLWJ
	pLgAyDidd2OXWJgzeY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1fqo-000000058Qi-1sos;
	Tue, 30 Apr 2024 05:16:22 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1fql-000000058PW-3EYi
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Apr 2024 05:16:21 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5ff57410ebbso3894372a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2024 22:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714454175; x=1715058975; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ynejgaDnZjcmZfXmFDrndip2YGb6tAWR1lBuHbKqsw=;
        b=gKj1ewtDFWZ9b3qUe7+hRF4vgJ+n2vmX97ZPSgtCctkNuXRK30OsUfIviouf0L1eQp
         vm6FtI+6CxnMHmEKUnptJLJ5MGwlx6LJt8wldgoCGu9HsgPtgRBmaEyK/ZWpQV4wIwEb
         hmSt9U7yxqxgDgAmXuwRG68JwN0jdHWaTw7KTVDG5VTQcOjx6uY9p7gf78XfWwKmWA/Z
         Z1eJC5iaYzHCYte3jaI4u8E0TLushquSe9HMAvAEUfBBdaMUg6G89zpZNmu07tEeNA6d
         mzqrA7M/YHDwGEMKfnTscO6Wfb1In3Mqk5U1LSLIAMkjfrCUdsNgMfMi5jdy2GsW0c9G
         IBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714454175; x=1715058975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ynejgaDnZjcmZfXmFDrndip2YGb6tAWR1lBuHbKqsw=;
        b=CuviwLd4KQEdTrlOVInNbfoTlRGVg5L8pZaJ0HoFhZ6oliKvtRCTDRe53W8S4FpmOU
         Bd5Kr1HBo6QUktipuT08ObdpXTDdatmSQgnfednpETcfhelM6b4t3+1XwS6pDWXCXyTF
         84aIRYcKYWqBoKswhbXWueVfwlK/6ZpdFM5Jmt5Ff2mJ0sFSJ5HG3gEYBDpQoDX2sU8X
         McaYEnXd/uaaT5M/lUYlPUN1bmuLylIEjFrE5TD34ZhYPW5M+x80CVQEywZ4gLZ1iv1s
         i89xRJssPVQGK/+huECIGTRU1zG2EWMxHd/Ys7hrmZaCt6FUaIKg8ZwEehfuLUTprwwb
         F5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCV19KkW72zvnJK6CjzPRIPZPIw6LFX5JiTmT+2BDGYLnGxIF877PzIe2Qavug0P/uFHjsYPB7l6DQq9Hhc6nY66d9MWb74cbx/TCXIvB2lJN/E=
X-Gm-Message-State: AOJu0YwHxEo/Uz3i9WnwE+I7QEY0ZzfWuvH/JMXPwdzsl26BhbYimgi+
	HBtsLRh1eTjn160cSOG7DHMOdzb8CsEYp86lE++KsEQuM4aeVdtL0IbCjrSOEg==
X-Google-Smtp-Source: AGHT+IGeASrZZdOKkLRwqMeew25lnfW2E16O02bRTclJxxqzXXmg/MPOAdDxiUpkYBPU/+iJ5ms0XA==
X-Received: by 2002:a05:6a20:12cf:b0:1a9:6cdd:6907 with SMTP id v15-20020a056a2012cf00b001a96cdd6907mr14733071pzg.29.1714454174430;
        Mon, 29 Apr 2024 22:16:14 -0700 (PDT)
Received: from thinkpad ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902cf4500b001e2c1ce5bb0sm21409980plg.83.2024.04.29.22.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 22:16:14 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:46:04 +0530
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
Subject: Re: [PATCH v3 5/5] PCI: kirin: Convert to agnostic GPIO API
Message-ID: <20240430051604.GA3301@thinkpad>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429102510.2665280-6-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_221619_828612_773C32C7 
X-CRM114-Status: GOOD (  26.59  )
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

T24gTW9uLCBBcHIgMjksIDIwMjQgYXQgMDE6MjM6MjJQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IFRoZSBvZl9ncGlvLmggaXMgZ29pbmcgdG8gYmUgcmVtb3ZlZC4gSW4gcHJlcGFy
YXRpb24gb2YgdGhhdCBjb252ZXJ0Cj4gdGhlIGRyaXZlciB0byB0aGUgYWdub3N0aWMgQVBJLgo+
IAo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29t
PgoKUmV2aWV3ZWQtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+CgotIE1hbmkKCj4gLS0tCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUta2lyaW4uYyB8IDEwNSArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDcwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWtpcmluLmMgYi9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2llLWtpcmluLmMKPiBpbmRleCBkNTUyM2YzMDIxMDIuLmQxZjU0
ZjE4OGU3MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWtp
cmluLmMKPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWtpcmluLmMKPiBA
QCAtMTIsMTIgKzEyLDEwIEBACj4gICNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgo+ICAjaW5j
bHVkZSA8bGludXgvZGVsYXkuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+IC0jaW5jbHVk
ZSA8bGludXgvZ3Bpby5oPgo+ICAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgo+ICAj
aW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29u
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfcGNpLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9waHkvcGh5
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPiBAQCAtNzgsMTYgKzc2LDE2IEBAIHN0cnVj
dCBraXJpbl9wY2llIHsKPiAgCXZvaWQJCSpwaHlfcHJpdjsJLyogb25seSBmb3IgUENJRV9LSVJJ
Tl9JTlRFUk5BTF9QSFkgKi8KPiAgCj4gIAkvKiBEV0MgUEVSU1QjICovCj4gLQlpbnQJCWdwaW9f
aWRfZHdjX3BlcnN0Owo+ICsJc3RydWN0IGdwaW9fZGVzYyAqaWRfZHdjX3BlcnN0X2dwaW87Cj4g
IAo+ICAJLyogUGVyLXNsb3QgUEVSU1QjICovCj4gIAlpbnQJCW51bV9zbG90czsKPiAtCWludAkJ
Z3Bpb19pZF9yZXNldFtNQVhfUENJX1NMT1RTXTsKPiArCXN0cnVjdCBncGlvX2Rlc2MgKmlkX3Jl
c2V0X2dwaW9bTUFYX1BDSV9TTE9UU107Cj4gIAljb25zdCBjaGFyCSpyZXNldF9uYW1lc1tNQVhf
UENJX1NMT1RTXTsKPiAgCj4gIAkvKiBQZXItc2xvdCBjbGtyZXEgKi8KPiAgCWludAkJbl9ncGlv
X2Nsa3JlcTsKPiAtCWludAkJZ3Bpb19pZF9jbGtyZXFbTUFYX1BDSV9TTE9UU107Cj4gKwlzdHJ1
Y3QgZ3Bpb19kZXNjICppZF9jbGtyZXFfZ3Bpb1tNQVhfUENJX1NMT1RTXTsKPiAgCWNvbnN0IGNo
YXIJKmNsa3JlcV9uYW1lc1tNQVhfUENJX1NMT1RTXTsKPiAgfTsKPiAgCj4gQEAgLTM4MSwxNSAr
Mzc5LDIwIEBAIHN0YXRpYyBpbnQga2lyaW5fcGNpZV9nZXRfZ3Bpb19lbmFibGUoc3RydWN0IGtp
cmluX3BjaWUgKnBjaWUsCj4gIAlwY2llLT5uX2dwaW9fY2xrcmVxID0gcmV0Owo+ICAKPiAgCWZv
ciAoaSA9IDA7IGkgPCBwY2llLT5uX2dwaW9fY2xrcmVxOyBpKyspIHsKPiAtCQlwY2llLT5ncGlv
X2lkX2Nsa3JlcVtpXSA9IG9mX2dldF9uYW1lZF9ncGlvKGRldi0+b2Zfbm9kZSwKPiAtCQkJCQkJ
ICAgICJoaXNpbGljb24sY2xrZW4tZ3Bpb3MiLCBpKTsKPiAtCQlpZiAocGNpZS0+Z3Bpb19pZF9j
bGtyZXFbaV0gPCAwKQo+IC0JCQlyZXR1cm4gcGNpZS0+Z3Bpb19pZF9jbGtyZXFbaV07Cj4gKwkJ
cGNpZS0+aWRfY2xrcmVxX2dwaW9baV0gPSBkZXZtX2dwaW9kX2dldF9pbmRleChkZXYsCj4gKwkJ
CQkJCQkiaGlzaWxpY29uLGNsa2VuIiwgaSwKPiArCQkJCQkJCUdQSU9EX09VVF9MT1cpOwo+ICsJ
CWlmIChJU19FUlIocGNpZS0+aWRfY2xrcmVxX2dwaW9baV0pKQo+ICsJCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIFBUUl9FUlIocGNpZS0+aWRfY2xrcmVxX2dwaW9baV0pLAo+ICsJCQkJCSAg
ICAgInVuYWJsZSB0byBnZXQgYSB2YWxpZCBjbGtlbiBncGlvXG4iKTsKPiAgCj4gIAkJcGNpZS0+
Y2xrcmVxX25hbWVzW2ldID0gZGV2bV9rYXNwcmludGYoZGV2LCBHRlBfS0VSTkVMLAo+ICAJCQkJ
CQkgICAgICAgInBjaWVfY2xrcmVxXyVkIiwgaSk7Cj4gIAkJaWYgKCFwY2llLT5jbGtyZXFfbmFt
ZXNbaV0pCj4gIAkJCXJldHVybiAtRU5PTUVNOwo+ICsKPiArCQlncGlvZF9zZXRfY29uc3VtZXJf
bmFtZShwY2llLT5pZF9jbGtyZXFfZ3Bpb1tpXSwKPiArCQkJCQlwY2llLT5jbGtyZXFfbmFtZXNb
aV0pOwo+ICAJfQo+ICAKPiAgCXJldHVybiAwOwo+IEBAIC00MDcsMTAgKzQxMCwxNiBAQCBzdGF0
aWMgaW50IGtpcmluX3BjaWVfcGFyc2VfcG9ydChzdHJ1Y3Qga2lyaW5fcGNpZSAqcGNpZSwKPiAg
CQlmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZShwYXJlbnQsIGNoaWxkKSB7Cj4gIAkJ
CWkgPSBwY2llLT5udW1fc2xvdHM7Cj4gIAo+IC0JCQlwY2llLT5ncGlvX2lkX3Jlc2V0W2ldID0g
b2ZfZ2V0X25hbWVkX2dwaW8oY2hpbGQsCj4gLQkJCQkJCQkicmVzZXQtZ3Bpb3MiLCAwKTsKPiAt
CQkJaWYgKHBjaWUtPmdwaW9faWRfcmVzZXRbaV0gPCAwKQo+IC0JCQkJY29udGludWU7Cj4gKwkJ
CXBjaWUtPmlkX3Jlc2V0X2dwaW9baV0gPSBkZXZtX2Z3bm9kZV9ncGlvZF9nZXRfaW5kZXgoZGV2
LAo+ICsJCQkJCQkJIG9mX2Z3bm9kZV9oYW5kbGUoY2hpbGQpLAo+ICsJCQkJCQkJICJyZXNldCIs
IDAsIEdQSU9EX09VVF9MT1csCj4gKwkJCQkJCQkgTlVMTCk7Cj4gKwkJCWlmIChJU19FUlIocGNp
ZS0+aWRfcmVzZXRfZ3Bpb1tpXSkpIHsKPiArCQkJCWlmIChQVFJfRVJSKHBjaWUtPmlkX3Jlc2V0
X2dwaW9baV0pID09IC1FTk9FTlQpCj4gKwkJCQkJY29udGludWU7Cj4gKwkJCQlyZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocGNpZS0+aWRfcmVzZXRfZ3Bpb1tpXSksCj4gKwkJCQkJ
CSAgICAgInVuYWJsZSB0byBnZXQgYSB2YWxpZCByZXNldCBncGlvXG4iKTsKPiArCQkJfQo+ICAK
PiAgCQkJcGNpZS0+bnVtX3Nsb3RzKys7Cj4gIAkJCWlmIChwY2llLT5udW1fc2xvdHMgPiBNQVhf
UENJX1NMT1RTKSB7Cj4gQEAgLTQzNCw2ICs0NDMsOSBAQCBzdGF0aWMgaW50IGtpcmluX3BjaWVf
cGFyc2VfcG9ydChzdHJ1Y3Qga2lyaW5fcGNpZSAqcGNpZSwKPiAgCQkJCXJldCA9IC1FTk9NRU07
Cj4gIAkJCQlnb3RvIHB1dF9ub2RlOwo+ICAJCQl9Cj4gKwo+ICsJCQlncGlvZF9zZXRfY29uc3Vt
ZXJfbmFtZShwY2llLT5pZF9yZXNldF9ncGlvW2ldLAo+ICsJCQkJCQlwY2llLT5yZXNldF9uYW1l
c1tpXSk7Cj4gIAkJfQo+ICAJfQo+ICAKPiBAQCAtNDYzLDE0ICs0NzUsMTEgQEAgc3RhdGljIGxv
bmcga2lyaW5fcGNpZV9nZXRfcmVzb3VyY2Uoc3RydWN0IGtpcmluX3BjaWUgKmtpcmluX3BjaWUs
Cj4gIAkJcmV0dXJuIFBUUl9FUlIoa2lyaW5fcGNpZS0+YXBiKTsKPiAgCj4gIAkvKiBwY2llIGlu
dGVybmFsIFBFUlNUIyBncGlvICovCj4gLQlraXJpbl9wY2llLT5ncGlvX2lkX2R3Y19wZXJzdCA9
IG9mX2dldF9uYW1lZF9ncGlvKGRldi0+b2Zfbm9kZSwKPiAtCQkJCQkJCSAgInJlc2V0LWdwaW9z
IiwgMCk7Cj4gLQlpZiAoa2lyaW5fcGNpZS0+Z3Bpb19pZF9kd2NfcGVyc3QgPT0gLUVQUk9CRV9E
RUZFUikgewo+IC0JCXJldHVybiAtRVBST0JFX0RFRkVSOwo+IC0JfSBlbHNlIGlmICghZ3Bpb19p
c192YWxpZChraXJpbl9wY2llLT5ncGlvX2lkX2R3Y19wZXJzdCkpIHsKPiAtCQlkZXZfZXJyKGRl
diwgInVuYWJsZSB0byBnZXQgYSB2YWxpZCBncGlvIHBpblxuIik7Cj4gLQkJcmV0dXJuIC1FTk9E
RVY7Cj4gLQl9Cj4gKwlraXJpbl9wY2llLT5pZF9kd2NfcGVyc3RfZ3BpbyA9IGRldm1fZ3Bpb2Rf
Z2V0KGRldiwgInJlc2V0IiwgR1BJT0RfT1VUX0xPVyk7Cj4gKwlpZiAoSVNfRVJSKGtpcmluX3Bj
aWUtPmlkX2R3Y19wZXJzdF9ncGlvKSkKPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBU
Ul9FUlIoa2lyaW5fcGNpZS0+aWRfZHdjX3BlcnN0X2dwaW8pLAo+ICsJCQkJICAgICAidW5hYmxl
IHRvIGdldCBhIHZhbGlkIGdwaW8gcGluXG4iKTsKPiArCWdwaW9kX3NldF9jb25zdW1lcl9uYW1l
KGtpcmluX3BjaWUtPmlkX2R3Y19wZXJzdF9ncGlvLCAicGNpZV9wZXJzdF9icmlkZ2UiKTsKPiAg
Cj4gIAlyZXQgPSBraXJpbl9wY2llX2dldF9ncGlvX2VuYWJsZShraXJpbl9wY2llLCBwZGV2KTsK
PiAgCWlmIChyZXQpCj4gQEAgLTU1Myw3ICs1NjIsNyBAQCBzdGF0aWMgaW50IGtpcmluX3BjaWVf
YWRkX2J1cyhzdHJ1Y3QgcGNpX2J1cyAqYnVzKQo+ICAKPiAgCS8qIFNlbmQgUEVSU1QjIHRvIGVh
Y2ggc2xvdCAqLwo+ICAJZm9yIChpID0gMDsgaSA8IGtpcmluX3BjaWUtPm51bV9zbG90czsgaSsr
KSB7Cj4gLQkJcmV0ID0gZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KGtpcmluX3BjaWUtPmdwaW9faWRf
cmVzZXRbaV0sIDEpOwo+ICsJCXJldCA9IGdwaW9kX2RpcmVjdGlvbl9vdXRwdXRfcmF3KGtpcmlu
X3BjaWUtPmlkX3Jlc2V0X2dwaW9baV0sIDEpOwo+ICAJCWlmIChyZXQpIHsKPiAgCQkJZGV2X2Vy
cihwY2ktPmRldiwgIlBFUlNUIyAlcyBlcnJvcjogJWRcbiIsCj4gIAkJCQlraXJpbl9wY2llLT5y
ZXNldF9uYW1lc1tpXSwgcmV0KTsKPiBAQCAtNjIzLDQ0ICs2MzIsNiBAQCBzdGF0aWMgaW50IGtp
cmluX3BjaWVfaG9zdF9pbml0KHN0cnVjdCBkd19wY2llX3JwICpwcCkKPiAgCXJldHVybiAwOwo+
ICB9Cj4gIAo+IC1zdGF0aWMgaW50IGtpcmluX3BjaWVfZ3Bpb19yZXF1ZXN0KHN0cnVjdCBraXJp
bl9wY2llICpraXJpbl9wY2llLAo+IC0JCQkJICAgc3RydWN0IGRldmljZSAqZGV2KQo+IC17Cj4g
LQlpbnQgcmV0LCBpOwo+IC0KPiAtCWZvciAoaSA9IDA7IGkgPCBraXJpbl9wY2llLT5udW1fc2xv
dHM7IGkrKykgewo+IC0JCWlmICghZ3Bpb19pc192YWxpZChraXJpbl9wY2llLT5ncGlvX2lkX3Jl
c2V0W2ldKSkgewo+IC0JCQlkZXZfZXJyKGRldiwgInVuYWJsZSB0byBnZXQgYSB2YWxpZCAlcyBn
cGlvXG4iLAo+IC0JCQkJa2lyaW5fcGNpZS0+cmVzZXRfbmFtZXNbaV0pOwo+IC0JCQlyZXR1cm4g
LUVOT0RFVjsKPiAtCQl9Cj4gLQo+IC0JCXJldCA9IGRldm1fZ3Bpb19yZXF1ZXN0KGRldiwga2ly
aW5fcGNpZS0+Z3Bpb19pZF9yZXNldFtpXSwKPiAtCQkJCQlraXJpbl9wY2llLT5yZXNldF9uYW1l
c1tpXSk7Cj4gLQkJaWYgKHJldCkKPiAtCQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCj4gLQlmb3Ig
KGkgPSAwOyBpIDwga2lyaW5fcGNpZS0+bl9ncGlvX2Nsa3JlcTsgaSsrKSB7Cj4gLQkJaWYgKCFn
cGlvX2lzX3ZhbGlkKGtpcmluX3BjaWUtPmdwaW9faWRfY2xrcmVxW2ldKSkgewo+IC0JCQlkZXZf
ZXJyKGRldiwgInVuYWJsZSB0byBnZXQgYSB2YWxpZCAlcyBncGlvXG4iLAo+IC0JCQkJa2lyaW5f
cGNpZS0+Y2xrcmVxX25hbWVzW2ldKTsKPiAtCQkJcmV0dXJuIC1FTk9ERVY7Cj4gLQkJfQo+IC0K
PiAtCQlyZXQgPSBkZXZtX2dwaW9fcmVxdWVzdChkZXYsIGtpcmluX3BjaWUtPmdwaW9faWRfY2xr
cmVxW2ldLAo+IC0JCQkJCWtpcmluX3BjaWUtPmNsa3JlcV9uYW1lc1tpXSk7Cj4gLQkJaWYgKHJl
dCkKPiAtCQkJcmV0dXJuIHJldDsKPiAtCj4gLQkJcmV0ID0gZ3Bpb19kaXJlY3Rpb25fb3V0cHV0
KGtpcmluX3BjaWUtPmdwaW9faWRfY2xrcmVxW2ldLCAwKTsKPiAtCQlpZiAocmV0KQo+IC0JCQly
ZXR1cm4gcmV0Owo+IC0JfQo+IC0KPiAtCXJldHVybiAwOwo+IC19Cj4gLQo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IGR3X3BjaWVfb3BzIGtpcmluX2R3X3BjaWVfb3BzID0gewo+ICAJLnJlYWRfZGJp
ID0ga2lyaW5fcGNpZV9yZWFkX2RiaSwKPiAgCS53cml0ZV9kYmkgPSBraXJpbl9wY2llX3dyaXRl
X2RiaSwKPiBAQCAtNjgwLDcgKzY1MSw3IEBAIHN0YXRpYyBpbnQga2lyaW5fcGNpZV9wb3dlcl9v
ZmYoc3RydWN0IGtpcmluX3BjaWUgKmtpcmluX3BjaWUpCj4gIAkJcmV0dXJuIGhpMzY2MF9wY2ll
X3BoeV9wb3dlcl9vZmYoa2lyaW5fcGNpZSk7Cj4gIAo+ICAJZm9yIChpID0gMDsgaSA8IGtpcmlu
X3BjaWUtPm5fZ3Bpb19jbGtyZXE7IGkrKykKPiAtCQlncGlvX2RpcmVjdGlvbl9vdXRwdXQoa2ly
aW5fcGNpZS0+Z3Bpb19pZF9jbGtyZXFbaV0sIDEpOwo+ICsJCWdwaW9kX2RpcmVjdGlvbl9vdXRw
dXRfcmF3KGtpcmluX3BjaWUtPmlkX2Nsa3JlcV9ncGlvW2ldLCAxKTsKPiAgCj4gIAlwaHlfcG93
ZXJfb2ZmKGtpcmluX3BjaWUtPnBoeSk7Cj4gIAlwaHlfZXhpdChraXJpbl9wY2llLT5waHkpOwo+
IEBAIC03MDcsMTAgKzY3OCw2IEBAIHN0YXRpYyBpbnQga2lyaW5fcGNpZV9wb3dlcl9vbihzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAJCWlmIChJU19FUlIoa2lyaW5fcGNpZS0+cGh5
KSkKPiAgCQkJcmV0dXJuIFBUUl9FUlIoa2lyaW5fcGNpZS0+cGh5KTsKPiAgCj4gLQkJcmV0ID0g
a2lyaW5fcGNpZV9ncGlvX3JlcXVlc3Qoa2lyaW5fcGNpZSwgZGV2KTsKPiAtCQlpZiAocmV0KQo+
IC0JCQlyZXR1cm4gcmV0Owo+IC0KPiAgCQlyZXQgPSBwaHlfaW5pdChraXJpbl9wY2llLT5waHkp
Owo+ICAJCWlmIChyZXQpCj4gIAkJCWdvdG8gZXJyOwo+IEBAIC03MjMsMTEgKzY5MCw5IEBAIHN0
YXRpYyBpbnQga2lyaW5fcGNpZV9wb3dlcl9vbihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LAo+ICAJLyogcGVyc3QgYXNzZXJ0IEVuZHBvaW50ICovCj4gIAl1c2xlZXBfcmFuZ2UoUkVGXzJf
UEVSU1RfTUlOLCBSRUZfMl9QRVJTVF9NQVgpOwo+ICAKPiAtCWlmICghZ3Bpb19yZXF1ZXN0KGtp
cmluX3BjaWUtPmdwaW9faWRfZHdjX3BlcnN0LCAicGNpZV9wZXJzdF9icmlkZ2UiKSkgewo+IC0J
CXJldCA9IGdwaW9fZGlyZWN0aW9uX291dHB1dChraXJpbl9wY2llLT5ncGlvX2lkX2R3Y19wZXJz
dCwgMSk7Cj4gLQkJaWYgKHJldCkKPiAtCQkJZ290byBlcnI7Cj4gLQl9Cj4gKwlyZXQgPSBncGlv
ZF9kaXJlY3Rpb25fb3V0cHV0X3JhdyhraXJpbl9wY2llLT5pZF9kd2NfcGVyc3RfZ3BpbywgMSk7
Cj4gKwlpZiAocmV0KQo+ICsJCWdvdG8gZXJyOwo+ICAKPiAgCXVzbGVlcF9yYW5nZShQRVJTVF8y
X0FDQ0VTU19NSU4sIFBFUlNUXzJfQUNDRVNTX01BWCk7Cj4gIAo+IC0tIAo+IDIuNDMuMC5yYzEu
MTMzNi5nMzZiNTI1NWEwM2FjCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCu
muCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
