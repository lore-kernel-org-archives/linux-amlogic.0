Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD0DC4828D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/l4xVXGfZRM9wsz7B6jS2P5EOOUDMdtUC3pJKXhMiOY=; b=jkOa2uGcT3VbwL
	XBxtKiva+3JCg5N0feYQxp15DQg3YwDRJNvapalItGYaB0+sUXzNwXVOXCRjZfN4todC1hcFTNjiW
	zKW/jW+fwNjzoCjo/GFZoUXJO3hwYULZNRWHUHV0IvIOEeYPdizirGeBeZTWb9dNTRBD0I/pG1zk6
	5iSOEgWxmnWHieTWQ9XCqTkV7GeInriMwbpkJ7QfesNU5MKH0MqoJjZqHOmDXx9IZff5lH8/t+pzy
	ACAdB54T2ecv47x6nt0Li5v33iijqAKNO+q2gRN0OSsaHgsoeL5uGtUY6V/DQABi2erta8y3FSn5y
	e3WdyMWFs/Tsn+xGni9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJtb-00000007OUL-3pRT;
	Tue, 06 Feb 2024 11:45:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHpo-00000006jhQ-2EQ6;
	Tue, 06 Feb 2024 09:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wv8aVTQt1PkjH10jXoXAhUeu0btco/HHsLNCr4o/nTU=; b=CKi2E33FmmCdyl66mLLUn2Q+g/
	53TULLc793lSQP7MesqkjXEef4IodWxjOedRiJZrpnaIfN1zB65LR4k5qGLf6JgHAZ56YOy1LVR5S
	JZ870qo0er03fJ0bqsZeQhYk1iN6s+3NbEpURJe8ehIHxiumOlqQP90AZjnMr+wu41QvI+zUfQJhP
	F1EeY4XYZVvEIBGnm38fUEj/tIYGjKsHItnwmtizWKKjeZ8NXTgLt+hUNjRabLld7r6Ze7tdzcKWK
	jiDZd6gFiRS3l30NJgpnMdIG4e/THVLMJADvtCEVSSx9Flt2TD2kb4o1lNFyUgtShJZV61mpNjjb0
	sPKTzB3Q==;
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHpk-0000000CRxx-1qxo;
	Tue, 06 Feb 2024 09:33:43 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-604571d73dcso20434917b3.3;
        Tue, 06 Feb 2024 01:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707212015; x=1707816815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv8aVTQt1PkjH10jXoXAhUeu0btco/HHsLNCr4o/nTU=;
        b=XG0jTM+9H6IMPrOWBEZJN+wRFKawRCir9Wm4U9c3I8UslIPOjgJXhGU4pezWvQdkg2
         4yw4wXx4LPpTPpN6SY3D6Az1xDXtiTZRcB680Li3vo+Gx0VWP/VUraJdvWa62hvn9WUH
         ijs7fMDhQj3PhGmNHkMivvJhUZql0TiFzzsi641IFYVyWu4FxPrtlGEmVUlEmWXjCeb0
         D6ylH8Taqt2tHuBfqxqQksBK3+99MsIEd5RNDH5eOUu0JYCT8ccKOkMkUgXrP7F3Y/nG
         WzBjc/nqe/Oe/ioK+JLQtF2PZ8Ges30s/hqtROnNSWcPT+ZbkAWWYycRQVYk7VPuCfBN
         VC1w==
X-Gm-Message-State: AOJu0Yw5YBx8xpNOx3AlMC7hJCKJlZ+giSD9kU+9j8D2JKcskx5xYO7R
	O7NRt6qZc5Fk5Nvgr/+BHoPpQWkjKSJ3XBeTDaDNm6aIsEYdUMiv/LzAWSPLWBs=
X-Google-Smtp-Source: AGHT+IFNUWGYY1UnFLdOSefvu25wEzLhbgb+nyXRghGYOJ1A4iCwQs4aBnX/pORGYAFBT+k4Fz7rPA==
X-Received: by 2002:a81:ce0a:0:b0:5ff:532e:f3c with SMTP id t10-20020a81ce0a000000b005ff532e0f3cmr1133799ywi.15.1707212014812;
        Tue, 06 Feb 2024 01:33:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVp7Ngn5cGaQOgkHo9hdGHcHKyORoah5GMOLRXLGU9lvpHg3YNVSnLyo3z02WdDic+XTpcSQgWUF2e5RYts08n+EgPC8OZRjaGJe5SBnyjeKA5Wh7JsKdbOg5d+LGXIUcVTeNEYj8/GeXkLBueVcii2r5iAffq61A==
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id ck4-20020a05690c0b8400b00602da661b4csm403481ywb.31.2024.02.06.01.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 01:33:34 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so4574196276.2;
        Tue, 06 Feb 2024 01:33:34 -0800 (PST)
