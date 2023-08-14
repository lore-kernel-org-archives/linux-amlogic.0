Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD7CC001E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Aug 2023 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBh9Aplz9xx1zUDjacu662BqaAuFN+rWfCURTHJZl+w=; b=DxwZE9qQs5mH54
	RdzyIJubsstmCYLyqWlnfjnuwL/ox4G97rn4dINw3Uc4Gsxoz7/2OXDFCwfGiFaqaU6dvSgRnl4fV
	bAOn9Ahrq+Ftn+J+HrM3lozBzDTJKMtH1OBg1vbNXW8U4yRyObdvVRNSA+GpiYiv5StanH1bmd01m
	rZBFE17+WboyngSi8VsSAz0pPvr1HFm24oFDw4AHxhfAniUDm+uXtSBB85P/KF4DM9E6hZq2u5rO6
	PuNWC/4JGU8PCFBKjsBMLpLhKx00GlQqgxb/4K5gMW9MV7b1Fk18fUW6oKDK+LUTtsYDTBDCtONRa
	L0hX1MQHmc+gNQdA3YJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSZ2-00GQnV-1A;
	Mon, 14 Aug 2023 08:04:36 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSZ0-00GQn5-1V;
	Mon, 14 Aug 2023 08:04:35 +0000
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d659ad4af70so3480410276.1;
        Mon, 14 Aug 2023 01:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000273; x=1692605073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzJrlLI5WNhjukEiyCuwgA8oXCqB2FTn6jKbDcA5q68=;
        b=Xze0RXyE/WI3YK0bZ4gJ8cLyHhqU/UEeYMgjwWaCrJZz2MgUboslNjZC88YPAcj7DG
         zUmdFPsPgeV5iAvu2VLNY6UXFle4Y43d6V45zdqD1b79p6/ql2LfOoyzYe8ipnzOT9un
         IPJSHzRhB9RuAL+x0wVr5P4TTlwmRzSZoWmUyUIWSwwJUTDOlv7r2ySY8NgayM5tCSgb
         1f9p+AR8sFj2gnVPyzHtqunoiZbFV4ApQMbOgVVoNY17Ypqs9CtDqxZk+qEh+fyi0y/X
         N4QEkS+Bwkr+B9brV6TxPfeS3x0GjGU58IhuZ5+aIE7lFcY+E/2hGGOrKRrLa2XZDmVR
         Lw+g==
X-Gm-Message-State: AOJu0YwK3RTtl9d0ucr5p1W4oGc4BMfAC84r5JWkpIQqTt/VuT9jR5Ec
	nERHTS3//SbSpu1+2zRsmzGtuSLtzx08iY7d
X-Google-Smtp-Source: AGHT+IFcRpWSQjqQpV+waU4Ea3oB3mgnDuKYcsZglGmFjD28c0dxB3h82uufpUutoZuFcA4dC5aCTw==
X-Received: by 2002:a25:907:0:b0:d48:1936:14d0 with SMTP id 7-20020a250907000000b00d48193614d0mr12324032ybj.53.1692000272982;
        Mon, 14 Aug 2023 01:04:32 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id v14-20020a25fc0e000000b00d20d4ffbbdbsm2307375ybd.0.2023.08.14.01.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:04:32 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-583fe10bb3cso45727117b3.2;
        Mon, 14 Aug 2023 01:04:32 -0700 (PDT)
X-Received: by 2002:a81:9294:0:b0:561:206a:ee52 with SMTP id
 j142-20020a819294000000b00561206aee52mr11727423ywg.24.1692000272605; Mon, 14
 Aug 2023 01:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230629073419.207886-1-tanure@linux.com> <20230629073419.207886-4-tanure@linux.com>
 <CAL_JsqKd_XYB682eHoW+omjGWLpuz0QL6zc0VB7u-Lm+X=PmOw@mail.gmail.com>
In-Reply-To: <CAL_JsqKd_XYB682eHoW+omjGWLpuz0QL6zc0VB7u-Lm+X=PmOw@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 14 Aug 2023 09:04:21 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2QUEhYax=bOzGHr2f0O8KSGnn0ncD5+HQRSOTUXwv6wA@mail.gmail.com>
Message-ID: <CAJX_Q+2QUEhYax=bOzGHr2f0O8KSGnn0ncD5+HQRSOTUXwv6wA@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] tty: serial: meson: Add a earlycon for the T7 SoC
To: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick <nick@khadas.com>, 
	Artem <art@khadas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_010434_510044_9F997407 
X-CRM114-Status: GOOD (  14.59  )
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

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgNDozNOKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMTozNOKAr0FNIEx1
Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlIG5ldyBBbWxv
Z2ljIFQ3IFNvQyBkb2VzIG5vdCBoYXZlIGEgYWx3YXlzLW9uIHVhcnQsCj4gPiBzbyBhZGQgT0Zf
RUFSTFlDT05fREVDTEFSRSBmb3IgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFu
dXJlIDx0YW51cmVAbGludXguY29tPgo+ID4gQWNrZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWls
LmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy90dHkvc2VyaWFsL21l
c29uX3VhcnQuYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4K
PiBUaGVzZSAyIHNlcmlhbCBwYXRjaGVzIHdpbGwgcHJvYmFibHkgbmV2ZXIgYmUgYXBwbGllZCBp
ZiB5b3UgZG9uJ3QKPiBzZW5kIHRoaXMgdG8gR3JlZyBhbmQgbGludXgtc2VyaWFsLiBJT1csIHVz
ZSBnZXRfbWFpbnRhaW5lcnMucGwgZm9yCj4geW91ciBwYXRjaGVzLgo+Cj4gUm9iClRoYW5rcywg
SSBkaWRuJ3Qgc2VlIHRoYXQgaXNzdWUuCkkganVzdCByZS1zZW50IGFkIHY5LgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
