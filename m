Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0494C77B7C
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 19:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxsCsVPcPp80qEGKgtfJifQS6CiFaGAuM+wsnK7Ll40=; b=hnR+HGhEWQFGuk
	ngKfb50bwmoDBkJbPtkeZkD1Dw2l6nwosIlHN76dodLHXq95zB7bAKXsQf5LqzuIX/vQym0qVzDMY
	2qsKvHkGpqoLLaopbcz7/Mnns+wVSFTbVlmfOY6N1l4NS1lGft7tqhARxPixVrURp++CGikyWR+Sx
	bRBy9FKDuHtaQBIPoUPx3grCGgvAiX315kCb+yJSquSjDUr/Zgue2/wTA8iedADm/DfTM9aXX2fO3
	Ze6qM6xj+UauRS4wttLqmPBzfId9QZ9bHW1v/CuA0xP+c6ifBGyW/szdovK847V7xEqgUe5muu9Qx
	TE8gzQMN2MFx0IDUx0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYrA-00Gclm-2L;
	Mon, 01 May 2023 19:06:40 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYr7-00Gciq-2N;
	Mon, 01 May 2023 19:06:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-95f4c5cb755so573688766b.0;
        Mon, 01 May 2023 12:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682967996; x=1685559996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbK7EtQRtZZE7KYEeoJBLaWKVzPK4dKamhRK6nyLgos=;
        b=IOKOgtayzfFZNsyi1stDP8bgZ2e8StGU6AXpOokekL9MEPm8GXe3VVJMt94V5DwdEM
         ATKwwwmalpAfY1y3ljA9x93gRbYm86ihqRakr7DtMI9ZAvHu4/Xs6P92b7aiNugQszBm
         mqqxxLmirHC+gAs0Yx2c5Kru6Ep97A/IaHWdSPh3TuZ1xx8AJlB21C0UZNlroQL3+CbI
         KvqjNd8TDpgSNIJLqROqTJv8HrTCVenOUH8bCNKlW5s9PK8cbQKVXSX9ahZv9ZMy5vAG
         B699V9dmeE2OyfAQ+qFqLCps61OUjvCXCzwMouYAxCdkpDi57VxOLyxpHBGR96pBt4rT
         C3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682967996; x=1685559996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbK7EtQRtZZE7KYEeoJBLaWKVzPK4dKamhRK6nyLgos=;
        b=QUkpNyO6nhzNq4QVuwpVTkyXp5p/x9Cwbf9xIVmON5kb3wntBtQvdTjwNIfmHPvs9K
         VOpjCn+Lcu3RIbuzuPaybnYEnsACMB9sJ6oG7DkG8xf6ga4PW9ZYOYwBklWItEMr43YJ
         vm1OyldpIJgsoo3usG6UlwSi23ITG5dekZtTgZOsW4WFCxVZMtvSBntggm4ufseb3Eu2
         laRL9Kwp/iOVIZlTKwefubKNi5QNPvpiehgvjcHlMCz90N0b7XDErP9ts/shtWwiLBDU
         r4uhw9K985Zz3tbattoILjjQ3+Ff6GztDgP5Va7Xg1v/tV4zSYkS602YXJvnDyfUXmW4
         N1bw==
X-Gm-Message-State: AC+VfDx1l8lHpUPugr7fY01UBQnHdMOninW9NKVYl5uOpKXP7deIb65w
	VhRog0554G/qHkNybrb0mJZAZS0aqbLU44e03wk=
X-Google-Smtp-Source: ACHHUZ5qgzS3PhkmnYZSPw1/CWfO5K2yQvVRa39/ZwKaLWKwP2rgTDXwfMm6qXhJyEvt0k+aENNNLDiUmPBDvWB5QjA=
X-Received: by 2002:a17:906:9b86:b0:957:2a7e:ce0a with SMTP id
 dd6-20020a1709069b8600b009572a7ece0amr14352840ejc.44.1682967996043; Mon, 01
 May 2023 12:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru> <20230426095805.15338-7-ddrokosov@sberdevices.ru>
