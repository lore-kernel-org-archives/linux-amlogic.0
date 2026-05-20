Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB3CCD5BAA
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2026 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AiR4YaSf0wUbFA3tpFPM/HKywByLIuzKRARCp4lkWD0=; b=5CY0wrLwZOgkFx
	IS9CFK0Genjw8eiKOL/y2fERFeMha59D4xY03t4ynd2r6fsvg8Tnm3Rd26lME63xQLUGmp9C6y1oo
	AbewG9SI2v9/sueIjaSdp7yN5195ERV41N0YM1zhq3uAMsJKvbjeNBcLbbcsUgSIeYq4wwjd1sS40
	xsCkeQPVdmNgv+lGmrb2TmtWDCPsR+gZ9MAsmUsEcjHUOxnIxjeSi87LAkoBu/UdDQ38HAAdowEKy
	JrUoWQKHySO9gj99nF9j9V2XMlkd8NqXLavdo2+w1EmZP8RTuvHe89PXB3XyfAnR5QXfPjDzjPSTV
	2tvX5wdaBLv1ZI1QsKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbHx-00000003msa-16zU;
	Wed, 20 May 2026 07:24:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbHt-00000003mri-2HkC
	for linux-amlogic@lists.infradead.org;
	Wed, 20 May 2026 07:24:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso43608415e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 20 May 2026 00:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779261855; x=1779866655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ohsf7Kwxw4dURrBVAg9+548r3Hkt++rO/LjKiVp3o1A=;
        b=aNf1OeXNpEnpmfHXbVV2yhqMNNHf33U0I2TYU4ovZw+UlfqP6VxdXYbschHJk1dDB6
         6N408cFbVK+0HVIQgpmbfUqoxGu3uJyqZ0XfxbwZzqn3KDpzbtJhlhQ/4H50V6B6aZte
         Nqr7b1P1+FpEud1PFZ6IUFWetjzFC5bg2p5akbh7eGDO1wfnlWEFlX7Ou6CXKUtC+myM
         lfgXZFjibGyOoBKQDmPgbkRVsdPXOyu7dD8p3bR4H79s6f+DLfwuPyHxflNu9Vuyt9mf
         8upvizBk90COU3iHwc3k9iZrBKs/8YG7Oarter/CcA0qhCk2M0niOJ8USxBkuwqXx8Xa
         t3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779261855; x=1779866655;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohsf7Kwxw4dURrBVAg9+548r3Hkt++rO/LjKiVp3o1A=;
        b=diV3zKmvtS9uM7H38NFXcSAsMmCr7j1FcNuv2sIsG7M0l6SvqHKZ1H64Dt3cFEoDsC
         934lwabZtSO3ASs7ne8iXf83AXLfuhtWQE0X13bHwK0TQlJMjQKUH6rLt+/U3FpOgYxq
         EP/EfSqbZlFQG10INXojeuYv3aA8q7u4HY9nsIqCb9YSRqFXVpzf/iGEXziBWslAo+YO
         OshMqpbra2Cu/kDvNS6PG4AmTYS51jOofuWci0lGL+UvVvXoQ/wycsFWz+DWVE0l+X0q
         0k9Z4K8LEwGYDhYdPxZXd89YG35HvCgrRMONd+WcuOadFkYbFfmMbSRr8KO7X8uL0/Np
         Mv6g==
X-Forwarded-Encrypted: i=1; AFNElJ86r7oh9RzVWWPOrXf2XxxkhNxUEBJeU1CtUS34OV5eLOsx77VGlp/ZF1Y9K5E5IpMItIfxXbtenRHMJdKR@lists.infradead.org
X-Gm-Message-State: AOJu0YwYIiu/L6yN4dPbQa2ILw3Xa1u610csKRQ/hp4Z99PpgiJGFqrq
	R57zLJjimzmIqy5pJ4TvJ5tG9J7Bi6H4lSgs0T53zF4xlSE1m4pUIHXsJ4F1NmHLyO0=
