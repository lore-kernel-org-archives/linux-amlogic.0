Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7667ECCFA00
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Nov 2025 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BI87pismYHyn4r6kfliR1qbtx0Kx0fci/VlLtrZW5/I=; b=p76CYQRcRRnTKM
	Le0vxomxkPO0t40/glwL1uMBBvyrVK+6P8VsWaHa/nsM7NNh+LpLfNfFyDWyTc+v+WfVSuH8IbTpd
	nvifoYcubsZoxnjipJDggXoquhKGdh6nONNTlUs10AwurHqFggbR0gbvSLgD6hm90lLRaowyFv4Lw
	6nZe5NRyMCKr1GvyZ4VabEoHRNO4AMxhC5eK8NSVQnndpvaURzSeL3Wcy1OXG9Nb8GPv7OaJogYPg
	td9wD5SDEUEuEcpVTYx4CBU2r6WtQuQWRlUPLJuwYTF5v2ZqSZaR6jfC1GI3M/D8hXghtDU3QQzZt
	4zMc+fbmVvcsT8cMSPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGE49-0000000Bb7O-1Xqy;
	Tue, 04 Nov 2025 10:15:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGE45-0000000Bb5z-03PX
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Nov 2025 10:15:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-475de184058so17050045e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Nov 2025 02:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762251298; x=1762856098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzTHhy3GAbklolyt8qy1XMnUZAQnKYr+cBkCn68R7OE=;
        b=vEoInxTz4mti2Fm1cx03WIY8jbXFxlkbO7dktPy5sJdD6l2h8mA8BxH3jFk+udmziS
         gW/n8P2q3KyCTLbgFGvWr/6sxbTfH3vuqLtl9NYhB3q5HXf7uZll0njNufO4wqTQUzy7
         1L3NFKT9u4n2g6WFKyffZrsolOGUDxnJSI+BhC2sBfWJhGI8wI/8IbjYSREB3HHyhzPd
         8owxwI+MGNIY+yXQJtm39ooUF9sObtPq+rzzdgozKMWQSHyYtmxlwH7VSihcKq7f5ITK
         2NLlPz1gC4/raS5k4JZo1fcWsuOwc+v5MZLdbxuwuFS7mga7i0dDl+p3ucpJl0elUMkW
         eJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251298; x=1762856098;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VzTHhy3GAbklolyt8qy1XMnUZAQnKYr+cBkCn68R7OE=;
        b=QHjmdJG/ZrV/IiTyz7azbpyD44quU6au6gY5fORdb7WR53i8hSBI2llJHjev1IfDiR
         RfqIcTsQx0P+1XC0amZKRToRAbbSmrL57+/NhcU8V55/hgyJbxmbYvg/2n69JunT2Y3v
         BEN1n48y/zSd6EHnEdWbTYKUFbp+8reI+h9LxzqT//L6T+m8HuM2FfI25DHqYFnu9l90
         Q1gz4z6QCGVncUs68fsUAEc1iNGNLbUvbB9aJn35uq7hGNVXip5TDezFHKbFqR8VxnnY
         5jhQ+BOA1y2Gzchwh+rO+iDeRXwnFVH6Wc1Ek5FTFWHZaa+Z2QgxwtqA1++bCGtv4cE4
         cGCw==
X-Forwarded-Encrypted: i=1; AJvYcCVUrQfWdOdXPy4W3Lbr4IxaZTWySZGM0Gukx6amBjMPeseV1OTmsU2c4H/fZGyQxrEJYYqSt1yWadwIEGrN@lists.infradead.org
X-Gm-Message-State: AOJu0YwxeZDQF/pGjtndJ7vij+UiHu5t+uqmKHxNBlN+ROR08XF2I1Xr
	r2BiPJk7tHPt96/WD2mm83bXSAFFScyxAj3l608mHSAoi6FsjE/78BSPBnGX+QehUO4=
X-Gm-Gg: ASbGncuCHMDSsKJyhaNRnqIqZbjI7R9aWGP/hyPbWZbnXS2yjrU9/H22V+w2JL67Bwd
	g6A4RNKhhcT2K1Le77tCIA0gZiPQfucwiaieSVUhPbqFhaRJ+5MZ7YEq/bUltPVIEapzxqqT44w
	+9O8ZvEeAfjZdCbGbQoRpL7/mmvsiyN9VixLW0o+DPKtDXCPXzm7FG562oNGgxbHz8IpV5FnwGI
	bT++qzRKl4B/deKq2RWesvIqjGK/P6ZNQ93NvK7yBEkAP7jCNyugzEaXq3cgDnTUlZN97CeYBUe
	YuVqDQAj3CpE/msxak9/lgYbSrUCND8yCYBaM0s5wc9UpgmwqNXcRKlGNrk7k2VsGWdubpWjbNm
	WAsb8SSfznCLCmvXbick5BJUdQQSoV+9V2B13gqSn3eKpgRKoK/hijma1U/PJ9Ix0ipC/hLORSS
	TnYVT1mfSY7g==
