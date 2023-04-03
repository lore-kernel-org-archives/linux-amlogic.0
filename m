Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83140C76188
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 20:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UguCO8fdbGp9BLJh0vh/Ojq8bmtJ17NY4mxRLbf7Drg=; b=rdQ0gKZXfXFEqo
	sJVtSp1IdVqPJcwqH0a+hH9grtFyZivsCp8jqVNMMJKYcKVcu5aM9fK4b3vUUhB6HKbn7CDRaUCfu
	AeQ/I8dYq14TTlzPB087nljXSfUVmWzL+jt4m84WKeHwBqGKZ131DhC93S5fjgNG1LWogyAV6+cG+
	/IEdwXGiVDFRCv8aRnNyA76wmw1WuRSjR9pmIDK7X4/Z3mEoaG/X5dxBbvY3iRpvvMUeR3wJuWiJ+
	LWoHKlyqQEzoR7zqD8gtQ7eCVc9uINzLPUwhgjODO0jhEwpTLvzR2USPZ2sypuA7EJZAjeRu3aXJo
	A8CyBBNIL1fHxUWCK4Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQqy-00GeLH-0c;
	Mon, 03 Apr 2023 20:32:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQqu-00GeJR-17;
	Mon, 03 Apr 2023 20:32:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id m2so30647821wrh.6;
        Mon, 03 Apr 2023 13:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680553949;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ey2H8pEuNuKHyUoN1U05NLZzezgDa8OosuFB18eS3w=;
        b=Xn9NBm6y/Gk8de23mO2NnmpY7bZcX+OYSyKDlf8d2ZfM48aZER1PSKuBPdMkmmZ8Sr
         C3UpfxpYBNL9T/rYLAs0w6HZkq7x1yBlt7QTAzwzk8ZxXc+MCKncNODWTETICyC9RGu5
         R7kmwYSOmA34ZOQr2/hTjerqlIWVUTWJLM8r8Z3M3OTUOvmihl1XtwuQ4dcVQAcpYKjN
         im6jnrvB0hCNpGT3Selb0cpy6sjZ6TUqQL3YISnxbmOp52QdQSeojZxwCTJLBWfH+gkA
         JCI70EdzUfUFyYgi9JLHMeCg0aiiSV0dnI2Hbrq2xxrUyMNq9qXGRG1j5BGUBdTz/uhp
         st3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680553949;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ey2H8pEuNuKHyUoN1U05NLZzezgDa8OosuFB18eS3w=;
        b=y8MbwXF7nnoagcthLbHQIQvgIb/1Dz9X+c1AQCmbj1EMa53oXmxVDW3eV/cnsXHcYs
         8k2h8yF4htoXB3Jq/QT6Yn/lcG4PI32/MUTlv6qAZ+ntYk6W5hXem5WwIwbxN5nYGq8T
         Pnho+HBxIOLBHpqXfj9EoP+oR1LFQk30QWeRy5Wr5mYSUQo2bOsfjdjWALANl4kjo87U
         4iIaOsVATPSzmDfj+dR+YfMdO+aA+wR8olGKul8e+c/tRyEcNg94/Oge4A524pgQcclC
         /i645YduLhi2kSSORJIQvKnpn0mpeAng6n57O9iX91XNBmbTVLAu20iXdUoLh800Lvzf
         QElg==
X-Gm-Message-State: AAQBX9c3DaFJaVbt5N0u3aygSWpGNBjJvqidF2GPaJDDep26JrzpSs/a
	/KCDFQKHqnad9gR0qe60dP4=
X-Google-Smtp-Source: AKy350Y09nlt7QoZGjLJyFWkQV13w+lVrMWv7/7Who3S4/dEjy3tvnn7xWuhBrJDNLqEN6arcEq8tg==
X-Received: by 2002:a5d:4847:0:b0:2cf:e956:9740 with SMTP id n7-20020a5d4847000000b002cfe9569740mr14083669wrs.6.1680553948870;
        Mon, 03 Apr 2023 13:32:28 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b9a3:9100:5849:b3bc:e358:e393? (dynamic-2a01-0c23-b9a3-9100-5849-b3bc-e358-e393.c23.pool.telefonica.de. [2a01:c23:b9a3:9100:5849:b3bc:e358:e393])
        by smtp.googlemail.com with ESMTPSA id b2-20020a5d4b82000000b002d828a9f9ddsm10432160wrt.115.2023.04.03.13.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 13:32:28 -0700 (PDT)
