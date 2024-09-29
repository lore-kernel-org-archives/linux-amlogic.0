Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E7FCF6495
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Sep 2024 20:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMsZtZMgIiACdZ+MW3abddrz8EeBTX7PBKavkWrLGT0=; b=z5Och3CfTkqVEe
	aiLGAyk7euMo+c1Dz35VCeBh7+PzGY/eEtVgW3QguqIVY5nn+lmr9kreBDqMbKKEHoxxJN7MVEGuF
	aNzYcttmRup/KkYui/KI26sS13290bllJBFrNPYnWjdpb9Dn1+LeqJllkiZDYuDwPV/jJUpzm1xJI
	iEGteAQQk00jl5KqeTo3ZJJFahw4x7sm1EqdSWEHb9U3/NVIRIVOSoajVfe3CcFnGucZCUAWOOw11
	ns5hANPnfO9BPBqB9Qp1lp/7Sz78yyWHJ2cFUcY4YwsG+p9pAD4e/nF7lqnv8t1YWrjNMjLWe2CRm
	+hJjfupafpIV3VoWxbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv0LO-0000000FIcv-13a0;
	Sun, 29 Sep 2024 20:16:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv0KB-0000000FIVF-3gDn;
	Sun, 29 Sep 2024 20:15:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20afdad26f5so47579685ad.1;
        Sun, 29 Sep 2024 13:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727640922; x=1728245722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6kbsHnZY4CHEkdYNOnQMnvz2R2muXrc7EV2uQlZEKU=;
        b=dCoKOKr1x/B+n4hPhQCmRiKtHFe8mWTpVGALfpGfLdXcDcI6hGmFSx230py7GtSmVi
         OaFAzb4l8VQefCHOg+5uuya5UxoMzwO5KwBQRoqOQ4Aw4pBKvVP6jBvvNk/2LvE5OSYx
         VT+jnva8n37y1Myo+K3wDzs/uZZFDIOxPP9ri5Ata8xg9PF6x+EkuXgq7uL7uaj4UG1v
         69v9sGpSm5amOU+LMwdwZOx+21T7D7k1q/afEQ7KfLpaHUzjgX6kSMRsCvePgTPqufFM
         ngDU+WUamHfWzTcmhT8X8YQ6NY3hxN0KGY3K1AbJiTZQxWne/JxTTielkv3Al0g0luME
         rOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727640922; x=1728245722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6kbsHnZY4CHEkdYNOnQMnvz2R2muXrc7EV2uQlZEKU=;
        b=AEWApcEnJiqhl668qIFKKt1anATL/vgCNPSMrOIva/Ikwkb+lNxAZwWBmjmIFUQ8sh
         KlelmG7l3OGQzEaAzLW8nWHnt/3VOAVPrqE3TPyeCtRDkhicxAbFy9wzlwD2ny7AEbLH
         aMAlYBFNyhWPFpC478Mqa3GCgBLQ2q95lizZwg3bz8fRi7NixJh6m9D9bPTlENzwjut5
         r6DZZYI+p1R7fCM99YSc/ijiqPNis17Ch1KDc0vb752yuwNPIBYYjzWazIFYCoOSro1f
         aAliZxR4BaQZAMG2IbRKRq6AK63kZBVrVpFaYjRGQGpJ7ioVHhNsRUEPawzEg1evO/Ld
         jnmg==
X-Forwarded-Encrypted: i=1; AJvYcCUFryyjM+93PXk/uwNAoJuTvGzbcT/rOZ7gnJx+Kz/guGaCmpuQQtJTBBJkUBlsH+d/0emxhHzLvV+sESHn@lists.infradead.org, AJvYcCX9MheVuILMe7xYz7HY/cnf5UXmnkEa/RJY3WAOW0pbSJhx5ys+AiXo9Ww999NXr65tjIhLvIHNMePJqSYvzUIL4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNbeFT3FA4IzwCIEY/q69pjyn+MpM7J/regQHBVFzKk3y5wEul
	KRYUwGiZTJhBNZFa5ulkP/VYIxhXBzLr+oh8VWMnXIQ23Mu9ynwOCMpGa9exYsPtCpKwijQ52O3
	Fqfl7rva2AF0toBvKbr9HGNnsB3I=
X-Google-Smtp-Source: AGHT+IH/k+F2RucCpezXya0CJVr6faMMNWovPjHyE80pA0LQItiWE2pGV1jIRx784LXOFZjCOD5KIRit1rE21uwu1Jo=
X-Received: by 2002:a17:902:d484:b0:207:5d33:a1b8 with SMTP id
 d9443c01a7336-20b37b79d4bmr147881915ad.38.1727640922480; Sun, 29 Sep 2024
 13:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
 <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-6-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-6-0b20ed4f0571@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 29 Sep 2024 22:15:11 +0200
Message-ID: <CAFBinCBRcNCOjBH6wfv+OqUf0aNtymxwUL2O_swWXKdF1F3NnA@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] ARM: dts: amlogic: fix /memory node name
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_131523_965222_5127E127 
X-CRM114-Status: UNSURE (   7.53  )
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

T24gTW9uLCBTZXAgMTYsIDIwMjQgYXQgMTA6MDjigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBVc2UgcHJvcGVyIGFkZHJlc3MgaW4gL21l
bW9yeSBub2RlIG5hbWUsIGZpeGluZzoKPiAvOiBtZW1vcnk6IEZhbHNlIHNjaGVtYSBkb2VzIG5v
dCBhbGxvdyB7J2RldmljZV90eXBlJzogWydtZW1vcnknXSwgJ3JlZyc6IFtbMTA3Mzc0MTgyNCwg
MjE0NzQ4MzY0OF1dfQo+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0
aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgphcyB3ZWxsIGFzOgpUZXN0ZWQtYnk6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+ICMg
T2Ryb2lkLUMxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