X-Google-Smtp-Source: AGHT+IFW39f8luyhpSRptudm6R2xZGEcdodo7MnF7yu9NJ2j+0Jo9qKayBjVFzg4CRgrhQRxcMSJYw==
X-Received: by 2002:a05:600c:3489:b0:477:cb6:805e with SMTP id 5b1f17b1804b1-477307e0513mr122942125e9.18.1762251298482;
        Tue, 04 Nov 2025 02:14:58 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:8c13:6331:568f:92f3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429dc18ef89sm3810253f8f.6.2025.11.04.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:14:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 5/5] clk: meson: t7: add t7 clock peripherals
 controller driver
In-Reply-To: <3b9a5978-aa02-486b-85f5-6443dc607dd5@amlogic.com> (Jian Hu's
	message of "Tue, 4 Nov 2025 17:17:50 +0800")
References: <20251030094345.2571222-1-jian.hu@amlogic.com>
	<20251030094345.2571222-6-jian.hu@amlogic.com>
	<1jbjlnxuug.fsf@starbuckisacylon.baylibre.com>
	<3b9a5978-aa02-486b-85f5-6443dc607dd5@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 04 Nov 2025 11:14:57 +0100
Message-ID: <1j1pmew1cu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_021501_175821_B0013236 
X-CRM114-Status: GOOD (  13.63  )
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