X-Gm-Gg: Acq92OFuRFkPVeqjdpyySAQ4l0OnGPsqKLhj8zxMtiCkvxeSLwEpoPQUK+np6RCvEht
	8YcMIbwQp/bmJ/PpPAqrq9LkMtHBVqFcjtS03Db8zToHZkQVc8w1pPEEzaOVLahy2Scw/rvB9Zs
	xBd+1r2S3pz9WVhcwWVHmPIwIOQbNn7vQPZSGWGFZOme+KbyKRtTkMlOrdP8/27rruqNs6WdB01
	sB8Ub0ySraY7tUAv4KAQ6pu5bHF8TDn8P+XQuoJdk2ALgYK103O7UhpKEpDGPrjuSqvsmVVsDu0
	cAs+Oe3vHMYu/lstsnnUt1ptXkmYSoft6U63x+xvwE3NzfSXUP2BWDgtE4DSlsrHHTKs7mR6pPC
	YMnHFNFbAzYFyFxMOAYQs9M/xX5XUkrWVQQeXfxXwyHSM4o4xmjZinkhBJX8x9d/jzFCl1W/tgl
	roEgZDYiSR85/cXZHX5alaBQ==
X-Received: by 2002:a05:600c:c0d0:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48fe53774b4mr270166855e9.8.1779261855105;
        Wed, 20 May 2026 00:24:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fa19:c0c9:991f:186d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49008c047absm86786415e9.0.2026.05.20.00.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:24:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
