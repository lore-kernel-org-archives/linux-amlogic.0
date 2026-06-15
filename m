Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132C1CD98DE
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jun 2026 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZN6AFDbjrehHUq43m6yWJ1m3eX2BKl3S5NmwVXPfNA=; b=o8226LFfcLN74x
	yzSAwNwr4NaR4KT3I778ezVLhCULOvpj7ieXtRaqXFTeaGoJjOD+vLOE3PoE8kzHckDwTDRBYZJPK
	chqDMJWxFTgaqdLPAKe9X722qov/rw3YwV/jHOxLj4k+rE0gARMpQT7lbuTQt0uXZ0mTq+fzV9/1g
	yuDxGBVwXgyDHfRh2HrfLkpOFvE4YlImPAoh1qtnipvWGBraL/h2g2/XUXnR2H8sGyO4GoD6hQvoF
	sZOaE4OYHxdPa1xmornO6Uz1lvzFzzbBkYjbCdylPl+QSN0ucWMjTn0vFuC8K4zHoF/1BTs85TKZI
	TcLIq5mqi+SgIRoRWNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Rv-0000000EB9X-3Srl;
	Mon, 15 Jun 2026 12:29:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Rt-0000000EB8h-1MkN
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Jun 2026 12:29:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49222fb062bso22705635e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Jun 2026 05:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781526591; x=1782131391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2xSbb+XBUSXol+Xw5qFRPsWuUhic/XBn3XXsaZ5Bxc=;
        b=CcfpSBK+Ap+g6A2xeGwn7fpGoDpuCXTLcwI+3N6PbEJYK0eFsGrbsXQRFL9gVRH+BD
         ZzEd+0ErWvegocHV7mOxS0kZID1QssNHh707v24PbOMmNUL5Al0QkxK5SbVpqjEB8tP5
         7xyCvUEwVhPxpYMA28LV62/L1TMydVBcAFPCpMfbfY404Yhn08RppGyShzvB/zCv231r
         QZ4stLlSpx7n0vQg16KXItIaA5r0P8Ruu/xAhz0l76D8E2Me0p34yPt5+z5nRIn0A+Q2
         +iihhkRvN7N0TxTpuMhF4SZYbtsUpiqE/IfxjroEOTb8LCXNbqFYNdQtgOKWnnT+gvtT
         HG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526591; x=1782131391;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2xSbb+XBUSXol+Xw5qFRPsWuUhic/XBn3XXsaZ5Bxc=;
        b=AzVFScLiOK8wZAnDEm8NS3XrDgN+Nck9YRHs322RjQXiMxyklvoYwaaJwWYr7z0TTG
         1nHwncupr1mN3L5eCV0oWhHwbIdmj86K4RRQUrDV8XfBE31/NkE4m3x6BY34aL/P85qE
         m3cT2Fsmae+/m8dGAopR6B+V/JxtUabzT0Lw+VBA0Wsqhv23bKtnv6ySdLX+7/nAlouD
         xSIB72ux5uKEmJq+gc0E7jxUGWyIMR8bVT71jjG81+pvrFckg1ac5WbZhIPKO8eseqdT
         9bIdTivZaVPrfwX+odY/nWVjehO0Zj5/sLhuLCSyF9X6gqkTfedP94N2wz+j30/1PYMr
         ceew==
X-Forwarded-Encrypted: i=1; AFNElJ/d43Yim37k4xeu63hX+gL8hErb1vg92JEBx0oMVEvswch0Fd/aaY3NIgi4KYNfyRk6n2IqV4IXl0TLGOWK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8WcHGWsmaNu/48otC4SyGwZ0IBCzvK+w+F+c2c/BCkUneb0E3
	1wWix1D4YwtcWQdrY477IGbri9FfM6VkMy47hhYeZxLWo5JqflU1/3gDqEZVGMIBukA=
X-Gm-Gg: Acq92OE7BWBCRnPVLJDGzK3YjFGGUouFyoGv+fvQEubgfusYrK3bVIkS9uFCEVqJ2OO
	8R6mGAzo+Jy/Vhu8AnxAWW6zgP3PCt4hVGi+xYMI538eKA5lhAFS6hNlko4K3YiNkSvCuNbr0TU
	Cp7CUO6HamPWH0BJxznI40Uc93tk4+Ki29NYOMwc33nmqu7Rx2OF4dEZRY/B2HJpdZPv6YkuX7m
	N/yN0pGr29dUWuSedc2l0mFhRbKU9++EZW+28cGsmZqVwWZM1ZQz1W64R3JHErWILcv7egA/RDj
	Dw4Zv0BRHZLTmQQ59tBfBIPskW/TY+Ce212b4t+U/tBH8PB9h84ojDsooS26JXRpeTyNjPOl5Oz
	Y696OEpb+3ERZSkFoqpYKYsyRmuKHRwX1Hc/j0+eD5MkgdR3D1r8yha0am3yrkQKIAPXHmVU2RH
	NH4SxePkX1PMUF2gzi3dP52g==