X-Received: by 2002:a5b:711:0:b0:dc6:4c9e:9e4d with SMTP id
 g17-20020a5b0711000000b00dc64c9e9e4dmr1100023ybq.20.1707212014034; Tue, 06
 Feb 2024 01:33:34 -0800 (PST)
MIME-Version: 1.0
References: <20240206071314.8721-1-liubo03@inspur.com>
In-Reply-To: <20240206071314.8721-1-liubo03@inspur.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Feb 2024 10:33:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
Message-ID: <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
Subject: Re: [PATCH 00/18] mfd: convert to use maple tree register cache
To: Bo Liu <liubo03@inspur.com>
Cc: lee@kernel.org, wens@csie.org, marek.vasut+renesas@gmail.com, 
	support.opensource@diasemi.com, neil.armstrong@linaro.org, 
	ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com, 
	mazziesaccount@gmail.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_093341_465702_5F8921A1 
X-CRM114-Status: GOOD (  16.23  )
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

SGkgQm8sCgpDQyBicm9vbmllCgpUaGFua3MgZm9yIHlvdXIgc2VyaWVzIQoKT24gVHVlLCBGZWIg
NiwgMjAyNCBhdCA4OjE24oCvQU0gQm8gTGl1IDxsaXVibzAzQGluc3B1ci5jb20+IHdyb3RlOgo+
IFRoZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlIGlzIGJhc2VkIG9uIGEgbXVjaCBtb3JlIG1v
ZGVybiBkYXRhIHN0cnVjdHVyZQo+IHRoYW4gdGhlIHJidHJlZSBjYWNoZSBhbmQgbWFrZXMgb3B0
aW1pc2F0aW9uIGNob2ljZXMgd2hpY2ggYXJlIHByb2JhYmx5Cgpwcm9iYWJseT8KCj4gbW9yZSBh
cHByb3ByaWF0ZSBmb3IgbW9kZXJuIHN5c3RlbXMgdGhhbiB0aG9zZSBtYWRlIGJ5IHRoZSByYnRy
ZWUgY2FjaGUuCj4KPiBCbyBMaXUgKDE4KToKPiAgIG1mZDogYWMxMDA6IGNvbnZlcnQgdG8gdXNl
IG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAgIG1mZDogYXMzNzExOiBjb252ZXJ0IHRvIHVz
ZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IGFzMzcyMjogY29udmVydCB0byB1
c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAgbWZkOiBheHAyMHg6IGNvbnZlcnQgdG8g
dXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAgIG1mZDogYmNtNTkweHg6IGNvbnZlcnQg
dG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAgIG1mZDogYmQ5NTcxbXd2OiBjb252
ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IGRpYWxvZzogY29u
dmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAgbWZkOiBraGFkYXMtbWN1
OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IGxvY2hu
YWdhci1pMmM6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAgIG1m
ZDogd29sZnNvbjogY29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAg
bWZkOiByb2htOiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBt
ZmQ6IHJrOHh4OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBt
ZmQ6IHJuNXQ2MTg6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAg
IG1mZDogcnNtdV9pMmM6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUK
PiAgIG1mZDogc2k0NzZ4OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hl
Cj4gICBtZmQ6IHN0bWZ4OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hl
Cj4gICBtZmQ6IHN0cG1pYzE6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2Fj
aGUKPiAgIG1mZDogcmM1dDU4MzogY29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBj
YWNoZQoKSWYgYWxsIG9mIHRoaXMgaXMgdHJ1ZSwgaXMgdGhlcmUgYW55IHJlYXNvbiB0byBrZWVw
IFJFR0NBQ0hFX1JCVFJFRQphcm91bmQ/ICBJZiBub3QsIHBlcmhhcHMgUkVHQ0FDSEVfUkJUUkVF
IHNob3VsZCBiZSB0cmVhdGVkIGFzClJFR0NBQ0hFX01BUExFIGluIHRoZSByZWdtYXAgY29yZSBj
b2RlIGZpcnN0LCBmb2xsb3dlZCBieSBhIHNpbmdsZQp0cmVlLXdpZGUgcGF0Y2ggdG8gcmVwbGFj
ZSBSRUdDQUNIRV9SQlRSRUU/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0CgoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
