Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386D6C47BCB
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 09:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Rxqe3gOXnneUcqLGICeEu6Hu5/sL7GVDbJpb/Z2WKE=; b=irZc5NrOSEdVUf
	2978E2SeZjArzExR+RygMfhGl/YdT+6o0pbh8LfCelFtcSYQtOt63Vp1Vku3zNyW5oztdfTcBw4T8
	6trfHIsD9StWeFnRffan0AYVvsGY9AL4YxXca3JqbXCgP9U4pEYmWGcOaPTFzs+dXB4hgYHYFk44d
	aWzVNOKqP464IxO8k4dIxZH+RSvkGQJt1GjOR07RjnLEQ5FPhwxn/ETmgjFQF2IJCqUVC0oeEjCAL
	eOIC/K517deN2Hgl0JuPL4mzsyl0DXijQh371CAbQUpW9nneXQVH8CZ1rbT3UDB05APteoxsctLy7
	bU/YKVlP2p1kTuEmXjpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd32p-0000000CfWu-3L61;
	Tue, 06 Jan 2026 09:08:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd32m-0000000CfV4-0zIK
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 09:08:02 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a09757004cso9453775ad.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 01:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767690479; x=1768295279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ng1O6r3g3fw5/a6Cbf+5U6aFI9SGtJM1t6RTyf6QqZ0=;
        b=dZTdZWh470BylIel35V8rLay2NzQr6DKj3iahrnItFj/krK0bDZUWVwcrREJorM2mQ
         lNi5/pkkpnXIl5/dUDJaGZCUxRFqNLHIMXZ9ILHdFjA3lbK2SJMV6O27RvHezpyC0/hA
         sUFx7zZqPBQskIZlOpV9BKAYiab3z/xboxenWKSzNulPNr6cKvNYmAlZ64XXyjgdVm4R
         DhZmoRQOaFzPOQMwBGJa03gD8BNy8u++21x+SruR7VANGKv9QlaldsNeNKpjACUtz4LM
         wNigVoY2TgvCnuWkmEWGPmfbabifF0JMAjlUkh8ZyXjVCcl3bMXhpqII88hhYAaQ2qj3
         ugAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690479; x=1768295279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ng1O6r3g3fw5/a6Cbf+5U6aFI9SGtJM1t6RTyf6QqZ0=;
        b=ruHsUtzeUJVakFawYwmvTdTY6ph9EKsrpflmGSNbdpdlPuaYLWFH+cF45nX5Hkd2gA
         R2LP4WMSf/ZZx8mTwNVKwhZwCbxAjN32pEg9WFXgGs+9WLas2f2h3PVT7iSeiK9KGbb5
         +ucQk9A0Y62IOGi5fStqvhF+exQcRmLeGK8OjIreWxfQw0YrqHUYWzVOcJDcBHjGaH2L
         ylGe6IMFSfoPoQkUsAYbLSUMXmc9VTAtEnvoXxLeY7lpNNPh8u1jh3VWBCMTM9ff7yAm
         JiHKacl0o8V/P1rEtYaw5eTQXHAfk6y++OHNRa6oW1RpJI3e5qgS/TOT89ceVLQrw6YD
         hYWw==
X-Gm-Message-State: AOJu0YxtaLSg7UV6W5AdZunwWV4io3YINqeg6q+HVPhG7ibk6RKTv4Vm
	7uknzlEZryTX6obmof/wuJmdMnwU6CGH0qXCNKaxG67kUPoDEw2N0aod+10/H7MJ75prlBk8GTj
	L5gK44mXU36KGnPO1DLcgJGMzq87P9yU82A==
X-Gm-Gg: AY/fxX7uJ4/YzFsN7QRMOnxQOCFGRRkLe7cwl3Op1AeCyzXp2YLX7uZX2iLDBvqHDes
	8rzc7C6js9NFX/TWVkA7eLoAnPx96E96buZdjnOdWtke7roTEz4tezgrXxaSBrYJ113aVknr5wF
	M3dUOWgQJ/nme+4Rq39Uqmnzh0Rt8cj27QZnuiXrsLAnRr+bINC6NkaNb7fsl8WEWmiicNYzpEn
	kd6ewjR4glZSjN87vMFnHu4V9xxvLpytMF7YAzaMHxJZYUm3EJ/M6sWGhLioTWxYXMLelR+OMl8
	JNiIcRM7RbAQLdr+lXvRMfAsHKQ=
X-Google-Smtp-Source: AGHT+IGvgGC1dgkt7wuMnmSCuPWWqlGjRV0GwcsdQ/Sq5EQ7QxT7kYX/RKSYc+hqxzm3Sblq3B8Wpb0Bsh7gDiAoQ0w=
X-Received: by 2002:a17:903:b10:b0:2a0:8966:7c9a with SMTP id
 d9443c01a7336-2a3e2df5419mr19705135ad.58.1767690479185; Tue, 06 Jan 2026
 01:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20251108211503.1578711-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20251108211503.1578711-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 10:07:48 +0100
X-Gm-Features: AQt7F2q3nwKPMxa1oOETiD35RsxTmLu3g29Iap0HmNIWj-OuXkkF_dQhuThhVVg
Message-ID: <CAFBinCDQojLyznKTxn+fGgq21Wd+eFFjTPc=a8Dw+xMnwy1S2A@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: meson: drop iio-hwmon in favour of generic-adc-thermal
To: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_010800_265257_1B855F75 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

SGkgTmVpbCwKCk9uIFNhdCwgTm92IDgsIDIwMjUgYXQgMTA6MTXigK9QTSBNYXJ0aW4gQmx1bWVu
c3RpbmdsCjxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+IENv
bW1pdCA4NWIyMWZkZWM5MDZlICgidGhlcm1hbC9kcml2ZXJzL2dlbmVyaWMtYWRjOiBSZWdpc3Rl
ciB0aGVybWFsCj4gem9uZXMgYXMgaHdtb24gc2Vuc29ycyIpIG1hZGUgImdlbmVyaWMtYWRjLXRo
ZXJtYWwiIGFsc28gcmVnaXN0ZXIgaHdtb24KPiBhdHRyaWJ1dGVzLiBUaGF0IG1lYW5zIHdlIG5v
dyBoYXZlIHRoZSB0ZW1wZXJhdHVyZSBzZW5zb3Igc2hvd24gdHdpY2U6Cj4gLSBvbmNlIGZyb20g
aWlvLWh3bW9uCj4gLSBhbmQgYW5vdGhlciB0aW1lIGZyb20gZ2VuZXJpYy1hZGMtdGhlcm1hbAo+
Cj4gV2UgbmVlZCB0aGUgbGF0dGVyIGZvciBTb0MgdGVtcGVyYXR1cmUgY29udHJvbCwgc28gc2lt
cGx5IGRyb3AgdGhlCj4gZm9ybWVyIHNvIHVzZXJzcGFjZSBkb2Vzbid0IHNlZSBkdXBsaWNhdGUg
c2Vuc29ycy4gQWxzbwo+IGdlbmVyaWMtYWRjLXRoZXJtYWwgcHJvdmlkZXMgYSBiZXR0ZXIgbmFt
ZSB0byB1c2Vyc3BhY2UKPiAoInNvY190aGVybWFsLXZpcnR1YWwtMCIpIHRoYW4gaWlvX2h3bW9u
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0
aW5nbEBnb29nbGVtYWlsLmNvbT4KZ2VudGxlIHBpbmcgb24gdGhpcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
