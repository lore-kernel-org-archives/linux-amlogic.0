Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0403AC3ABA3
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9CRy2yRbLKyWRpeHf4DuiECp4YfgtmTdadbjuvz1Xs=; b=LVoT3z4lPU3wFQ
	SlbfZbhb07Pxb+LBMdlBtY6gSZHo4eEKeKio9yUC95oNaJFZ2x6AqPXicaVWYHfk6sRWwETRiWnm2
	Ct7bHC6micglZ+YkWR1c3Q7dVyZK/xSTLbjEs1KM3fwoI2rCKrL0HnqfFETwtaYkYpXA9cdBbrwYa
	NZCBzOKlK8WXHHdSwPRTFbUlX4nU5QzB3RmmL9o9TeIIoCNyF2wVtHZNzgpEQQOUfOjYEZ1B3tuZh
	onvqsmsq3uZCKBmd8CXeKa8p5PMHElExxEn0d/0M7DfbXhAX4rTZsIty4VBAthSSaChO320uexVla
	K5ywfknsdnzp2ZwF0rdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spua4-00000002Xbt-1hpa;
	Sun, 15 Sep 2024 19:06:44 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spuWm-00000002WxV-3At9;
	Sun, 15 Sep 2024 19:03:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2053525bd90so21485985ad.0;
        Sun, 15 Sep 2024 12:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726427000; x=1727031800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jJyScG3d9NHQ5S4X3PfMPGGWweIlWR9sQ4K9rWSPFE=;
        b=MSwbSVYX/ez7JIF93FCftwBFbcpQzVscCzRZZG0bzGCwybNCZ0n97AdQywj+Zk/fij
         jnW30IPAcV3nOOPN4RlEhXQ0vp15F2tYjp8u6fNNJleartQnagol/MVG4acTSifioJb8
         +RhhCLkvphf7g/wzcpb3gnnkt8NdSHKv/le7w7+7rdcB7b+Dhi7nam6bvN8QXObtOwr8
         byvBF1vLlP31RR9yTy57I5URtaj3fQfO0VGYzkdB5atOYlZoPnnDhk3cmv+czbPEAOb0
         aFlDhdRGaWN0Z3vSAkAUSKpVWU2Y3RfxKDiJGBA29hXLmb+sJC6/GxYL5StglR8hf+va
         wQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427000; x=1727031800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jJyScG3d9NHQ5S4X3PfMPGGWweIlWR9sQ4K9rWSPFE=;
        b=ikX2Y8IM/WBRZqhGkPcN8Wf599v1NVDAoIy3DNg+BlzrqkF3g3gnevbCfYUIC4SejS
         vWivzKqcfm5YVHJj9nCHkEUS2i8jqlkb5a2xhkfQOhwBIGki6iI+NTfZFnwulNg3Gu+s
         P1H1qBBFoQ+4HcLkb+JwT35P//zP2Uv2gR2LQjrcYhaPyVNO61q+LA+AQwxeay0rx5bz
         lQvat/udC4NHLWSvlBXo0L1pGRqLrGFa1VM+X7rQKOiPSvBmBb4nD6J1f79WGC5UJBdz
         hDNLrSt/U1zQj1hUzJsVTFi9APlfq13r9FUM9jm/rUtb4AMeAvlcOvNOdo15uasKgrwV
         U75g==
X-Forwarded-Encrypted: i=1; AJvYcCUtMBpxnvyUQbvN4x7PSc1i5Tp3RIgsY9om8asi4XRnG+pm8ldDkw6vRHO7o633hqzcuU2DEHOqCpGtLbNqXsakRQ==@lists.infradead.org, AJvYcCX4MPnVrvOVob/vKNT9czeRRlfWEYJP9YmIRf06IcWsg8HPA9OPvjbNLcQrdAMcdaXPu0dmS9UOciBvW6nB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn65Kfb2NxJIb95XmvlhryaVMFXqs5HNxj+7TNU9idF+x7cQTd
	7lsCTDhGpa6Gm1PDGKdBSBevzJk2DZTqZVHiaMNUwjjAEbkEemD+n8oex3XnHDqD2oG6zeYW7hP
	Vmy8AY7vOaOv/FLUyPYh0XjbG564=
X-Google-Smtp-Source: AGHT+IEZ6GCkzKAWLZZHHU7eMS2eyq+j9CTeJLAwZNxO0mhFJtwQEHrrljy0vbXUZx2OkSpdfzy+QX7A9REB1jTMkmE=
X-Received: by 2002:a17:902:d58c:b0:207:2093:99bb with SMTP id
 d9443c01a7336-20782529c52mr108597785ad.31.1726426999543; Sun, 15 Sep 2024
 12:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
 <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-7-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-7-feaabb45916b@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:03:08 +0200
Message-ID: <CAFBinCDe-yhHja=KMjAr6-EigOWipTCZZ0ETT9QttuOOBFX+kw@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: amlogic: meson8: use correct pinctrl bank
 node name
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_120320_817929_EF0676B4 
X-CRM114-Status: UNSURE (   8.25  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMTI6MTnigK9QTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBVc2UgdGhlIHByb3BlciBuYW1lIGZvciB0
aGUgcGluY3RybCBiYW5rIHN1Ym5vZGUsIGZpeGluZzoKPiBwaW5jdHJsQDk4ODA6IFVuZXZhbHVh
dGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnYmFua3NAODBiMCcsICdiYW5rc0A4MGIw
JywgJ2JhbmtzQDgwYjAnLCAnYmFua3NAODBiMCcsICdiYW5rc0A4MGIwJywgJ2JhbmtzQDgwYjAn
LCAnYmFua3NAODBiMCcsICdiYW5rc0A4MGIwJywgJ2JhbmtzQDgwYjAnLCAnYmFua3NAODBiMCcs
ICdiYW5rc0A4MGIwJywgJ2JhbmtzQDgwYjAnLCAnYmFua3NAODBiMCcsICdiYW5rc0A4MGIwJywg
J2JhbmtzQDgwYjAnLCAncmVnJywgJ3JlZycgd2VyZSB1bmV4cGVjdGVkKQo+ICAgICAgICAgZnJv
bSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waW5jdHJsL2FtbG9n
aWMsbWVzb244LXBpbmN0cmwtY2J1cy55YW1sIwo+IHBpbmN0cmxAODQ6IFVuZXZhbHVhdGVkIHBy
b3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnYW8tYmFua0AxNCcsICdhby1iYW5rQDE0JywgJ2Fv
LWJhbmtAMTQnLCAnYW8tYmFua0AxNCcsICdhby1iYW5rQDE0JywgJ2FvLWJhbmtAMTQnLCAnYW8t
YmFua0AxNCcsICdhby1iYW5rQDE0JywgJ2FvLWJhbmtAMTQnLCAnYW8tYmFua0AxNCcsICdhby1i
YW5rQDE0JywgJ2FvLWJhbmtAMTQnLCAnYW8tYmFua0AxNCcsICdhby1iYW5rQDE0JywgJ2FvLWJh
bmtAMTQnLCAncmVnJywgJ3JlZycgd2VyZSB1bmV4cGVjdGVkKQo+Cj4gU2lnbmVkLW9mZi1ieTog
TmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
