Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060F0C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 10:08:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A233D21531
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 10:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZPqMEC38";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GdR9hDKN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A233D21531
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N1KKROpswxnGPedPOuQkQHP/+/+O7GQtjixk+Teq0co=; b=ZPqMEC38mWOIEcmBumTZTzBwW
	lPGcjSuvYKlAOu9KJQYzkmtE3LO+NUVHcBf6Ki4GgOE7yxhM388Sy/EFLCaOfpvGg1xgLx0Ltj6Mh
	GUhg8xaWFDYY2IyrEYpMwFLqMr4F+Sb8ckOHO1vZYM8DB53+dyB4fjYHZbyI8L7bWm8tJek7t+0lH
	bTdnVVMHDBbDK+RDa7yO1HsTrVZdn55NhF7cAhm8MJZYKdxJ8B6jAh8LEiB43ymxVU6NTWdLzb2W2
	VY/XYXWCECk5Pjq9X/79VgsdJRj0ijN0faLGwGS1xPdJppLK7K+EpKIQM9oN/cFumTGs6/N7TAnDm
	jrtpiEgVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFE4F-0000HW-QA; Mon, 07 Sep 2020 10:08:07 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFE4A-0000Ed-8j
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 10:08:03 +0000
Received: by mail-ua1-x941.google.com with SMTP id v5so3788767uau.10
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QuNLltsEiIW4LCbpFyTWl1p44IkTT3QJmbdClg97dn0=;
 b=GdR9hDKN5L9o4E+D9klMf226TdSBiyQrmIJFqTy1wvu7JgUOP5hnq9D/dbGUt34nVN
 XTE9ZkkMZYDWJkEj8/LXyenZz3T0Irx/WXSUQIYDB4F7XGGOjeU/eP0cHxgH70gtpxoS
 593wZnUVUiqgZqhmNZJBvdbDOEAjelVZNg7W3uJxmMeE2W2+4ryrLED4uLWr5d2on/1Y
 V+k0+LPGbknr9eHhBtS9n9cOKc/o9fFLWU4T/+6C9EhAuV3OtNNgAG8pjet6UXydTeg8
 /OlJ55P8StYowRupDWz7iqCrO55GZV8SHF0Qf78K+dPX1qyWPG1Pi5uUN5Re3N+8QgpF
 Opsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QuNLltsEiIW4LCbpFyTWl1p44IkTT3QJmbdClg97dn0=;
 b=pW4ICaTaNURzOMlfyx+wGpNFeVO6/CJnhROuSd7vhC+BBiYI8mO4GfgxHx3M71PyDp
 2wyWM4ONRBdxVyTXDqapW4ARwjBVs9/wI+7wXamMxHGuU9FCd9FqKN1u8U/ESmzSPlND
 2EYOHOk1/MReGeyioNmMzmkyaXoicPtxvMPk69BMb5eX2NSMTZN41UQ/tVIxsHzySPcl
 3TEdOmoLxeFYLBi6UT/o1HLzKLn3hSsWcf5ib25G40YXhrsGf9bPh3QpRRHFLK4P7fQR
 JzFqOc+OLuUXGj2vZAi10F57PnP88DRFaLXC6H6SRmbMXwQ9HpTw/Yj1WdTW00LBkDYB
 gq6g==
X-Gm-Message-State: AOAM533FGNuRtO4bz9y/9tRy9PacP5rUfmjEHtJdtm83FGB+mwc2y2z7
 yw9o8YEdhxy1OzHh44H9J+xNtnN/MM3ORLjxd3VW8A==
X-Google-Smtp-Source: ABdhPJylvGTfdGwP02Q+D0hgvcDauwlOQni6HAn5s7aLot2eLwS2w0Wmn0FgXWKx98K2aaDsiVxs7F4QHZfQitRnsZs=
X-Received: by 2002:ab0:130a:: with SMTP id g10mr1522518uae.100.1599473277782; 
 Mon, 07 Sep 2020 03:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200904164315.24618-1-krzk@kernel.org>
