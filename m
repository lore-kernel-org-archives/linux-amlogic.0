Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21BBC7EE26
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 May 2023 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRtDg0Wt1hStOwZ0j/DGfr4yys38Ma7B4nyaP6aSQfU=; b=JC0a9A95+FnmsU
	tV6WnCaIuJ3m1tYVrmjHXw5MdY4hjAQlfBUOlg+uWVYV2qQwAGXDt4hNM1cTXNo1DvzN8X8+MOasz
	hP2dIQUpZYFmIAPSQNMc1qsNYalzrc8/UXtrhUtWjeGoIisVsLWfZJnc00Q8tvHoQ/P2ggBkxO+DP
	2KB8J3Is8hVdfh3nq0gqpONZVIogNTQFlgbO0YmpvI98R1PbVZm6Q3w0t6XzngrIQHJLMPdjDHAuv
	Jh3CO0Dd+HaSwsTZhnWICtZRJsr/bC5gjkmxil54a1sqloJ9eU8l/Nm7Pj27julKPiD/c09f/pgBR
	8OAM09mIeA00dROEPGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q07M9-00HEit-1V;
	Fri, 19 May 2023 21:09:45 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q07M6-00HEiH-1O;
	Fri, 19 May 2023 21:09:44 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-965d2749e2eso575399066b.1;
        Fri, 19 May 2023 14:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684530580; x=1687122580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TorRBbiNSrshF0ap3UL67FrkImFt8D/40YtUQbz9REQ=;
        b=dpaHBYN0mAs5TZA7Iw/DfHqd5WpnxHSJmDSJe2Y/Qv7suXxR+zk9+Y/a8oNdaR5xs1
         KubdtoNaExtjhH4Ci1MCYZObY1Ei4uK19ae26VvY/zHjHESnwmEqTBuYpn0NRy8O2CHB
         XfYU/6neCWR/C5ivNQvsB15+a5rPECxIb6RWOO39MlCGQ9LmmFXEOTjok03KbvEEBWEQ
         IqOkWYomFa7p9KiFiArPe3YXNBSTDVp5fC0rmo525fVCAhYeZ6+kdmcWbKoQ1Qnc6CqH
         Pws5Ptp20mQwd87vfjkoFPqQffwywoaVjpnvQPhXW2/DRtEFciU3RoEXoHZWvAJGh+oE
         kj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684530580; x=1687122580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TorRBbiNSrshF0ap3UL67FrkImFt8D/40YtUQbz9REQ=;
        b=dil46JRwyEWDRn66HA1QvVlI+qRusO5ZBdBntGQfVC36ZMW1yaRc5JrVOsA6rNbhpv
         MlXKbrJ0cd8/KhRRas7qv3iRBjt0T1OIZSfNWYnGMNoqsgCrNhyiwG/zFGxE/Gf7TD4J
         hqthmu9SlHhiL7zMqCThG11x9kcT7/sGYHeqWyrdcpTMZvDpNHP6i5z08vxHz7vDdOvX
         gJ5GfKbTp0X1BU5IG6g5vDmh9seXjHdqnDAjmaF9NTI9WB7LlrlOs+bdsTshoJTy13YW
         3ntaJ4ud1Z9kkOpkBBTHrj0lXbz/gW1DtKxbWvzqwGsOzFkNYGBaotRqSJ4kxON5j4Ze
         5KHA==
X-Gm-Message-State: AC+VfDyCi0iJNJJb6lDDzUylJkFHRl8BkpxVZV/a6S/8Nb5fxLb/jDxV
	G1st/wDmXWBO0gV4uiyPy8DfLFlyIkuPx2cBwvY=
X-Google-Smtp-Source: ACHHUZ6s33Zsi7MTUXzy5qgLERqDb+ABr1XwN5aDTGrd5iCKsQ+pQKlGN2FqdAmEp4ZnNXjwMFvf+/hgUtyP29y/vHc=
X-Received: by 2002:a17:907:971f:b0:96a:ec5c:687b with SMTP id
 jg31-20020a170907971f00b0096aec5c687bmr3096717ejc.64.1684530579899; Fri, 19
 May 2023 14:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230517133309.9874-1-ddrokosov@sberdevices.ru> <20230517133309.9874-6-ddrokosov@sberdevices.ru>
