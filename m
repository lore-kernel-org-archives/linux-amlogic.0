Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC98ECE588
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CW3YyU0/c9r2k8XSH2jvQJkSGKTUyxiHKtN5chdMGds=; b=xYMlwKrkwMNtK0
	KksQlMuLlW6r7kM/Tx1Su2486sG+xSozY/dFZNJ5KZK+4wDBMpIGV211qgQ2AcG9cRAGhMp9wvlkr
	EeNiCTPdMCVxBwHsiY4uwbshWQBIU7q4qf8+lhmnnivgdmrTPhyGqppA7NPCqXhcEWi26dTrUXugY
	d8uZnF7tykmdeupCeA7C/OpG3DNfYKrw6DgZPz8Cy1Idqv9EZeeNRjHgoSOtxY9porxzKCQIgTo5u
	nk/7pB/eOKObQTf466cGMq8JFYIAscNgXoaCIQbqIC/U/M7STiGaPrKfFy8TL4+PDaiHl2as4/DC2
	x3h+zcLKJh18AsTPm3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snl3g-00000003F1D-05Oe;
	Mon, 09 Sep 2024 20:32:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snl2w-00000003Ety-2tI0
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Sep 2024 20:31:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-205659dc63aso46977225ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Sep 2024 13:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1725913898; x=1726518698; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Modq40l+gMU0cxUn2O2G1RQEmcRA5Oa9oTlMQhT0pYU=;
        b=Cg5INeZqQliKUdh5WTQQI24D78QMp0+jet3BBsHNGbILT2F09y8UrTDS7RQkNOzboB
         yONIQDcttjftCYQaBj3YK2RKaAKshp8Sib0QX1As6TGfj4GM8xI1eWedqJwe+GzDY4mq
         IO90b5U4ZdPx9miZtrMylV7EQefTtMrpcS2HTPcxREMiVuZGCYbPo/SnHNWcZLoOimqh
         Z7TdHnk1YEPl6pYkaDrGTauFysQkOZ1QtWH7SoLwQ+YJisIWDPwnqWzIjZra9lE3wAz1
         g0WKy6GFLCuOkmXyy7THnij6LLaCExiLyCHC38GdtZ86zY4QPy8Tg+ZFF3cS/wmoeWxV
         B1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725913898; x=1726518698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Modq40l+gMU0cxUn2O2G1RQEmcRA5Oa9oTlMQhT0pYU=;
        b=S/AAXU9gPr3oSbrz0I9riRB0hdvV1+qAJwjRFK0b2oYrLtInJ57tLCy00NyrzqOIHL
         kink8L2GwUrzPubP/hqRU+Uf9xNvmiYKsPH2O9b1hBvLDXRNqEUfMulX3EGsZhhVQnrn
         exLwgZYQgpkBaQ/teOnk3ItPm3IvmTsy2G4jdPHaReItGxM6X5aZz4GnvgTtzkdSo1a4
         LRcc1J4X/9Dr/QLkUVgNZM5xDSR2lKJjkpA46FKFtkxvqtT/NT1IwSkngkvGatwhGaVH
         rvhmznW3Qt+0B3v5QXOyf4HBOn8aSVN6qPmsPLiaYymBG/NgEjMRf4RhYw/MQHdeiYVJ
         YPsQ==
X-Gm-Message-State: AOJu0YzKVk1uwux+NTjzVEJ3JJFZdlK4RaPJYrwLoJedfvREDlF8hQoq
	DvQHIw85gNodCJQt78gDPVywskLgYa6lOxYuXmdeGvSiDxiGgBPNGzVp0wdbVVEa3YGRuTCxaVT
	AstU4uReEs0ExOT/D9YOYZyr/p1rk3MZX
X-Google-Smtp-Source: AGHT+IFu1DjE6/bjjCKEtsWa9SG+mtRSHJ1Pfd7P2we2T3xNiQwVvHeBZh2wTxtcCMjHmdkVwmaLYN5AJK8GND+xOJw=
X-Received: by 2002:a17:902:da89:b0:207:6ef:d8ab with SMTP id
 d9443c01a7336-20706efd94fmr101196405ad.49.1725913897754; Mon, 09 Sep 2024
 13:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240905152951.83481-1-theo.debrouwere@faytech.de>
In-Reply-To: <20240905152951.83481-1-theo.debrouwere@faytech.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Sep 2024 22:31:26 +0200
Message-ID: <CAFBinCCRfjYeUKMpLQjbb1K8YFNPvQNTmi3zH=QePmNLKXGdMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: meson-g12a: add pwm_d option
To: Theo Debrouwere <theo.debrouwere@gmail.com>
Cc: linux-amlogic@lists.infradead.org, 
	Theo Debrouwere <theo.debrouwere@faytech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_133138_744969_1D914D1A 
X-CRM114-Status: UNSURE (   6.33  )
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

T24gVGh1LCBTZXAgNSwgMjAyNCBhdCA2OjQ24oCvUE0gVGhlbyBEZWJyb3V3ZXJlCjx0aGVvLmRl
YnJvdXdlcmVAZ21haWwuY29tPiB3cm90ZToKPgo+IEFkZCBtaXNzaW5nIFBXTV9EIHBpbiBtdXhp
bmcgZm9yIEdQSU9BXzQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaGVvIERlYnJvdXdlcmUgPHRoZW8u
ZGVicm91d2VyZUBmYXl0ZWNoLmRlPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8
bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