In-Reply-To: <20200904164315.24618-1-krzk@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Sep 2020 12:07:21 +0200
Message-ID: <CAPDyKFrzDeNqvM4cc69iCdVW7QnF=O9C=v13+o5bGBSCSzZfWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: host: Drop unneeded MMC dependency in Kconfig
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_060802_367082_34FF2D96 
X-CRM114-Status: GOOD (  17.56  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@axis.com, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Manjunath M B <manjumb@synopsys.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Prabu Thangamuthu <prabu.t@synopsys.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Manuel Lauss <manuel.lauss@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCA0IFNlcCAyMDIwIGF0IDE4OjQzLCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWxsIGVudHJpZXMgaW4gS2NvbmZpZyBhcmUgYWxyZWFkeSBw
YXJ0IG9mICJpZiBNTUMiLCBzbyB0aGVyZSBpcyBubyBuZWVkCj4gZm9yIGFkZGl0aW9uYWwgZGVw
ZW5kZW5jeSBvbiBNTUMuCj4KPiBTdWdnZXN0ZWQtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJx
LWxpbnV4QHJlcmUucW1xbS5wbD4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+CgpBcHBsaWVkIGZvciBuZXh0LCB0aGFua3MhCgpLaW5kIHJlZ2Fy
ZHMKVWZmZQoKCj4KPiAtLS0KPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gMS4gTmV3IHBhdGNoCj4g
LS0tCj4gIGRyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbW1jL2hvc3QvS2NvbmZpZyBiL2RyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZwo+IGluZGV4IGI5
NWY3OWY1MzM5NS4uZWVhMDFmZGUwNTkxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qv
S2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZwo+IEBAIC00MjIsNyArNDIy
LDcgQEAgY29uZmlnIE1NQ19TREhDSV9JUFJPQwo+Cj4gIGNvbmZpZyBNTUNfTUVTT05fR1gKPiAg
ICAgICAgIHRyaXN0YXRlICJBbWxvZ2ljIFM5MDUvR1gqL0FYRyBTRC9NTUMgSG9zdCBDb250cm9s
bGVyIHN1cHBvcnQiCj4gLSAgICAgICBkZXBlbmRzIG9uIEFSQ0hfTUVTT04gJiYgTU1DCj4gKyAg
ICAgICBkZXBlbmRzIG9uIEFSQ0hfTUVTT04KPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgVGhp
cyBzZWxlY3RzIHN1cHBvcnQgZm9yIHRoZSBBbWxvZ2ljIFNEL01NQyBIb3N0IENvbnRyb2xsZXIK
PiAgICAgICAgICAgZm91bmQgb24gdGhlIFM5MDUvR1gqL0FYRyBmYW1pbHkgb2YgU29Dcy4gIFRo
aXMgY29udHJvbGxlciBpcwo+IEBAIC00NTgsNyArNDU4LDcgQEAgY29uZmlnIE1NQ19NRVNPTl9N
WF9TRElPCj4KPiAgY29uZmlnIE1NQ19NT1hBUlQKPiAgICAgICAgIHRyaXN0YXRlICJNT1hBUlQg
U0QvTU1DIEhvc3QgQ29udHJvbGxlciBzdXBwb3J0Igo+IC0gICAgICAgZGVwZW5kcyBvbiBBUkNI
X01PWEFSVCAmJiBNTUMKPiArICAgICAgIGRlcGVuZHMgb24gQVJDSF9NT1hBUlQKPiAgICAgICAg
IGhlbHAKPiAgICAgICAgICAgVGhpcyBzZWxlY3RzIHN1cHBvcnQgZm9yIHRoZSBNT1hBUlQgU0Qv
TU1DIEhvc3QgQ29udHJvbGxlci4KPiAgICAgICAgICAgTU9YQSBwcm92aWRlcyBvbmUgbXVsdGkt
ZnVuY3Rpb25hbCBjYXJkIHJlYWRlciB3aGljaCBjYW4KPiAtLQo+IDIuMTcuMQo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