In-Reply-To: <d023303e-e785-4b60-85cd-c83cc3f890e4@amlogic.com> (Jian Hu's
	message of "Wed, 20 May 2026 11:25:35 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
	<1jse7u6n3q.fsf@starbuckisacylon.baylibre.com>
	<d023303e-e785-4b60-85cd-c83cc3f890e4@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 20 May 2026 09:24:12 +0200
Message-ID: <1jwlwy5ysj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_002417_611051_8FC1DD3E 
X-CRM114-Status: GOOD (  19.29  )
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

T24gbWVyLiAyMCBtYWkgMjAyNiBhdCAxMToyNSwgSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNv
bT4gd3JvdGU6Cgo+IE9uIDUvMTQvMjAyNiAxMToxMyBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToK
Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IE9uIGx1bi4gMTEgbWFpIDIwMjYgYXQgMjA6NDcs
IEppYW4gSHUgdmlhIEI0IFJlbGF5IDxkZXZudWxsK2ppYW4uaHUuYW1sb2dpYy5jb21Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4+Cj4+PiBGcm9tOiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+
Pj4KPj4+IGxfZGV0ZWN0IGNvbnRyb2xzIHRoZSBlbmFibGUvZGlzYWJsZSBvZiB0aGUgUExMIGxv
Y2stZGV0ZWN0IG1vZHVsZS4KPj4+Cj4+PiBGb3IgQTksIHRoZSBsX2RldGVjdCBzaWduYWwgaXMg
YWN0aXZlLWhpZ2g6Cj4+PiAwIC0+IERpc2FibGUgbG9jay1kZXRlY3QgbW9kdWxlOwo+Pj4gMSAt
PiBFbmFibGUgbG9jay1kZXRlY3QgbW9kdWxlLgo+Pj4KPj4+IEhlcmUsIGEgZmxhZyBDTEtfTUVT
T05fUExMX0xfREVURUNUX0FDVElWRV9ISUdIIGlzIGFkZGVkIHRvIGhhbmRsZSBjYXNlcwo+Pj4g
bGlrZSBBOSwgd2hlcmUgdGhlIHNpZ25hbCBpcyBhY3RpdmUtaGlnaC4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+Pj4gLS0tCj4+PiAgIGRyaXZl
cnMvY2xrL21lc29uL2Nsay1wbGwuYyB8IDkgKysrKysrKy0tCj4+PiAgIGRyaXZlcnMvY2xrL21l
c29uL2Nsay1wbGwuaCB8IDIgKysKPj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29u
L2Nsay1wbGwuYyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+Pj4gaW5kZXggMWVhNjU3
OWE3NjBmLi41YTBiZDc1Zjg1YTkgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9j
bGstcGxsLmMKPj4+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+Pj4gQEAgLTM4
OCw4ICszODgsMTMgQEAgc3RhdGljIGludCBtZXNvbl9jbGtfcGxsX2VuYWJsZShzdHJ1Y3QgY2xr
X2h3ICpodykKPj4+ICAgICAgICB9Cj4+Pgo+Pj4gICAgICAgIGlmIChNRVNPTl9QQVJNX0FQUExJ
Q0FCTEUoJnBsbC0+bF9kZXRlY3QpKSB7Cj4+PiAtICAgICAgICAgICAgIG1lc29uX3Bhcm1fd3Jp
dGUoY2xrLT5tYXAsICZwbGwtPmxfZGV0ZWN0LCAxKTsKPj4+IC0gICAgICAgICAgICAgbWVzb25f
cGFybV93cml0ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDApOwo+Pj4gKyAgICAgICAgICAg
ICBpZiAocGxsLT5mbGFncyAmIENMS19NRVNPTl9QTExfTF9ERVRFQ1RfQUNUSVZFX0hJR0gpIHsK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICBtZXNvbl9wYXJtX3dyaXRlKGNsay0+bWFwLCAmcGxs
LT5sX2RldGVjdCwgMCk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgbWVzb25fcGFybV93cml0
ZShjbGstPm1hcCwgJnBsbC0+bF9kZXRlY3QsIDEpOwo+Pj4gKyAgICAgICAgICAgICB9IGVsc2Ug
ewo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZw
bGwtPmxfZGV0ZWN0LCAxKTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICBtZXNvbl9wYXJtX3dy
aXRlKGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwgMCk7Cj4+PiArICAgICAgICAgICAgIH0KPj4g
SSdtIG5vdCBhIGZhbiBvZiB0aGlzIGNvZGUgZHVwbGljYXRpb24uCj4+IFVzZSB0aGUgaW50cm9k
dWNlZCBDTEtfTUVTT05fUExMX0xfREVURUNUX0FDVElWRV9ISUdIIHRvIGNvbXB1dGUgdGhlCj4+
IGZpcnN0IHZhbHVlLCB0aGVuIGZsaXAgdGhlIGJpdC4KPgo+Cj4gT2ssIEkgd2lsbCB1cGRhdGUg
dGhpcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Cj4gSGVyZSBpcyB0aGUgdXBkYXRlZCBjb2RlOgo+
Cj4gwqAgwqAgwqAgwqAgaWYgKE1FU09OX1BBUk1fQVBQTElDQUJMRSgmcGxsLT5sX2RldGVjdCkp
IHsKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBtZXNvbl9wYXJtX3dyaXRl
KGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAhKHBsbC0+ZmxhZ3MgJgo+IENMS19NRVNPTl9QTExfTF9ERVRFQ1RfQUNUSVZFX0hJ
R0gpKTsKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBtZXNvbl9wYXJtX3dy
aXRlKGNsay0+bWFwLCAmcGxsLT5sX2RldGVjdCwKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAhIShwbGwtPmZsYWdzICYKPiBDTEtfTUVTT05fUExMX0xfREVURUNUX0FDVElW
RV9ISUdIKSk7CgpQbGVhc2UgdXNlIGEgdmFyaWFibGUuIE1ha2UgaXQgY2xlYW4gCgo+IMKgIMKg
IMKgIMKgIH0KPgo+Pj4gICAgICAgIH0KPj4+Cj4+PiAgICAgICAgaWYgKG1lc29uX2Nsa19wbGxf
d2FpdF9sb2NrKGh3KSkKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxs
LmggYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmgKPj4+IGluZGV4IDk0OTE1N2ZiN2JmNS4u
OTdiN2M3MDM3NmEzIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5o
Cj4+PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmgKPj4+IEBAIC0yOSw2ICsyOSw4
IEBAIHN0cnVjdCBwbGxfbXVsdF9yYW5nZSB7Cj4+Pgo+Pj4gICAjZGVmaW5lIENMS19NRVNPTl9Q
TExfUk9VTkRfQ0xPU0VTVCAgQklUKDApCj4+PiAgICNkZWZpbmUgQ0xLX01FU09OX1BMTF9OT0lO
SVRfRU5BQkxFRCBCSVQoMSkKPj4+ICsvKiBsX2RldGVjdCBzaWduYWwgaXMgYWN0aXZlLWhpZ2gg
Ki8KPj4+ICsjZGVmaW5lIENMS19NRVNPTl9QTExfTF9ERVRFQ1RfQUNUSVZFX0hJR0ggICBCSVQo
MikKPj4+Cj4+PiAgIHN0cnVjdCBtZXNvbl9jbGtfcGxsX2RhdGEgewo+Pj4gICAgICAgIHN0cnVj
dCBwYXJtIGVuOwo+PiAtLQo+PiBKZXJvbWUKPgo+IEJlc3QgcmVnYXJkcywKPgo+IEppYW4KCi0t
IApKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