In-Reply-To: <20230426095805.15338-7-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 1 May 2023 21:06:24 +0200
Message-ID: <CAFBinCA2OhtVaCJDi8ZfAFLSE4oUgxYBDScaP_WW63curEK8Mg@mail.gmail.com>
Subject: Re: [PATCH v14 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_120637_772025_32A179B3 
X-CRM114-Status: GOOD (  13.99  )
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

SGkgRG1pdHJ5LAoKb3ZlcmFsbCB0aGlzIGxvb2tzIHByZXR0eSBnb29kLgoKK0NjIEhlaW5lcgoK
T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTE6NTjigK9BTSBEbWl0cnkgUm9rb3Nvdgo8ZGRyb2tv
c292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKWy4uLl0KPiArc3RhdGljIHN0cnVjdCBjbGtfcmVn
bWFwIHB3bV9hX3NlbCA9IHsKPiArICAgICAgIC5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21hcF9t
dXhfZGF0YSl7Cj4gKyAgICAgICAgICAgICAgIC5vZmZzZXQgPSBQV01fQ0xLX0FCX0NUUkwsCj4g
KyAgICAgICAgICAgICAgIC5tYXNrID0gMHgxLAo+ICsgICAgICAgICAgICAgICAuc2hpZnQgPSA5
LAo+ICsgICAgICAgfSwKPiArICAgICAgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0
YSl7Cj4gKyAgICAgICAgICAgICAgIC5uYW1lID0gInB3bV9hX3NlbCIsCj4gKyAgICAgICAgICAg
ICAgIC5vcHMgPSAmY2xrX3JlZ21hcF9tdXhfb3BzLAo+ICsgICAgICAgICAgICAgICAucGFyZW50
X2RhdGEgPSBwd21fYWJjZF9wYXJlbnRzLAo+ICsgICAgICAgICAgICAgICAubnVtX3BhcmVudHMg
PSBBUlJBWV9TSVpFKHB3bV9hYmNkX3BhcmVudHMpLAo+ICsgICAgICAgICAgICAgICAvKiBGb3Ig
bW9yZSBpbmZvcm1hdGlvbiwgcGxlYXNlIHJlZmVyIHRvIHJ0YyBjbG9jayAqLwo+ICsgICAgICAg
ICAgICAgICAuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQsCkhlaW5lciBpcyB3b3Jr
aW5nIG9uIGEgc2VyaWVzIHRoYXQgYWRkcyBjb21tb24gY2xvY2sgc3VwcG9ydCB0byB0aGUKUFdN
IGRyaXZlciBbMF0uCkkgdGhpbmsgaGlzIHBsYW5zIGZvciBhIG5leHQgc3RlcCBhcmUgYWRkaW5n
IHN1cHBvcnQgZm9yIFNvQ3Mgd2hlcmUKdGhlIFBXTSBjbG9ja3MgYXJlIHBhcnQgb2YgdGhlIHBl
cmlwaGVyYWwgY2xvY2sgY29udHJvbGxlciAoaW5zdGVhZCBvZgpiZWluZyBwYXJ0IG9mIHRoZSBQ
V00gY29udHJvbGxlciByZWdpc3RlcnMpLgoKSGF2ZSB5b3UgY29uc2lkZXJlZCByZW1vdmluZyBD
TEtfU0VUX1JBVEVfUEFSRU5UIGZyb20gdGhlICZydGMgY2xvY2sKc28gZG93bnN0cmVhbSBjbG9j
a3Mgd29uJ3QgY2hhbmdlIHRoZSBydGMgY2xvY2sgcmF0ZSBieSBhY2NpZGVudD8KVGhlbiB3ZSBj
b3VsZCBkcm9wIHRoZSBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQgZmxhZyBmcm9tIHRoZSBQV00K
Y2xvY2tzIHRvIGFsbG93IHRoZW0gdG8gcGljayB0aGUgYmVzdCBhdmFpbGFibGUgcGFyZW50ICh3
aGV0aGVyIHRoYXQncwp0aGUgcnRjIGNsb2NrLCB4dGFsIG9yIHN5c19wbGwpLgpUaGF0IHNhaWQs
IGl0IHdvdWxkIHJlcXVpcmUgbWFuYWdpbmcgdGhlIENMS0lEX1JUQ18zMktfU0VMIGNsb2NrIChv
cgppdCdzIHBhcmVudHMpIHVzaW5nIGFzc2lnbmVkLWNsb2NrcyBpbnN0ZWFkIG9mIGRvaW5nIHNv
IHdpdGggdGhlIFBXTQooYW5kIG90aGVyKSBjbG9ja3MuIFdoZXRoZXIgdGhpcyB3b3VsZCBjYXVz
ZSBwcm9ibGVtczogSSdtIG5vdCBzdXJlLApzbyBJJ20gaG9waW5nIHRoYXQgeW91IGNhbiBzaGFy
ZSBzb21lIGluc2lnaHRzLgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgoKWzBdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvOWZhY2EyZTYtYjdhMS00NzQ4LTdlYjAtNDhmODA2
NGUzMjNlQGdtYWlsLmNvbS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
