Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF49C71153
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8UwlnPvG7xPbW8+/NJGSY2qRE3yB3j5MFRGDQhqc5g=; b=wLZmCHw9OYJKzA
	KvyapMRUj5Palg8V6o4UUqRJnpBwHg8H/0QOrxJoMmP2OOLd0XnrDiQouxY2LIGHJKz3IxW+UJW2o
	PBoTPR2E2HWQQAOtSwyQZYOsUtHaEhibt8saFVwuee0UmYN+Rw5K3BPz6xl0ZnWdpELU66+jBxi5a
	XBGeG9FDs50sZ6lBvA80Kf9Q/SVaPlClpGA2t+fhCAcNnunZFf4Ly+CgjbU8TdfsA1JVkdweuxbe6
	UieySXApsHWhfQEV/o/rFW0QsLC6NqvcKfu5PjAMq+cC1RDJFj2OTMYT1wfBDCXj4GH0QeqbGXmmu
	KTI4osUsnV/cAj9uBcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qabKu-009Yy9-1x;
	Mon, 28 Aug 2023 12:27:16 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qabKr-009YxV-14;
	Mon, 28 Aug 2023 12:27:14 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-58fae4a5285so37257767b3.0;
        Mon, 28 Aug 2023 05:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693225631; x=1693830431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vd2oaz8O6yC6TQP51Ippcp5WPCtEkFpwR0Ae/q8Ui2E=;
        b=c7FWpcGgnmJ7FxjknU8oKR9qQCZYTgE7Kj0hMz+M8HdzQLogyDVZpbauETLoMA31DG
         OX7EiVh1UgEJRFpW5T0gLuvuxYrr1kpmN7lkyI0/iMCnQ2SVDeE3vBwwIsxyx68FkbMr
         YmMNdiCr2hNDMLi8Pl9VNFi6ugLWzsHWyVwkFND1nqEqn6chUFl8Kw8t4j8+h1OmEuOy
         37LcF4h8J1AX7x4wLhjCQcByC9iHClh8+iqBmjqur6/zLigrD20GcSM7E0egUOHjt9Xi
         70NWQnBndoRFQkaVRimeOqXUEw2lrVfnwqDQLj513irYoL7v+eE+2bWzWMbAof+z1e8G
         a0iA==
X-Gm-Message-State: AOJu0YzbD7NgrDX15g8sUMH/+SDptQfgXyOC87qN5DZHiFJBfJnN5lqq
	O7wLJonjHXxM1Snv9+fuuWOM5qBFOorkeavI
X-Google-Smtp-Source: AGHT+IGkZhw8dokZBPUYrDjz9GUywXhxLAt0CbjNZN5pv0maME4IuvA7Jl8nQISP5pgxLyPmehP0Cg==
X-Received: by 2002:a0d:df81:0:b0:573:b45e:f7bb with SMTP id i123-20020a0ddf81000000b00573b45ef7bbmr25935447ywe.6.1693225630828;
        Mon, 28 Aug 2023 05:27:10 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id g185-20020a0dc4c2000000b0057a8de72338sm2085429ywd.68.2023.08.28.05.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 05:27:10 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-58d9ba95c78so37013347b3.1;
        Mon, 28 Aug 2023 05:27:10 -0700 (PDT)
X-Received: by 2002:a0d:ddc8:0:b0:592:7a6c:65a8 with SMTP id
 g191-20020a0dddc8000000b005927a6c65a8mr13008456ywe.26.1693225630384; Mon, 28
 Aug 2023 05:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230828121053.60838-1-tanure@linux.com> <7720b990-c9cf-4c3d-8bb2-928b3b17f089@linaro.org>
In-Reply-To: <7720b990-c9cf-4c3d-8bb2-928b3b17f089@linaro.org>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 28 Aug 2023 13:26:59 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+0AWcY7SySsdtVn=7xE8H0YtLBfN2XrKSOZMGB-60NRhg@mail.gmail.com>
Message-ID: <CAJX_Q+0AWcY7SySsdtVn=7xE8H0YtLBfN2XrKSOZMGB-60NRhg@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: meson: Add a earlycon for the S4 SoC
To: neil.armstrong@linaro.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_052713_368537_FA0F2A45 
X-CRM114-Status: GOOD (  17.07  )
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

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMToxNuKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMjgvMDgvMjAyMyAxNDox
MCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gVGhlIG5ldyBBbWxvZ2ljIFM0IFNvQyBkb2VzIG5v
dCBoYXZlIGEgYWx3YXlzLW9uIHVhcnQsIHNvIGFkZAo+ID4gT0ZfRUFSTFlDT05fREVDTEFSRSBm
b3IgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXgu
Y29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgfCA0ICsr
LS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyBiL2Ry
aXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPiA+IGluZGV4IDc5MGQ5MTBkYWZhNS4uOGRm
YWEyNjBlNTQ1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQu
Ywo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+ID4gQEAgLTY0Niw4
ICs2NDYsOCBAQCBtZXNvbl9zZXJpYWxfZWFybHlfY29uc29sZV9zZXR1cChzdHJ1Y3QgZWFybHlj
b25fZGV2aWNlICpkZXZpY2UsIGNvbnN0IGNoYXIgKm9wdAo+ID4gICAgICAgcmV0dXJuIDA7Cj4g
PiAgIH0KPiA+Cj4gPiAtT0ZfRUFSTFlDT05fREVDTEFSRShtZXNvbiwgImFtbG9naWMsbWVzb24t
YW8tdWFydCIsCj4gPiAtICAgICAgICAgICAgICAgICBtZXNvbl9zZXJpYWxfZWFybHlfY29uc29s
ZV9zZXR1cCk7Cj4gPiArT0ZfRUFSTFlDT05fREVDTEFSRShtZXNvbiwgImFtbG9naWMsbWVzb24t
YW8tdWFydCIsIG1lc29uX3NlcmlhbF9lYXJseV9jb25zb2xlX3NldHVwKTsKPiA+ICtPRl9FQVJM
WUNPTl9ERUNMQVJFKG1lc29uLCAiYW1sb2dpYyxtZXNvbi1zNC11YXJ0IiwgbWVzb25fc2VyaWFs
X2Vhcmx5X2NvbnNvbGVfc2V0dXApOwo+Cj4gTm90IHN1cmUgd2h5IHlvdSB3b3VsZCBjaGFuZ2Ug
Ym90aCBsaW5lcywgYW5kIHdoZXJlJ3MgdGhlIHQ3IGVudHJ5ID8Kb2ssIGJ1dCB3ZSBkb24ndCBu
ZWVkIHQ3LCByaWdodD8gVDcgd2lsbCB1c2UgUzQgY29tcGF0aWJsZSBsaW5lLgo+Cj4gTmVpbAo+
Cj4gPgo+ID4gICAjZGVmaW5lIE1FU09OX1NFUklBTF9DT05TT0xFX1BUUihfZGV2bmFtZSkgKCZt
ZXNvbl9zZXJpYWxfY29uc29sZV8jI19kZXZuYW1lKQo+ID4gICAjZWxzZQo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
