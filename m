Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6241AC4828D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmruBFZdh3pS8KWgl6ZK0MAbiUBKIZuwUsCa9nW6/S4=; b=mUR9k0M5rPXEWN
	6jlLa0IpUSwE9kuU0fp75JBMOhKtxCHdYkQIPT7LknFIK+SfuiWkH88PCc8YWQUmmlLerWMoEYvnq
	WeYL0LAnOm/aGs5QjMonCfiEGxschNynPOvfYfnPicfaU9fss201RGsLa4wZDG2N9JM94kWTDhm9s
	xYtx0kJrZJSYVXGD9JGuxv1Boe6sM6NvGPEM9yOmW0fEukzyPIaSivxCANO3z7t8UYHm32vcJQJAq
	KVmQMIeFnO05g1EzISusSqHyoDQWeiuxbNBJ7MjkAu6B0l7JAxsq6Gqe3tdnxdse79CT4SX3i5icN
	EdJiOAuC5SzGzU6q7rGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXGH1-00000006Laz-3JgT;
	Tue, 06 Feb 2024 07:53:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXGGy-00000006LZc-0pxu;
	Tue, 06 Feb 2024 07:53:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40fe282b8adso2474125e9.2;
        Mon, 05 Feb 2024 23:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707206017; x=1707810817; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfkBm1RhD0fBqif8h7QjuzJWyO2tJjvDMiDZcwNsAPg=;
        b=DYQaYYqarVhmththXz0lWpqOvkjkDf43cqp7cTwZogPu0mvssNvsoHHNZ7ygeIt3L7
         nMjisqSEHFZ3vIIxWNyeJvshG3J6o1BcZRnHf69DKptVK8Az/vb5h1ZQUlrRD27r1PY5
         AfQqFTkFpVn9+gRWaHAlJyEf3wmZav9o8GF2UH/O0kbuL9tI7gV6ZXK9gv+b2ELZ4ah1
         KZZC6xVpr/52vltMoZpe3d2sqNpEdKm90osPjToMV9DURGfH5zc23bXQiX8LmmbNL/hn
         dg72pA/StBDqhfoSfiTlv3XSUFyVuNMx0GtL3WAHiEiUG2YfICCjR0JKwUlxwmdH/JNw
         dM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707206017; x=1707810817;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfkBm1RhD0fBqif8h7QjuzJWyO2tJjvDMiDZcwNsAPg=;
        b=nZxgh8Mjuc/XZJ7Vn6zWwaYOzm1WwBdmGf5mjz0rgqmuFdC55p/7l6RjhDw09u9/rF
         FKuulK0eJzvdANnlJohv9MSQFMDx0CbNXJ4nUYNIdJuoOzrRbFWGfXQEQcI+eGNqLVzx
         EVax4DFngf0bysn8Z9teBcyLZhR9lyxy4V/zcP3cPuNJWlbfopqN7zwWDbh7+Nh3eRCM
         +zNH93IRzrpug6UeWJ1+b1QudUNljOPQopH1tPMDRBUfUiKpbDy1CBCGJL1UovCNw+F+
         6Zw6FEJXCa6y4ePo6kG/caEftogscgZbgW5SmWy6ZSwqvWs4AYpyLI4EDEc2b8EblIfa
         Jl+g==
X-Gm-Message-State: AOJu0YwtWdTSYS8WknDurror+AwfZYUvBwoDMebWHlTQypHo0koC+kkt
	jSFpADpfMyosgbSXpgsX5RflcLF5yueEPm9LHbRSPaMLPavalVISff0cajva1DO6zg==
X-Google-Smtp-Source: AGHT+IEkxytFY/M7v//MYcmidm4cgYusdjWKs3q86A1TUXUqt3jP1s6OjJY1u1rglqfVV597ka2Dzg==
X-Received: by 2002:a05:600c:511a:b0:40f:dd91:2d06 with SMTP id o26-20020a05600c511a00b0040fdd912d06mr1483545wms.32.1707206016988;
        Mon, 05 Feb 2024 23:53:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUCzbly27GvMKMmnHbmpUcxQJNeYbM47wEtSHLWabBiurZKyKWh49Lz4iBP4jbXue+rmAlQwV/GUKAZVhSZYzoNp/PSnkviJ5DZIhCznLX+ZqBW5kL3E58zGL4IhmL2cjYNXFOEbOnvVpAuTfWZhZ8vcYtsQLeO1eDr3zWM66TVUdfc5P7MS1R+MpUnxjlIxGLzU7uy289P73Xeo/WSW2L38L/r+cJ92XOfzD2cWga6qtZFC4JTyCgEn0+5cIMy+P9SWvxzYE/GYA95GjjXrrRG8Tp08gxzZg3dtLiJzGQa+6GJKpXPcs+hcMMXQzm4xEyAfUsJiMF3Q7uTIT8OdpVVNlawYaJImFVJ66cb4E2hypzDnq5yZ0NePmDdlkNmtKfB5mWagTYqwV0eYePM2EnBh8Rk0j6CX8W360MJ5ic7spXAFvsjGh4XVbCAYkKph5VoFAf+bf14DtFpXAGGb0qrMN4FSKw=
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id n29-20020a05600c3b9d00b0040ef2e7041esm1093717wms.6.2024.02.05.23.53.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Feb 2024 23:53:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCHv1 3/5] arm64: dts: amlogic: Add cache information to the
 Amlogic G12A SoCS
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <4248e19e-5f2f-4e4f-a869-a0fec81b16bd@lexina.in>
Date: Tue, 6 Feb 2024 11:53:22 +0400
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AML <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Viacheslav <adeep@lexina.in>
Message-Id: <E850AF1E-BF7E-45F7-8AF0-68B548166094@gmail.com>
References: <20240205171930.968-1-linux.amoon@gmail.com>
 <20240205171930.968-4-linux.amoon@gmail.com>
 <4248e19e-5f2f-4e4f-a869-a0fec81b16bd@lexina.in>
