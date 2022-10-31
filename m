Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EFFECAAA1
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 16:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bs1enNYR/eJJUisUwiW+YUtQpUrCwNol5VzE9AdLulo=; b=EGj2X3FF0BlVa1
	OoDTGL8n4kVUILAEUgpBzZeLRIl71slIM7hWw54ypZY0M4w5cNnSl8bSe3KPlKaV3NVqNlhxD/OZM
	ZJtb+uyDVcHMFf9GPSHh4J02i7s4rka3RF19/cw1rAOYZnZ3CiWcJRA9gnfklRd9LhJcWLHUGqNjj
	sApBk9EA+UYzY8sWJRvc/vGBP/O40KBwQSBLFCH9eYch17Me1fTFxlc6f45Iw3VVy1nNT1H083AH1
	9xbiCBSW9Zyg1DunOcHncUsUK2+qRtxpyj4UsYfzEv1jg2K6V4szWvP+IjFQW24UR/E8yUFw0WHU1
	Ug25b6+C8bgGSfuuZaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXxE-00D5fi-0U; Mon, 31 Oct 2022 16:48:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXwi-00D5TQ-4P
	for linux-amlogic@lists.infradead.org; Mon, 31 Oct 2022 16:47:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id y16so16778423wrt.12
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Oct 2022 09:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKTqAkxJgMWx6sBMNSE6aZbt6frvVDq8u09kfz+kAfA=;
        b=XRcmdZ4LO0owByPD5STPLCr2UYHDXmzbX7K1uLrLp0SOM6/QXVwHX3X/2izgX3DHeH
         3a2gczFLc9gHwDbBwP0MIcHXlUV3cfdvLKA9fvVBskFtLJ7is1P2OXUnb6A6mJpEUggS
         wwQ2XyG/maewHSkOjIZf6kvSFpAmaqpe1pJ4lM0I7bm67V7sPrSDC1ZWc71YEjcL2Eom
         YLg2hj89uMii3gfsoP1q7wpIJNDsktqDsrj+3G60XoWQH7u5Zd1a6mkr1yK3Vb9kj0UN
         0KTuqzbDJkpIbsOM53u0t2oN+9xPygxvlJzEGfDNrKoBYJvr/XFbUf0P8v+PiKSUG+wR
         ZY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKTqAkxJgMWx6sBMNSE6aZbt6frvVDq8u09kfz+kAfA=;
        b=4ur1uyl+65e3rD9D89cFhSyuNJv7AtdUnGTeuRYa6iWmgfBvSRbdU2RgfLygAHL0u2
         30ucmKodKM26TbuJ8wEOw3KAje3zLk6zKZURCAvJa0n4Kp7b2PkQ9FC7BDkiZbw1p0kZ
         tLJq6E1pSwOgB/GIz/UqcVx/qi+sjG4j/Gf/RPgx0qzUQoiRLnvy+4uRg3Ztjy6EX1+F
         /LT87PJQPELyWLiAc0GsmoBlPnlxztWyorHobjmwWnDAO1/PhFCWLG3m9ao0oV0OLTb7
         vDjmUsONBFeelILuDVJvJUWrdn1/h6xRIRGFxnIuOPIY3tE2feM2hQ3fsnGIb38klILQ
         oQTg==
X-Gm-Message-State: ACrzQf2DRlzDD58j8sC+h0BCW9MhuFAOWfApIaEhzZa7owjLRwFolhcu
	CqkZyAeC4OL3/AStzT7nIdV4RQ==
X-Google-Smtp-Source: AMsMyM4jP4ham9rkHQIKGWu7iRmlbMIYmA2Dcqhqsr+EJ555arOEBiRDyVkQMUQq9czGPTPFVQelzA==
X-Received: by 2002:a5d:4b90:0:b0:236:702f:2093 with SMTP id b16-20020a5d4b90000000b00236702f2093mr9210941wrt.577.1667234850953;
        Mon, 31 Oct 2022 09:47:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600c46c800b003b4868eb71bsm7488871wmo.25.2022.10.31.09.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:47:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Oct 2022 17:47:27 +0100
Subject: [PATCH 3/4] dt-bindings: amlogic: document Odroid Go Ultra compatible
MIME-Version: 1.0
Message-Id: <20221031-b4-odroid-go-ultra-initial-v1-3-42e3dbea86d5@linaro.org>
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Sebastian Reichel <sre@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_094732_229149_6E114652 
X-CRM114-Status: UNSURE (   7.28  )
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

VGhpcyBkb2N1bWVudHMgdGhlIE9kcm9pZCBHbyBVbHRyYSwgYSBwb3J0YWJsZSBnYW1pbmcgZGV2
aWNlLAp3aXRoIHRoZSBmb2xsb3dpbmcgY2hhcmFjdGVyaXN0aWNzOgotIEFtbG9naWMgUzkyMlgg
U29DCi0gUks4MTcgJiBSSzgxOCBQTUlDcwotIDJHaUIgTFBERFI0Ci0gT24gYm9hcmQgMTZHaUIg
ZU1NQwotIE1pY3JvIFNEIENhcmQgc2xvdAotIDVpbmNoIDg1NMOXNDgwIE1JUEktRFNJIFRGVCBM
Q0QKLSBFYXJwaG9uZSBzdGVyZW8gamFjaywgMC41V2F0dCA4zqkgTW9ubyBzcGVha2VyCi0gTGkt
UG9seW1lciAzLjdWLzQwMDBtQWggQmF0dGVyeQotIFVTQi1BIDIuMCBIb3N0IENvbm5lY3Rvcgot
IHgxNiBHUElPIElucHV0IEJ1dHRvbnMKLSAyeCBBREMgQW5hbG9nIEpveXN0aWNrcwotIFVTQi1D
IFBvcnQgZm9yIFVTQjIgRGV2aWNlIGFuZCBDaGFyZ2luZwoKU2lnbmVkLW9mZi1ieTogTmVpbCBB
cm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9hbWxvZ2ljLnlhbWwKaW5kZXggOWZkYTI0MzZjNjE4Li5lMTZiNWZhNTU4NDcgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55
YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55
YW1sCkBAIC0xNjMsNiArMTYzLDcgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgICAgLSBhencs
Z3NraW5nLXgKICAgICAgICAgICAgICAgLSBhencsZ3RraW5nCiAgICAgICAgICAgICAgIC0gYXp3
LGd0a2luZy1wcm8KKyAgICAgICAgICAgICAgLSBoYXJka2VybmVsLG9kcm9pZC1nby11bHRyYQog
ICAgICAgICAgICAgICAtIGhhcmRrZXJuZWwsb2Ryb2lkLW4yCiAgICAgICAgICAgICAgIC0gaGFy
ZGtlcm5lbCxvZHJvaWQtbjItcGx1cwogICAgICAgICAgICAgICAtIGtoYWRhcyx2aW0zCgotLSAK
YjQgMC4xMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