T24gVHVlIDA0IE5vdiAyMDI1IGF0IDE3OjE3LCBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29t
PiB3cm90ZToKCj4+PiArCj4+PiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwIHQ3X2RzcGEgPSB7
Cj4+PiArICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfbXV4X2RhdGEpewo+Pj4gKyAg
ICAgICAgICAgICAub2Zmc2V0ID0gRFNQQV9DTEtfQ1RSTDAsCj4+PiArICAgICAgICAgICAgIC5t
YXNrID0gMHgxLAo+Pj4gKyAgICAgICAgICAgICAuc2hpZnQgPSAxNSwKPj4+ICsgICAgIH0sCj4+
PiArICAgICAuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0X2RhdGEpewo+Pj4gKyAgICAgICAg
ICAgICAubmFtZSA9ICJkc3BhIiwKPj4+ICsgICAgICAgICAgICAgLm9wcyA9ICZjbGtfcmVnbWFw
X211eF9vcHMsCj4+PiArICAgICAgICAgICAgIC5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBj
bGtfaHcgKltdKSB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgJnQ3X2RzcGFfYS5odywKPj4+
ICsgICAgICAgICAgICAgICAgICAgICAmdDdfZHNwYV9iLmh3LAo+Pj4gKyAgICAgICAgICAgICB9
LAo+Pj4gKyAgICAgICAgICAgICAubnVtX3BhcmVudHMgPSAyLAo+Pj4gKyAgICAgICAgICAgICAu
ZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5ULAo+Pj4gKyAgICAgfSwKPj4+ICt9Owo+Pj4gKwo+
Pj4gLi4uLi4uCj4+PiArCj4+PiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwIHQ3X2FuYWtpbl8w
ID0gewo+PiBOaXRwaWNrOiBmb3IgdGhlIERTUCBpdCB3YXMgYS9iLCBoZXJlIGl0IGlzIDAvMQo+
PiBDb3VsZCB5b3UgcGljayBvbmUgd2F5IG9yIHRoZSBvdGhlciBhbmQgc3RpY2sgdG8gaXQgPwo+
Cj4KPiBvayAsIEkgd2lsbCB1c2UgMC8xIGZvciBEU1AuCgpJIHRoaW5rIEkgcHJlZmVyIGEvYiBp
ZiB5b3UgZG9uJ3QgbWluZC4gc2VlIGJlbG93IGZvciB3aHkgLi4uCgo+Cj4+PiArICAgICAuZGF0
YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfZ2F0ZV9kYXRhKXsKPj4+ICsgICAgICAgICAgICAgLm9m
ZnNldCA9IEFOQUtJTl9DTEtfQ1RSTCwKPj4+ICsgICAgICAgICAgICAgLmJpdF9pZHggPSA4LAo+
Pj4gKyAgICAgfSwKPj4+ICsgICAgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkg
ewo+Pj4gKyAgICAgICAgICAgICAubmFtZSA9ICJhbmFraW5fMCIsCj4+PiArICAgICAgICAgICAg
IC5vcHMgPSAmY2xrX3JlZ21hcF9nYXRlX29wcywKPj4+ICsgICAgICAgICAgICAgLnBhcmVudF9o
d3MgPSAoY29uc3Qgc3RydWN0IGNsa19odyAqW10pIHsgJnQ3X2FuYWtpbl8wX2Rpdi5odyB9LAo+
Pj4gKyAgICAgICAgICAgICAubnVtX3BhcmVudHMgPSAxLAo+Pj4gKyAgICAgICAgICAgICAuZmxh
Z3MgPSBDTEtfU0VUX1JBVEVfR0FURSB8IENMS19TRVRfUkFURV9QQVJFTlQsCj4+PiArICAgICB9
LAo+Pj4gK307CgpbLi4uXQoKPj4+ICsKPj4+ICtzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgdDdf
YW5ha2luX2NsayA9IHsKPj4+ICsgICAgIC5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21hcF9nYXRl
X2RhdGEpewo+Pj4gKyAgICAgICAgICAgICAub2Zmc2V0ID0gQU5BS0lOX0NMS19DVFJMLAo+Pj4g
KyAgICAgICAgICAgICAuYml0X2lkeCA9IDMwLAo+Pj4gKyAgICAgfSwKPj4+ICsgICAgIC5ody5p
bml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkgewo+Pj4gKyAgICAgICAgICAgICAubmFtZSA9
ICJhbmFraW5fY2xrIiwKPj4gQWdhaW4sIG5vdCBhIGdyZWF0IG5hbWUsIGVzcGVjaWFsbHkgY29u
c2lkZXJpbmcgdGhlIG9uZSBhYm92ZS4KPj4gSXMgdGhpcyByZWFsbHkgcmVhbGx5IGhvdyB0aGUg
ZG9jIHJlZmVycyB0byB0aGVzZSAyIGNsb2NrcyA/Cj4KPgo+IGJpdDMwIGdhdGUgY2xvY2sgaXMg
YWZ0ZXIgYml0MzEgbXV4IGNsb2NrLMKgIGFuZCB0aGUgZ2F0ZSBjbG9jayBpcyB0aGUgZmluYWwK
PiBvdXRwdXQgY2xvY2ssIGl0IGlzIHVzZWQgdG8gZ2F0ZSBhbmFraW4gY2xvY2suCj4KPiBJIHdp
bGwgcmVuYW1lIGJpdDMxIGFzIGFuYWtpbl9wcmUsIHJlbmFtZSBiaXQzMCBhcyBhbmFraW4uCgpP
ayBmb3IgdGhlIGxhc3QgZWxlbWVudAoKLi4uIGJ1dCBJIGRvbid0ICBsaWtlICJfcHJlIiBmb3Ig
YSBtdXggc2VsZWN0aW5nIG9uZSB0aGUgMiBnbGl0Y2ggZnJlZQpwYXRoLiBJdCBkb2VzIG5vdCBo
ZWxwIHVuZGVyc3RhbmRpbmcgdGhlIHRyZWUuCgpGb3Igc3VjaCBtdXgsIHdoZW4gaXQgaXMgbm90
IHRoZSBsYXN0IGVsZW1lbnQsIEkgd291bGQgc3VnZ2VzdAoiX2FiX3NlbCIgLi4uIGF0IGxlYXN0
IGl0IGlzIGNsZWFyIHdoYXQgaXQgZG9lcyBzbywgImFuYWtpbl9hYl9zZWwiID8KCgo+Cj4+PiAr
ICAgICAgICAgICAgIC5vcHMgPSAmY2xrX3JlZ21hcF9nYXRlX29wcywKPj4+ICsgICAgICAgICAg
ICAgLnBhcmVudF9od3MgPSAoY29uc3Qgc3RydWN0IGNsa19odyAqW10pIHsKPj4+ICsgICAgICAg
ICAgICAgICAgICAgICAmdDdfYW5ha2luLmh3Cj4+PiArICAgICAgICAgICAgIH0sCj4+PiArICAg
ICAgICAgICAgIC5udW1fcGFyZW50cyA9IDEsCj4+PiArICAgICAgICAgICAgIC5mbGFncyA9IENM
S19TRVRfUkFURV9QQVJFTlQKPj4+ICsgICAgIH0sCj4+PiArfTsKPj4+ICsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