Message-ID: <16b9c260-d744-eba3-5c88-e511465bb94e@gmail.com>
Date: Mon, 3 Apr 2023 22:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Chris Healy <cphealy@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <8d309575-067c-7321-33cf-6ffac11f7c8d@gmail.com>
 <CAFXsbZq=uzfFjkYw3eWuTjvcGpn6TSoc_OJYCwgthr5jU9qBpQ@mail.gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: enable edpd tunable support
 for G12A internal PHY
In-Reply-To: <CAFXsbZq=uzfFjkYw3eWuTjvcGpn6TSoc_OJYCwgthr5jU9qBpQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_133232_397736_4D5C0D5E 
X-CRM114-Status: GOOD (  14.84  )
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

T24gMDMuMDQuMjAyMyAyMjoyNCwgQ2hyaXMgSGVhbHkgd3JvdGU6Cj4gT24gTW9uLCBBcHIgMywg
MjAyMyBhdCAxMjozNeKAr1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+
IHdyb3RlOgo+Pgo+PiBFbmFibGUgRURQRCBQSFkgdHVuYWJsZSBzdXBwb3J0IGZvciB0aGUgRzEy
QSBpbnRlcm5hbCBQSFksIHJldXNpbmcgdGhlCj4+IHJlY2VudGx5IGFkZGVkIHR1bmFibGUgc3Vw
cG9ydCBpbiB0aGUgc21zYyBkcml2ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxs
d2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9uZXQvcGh5L21l
c29uLWd4bC5jIHwgNCArKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9waHkvbWVzb24tZ3hsLmMgYi9kcml2ZXJzL25l
dC9waHkvbWVzb24tZ3hsLmMKPj4gaW5kZXggM2RlYTdjNzUyLi5iYjliMzNiNmIgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvbmV0L3BoeS9tZXNvbi1neGwuYwo+PiArKysgYi9kcml2ZXJzL25ldC9w
aHkvbWVzb24tZ3hsLmMKPj4gQEAgLTIxMCw2ICsyMTAsMTAgQEAgc3RhdGljIHN0cnVjdCBwaHlf
ZHJpdmVyIG1lc29uX2d4bF9waHlbXSA9IHsKPj4gICAgICAgICAgICAgICAgIC5yZWFkX3N0YXR1
cyAgICA9IGxhbjg3eHhfcmVhZF9zdGF0dXMsCj4+ICAgICAgICAgICAgICAgICAuY29uZmlnX2lu
dHIgICAgPSBzbXNjX3BoeV9jb25maWdfaW50ciwKPj4gICAgICAgICAgICAgICAgIC5oYW5kbGVf
aW50ZXJydXB0ID0gc21zY19waHlfaGFuZGxlX2ludGVycnVwdCwKPj4gKwo+PiArICAgICAgICAg
ICAgICAgLmdldF90dW5hYmxlICAgID0gc21zY19waHlfZ2V0X3R1bmFibGUsCj4+ICsgICAgICAg
ICAgICAgICAuc2V0X3R1bmFibGUgICAgPSBzbXNjX3BoeV9zZXRfdHVuYWJsZSwKPj4gKwo+PiAg
ICAgICAgICAgICAgICAgLnN1c3BlbmQgICAgICAgID0gZ2VucGh5X3N1c3BlbmQsCj4gV2h5IGFk
ZCB0aGUgZW1wdHkgbGluZXMgYmVmb3JlIGFuZCBhZnRlciB0aGUgdHdvIG5ldyBsaW5lcz8KPiAK
SnVzdCBmb3IgcmVhZGFiaWxpdHksIGJlY2F1c2UgdGhlc2UgdHdvIGVudHJpZXMgYmVsb25nIHRv
Z2V0aGVyLgpTb21ldGltZXMgaXQncyBhIGxpdHRsZSBoYXJkIHRvIHJlYWQgaWYgZHJpdmVycyBo
YXZlIDEwKyBjYWxsYmFja3MKaW4gYSBmbGF0IGxpc3QgaW4gZGlmZmVyZW50LCBhcmJpdHJhcnkg
b3JkZXIuCgo+PiAgICAgICAgICAgICAgICAgLnJlc3VtZSAgICAgICAgID0gZ2VucGh5X3Jlc3Vt
ZSwKPj4gICAgICAgICAgICAgICAgIC5yZWFkX21tZCAgICAgICA9IGdlbnBoeV9yZWFkX21tZF91
bnN1cHBvcnRlZCwKPj4gLS0KPj4gMi40MC4wCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
