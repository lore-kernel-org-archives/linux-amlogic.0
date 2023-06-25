Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA42EB64DC
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqNQA2SRgYiTkUy09aoLi2b2ohMLx3np1DrcSz/3DwI=; b=USZkjWP8LLFCy2
	0dLIBKYcHefQAKcpd3ahSUg3Vh5EtpCMxPI4A1sIdNF4ISEhXkRfGUx0JBf6nju/OjXJ3VukGs3ax
	UULQZ9RDK/PyHjsx87I6lpxkbE3Ai78/2IeLeZpmEoh+warAjF/I4pdvYj3aofexjAUT7IOIXrTp0
	lfrmmtYYe4/TsZbkABczOvbI/ibGsfeGKocwRTbkWj5i7i0c7+AvVteyo/XUk56wzFz/BIh6zKWoA
	+eB3gUKk3irSbUxo5u6lgOnyDTQHKfuGwZF5PuvUVB1sDKezKZR0fYvuvizUFjMwFzmMX6dYZkXfW
	ZdHGdZa6hJDHdPF50h/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWhB-008gqo-1e;
	Sun, 25 Jun 2023 20:50:53 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWh8-008gpk-1C;
	Sun, 25 Jun 2023 20:50:51 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-988a2715b8cso675780566b.0;
        Sun, 25 Jun 2023 13:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687726248; x=1690318248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SBQPc5uKJ8Qyprt0o5l8sXwt+At2XiILmQ1q2dIyts=;
        b=IMHhFsNgqUYKxdAxM3w5x16VUYRZJY+CnJT4V8GrDkTDJgYGlo1vqjbpePbKzzeNIi
         m0f/QTK+YGxFNpYDGn1lZ0FvwsPfoHxx6/SoZD9SBGW/utFo44kRa+8DnvC1xZZb83qx
         BpDE8v+GmkrkCb9I8vKIBh1JQlxWzOeHnGR07f7Wemj1HPLt9VeD8eoAdbR1wjmqT1mA
         9jjRAC15ucjcowUYck2JYACkuTqKpL5A0cY54bXV2y9Qhfa98vr0Tey39amH8csORJiG
         c+/9OG7MI3Iodd1IesGWwcyDpGnrhxb1T3fK2bIutDk5FQE2MqDF1X/G4wUP8x2l4HwH
         /e8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687726248; x=1690318248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SBQPc5uKJ8Qyprt0o5l8sXwt+At2XiILmQ1q2dIyts=;
        b=lKDccn8RiGqZhuLceGDdD5RSvixW7fphsxo/z/l17u7c7Ly7cIaMC8cPDbc3x5yqiQ
         MGYYPgznMRrqS0iPpZZO6eDxepeKo0iL60TqqUf+9pYSIyG9TaypJURN82lmqB0td4ek
         dFIkJNF6igV2Qwj/DT+IUYUTPqaLsf6pajfV2g4U1iVQO96pt3LE+K4Lf4XSq/yal/US
         9kc/iRyp3SAut0jKNXI0kzlDOk8QGNHVuqaZLTey/JNQbTfSSv5JpmhQ00Gdv8euMXZ/
         FuCn4TF00WuNA4RCQFed00X/ls+7v7TPmRu5F2gfQcSqxNMhIkHTvR6VHbGiW4qzV0/6
         28Ag==
X-Gm-Message-State: AC+VfDz8lgd1eoKuttB8GSBqLqsuVW7+MSQiZjU5lTt34HE2NZNg81uZ
	ZC2hVqzmmmzAUd0IYNrXig193GVHtFJltC7sSX0=
X-Google-Smtp-Source: ACHHUZ5jvDY83UJJ6wMhDoedkzSmA5NrWCT3rmPXFwLwZ1tUb+Ma86JQVdZo6A7aCeavA1CesRuQbbrPqMvnulJlmzI=
X-Received: by 2002:a17:906:794a:b0:98d:4ae:8db9 with SMTP id
 l10-20020a170906794a00b0098d04ae8db9mr9551240ejo.19.1687726247842; Sun, 25
 Jun 2023 13:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru> <20230607201641.20982-4-ddrokosov@sberdevices.ru>
In-Reply-To: <20230607201641.20982-4-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Jun 2023 22:50:37 +0200
Message-ID: <CAFBinCC0F4gaW1eFkJvf=oSkmAMmjbJ-ZFbVhpnrcGZPOX2sYg@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] arm64: dts: meson: a1: enable efuse controller and
 setup its clk
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, conor+dt@kernel.org, kernel@sberdevices.ru, 
	sdfw_system_team@sberdevices.ru, rockosov@gmail.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Alexey Romanov <avromanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_135050_411472_BB48F153 
X-CRM114-Status: UNSURE (   7.38  )
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

T24gV2VkLCBKdW4gNywgMjAyMyBhdCAxMDoxNuKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ICsgICAgICAgZWZ1c2U6IGVmdXNlIHsK
PiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWd4YmItZWZ1c2Ui
Owo+ICsgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsa2NfcGVyaXBocyBDTEtJRF9PVFA+Owo+
ICsgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAgICAgICAgICAg
I3NpemUtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgIHNlY3VyZS1tb25pdG9yID0gPCZz
bT47Cj4gKyAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnB3cmMgUFdSQ19PVFBfSUQ+
Owo+ICsgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7CklmIGVGdXNlIGlzIGFsd2F5cyBl
bmFibGVkIHRoZW4gd2UgY2FuIGp1c3QgZHJvcCBzdGF0dXMgPSAib2theSIgYXMKdGhhdCdzIHRo
ZSBkZWZhdWx0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
