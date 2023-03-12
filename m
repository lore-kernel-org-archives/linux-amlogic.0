Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB0FC6FA99
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 20:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYei3iwOVX+/jz2FnQ+QE1C7zeMBWEW+A2hTf/ELwkE=; b=y+aMKLblSLa8Dz
	k5gHl8CNaaNH3gv0aEykF2eUIuaZB+A88BVVad+e7MyIZRw/ofyBUcXKAuiU822s2gqowzdVXZYzn
	lGMkarynllhKExcg3ez0dl05pk9xXgQZwJhwraLNznFmWXjHqz9UUFJnRcfjsZxkzk15KJb5EGCgB
	qKfRGqpdrEs6XvI/an21Qlv5mD2mhwvcNZFSwFwnqOhzUHdnHzT+Iiqlp/ALEORVPxacy7nKH+kWB
	PlxpEuAl5HtcT3S3yg6m0vxIzJYGqrjFxAb/kU2NrsBbs+dJyQWHNLNgi5NMQWHpks+A644u8VS8t
	dkcEwo/rtc/V4V8mbiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSIi-003V45-0l; Sun, 12 Mar 2023 20:28:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSIf-003V2p-2j; Sun, 12 Mar 2023 20:28:14 +0000
Received: by mail-ed1-x536.google.com with SMTP id j11so40906475edq.4;
        Sun, 12 Mar 2023 13:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678652892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn7rGXP9a+n4kykSAVJ38yeOYG47jZ8DOqSys/GUHm0=;
        b=CVBQzqYCNAPyWk09GzvdecOwLxuztTqPOpWt9vR0lxNEZOJ7DGfOxpQFlI/Hwhy+lA
         Plfq05uMvlHZowrfjd+DhJzRwqNNKb/qYgyy9pSkwmNqNCO/6iMvE/x0eRMAy6VSlHyF
         9wTmFptJL+fSKaDCnZmpDB5HlZymIDrEHwa3d5/ndQD7uFaW4Ljc3AuPhFmbKxwR4Fqp
         oKG3HuIt3noDNUBpTHbKJI7F1WT4bFAReS120gX3np6V5KBoLyncarspZ+BpibEAkst5
         9R2A8MTLZp/DtNFQBmy5t6PMMe9iNSTwFNo+pEZMqeEoaLtGBZqAueuDArkHb2Qcv6fj
         ursg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678652892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yn7rGXP9a+n4kykSAVJ38yeOYG47jZ8DOqSys/GUHm0=;
        b=jjCU4uMbd8qh2kVUsqmy3yxuKe/OTYc3y9vol931ZM4/Sr+U3CZFQuVQ80zVdX0oGg
         ZQaCqJyqHM612KTC9BgqDq5EjTES3tJlVZXFcAhewzPgJUGShxQgovMwqsApJAyL/2MQ
         73qb72R/YozR3Ul5HEQoufPCO6bu7legz1TBWX0O1JJC8ylFsZDOAcK/GfwADSjw+Rrn
         pQtb4ieju2q0JW6Xu+1Oovo9rInVtO1ZrQvNmCte+gTy6iggWL0VTld6xHfUsp4Cs3XW
         jAUzQ/3lmuEI1hHF1Eu0Nc4zA8CK2oL06+HVs46EpBgE5JDUFGWiSDgu6HN9ZzN+Owyl
         05Fg==
X-Gm-Message-State: AO0yUKUdCTeDsI3AObWSiA+EFYaKNHZ0A19uphoFYpLsapKszzGQadJD
	bBzQHRJ/Kl7Dio18cQiakfK8QYyfMFqkMGw1SNjovffewg7WIQ==
X-Google-Smtp-Source: AK7set/6hHg0Nod0N6Qs9t9pD9PM6JVRFdHySE+N5trzgl0H0qKarMmaqrd7tgVoASSuASpnIIGevY6z3n4EQlR1SiY=
X-Received: by 2002:a50:d758:0:b0:4bd:ce43:9ee8 with SMTP id
 i24-20020a50d758000000b004bdce439ee8mr17766701edj.6.1678652891770; Sun, 12
 Mar 2023 13:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <9ae6f90e-e1ea-d088-cdae-7dd8a541f00f@gmail.com> <71586432-360f-9b92-17f6-b05a8a971bc2@gmail.com>
In-Reply-To: <71586432-360f-9b92-17f6-b05a8a971bc2@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Mar 2023 21:28:00 +0100
Message-ID: <CAFBinCCJSn2LoK1MvEeQ0SUqEzczbWbSXT7ueb4yM9vO-a7eQg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: core: add helpers mmc_regulator_enable/disable_vqmmc
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_132813_139080_BE22016C 
X-CRM114-Status: UNSURE (   8.98  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTE6NDHigK9QTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxs
d2VpdDFAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZXJlJ3MgYSBudW1iZXIgb2YgZHJpdmVycyAo
ZS5nLiBkd19tbWMsIG1lc29uLWd4LCBtbWNpLCBzdW54aSkgdXNpbmcKPiB0aGUgc2FtZSBtZWNo
YW5pc20gYW5kIGEgcHJpdmF0ZSBmbGFnIHZxbW1jX2VuYWJsZWQgdG8gZGVhbCB3aXRoCj4gZW5h
YmxpbmcvZGlzYWJsaW5nIHRoZSB2cW1tYyByZWd1bGF0b3IuCj4KPiBNb3ZlIHRoaXMgdG8gdGhl
IGNvcmUgYW5kIGNyZWF0ZSBuZXcgaGVscGVycyBtbWNfcmVndWxhdG9yX2VuYWJsZV92cW1tYwo+
IGFuZCBtbWNfcmVndWxhdG9yX2Rpc2FibGVfdnFtbWMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIZWlu
ZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgpBY2tlZC1ieTogTWFydGluIEJsdW1l
bnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
