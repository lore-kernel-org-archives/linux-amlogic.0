Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7E2C54E4A
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Mar 2024 09:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQ5ee30hk81LvqFLhokex8GIKW2psF8jkVy3FO4Xk+w=; b=FrKBuBe+ey4ez0
	qi1ms6c8thMq901BsxAf5oyunApTKDly7Jt6+YtYWDSW6jIDkfdjouxIJ8b6k6SfG+bRxQTae6mrl
	R3Ils+i3fkZEeGftBt7BsPuXteTxxWv5X6jglLygbv44trx2SIeTbyRh/XPbMO90ZpeF3TBIjgnU0
	ZYjAfIVA2FVS3K76RQiU6t6OIUdZuaphfoTkZPwXQ2YzdV5JCj1yf9/kk3i2EXWCWgCeGeQDUQmwc
	DjOFh3WeelwESRPnIDI7COIBu4TXgFkI81INVaWkKfYKJencvDiN0nhBV3sqDAySYU5bhjFbuIjvr
	tnL9ftwAKt+yDjW7ZLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riWxQ-00000008ea8-1Fqu;
	Fri, 08 Mar 2024 09:56:04 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riWxM-00000008eYp-3TXz
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Mar 2024 09:56:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so1260195a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Mar 2024 01:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709891760; x=1710496560; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JUK3zdKghpmKi7BAcVW5ImJ4qoLWxSUUxIXqc6+4Iww=;
        b=K5enqpoJia6dV4WyCqaAAgLGu7Cm0zTs0ZAWCqIkr+SAXeE1ccsz6fyWHARXIiOVY8
         6iwLc29zvq2VAtKero4O6OOWIrGZz0c1BxifdW8lBzDwbAgD8DesYopI97SakaKD9qdx
         iP7C7f3J0Ld4cBjxkIxUY+/Cjq4W+PIGIYe++xqZxM1R+UQNimzBGi75kL+8fXbsJthM
         DDouzMoyug9vYKi3lv1Bx5pcbTqd7NieHhWP0QmdO8/pZXksl4yRhydAm2rfs8K1nioX
         DmDsmue4Ai3aSJLkZ+cjHqwUt5Zglapu82RaMx7feUPVSNR4E+kAl9eVEZmFJo1vEDrt
         SqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891760; x=1710496560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUK3zdKghpmKi7BAcVW5ImJ4qoLWxSUUxIXqc6+4Iww=;
        b=frDiTdXIm8PVg5Fd+ofOUIYUdS4gZrj0+Tkm+LIIS/EDDNb4pqTv3lt/7hu+LjvjHb
         m23OjRMMitiPC56vFG4C92jyWBE4f4Am+ZERZ0f/Y4aFYBy+gp0vearWo8c/P8lpCx0l
         nyBFyu9QuRIZGU+clFrxWywgkHLncN4oyK14US/K+NrgvLyMhXWX2QoGdHoblIAl6Nx2
         rS6rO2q9yOTUyTdHIpxqqe5L1jAV9EWvZGNZtvOGEFdapFI484G3SsDPCCOWGlQH2zME
         f51kq0ad2UWWfQigKUwQnOEz2UIxCU0fKxCP6kYN0W2BLiE37Y2bOEqoGH4n8UnCwGRQ
         8cPA==
X-Forwarded-Encrypted: i=1; AJvYcCW2GAJp8dX0xG9yeQ83HRClvThVNgtt1lKAkdFoNgtsG1dhakKofSdrYH9zh+X7J10gjgk2JPPNIdEe+U+9+SRK17Ri8evFlNFakrXImh36a6k=
X-Gm-Message-State: AOJu0Yyy8876HTNrJp2llL0hH3KXvm0O0/aWdRwVJH2uSWBuAemfXDs0
	/VcjUXfX7YMAh9Ih2NUJ9WL91sutix5XyBveXZwCXO95N7Zpl3XPsqnLC35iYg==