In-Reply-To: <20230517133309.9874-6-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 19 May 2023 23:09:29 +0200
Message-ID: <CAFBinCC3kQ9Nz3R2W-Qj9tbPJfS8JsB_4AkmPgS6xpQ96DBy2w@mail.gmail.com>
Subject: Re: [PATCH v15 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, krzysztof.kozlowski+dt@linaro.org
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, khilman@baylibre.com, 
	jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_140943_449623_EE58DCAF 
X-CRM114-Status: GOOD (  11.54  )
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

SGkgS3J6eXN6dG9mIGFuZCBEbWl0cnksCgpPbiBXZWQsIE1heSAxNywgMjAyMyBhdCAzOjMz4oCv
UE0gRG1pdHJ5IFJva29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6ClsuLi5d
Cj4gKyAgY2xvY2tzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGlucHV0
IGZpeGVkIHBsbCBkaXYyCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGlucHV0IGZpeGVkIHBsbCBk
aXYzCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGlucHV0IGZpeGVkIHBsbCBkaXY1Cj4gKyAgICAg
IC0gZGVzY3JpcHRpb246IGlucHV0IGZpeGVkIHBsbCBkaXY3Cj4gKyAgICAgIC0gZGVzY3JpcHRp
b246IGlucHV0IGhpZmkgcGxsCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGlucHV0IG9zY2lsbGF0
b3IgKHVzdWFsbHkgYXQgMjRNSHopCj4gKwo+ICsgIGNsb2NrLW5hbWVzOgo+ICsgICAgaXRlbXM6
Cj4gKyAgICAgIC0gY29uc3Q6IGZjbGtfZGl2Mgo+ICsgICAgICAtIGNvbnN0OiBmY2xrX2RpdjMK
PiArICAgICAgLSBjb25zdDogZmNsa19kaXY1Cj4gKyAgICAgIC0gY29uc3Q6IGZjbGtfZGl2Nwo+
ICsgICAgICAtIGNvbnN0OiBoaWZpX3BsbAo+ICsgICAgICAtIGNvbnN0OiB4dGFsClRoaXMgSVAg
YmxvY2sgaGFzIGF0IGxlYXN0IG9uZSBhZGRpdGlvbmFsIGlucHV0IGNhbGxlZCAic3lzX3BsbF9k
aXYxNiIuCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgInN5c19wbGxfZGl2MTYiIGNsb2Nr
IGlzIGdlbmVyYXRlZCBieSB0aGUKQ1BVIGNsb2NrIGNvbnRyb2xsZXIuIFN1cHBvcnQgZm9yIHRo
ZSBDUFUgY2xvY2sgY29udHJvbGxlcgooZHQtYmluZGluZ3MgYW5kIGEgZHJpdmVyKSB3aWxsIGJl
IGFkZGVkIGF0IGEgbGF0ZXIgdGltZSBieSBEbWl0cnkuCkhvdyBjYW4gd2UgbWFuYWdlIGluY3Jl
bWVudGFsbHkgaW1wbGVtZW50aW5nIHRoZSBjbG9jayBjb250cm9sbGVycz8KRnJvbSBhIGhhcmR3
YXJlIHBlcnNwZWN0aXZlIHRoZSAic3lzX3BsbF9kaXYxNiIgaW5wdXQgaXMgbWFuZGF0b3J5LgpI
b3cgdG8gbWFuYWdlIHRoaXMgaW4gdGhlIC5kdHMgcGF0Y2hlcyB0aGVuIChmb3IgZXhhbXBsZTog
ZG9lcyB0aGlzCm1lYW4gdGhhdCBEbWl0cnkgY2FuIG9ubHkgYWRkIHRoZSBjbG9jayBjb250cm9s
bGVyIHRvIHRoZSAuZHRzIHdoZW4KYWxsIGNsb2NrIGNvbnRyb2xsZXIgYmluZGluZ3MgaGF2ZSBi
ZWVuIGltcGxlbWVudGVkIC0gb3IgaXMgdGhlcmUKYW5vdGhlciB3YXkpPwoKCkJlc3QgcmVnYXJk
cywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
