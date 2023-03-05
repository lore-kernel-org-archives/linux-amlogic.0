Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B81BC678DB
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stgHsbPDOWpVxaIMdQlGQKKyKZ/cYV02Vg7RCoKcFi4=; b=pLI0bGug11MlaU
	uEhM5thMBGvxhl13ovTIMpr3vTSzGCJjojS4usmBF1Ufc/rggwuzA03uNsrrdJhm++YG3tZhbN9OJ
	8PX+qLULAeT0OA81gdRf8MJZA8rTSUgl635afLawC94ofsYP8/NaXs/lntoLrO/CG9XeyyzUNS3w5
	MgGrM9Je431qwI8q+J5U58N1jzksfb8DOLFgb6i7R4kiUY6Py1tlWjdSe431maudX+NjinqskVHor
	UUcrvxkJwKLhactosufJA1Q5zNYtJxneeflgCL4VB8hslv/0aX6sXju9AZgWanDiUtRU3wknes6Ba
	qX3xsMxMuhdjQosKdcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYoiR-00AIAW-78; Sun, 05 Mar 2023 13:47:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYoiG-00AI7g-Hn; Sun, 05 Mar 2023 13:47:45 +0000
Received: by mail-wr1-x42a.google.com with SMTP id e13so6329370wro.10;
        Sun, 05 Mar 2023 05:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgccpFC0cmADrFfCEi9mRisLTkUSblVIUuRK9wVI2oc=;
        b=BIEgwxzU2sKD58+jNWAw4z4k9A5hBzcNmLPvel+XTp5zgg2dkmqKS8Ph/VhWIaKzlk
         4p4oYr6T2lxSwyVUbQzJZ0L/xgRsKoxaUYoDtNVuTRVZQIAszAdSH5I8PauvEJYfYeWU
         CIK0PIPc6Eb2H3R+ZtpO6q0vjotS0nrLwrqxuZPq41GQI+xz3tjPheuzm+n5mh+wcDB/
         qlUHMtHAqqjWswTW3E4kkhh+Fqet9UG427afoO39HfNSHSVVwdH9rZi8xIdeLzxv1Z08
         O9WYWnLHIEwV8pnGEShyXv1yVAEOkEaDd5RpQkDniv3TbwqHQ7VtRJMGMmVZQ9mFEBl4
         XB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgccpFC0cmADrFfCEi9mRisLTkUSblVIUuRK9wVI2oc=;
        b=n7GsBhbfMA9fa63m2MJrXMEyvDkBev+ejHrnUM5aHwqVHbCKswlfTi6TLoAqGz978u
         gL2P92Z6tXINKiN4v5DMmODxRMoidPRYFk+Z6aB+ZH01H8B3B8E/jj1kPFHnHJ4r20wo
         2bAuP9UNMeHGziaOh9kZGORhsGrHMiBTpvc+gevNEWs8FF6p7XNYu/bLIj4hEYaIT6hQ
         5qtRodtzO9gqNEzmEFb+0ujf06Fj3tTlGJymSJnn1VxX8bJs3JJ5PStw/Ta17L2Czs6V
         Ojy1ZsK8q5yf2MtizVQ8raC6zgraCRYIVDvYXtTmlHrhbtij/P8d+lG0GV5p0MD5dGaT
         hhYQ==
X-Gm-Message-State: AO0yUKVwmhXW3I48WxqBpPO5bofWDLzv00B6QtC1wi88SSHRh4Uh5Kd0
	Jg/obrptJ2/8JmkD6h+9j5flbBK8Dq892Q==
