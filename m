Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8367EEB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAEYsMq9n7tJNr+y89mtZHX2uIbRjlPNUlb1nO0+v98=; b=SDhniiVyeFCmlL
	5rMdRmfl7mQhOlOAYgZN9dcchOZaBzEpG4Bs+8se9B7Sp1wZHnvtwOyZxN4NLSr7ILke4vYENshd8
	nVmlYlxMQM0e5QPe9wm+kczr+FyZTWbdJS7KwScAZCo6B2gedxbhCykQhhbwskbnalRO2Ws1EnZ32
	C1coMPg8UX67oN67ZD6uOZVUhl/M/yUad16Ty5sElwzDjzaG0/m5eAUq1UY1ThyTwK2n+Xoafma6+
	Rd9VwyZ8WJroqbSroaePga64ZCHi7hQIIKpilhwbQLghG1r0CYeny11htZLbFJw3lL8HJi5+i/mWy
	jXAB++0Jflwdr5LBdJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4oT-00CfYk-1R;
	Tue, 27 Jun 2023 09:16:41 +0000
Received: from mail-yb1-f179.google.com ([209.85.219.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4oP-00CfWh-1q;
	Tue, 27 Jun 2023 09:16:39 +0000
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-c11e2b31b95so3316989276.3;
        Tue, 27 Jun 2023 02:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687857396; x=1690449396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJEsAyJMr53UgQ5hcDPQftgfnsXq+Wmcilt10Mv3eBI=;
        b=F9JyG7OcoGeQj5BEQeKEMdLfUeyq6krxAICVRRvfhFKNvL+XU9i/MXKMy9mvnZmG4K
         UXs2LqYkSLRON+gp2zrB0vZ2Mu58F2D8fl+R6MFeJ3Jy+IIJiY9MqUnv/xgq6cH3H5KA
         KUW691GrDBdOUz1hhnFRjU9wwKiFA1cb+wVsFEnq6uz+HCCsAaI/hxGQFfvMXsWj6UN5
         rDiJHDQv9J3mNHf95D9pzPb3zS9C32iD2Fum904wZ57PCDcLJE0pSt8+Wae3kfdB3p0h
         UrC0WWU4ijiFO6ci0g5HJIA1qlT7RaM5xVmbRpH9zn/wjgiE3MwP7DGimmvsef8vyORD
         LiTg==
X-Gm-Message-State: AC+VfDzYuV8f0Q3WA4qyOrp1wJS8Fkf12n0ninHuGNUjKBK8Yjv+eaBt
	XDXf8s71vghdymiU7Y/2pWi1fl+ZG8pfzjqM
X-Google-Smtp-Source: ACHHUZ7uv+GxbibFjyW/cWK/0z2TBG6oDnhPnb2MQVW/Z5AovorBNqT5PG3srj6Na4VeODVSrInt5A==
X-Received: by 2002:a25:ca54:0:b0:bc5:7056:4572 with SMTP id a81-20020a25ca54000000b00bc570564572mr24729938ybg.51.1687857396038;
        Tue, 27 Jun 2023 02:16:36 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id p14-20020a25ea0e000000b00bc68b767cf9sm1543413ybd.41.2023.06.27.02.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 02:16:35 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5704fce0f23so44672547b3.3;
        Tue, 27 Jun 2023 02:16:35 -0700 (PDT)
X-Received: by 2002:a81:7bc2:0:b0:56d:43cb:da98 with SMTP id
 w185-20020a817bc2000000b0056d43cbda98mr30313449ywc.29.1687857394892; Tue, 27
 Jun 2023 02:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230627091007.190958-1-tanure@linux.com> <20230627091007.190958-4-tanure@linux.com>
 <3570635f-99ab-7127-0441-53852688a59c@linaro.org>
In-Reply-To: <3570635f-99ab-7127-0441-53852688a59c@linaro.org>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 27 Jun 2023 10:16:23 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+0fHUQTzgCUb5mU2BPFdwTnxNsq8+YCNadvdsq2_aeMaA@mail.gmail.com>
Message-ID: <CAJX_Q+0fHUQTzgCUb5mU2BPFdwTnxNsq8+YCNadvdsq2_aeMaA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] tty: serial: meson: Add a earlycon for the T7 SoC
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick <nick@khadas.com>, Artem <art@khadas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_021637_604216_5CFD42AC 
X-CRM114-Status: GOOD (  17.44  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgMTA6MTLigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBIaSBMdWNhcywKPgo+IE9uIDI3LzA2LzIw
MjMgMTE6MTAsIEx1Y2FzIFRhbnVyZSB3cm90ZToKPiA+IFRoZSBuZXcgQW1sb2dpYyBUNyBTb0Mg
ZG9lcyBub3QgaGF2ZSBhIGFsd2F5cy1vbiB1YXJ0LAo+ID4gc28gYWRkIE9GX0VBUkxZQ09OX0RF
Q0xBUkUgZm9yIGl0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJl
QGxpbnV4LmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5j
IHwgMiArKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgYi9kcml2ZXJzL3R0eS9z
ZXJpYWwvbWVzb25fdWFydC5jCj4gPiBpbmRleCAyNTAxZGI1YTdhYWYuLmMyNGUxMDVhOThjNSAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPiA+ICsrKyBi
L2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPiA+IEBAIC02NDksNiArNjQ5LDggQEAg
bWVzb25fc2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXAoc3RydWN0IGVhcmx5Y29uX2RldmljZSAq
ZGV2aWNlLCBjb25zdCBjaGFyICpvcHQKPiA+Cj4gPiAgIE9GX0VBUkxZQ09OX0RFQ0xBUkUobWVz
b24sICJhbWxvZ2ljLG1lc29uLWFvLXVhcnQiLAo+ID4gICAgICAgICAgICAgICAgICAgbWVzb25f
c2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXApOwo+ID4gK09GX0VBUkxZQ09OX0RFQ0xBUkUobWVz
b24sICJhbWxvZ2ljLHQ3LXVhcnQiLAo+ID4gKyAgICAgICAgICAgICAgICAgbWVzb25fc2VyaWFs
X2Vhcmx5X2NvbnNvbGVfc2V0dXApOwo+ID4KPiA+ICAgI2RlZmluZSBNRVNPTl9TRVJJQUxfQ09O
U09MRSAgICAgICAgKCZtZXNvbl9zZXJpYWxfY29uc29sZSkKPiA+ICAgI2Vsc2UKPgo+IEkndmUg
cmV2aWV3ZWQgbGFzdCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2gsIHBsZWFzZSBrZWVwIHRhZ3MgZm9y
IG1pbm9yIGNoYW5nZXMsCj4gb3IgZXhwbGljaXRlbHkgZXhwbGFpbiB3aHkgeW91IGRpZG4ndCBr
ZWVwIHRoZSB0YWcuCj4KPiBBY2tlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25n
QGxpbmFyby5vcmc+ClN1cmUsIEkgZGlkbid0IGtlZXAgaXQgYmVjYXVzZSB0aGUgY2hhbmdlIGZy
b20gImFtbG9naWMsbWVzb24tdDctdWFydCIKdG8gImFtbG9naWMsdDctdWFydCIgc2VlbSBhIHJl
bGV2YW50IG9uZS4KCj4KPiBUaGFua3MsCj4gTmVpbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
