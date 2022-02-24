Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1C3C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6i3GpSBDId1g7LskEsHCyXFW8IyvQ4p4hk8889F1FHA=; b=bhWfzZI/GhA3YD
	n5OCQNm+sdambeG/Y2XWcmPtnWy/a0wnHTWG19QJuV7xTu+frLWn2DwjLpNgXxKCM/UpmfwUFlQeg
	+7qtKX885mUNgtl6KGBnxuOF4EzhNtYFkp29JiXrMAIsjwi6M2yPyl7eQOqOn4BbpOytzlnu+eCG+
	KM+xz7SxANZpq8MXvQ9V5tDSxbNZWjs/BgLuafuapML9/nLAneKCM5azhQ0/aqvD/7ROKDjVjPeTU
	0tnbnEFrU/rLpMvGAYP9s1qXGLSlZ6tcyOEEzKA1HnUqNkO5L0nUaiM1HuyxGGnYpMQyDptaCrhTd
	rgGbD6vW14kuKyY15Mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKJw-002GG0-8k; Thu, 24 Feb 2022 20:02:36 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKJd-002G90-HZ; Thu, 24 Feb 2022 20:02:18 +0000
Received: by mail-ej1-x631.google.com with SMTP id lw4so6578410ejb.12;
 Thu, 24 Feb 2022 12:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=XMOMyaP+5tw/NTE2jwKE8j7Rm2F5qsTyT92ajHBSVzE=;
 b=CO0fSRAek4bdCwTabHBOyTV//bomfxsKiwtf24TvCt3E/ghibT7nI1SwynRANTKZOH
 sJ5EwBa/MKMV0M7Ao2dpvFihZJ4Sp5cnH3tBViWUwjUPSBikbQVXGsZCO4+n3t3ikBb+
 SCob2GZQT5W0WUeCOtSEQRImMwq59WQ4F4UowavJeojoDvMGtoyOgypJAYGw02O6rvVK
 iOD9aWd6bMTaN/0Kd3bVHT+8lw84NMZVfp+FuUwOKx4nJ/wtZ4Dv4xR5sRmH40p3T8Ja
 0xeOHNlu6Zi7pxQQM0Z7ohNbwZ/P0XaRr00mOFcjfUH5Q4CMKWG5jxRiMI7uDHAQfUGt
 txng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=XMOMyaP+5tw/NTE2jwKE8j7Rm2F5qsTyT92ajHBSVzE=;
 b=4oDDan0mld7R+OnHJOA+WIPiLCPqqI9TRq8GwpBfsycuWPHy4kstpHzyC82cBhRMra
 LM9LdQnDldLL5iNiv4+pPg5v+FE5GhDBu2DlvaJqeswr2mz26XkH93KhD4LpOT+GhGD8
 5gRS4ZOquPtY9vt6g/35S2u54tLLcwldy9ypIPqkE6KSzZSUvux8oi8bEoygmdTenw7Y
 9/d8GsHRiB+vRPHcFgoCm8A7zOX5sda+MQ2pYEeBTluT8MqNnvNYGjK909JM4JOGJ7E1
 S46W1BcgGH0YZKPsrDdrM6F4Nl5YFCrgq5HbFu1pPL7uuZf8kyvTjVYep3rZP3sV7BU3
 eOVQ==
X-Gm-Message-State: AOAM533m8bz9BQdKPAGfpZVKDDx0jg58WvF3FGH5k+P2P3U0gnTS4Sc5
 MTZpi0RuRI9canT0I33JmHc=
X-Google-Smtp-Source: ABdhPJwoQF7agrZ0iFxeuqZW1ispp3xWQbui3gq2JpfwyFy+q8EbyiXnrW3yIfB7IUj7ep7750dKaQ==
X-Received: by 2002:a17:906:3b4b:b0:6d3:4b9f:1764 with SMTP id
 h11-20020a1709063b4b00b006d34b9f1764mr3423702ejf.345.1645732935531; 
 Thu, 24 Feb 2022 12:02:15 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd?
 (p200300ea8f4d2b0070ade6bd1cea7edd.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020aa7df96000000b0040fb8c4806fsm224276edy.93.2022.02.24.12.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:02:14 -0800 (PST)
Message-ID: <0d3c7622-24c9-f348-010e-a98aca251986@gmail.com>
Date: Thu, 24 Feb 2022 21:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add Titan Micro
 Electronics
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
In-Reply-To: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_120217_603786_702874BA 
X-CRM114-Status: UNSURE (   6.35  )
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

RnJvbTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgoKQXNzaWduIHZlbmRvciBw
cmVmaXggInRpdGFubWVjIiwgbWF0Y2hpbmcgdGhlaXIgZG9tYWluIG5hbWUuCgpBY2tlZC1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBGw6Ry
YmVyIDxhZmFlcmJlckBzdXNlLmRlPgpTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhr
YWxsd2VpdDFAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggZTA2MmE4MTg3Li42ZmZkZWM5MWYgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlh
bWwKQEAgLTEyMzgsNiArMTIzOCw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgIGRlc2NyaXB0
aW9uOiBUZXhhcyBJbnN0cnVtZW50cwogICAiXnRpYW5tYSwuKiI6CiAgICAgZGVzY3JpcHRpb246
IFRpYW5tYSBNaWNyby1lbGVjdHJvbmljcyBDby4sIEx0ZC4KKyAgIl50aXRhbm1lYywuKiI6Cisg
ICAgZGVzY3JpcHRpb246IFNoZW56aGVuIFRpdGFuIE1pY3JvIEVsZWN0cm9uaWNzIENvLiwgTHRk
LgogICAiXnRsbSwuKiI6CiAgICAgZGVzY3JpcHRpb246IFRydXN0ZWQgTG9naWMgTW9iaWxpdHkK
ICAgIl50bXQsLioiOgotLSAKMi4zNS4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