X-Received: by 2002:a05:600c:8b31:b0:490:b28d:a6f9 with SMTP id 5b1f17b1804b1-490ec4a8474mr184582905e9.8.1781526590867;
        Mon, 15 Jun 2026 05:29:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3c22:dcc2:a51d:cde2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49220372ed0sm223313935e9.14.2026.06.15.05.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:29:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
In-Reply-To: <bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com> (Jian Hu's
	message of "Mon, 15 Jun 2026 19:25:20 +0800")
References: <20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com>
	<20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
	<1jecieftme.fsf@starbuckisacylon.baylibre.com>
	<bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Jun 2026 14:29:48 +0200
Message-ID: <1j7bo0dm0z.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_052953_402435_7E1D65E5 
X-CRM114-Status: GOOD (  26.68  )
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

T24gbHVuLiAxNSBqdWluIDIwMjYgYXQgMTk6MjUsIEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5j
b20+IHdyb3RlOgoKPiBPbiA2LzEwLzIwMjYgODo0OSBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToK
Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IE9uIG1lci4gMTAganVpbiAyMDI2IGF0IDE2OjE0
LCBKaWFuIEh1IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtqaWFuLmh1LmFtbG9naWMuY29tQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Pgo+Pj4gRnJvbTogSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNvbT4K
Pj4+Cj4+PiBBZGQgdGhlIHBlcmlwaGVyYWxzIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyIGZvciB0
aGUgQW1sb2dpYyBBOSBTb0MgZmFtaWx5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEppYW4gSHUg
PGppYW4uaHVAYW1sb2dpYy5jb20+Cj4+PiAtLS0KPj4+ICAgZHJpdmVycy9jbGsvbWVzb24vS2Nv
bmZpZyAgICAgICAgICB8ICAgMTUgKwo+Pj4gICBkcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSAg
ICAgICAgIHwgICAgMSArCj4+PiAgIGRyaXZlcnMvY2xrL21lc29uL2E5LXBlcmlwaGVyYWxzLmMg
fCAxOTI1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gICAzIGZpbGVz
IGNoYW5nZWQsIDE5NDEgaW5zZXJ0aW9ucygrKQo+Pj4KPgo+IFsgLi4uIF0KPgo+Pj4gKwo+Pj4g
Ky8qIENoYW5uZWwgNiBpcyB1bmNvbm5lY3RlZC4gKi8KPj4+ICtzdGF0aWMgdTMyIGE5X2dsYl9w
YXJlbnRzX3ZhbF90YWJsZVtdID0geyAwLCAxLCAyLCAzLCA0LCA1LCA3IH07Cj4+PiArc3RhdGlj
IHN0cnVjdCBjbGtfcmVnbWFwIGE5X2RzcGE7Cj4+IFdoYXQgaXMgdGhpcyA/Cj4KPgo+IFRoZSBw
ZXJpcGhlcmFsIGNsb2NrIGRlZmluaXRpb25zIGFyZSBvcmRlcmVkIGJ5IHJlZ2lzdGVyIG9mZnNl
dC4KPgo+IGRzcGEgaXMgb25lIG9mIHRoZSBwYXJlbnRzIG9mIHRoZSBnbGIgY2xvY2ssIHdoaWxl
IHRoZSBkc3AgY2xvY2sgcmVnaXN0ZXJzCj4gYXJlIGxvY2F0ZWQgYWZ0ZXIgdGhlIEdMQiBjbG9j
ayByZWdpc3RlcnMuCj4KPiBTaW5jZSBnbGIgcmVmZXJlbmNlcyBhOV9kc3BhIGJlZm9yZSBpdHMg
ZnVsbCBkZWZpbml0aW9uIGFwcGVhcnMsIHRoZQo+IGRlY2xhcmF0aW9uCj4KPiBzdGF0aWMgc3Ry
dWN0IGNsa19yZWdtYXAgYTlfZHNwYTsKPgo+IGlzIGFkZGVkIGFzIGEgZm9yd2FyZCBkZWNsYXJh
dGlvbiB0byBzYXRpc2Z5IHRoZSBjb21waWxlci4KPgo+Cj4gV291bGQgaXQgbWFrZSBzZW5zZSB0
byByZWxheCB0aGUgcmVnaXN0ZXItb2Zmc2V0IG9yZGVyaW5nIGluIHRoaXMgY2FzZT8KPgoKSSBk
b24ndCB0aGluayB3ZSBldmVyIGVuZm9yY2VkIHN1Y2ggb3JkZXJpbmcgKG9yIGFueSBvdGhlciBv
cmRlcmluZykgaW4KdGhlIGNsb2NrIGRyaXZlciwgc28geWVzIHBsZWFzZS4KCgo+IEJ5IGRlZmlu
aW5nIHRoZSBEU1AgY2xvY2sgYmVmb3JlIHRoZSBHTEIgY2xvY2ssIHdlIGNvdWxkIHJlbW92ZSB0
aGUgZm9yd2FyZAo+IGRlY2xhcmF0aW9uIG9mIGE5X2RzcGEuCgpVbmxlc3MgaXQgaXMgYWJzb2x1
dGVseSBuZWNlc3NhcnksIHBsZWFzZSBhdm9pZCBmb3J3YXJkIGRlY2xhcmF0aW9uLgoKRGVjbGFy
ZSB3aGF0IGlzIG5lZWRlZCBmaXJzdCwga2VlcCByZWxhdGVkIHRoaW5ncyB0b2dldGhlciBhbmQg
dXNlIHlvdXIKYmVzdCBqdWRnZW1lbnQgLi4uIElPVywgbWFrZSBpdCBlYXN5IGZvciBtZSB0byBy
ZXZpZXcgOykgCgo+Cj4+PiArCj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2Rh
dGEgYTlfZ2xiX3BhcmVudHNbXSA9IHsKPj4+ICt9OwoKWy4uLl0KCj4+PiArCj4+PiArc3RhdGlj
IHN0cnVjdCBjbGtfcmVnbWFwIGE5X3ZjbGtfZGl2Ml9lbiA9IHsKPj4+ICsgICAgIC5kYXRhID0g
JihzdHJ1Y3QgY2xrX3JlZ21hcF9nYXRlX2RhdGEpewo+Pj4gKyAgICAgICAgICAgICAub2Zmc2V0
ID0gVklEX0NMS19DVFJMLAo+Pj4gKyAgICAgICAgICAgICAuYml0X2lkeCA9IDEsCj4+PiArICAg
ICB9LAo+Pj4gKyAgICAgLmh3LmluaXQgPSBDTEtfSFdfSU5JVF9IVygidmNsa19kaXYyX2VuIiwg
JmE5X3ZjbGsuaHcsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZjbGtfcmVn
bWFwX2dhdGVfb3BzLCBDTEtfU0VUX1JBVEVfUEFSRU5UKSwKPj4+ICt9Owo+PiBMb29rcyB0byBt
ZSBhbGwgdGhpcyBkaXZfZW4gLyBkaXYgcmVwZWF0aW5nIHBhdHRlcm4gd291bGQgYmUgZWFzaWVy
IHRvIHJldmlldwo+PiB3aXRoIHRpbnkgbWFjcm8gLgo+Cj4KPiBHb29kIHBvaW50Lgo+Cj4gSSB0
cmllZCB0byByZWR1Y2UgdGhlIHJlcGVhdGVkIGRpdl9lbi9kaXYgcGF0dGVybiB1c2luZyBhIGhl
bHBlciBtYWNyby4KPgo+IEl0IGtlZXBzIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiBnYXRlIGFu
ZCBmaXhlZC1mYWN0b3IgY2xvY2sgbW9yZSBjb21wYWN0Cj4gYW5kIGVhc2llciB0byByZXZpZXcu
Cj4KPiBBZnRlciB1c2luZyB0aGUgaGVscGVyIG1hY3JvLCB0aGUgZGl2X2VuL2RpdiBjb2RlIGNh
biBiZSBzaW1wbGlmaWVkIHRvIHRoZQo+IGZvbGxvd2luZzoKPgo+ICNkZWZpbmUgQTlfVkNMSyhf
bmFtZSwgX3JlZywgX2JpdCwgX2RpdiwgX3BhcmVudCkgwqAgwqAgwqAgwqBcCj4gc3RydWN0IGNs
a19yZWdtYXAgYTlfIyNfbmFtZSMjX2VuID0geyDCoCDCoCDCoFwKICAgICAgICAgICAgICAgICAg
ICAgICBeLSBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5LCBhIHRvdWNoIHRvbyBhZ3Jlc3NpdmUKICAg
ICAgICAgICAgICAgICAgICAgICAgCgo+IMKgIMKgIMKgIMKgIC5kYXRhID0gJihzdHJ1Y3QgY2xr
X3JlZ21hcF9nYXRlX2RhdGEpeyDCoCDCoCDCoCDCoCDCoFwKPiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAub2Zmc2V0ID0gX3JlZywgwqAgwqAgwqBcCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
LmJpdF9pZHggPSBfYml0LCDCoCDCoCDCoCBcCj4gwqAgwqAgwqAgwqAgfSwgwqAgwqAgwqAgXAo+
IMKgIMKgIMKgIMKgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkgeyDCoCDCoCDC
oCDCoCDCoCBcCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLm5hbWUgPSAjX25hbWUgIl9lbiIs
IMKgIMKgIMKgXAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5vcHMgPSAmY2xrX3JlZ21hcF9n
YXRlX29wcywgwqAgwqAgwqAgwqAgwqAgXAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5wYXJl
bnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7IF9wYXJlbnQgfSzCoCDCoCBcCj4g
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLm51bV9wYXJlbnRzID0gMSwgwqAgwqAgwqBcCj4gwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZsYWdzID0gQ0xLX1NFVF9SQVRFX1BBUkVOVCwgwqAgwqAg
wqBcCj4gwqAgwqAgwqAgwqAgfSwgwqAgwqAgwqAgXAo+IH07IMKgIMKgIMKgIFwKPiDCoCDCoCDC
oCBcCj4gc3RydWN0IGNsa19maXhlZF9mYWN0b3IgYTlfIyNfbmFtZSA9IHsgwqAgwqAgwqAgXAo+
IMKgIMKgIMKgIMKgIC5tdWx0ID0gMSwgwqAgwqAgwqAgXAo+IMKgIMKgIMKgIMKgIC5kaXYgPSBf
ZGl2LCDCoCDCoCDCoCBcCj4gwqAgwqAgwqAgwqAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5p
dF9kYXRhKXsgwqAgwqAgwqAgwqAgwqBcCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLm5hbWUg
PSAjX25hbWUsIMKgIMKgIMKgXAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5vcHMgPSAmY2xr
X2ZpeGVkX2ZhY3Rvcl9vcHMsIMKgIMKgIMKgIMKgIMKgXAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIC5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7IMKgIMKgIMKgXAo+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZhOV8jI19uYW1lIyNfZW4uaHcg
wqAgwqAgwqAgwqAgwqBcCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSwgwqAgwqAgwqAgXAo+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5udW1fcGFyZW50cyA9IDEsIMKgIMKgIMKgXAo+IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5mbGFncyA9IENMS19TRVRfUkFURV9QQVJFTlQsIMKgIMKg
IMKgXAo+IMKgIMKgIMKgIMKgIH0sIMKgIMKgIMKgIFwKPiB9OyDCoCDCoCDCoCBcCj4KPiBzdGF0
aWMgQTlfVkNMSyh2Y2xrX2RpdjIsIFZJRF9DTEtfQ1RSTCwgMSwgMiwgJmE5X3ZjbGsuaHcpOwo+
IHN0YXRpYyBBOV9WQ0xLKHZjbGtfZGl2NCwgVklEX0NMS19DVFJMLCAyLCA0LCAmYTlfdmNsay5o
dyk7Cj4gc3RhdGljIEE5X1ZDTEsodmNsa19kaXY2LCBWSURfQ0xLX0NUUkwsIDMsIDYsICZhOV92
Y2xrLmh3KTsKPiBzdGF0aWMgQTlfVkNMSyh2Y2xrX2RpdjYsIFZJRF9DTEtfQ1RSTCwgNCwgMTIs
ICZhOV92Y2xrLmh3KTsKPiBzdGF0aWMgQTlfVkNMSyh2Y2xrMl9kaXYyLCBWSUlEX0NMS19DVFJM
LCAxLCAyLCAmYTlfdmNsazIuaHcpOwo+IHN0YXRpYyBBOV9WQ0xLKHZjbGsyX2RpdjQsIFZJSURf
Q0xLX0NUUkwsIDIsIDQsICZhOV92Y2xrMi5odyk7Cj4gc3RhdGljIEE5X1ZDTEsodmNsazJfZGl2
NiwgVklJRF9DTEtfQ1RSTCwgMywgNiwgJmE5X3ZjbGsyLmh3KTsKPiBzdGF0aWMgQTlfVkNMSyh2
Y2xrMl9kaXY2LCBWSUlEX0NMS19DVFJMLCA0LCAxMiwgJmE5X3ZjbGsyLmh3KTsKPgo+Cj4gSWYg
eW91IHRoaW5rIHNwbGl0dGluZyBpdCBmdXJ0aGVyIGludG8gc2VwYXJhdGUgaGVscGVyIG1hY3Jv
cyB3b3VsZCBpbXByb3ZlCj4gcmVhZGFiaWxpdHkuCgpPbmUgY2xvY2sgcGVyIG1hY3JvIHBsZWFz
ZS4gSGlkZGluZyAyIGRlY2xhcmF0aW9uIGlzIHJlY2lwZSBmb3IKZGlzYXN0ZXIuIEZvciBleCwg
aGVyZSB0aGUgZmlyc3Qgb25lIGlzIHN0YXRpYywgdGhlIDJuZCBpcyBub3QgCgo+Cj4gSSBjYW4g
ZG8gdGhhdCBhcyB3ZWxsLgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