To: Anand Moon <linux.amoon@gmail.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_235340_260910_A4FEF360 
X-CRM114-Status: GOOD (  15.06  )
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

PiBPbiA2IEZlYiAyMDI0LCBhdCAxMTo0OOKAr2FtLCBWaWFjaGVzbGF2IDxhZGVlcEBsZXhpbmEu
aW4+IHdyb3RlOgo+IAo+IFlvdSBtaXNzZWQgdGhlIEFYRyBmYW1pbHkgd2l0aCB0aGUgQ29ydGV4
LUE1MyBDUFUuIFRoZSBkYXRhc2hlZXQgZG9lcyBub3QgcHJvdmlkZSBpbmZvcm1hdGlvbiBvbiBj
YWNoZSBzaXplcy4gR2l2ZW4gdGhhdCB0aGUgQTExM1gvQTExM0QgYXJlIGVxdWlwcGVkIHdpdGgg
dGhlIEFybSBDb3J0ZXgtQTUzIHByb2Nlc3NvciwgaXQgaXMgYXNzdW1lZCB0aGV5IHVzZSB0aGUg
c2FtZSBjYWNoZSBzaXplIGFzIHRoZSBTOTA1L1M5MDVYL1M5MDVYMiBtb2RlbHMuCgpHWE0gaXMg
YWxzbyBtaXNzaW5nLCBhbmQgYWxzbyB1c2luZyBBNTMgY29yZXMuCgpDaHJpc3RpYW4KCj4gMDUv
MDIvMjAyNCAyMC4xOSwgQW5hbmQgTW9vbiB3cm90ZToKPj4gQXMgcGVyIHRoZSBTOTA1WDIgZGF0
YXNoZWV0IGFkZCBtaXNzaW5nIGNhY2hlIGluZm9ybWF0aW9uIHRvIHRoZSBBbWxvZ2ljCj4+IEcx
MkEgU29DLgo+PiAtIEVhY2ggQ29ydGV4LUE1MyBjb3JlIGhhcyAzMktCIG9mIEwxIGluc3RydWN0
aW9uIGNhY2hlIGF2YWlsYWJsZSBhbmQKPj4gMzJLQiBvZiBMMSBkYXRhIGNhY2hlIGF2YWlsYWJs
ZS4KPj4gLSBBbG9uZyB3aXRoIDUxMktCIFVuaWZpZWQgTDIgY2FjaGUuCj4+IFRvIGltcHJvdmUg
c3lzdGVtIHBlcmZvcm1hbmNlLgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5h
bW9vbkBnbWFpbC5jb20+Cj4+IC0tLQo+PiBObyBwdWJsaWMgZGF0YWhlZXQgYXZhaWxhYmxlLCBz
aW5jZSBTOTA1WDIgc3VwcG9ydCBBcm0gQ29ydGV4LUE1MyBjcHUKPj4gbmVuY2UgdXNlZCB0aGUg
c2FtZSBjYWNoZSBzaXplIGFzIFM5MDUgYW5kIFM5MDVYLgo+PiAtLS0KPj4gIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLmR0c2kgfCAyNyArKysrKysrKysrKysrKysrKysr
KysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4+IGRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYS5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEuZHRzaQo+PiBpbmRleCA1NDNlNzA2NjlkZjUuLjZl
MWUzYTNmNWYxOCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLWcxMmEuZHRzaQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
ZzEyYS5kdHNpCj4+IEBAIC0xNyw2ICsxNywxMiBAQCBjcHUwOiBjcHVAMCB7Cj4+ICAgY29tcGF0
aWJsZSA9ICJhcm0sY29ydGV4LWE1MyI7Cj4+ICAgcmVnID0gPDB4MCAweDA+Owo+PiAgIGVuYWJs
ZS1tZXRob2QgPSAicHNjaSI7Cj4+ICsgZC1jYWNoZS1saW5lLXNpemUgPSA8MzI+Owo+PiArIGQt
Y2FjaGUtc2l6ZSA9IDwweDgwMDA+Owo+PiArIGQtY2FjaGUtc2V0cyA9IDwzMj47Cj4+ICsgaS1j
YWNoZS1saW5lLXNpemUgPSA8MzI+Owo+PiArIGktY2FjaGUtc2l6ZSA9IDwweDgwMDA+Owo+PiAr
IGktY2FjaGUtc2V0cyA9IDwzMj47Cj4+ICAgbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDI+Owo+PiAg
ICNjb29saW5nLWNlbGxzID0gPDI+Owo+PiAgIH07Cj4+IEBAIC0yNiw2ICszMiwxMiBAQCBjcHUx
OiBjcHVAMSB7Cj4+ICAgY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE1MyI7Cj4+ICAgcmVnID0g
PDB4MCAweDE+Owo+PiAgIGVuYWJsZS1tZXRob2QgPSAicHNjaSI7Cj4+ICsgZC1jYWNoZS1saW5l
LXNpemUgPSA8MzI+Owo+PiArIGQtY2FjaGUtc2l6ZSA9IDwweDgwMDA+Owo+PiArIGQtY2FjaGUt
c2V0cyA9IDwzMj47Cj4+ICsgaS1jYWNoZS1saW5lLXNpemUgPSA8MzI+Owo+PiArIGktY2FjaGUt
c2l6ZSA9IDwweDgwMDA+Owo+PiArIGktY2FjaGUtc2V0cyA9IDwzMj47Cj4+ICAgbmV4dC1sZXZl
bC1jYWNoZSA9IDwmbDI+Owo+PiAgICNjb29saW5nLWNlbGxzID0gPDI+Owo+PiAgIH07Cj4+IEBA
IC0zNSw2ICs0NywxMiBAQCBjcHUyOiBjcHVAMiB7Cj4+ICAgY29tcGF0aWJsZSA9ICJhcm0sY29y
dGV4LWE1MyI7Cj4+ICAgcmVnID0gPDB4MCAweDI+Owo+PiAgIGVuYWJsZS1tZXRob2QgPSAicHNj
aSI7Cj4+ICsgZC1jYWNoZS1saW5lLXNpemUgPSA8MzI+Owo+PiArIGQtY2FjaGUtc2l6ZSA9IDww
eDgwMDA+Owo+PiArIGQtY2FjaGUtc2V0cyA9IDwzMj47Cj4+ICsgaS1jYWNoZS1saW5lLXNpemUg
PSA8MzI+Owo+PiArIGktY2FjaGUtc2l6ZSA9IDwweDgwMDA+Owo+PiArIGktY2FjaGUtc2V0cyA9
IDwzMj47Cj4+ICAgbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDI+Owo+PiAgICNjb29saW5nLWNlbGxz
ID0gPDI+Owo+PiAgIH07Cj4+IEBAIC00NCw2ICs2MiwxMiBAQCBjcHUzOiBjcHVAMyB7Cj4+ICAg
Y29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE1MyI7Cj4+ICAgcmVnID0gPDB4MCAweDM+Owo+PiAg
IGVuYWJsZS1tZXRob2QgPSAicHNjaSI7Cj4+ICsgZC1jYWNoZS1saW5lLXNpemUgPSA8MzI+Owo+
PiArIGQtY2FjaGUtc2l6ZSA9IDwweDgwMDA+Owo+PiArIGQtY2FjaGUtc2V0cyA9IDwzMj47Cj4+
ICsgaS1jYWNoZS1saW5lLXNpemUgPSA8MzI+Owo+PiArIGktY2FjaGUtc2l6ZSA9IDwweDgwMDA+
Owo+PiArIGktY2FjaGUtc2V0cyA9IDwzMj47Cj4+ICAgbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDI+
Owo+PiAgICNjb29saW5nLWNlbGxzID0gPDI+Owo+PiAgIH07Cj4+IEBAIC01Miw2ICs3Niw5IEBA
IGwyOiBsMi1jYWNoZTAgewo+PiAgIGNvbXBhdGlibGUgPSAiY2FjaGUiOwo+PiAgIGNhY2hlLWxl
dmVsID0gPDI+Owo+PiAgIGNhY2hlLXVuaWZpZWQ7Cj4+ICsgY2FjaGUtc2l6ZSA9IDwweDdkMDAw
PjsgLyogTDIuIDUxMiBLQiAqLwo+PiArIGNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47Cj4+ICsgY2Fj
aGUtc2V0cyA9IDw1MTI+Owo+PiAgIH07Cj4+ICAgfTsKPj4gIAo+IAo+IAo+IEJlc3QgcmVnYXJk
cywKPiAtLQo+IFZpYWNoZXNsYXYgQm9jaGFyb3YgPGFkZWVwQGxleGluYS5pbj4KPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0Cj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