X-Google-Smtp-Source: AK7set/4CfbD2Va0TPMevPmj8KPXfN+Sc7iATlgyiEG3NUSXqB8JwjyKi60XS/M2/2ED+FuhJ6lk8Q==
X-Received: by 2002:adf:e74a:0:b0:2c7:efb:dded with SMTP id c10-20020adfe74a000000b002c70efbddedmr5669098wrn.24.1678024062276;
        Sun, 05 Mar 2023 05:47:42 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id r4-20020a5d4944000000b002c56013c07fsm7313389wrs.109.2023.03.05.05.47.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Mar 2023 05:47:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 2/2] arm64: dts: meson: add support for BananaPi M2S
 variants
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <0d2184ee-679e-371e-8433-c38b22c97799@linaro.org>
Date: Sun, 5 Mar 2023 17:47:38 +0400
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org
Message-Id: <9CC246C2-28A7-46DF-924F-8FBF5CDE16CA@gmail.com>
References: <20230305132044.1596320-1-christianshewitt@gmail.com>
 <20230305132044.1596320-3-christianshewitt@gmail.com>
 <0d2184ee-679e-371e-8433-c38b22c97799@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_054744_610224_4CA64442 
X-CRM114-Status: GOOD (  10.07  )
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

Cj4gT24gNSBNYXIgMjAyMywgYXQgNTozMCBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiAKPiBPbiAwNS8wMy8yMDIzIDE0OjIw
LCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+PiBCYW5hbmFQaSBNMlMgc2hpcHMgaW4gQW1sb2dp
YyBTOTIyWCBhbmQgQTMxMUQgdmFyaWFudHMgd2l0aCB0aGUKPj4gZm9sbG93aW5nIGNvbW1vbiBz
cGVjaWZpY2F0aW9uczoKPj4gCj4gKC4uLikKPiAKPj4gKwo+PiArCWxlZHMgewo+PiArCQljb21w
YXRpYmxlID0gImdwaW8tbGVkcyI7Cj4+ICsKPj4gKwkJYmx1ZSB7Cj4gCj4gbGVkLTAKPiAKPiBE
b2VzIG5vdCBsb29rIGxpa2UgeW91IHRlc3RlZCB0aGUgRFRTIGFnYWluc3QgYmluZGluZ3MuIFBs
ZWFzZSBydW4gYG1ha2UKPiBkdGJzX2NoZWNrYCAoc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy93cml0aW5nLXNjaGVtYS5yc3QKPiBmb3IgaW5zdHJ1Y3Rpb25zKS4KCknigJlt
IGJ1aWxkaW5nIGV2ZXJ5dGhpbmcgaW4gYSBjcm9zcy1jb21waWxlIGJ1aWxkIHN5c3RlbSB0aGF0
IGRvZXNu4oCZdCBhbGxvdwp0aGlzIHRvIGJlIGRvbmUgd2l0aG91dCBhIHByb2JsZW0gYW1vdW50
IG9mIGhvb3AganVtcGluZy4gSSBuZWVkIHRvIHdvcmsgb24KYW5vdGhlciBhcnJhbmdlbWVudCB0
byBkbyB0aGlzIHRlc3RpbmcgKHdvcmstaW4tcHJvZ3Jlc3MpLiBUaGFua3MgZm9yIHRoZQppbnB1
dC4KCkNocmlzdGlhbgoKPj4gKwkJCWNvbG9yID0gPExFRF9DT0xPUl9JRF9CTFVFPjsKPj4gKwkJ
CWZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX1NUQVRVUzsKPj4gKwkJCWdwaW9zID0gPCZncGlvX2Fv
IEdQSU9BT183IEdQSU9fQUNUSVZFX0xPVz47Cj4+ICsJCQlsaW51eCxkZWZhdWx0LXRyaWdnZXIg
PSAiaGVhcnRiZWF0IjsKPj4gKwkJfTsKPj4gKwo+PiArCQlncmVlbiB7Cj4gCj4gbGVkLTEKPiAK
Pj4gKwkJCWNvbG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47Cj4+ICsJCQlmdW5jdGlvbiA9IExF
RF9GVU5DVElPTl9TVEFUVVM7Cj4+ICsJCQlncGlvcyA9IDwmZ3Bpb19hbyBHUElPQU9fMiBHUElP
X0FDVElWRV9MT1c+Owo+PiArCQl9Owo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
