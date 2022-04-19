Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C768EC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Apr 2022 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2zAm0+dl7Sf/g+uV5rvuQqHX+yyyWsF0XrTtQXeZ5s=; b=BgYi378wN3Uvfw
	UDVxNB6PaZoQgCqtvMyFD19Q4gv3MGN4F0xXE0Q9QJscUXBU0EipPCkYZKNwhwxfeAsdu7RHu2zrH
	6WSdb4KuvzrTeUFxbCudbPwhEhDKjYJKKcE/9VWaLaoJB8hkF40Qjduxyel8MewbadHBTHWohufPi
	tWKwEZV3nEf3kPViB4kLguzU43bY9TXS0I9zVgIOYmPzEmqsC4ksqOvKRGbPfvxWYZfzYYP727dmG
	f0MrlBwWBmnnCB1lismYl62RU0RnVPvVDL+xBOo6HxXSVcm1u1t5SVs4uepXCVqjekb2JWaZxYsHv
	ry+RQKaemtmk0/VS7Rjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngiZc-00289d-2M; Tue, 19 Apr 2022 07:46:56 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiRe-00248I-US; Tue, 19 Apr 2022 07:38:44 +0000
Received: by mail-ed1-f46.google.com with SMTP id v15so20079967edb.12;
 Tue, 19 Apr 2022 00:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cMIQtXBcL0LX2Xu0lItqcQNjpRN4Lxw6ZeFSuk932VI=;
 b=NXP0Xtenv2cF0iIEHKjwgvfgsvFv3YVUIH5L2O0sPtllI/68NEhUNh0QjJwdNU5QGI
 HF6Tp0k7iPKLfpPhjosRyZmHlo/rVzdKzTTKN896gJZ7ZZfld3d8wHCTepqvfCd1J18O
 TnMVMCNq/waLDyLvvfaaivbFPgWX9QIBoqaw25fltuIV4ZHP7XJ1GRnZwzxfDI6i6mLs
 QdvFfNBd7rU16jKGWjpi4VR8O4L3O1+8t80eGDz9P+FSHhPqciaiZ3P3AQY6TYe95jd6
 TuzHu2VaYfxfAyeoZIsxnFCDfHjK4zS0br+b6ybkRdOMvu/+7ts42dMdohCqGy/BTOTB
 jbvw==
X-Gm-Message-State: AOAM5316Q1f0sdv2dEKN0r6z9tsQ4JEqiirIVSRd/kG7Vu/qgH1BJQs2
 KGkOaAPmgcjn+6qIQQm4Ino=
X-Google-Smtp-Source: ABdhPJx9uF7mg6dncUt7CC20Ri+ArabDBoEQkVzbHd/rqPriMfROsVzMkJEP2rCKSX2QYiazZ8y76A==
X-Received: by 2002:a05:6402:22c4:b0:41d:78b1:349 with SMTP id
 dm4-20020a05640222c400b0041d78b10349mr16239817edb.365.1650353918802; 
 Tue, 19 Apr 2022 00:38:38 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05640243c900b0041facb9ac9esm7807362edc.1.2022.04.19.00.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 00:38:38 -0700 (PDT)
Message-ID: <9af92c78-73a7-d524-182c-3ebffa69b08a@kernel.org>
Date: Tue, 19 Apr 2022 09:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 1/2] tty: serial: meson: Add a 12MHz internal clock
 rate to calculate baud rate in order to meet the baud rate requirements of
 special BT modules
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220418053202.24528-1-yu.tu@amlogic.com>
 <20220418053202.24528-2-yu.tu@amlogic.com>
 <CAHp75VeW65dV9jJu8-yUWME+XKnaxZBu5Zv8iEJxP2dizA=HUg@mail.gmail.com>
 <d10e27ff-e674-87bd-2c98-63c7040baeb1@amlogic.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <d10e27ff-e674-87bd-2c98-63c7040baeb1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_003843_010532_9772FF7B 
X-CRM114-Status: GOOD (  14.78  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxOS4gMDQuIDIyLCA5OjI5LCBZdSBUdSB3cm90ZToKPiBIaSBBbmR5LAo+ICDCoMKg
wqDCoFRoYW5rIHlvdSBmb3IgeW91ciBhZHZpY2UuCj4gCj4gT24gMjAyMi80LzE4IDIwOjA5LCBB
bmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+PiBPbiBNb24s
IEFwciAxOCwgMjAyMiBhdCA4OjUwIEFNIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6
Cj4+Pgo+Pj4gQSAvMiBkaXZpZGVyIG92ZXIgWFRBTCB3YXMgaW50cm9kdWNlZCBzaW5jZSBHMTJB
LCBhbmQgaXMgcHJlZmVycmVkCj4+PiB0byBiZSB1c2VkIG92ZXIgdGhlIHN0aWxsIHByZXNlbnQg
LzMgZGl2aWRlciBzaW5jZSBpdCBwcm92aWRlcyBtdWNoCj4+PiBjbG9zZXIgZnJlcXVlbmNpZXMg
dnMgdGhlIHJlcXVlc3QgYmF1ZHJhdGUuRXNwZWNpYWxseSB0aGUgQlQgbW9kdWxlCj4+Cj4+ICdl
LiBFJyAobWluZCB0aGUgc3BhY2UpCj4gTXkgc3RhdGVtZW50IGlzIGEgd2hvbGUuIFRoZXJlIHNo
b3VsZCBiZSBubyBzcGFjZXMuCgpQZXJpb2Qgc2hvdWxkIGJlIGZvbGxvd2VkIGJ5IGEgc3BhY2Us
IG9mIGNvdXJzZS4KCj4+PiB1c2VzIDNNaHogYmF1ZCByYXRlLiA4TWh6IGNhbGN1bGF0aW9ucyBj
YW4gbGVhZCB0byBiYXVkIHJhdGUgYmlhcywKPj4+IGNhdXNpbmcgc29tZSBwcm9ibGVtcy4KPj4K
Pj4gLi4uCj4+Cj4+PiArc3RydWN0IG1lc29uX3VhcnRfZGF0YSB7Cj4+PiArwqDCoMKgwqDCoMKg
IGJvb2wgaGFzX3h0YWxfZGl2MjsKPj4KPj4gSSB3b3VsZCBwcmVmZXIgdG8gc2VlIHRoaXMgYXMg
YW4gdW5zaWduZWQgaW50IGFuZCB3aXRoIGEgbGVzcwo+PiBwYXJ0aWN1bGFyIG5hbWUsIGUuZy4g
eHRhbF9kaXYgd291bGQgc3VmZmljZS4KPiBJIGRvbid0IGhhdmUgYSBwcm9ibGVtIHdpdGggeW91
ciBzdWdnZXN0aW9uLkxldCdzIHNlZSBXaGF0IE5laWwgaGFzIHRvIHNheS4KCkFjdHVhbGx5IHdo
eSB1aW50IHByb3ZpZGVkIGl0J3MgYSBib29sZWFuIHZhbHVlPyBPciBkbyB5b3UgbWVhbiB0byBz
dG9yZSAKdGhlIGRpdmlzb3IgZGlyZWN0bHkgaW4gdGhpcyBtZW1iZXIsIEFuZHk/Cgp0aGFua3Ms
Ci0tIApqcwpzdXNlIGxhYnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