X-Google-Smtp-Source: AGHT+IGOTlUHapfqElkZxE+j6NSs76sL89OIFPzQbD3+yFMWYqGGsRtHUD1W1wK1/RK2ZY2d13ivWw==
X-Received: by 2002:a17:90a:a8f:b0:299:7b37:9221 with SMTP id 15-20020a17090a0a8f00b002997b379221mr16693450pjw.12.1709891759544;
        Fri, 08 Mar 2024 01:55:59 -0800 (PST)
Received: from thinkpad ([117.217.183.232])
        by smtp.gmail.com with ESMTPSA id ei16-20020a17090ae55000b0029b73ccf4fesm2806572pjb.30.2024.03.08.01.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 01:55:59 -0800 (PST)
Date: Fri, 8 Mar 2024 15:25:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 1/1] PCI: dwc: Remove unused of_gpio.h
Message-ID: <20240308095547.GI3789@thinkpad>
References: <20240307122840.3682287-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240307122840.3682287-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_015600_940865_5FF793BF 
X-CRM114-Status: GOOD (  14.20  )
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

T24gVGh1LCBNYXIgMDcsIDIwMjQgYXQgMDI6Mjg6NDBQTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IG9mX2dwaW8uaCBpcyBkZXByZWNhdGVkIGFuZCBzdWJqZWN0IHRvIHJlbW92ZS4K
PiBUaGUgZHJpdmVyIGRvZXNuJ3QgdXNlIGl0LCBzaW1wbHkgcmVtb3ZlIHRoZSB1bnVzZWQgaGVh
ZGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2ktZHJhN3h4LmMgICAgfCAxIC0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1l
c29uLmMgICAgIHwgMSAtCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS5j
ICAgICB8IDEgLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMg
fCAyIC0tCgpXaGF0IGFib3V0IHRoZSByZXN0PwoKZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1raXJpbi5jCmRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1pbXg2LmMKClRoZXJl
IGlzIGFsc28gb25lIG5vbi1kd2MgZHJpdmVyOgoKZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kt
YWFyZHZhcmsuYwoKSXQgaXMgYmV0dGVyIHRvIHJlbW92ZSBpdCBmcm9tIGFsbCBQQ0kgZHJpdmVy
cyBpbiBhIHNpbmdsZSBwYXRjaC4KCi0gTWFuaQoKPiAgNCBmaWxlcyBjaGFuZ2VkLCA1IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kt
ZHJhN3h4LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktZHJhN3h4LmMKPiBpbmRl
eCAwZTQwNjY3NzA2MGQuLmY2ZDJiYTQyOTU4YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2ktZHJhN3h4LmMKPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9wY2ktZHJhN3h4LmMKPiBAQCAtMTcsNyArMTcsNiBAQAo+ICAjaW5jbHVkZSA8bGludXgv
a2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L29mLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9v
Zl9wY2kuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGh5
L3BoeS5oPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVz
b24uYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jCj4gaW5kZXggNjQ3
N2M4MzI2MmMyLi5kYjk0ODJhMTEzZTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpLW1lc29uLmMKPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2ktbWVzb24uYwo+IEBAIC05LDcgKzksNiBAQAo+ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1l
ci5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGNp
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L3Jlc2V0Lmg+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtcWNvbS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLmMKPiBpbmRl
eCAyY2UyYTNiZDkzMmIuLjAwODRhMzM5MDA0MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLXFjb20uYwo+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtcWNvbS5jCj4gQEAgLTIwLDcgKzIwLDYgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2tl
cm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2Yu
aD4KPiAtI2luY2x1ZGUgPGxpbnV4L29mX2dwaW8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BjaS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtdGVncmExOTQuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmEx
OTQuYwo+IGluZGV4IDFmN2I2NjJjYjhlMS4uNjMzZDhkYzUwMzM5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYwo+ICsrKyBiL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYwo+IEBAIC0xMyw3ICsxMyw2IEBACj4g
ICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9ncGlvLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pbnRlcmNv
bm5lY3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+IEBAIC0yMSw3ICsyMCw2
IEBACj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L29mX2dwaW8u
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mX3BjaS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGNpLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+Cj4gLS0gCj4gMi40My4wLnJjMS4xLmdiZWM0
NDQ5MWYwOTYKPiAKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a
4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
