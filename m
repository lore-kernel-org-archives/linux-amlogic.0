Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9EEC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 12:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21DF82084D
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 12:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oobDyOb6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqzSu3r+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21DF82084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5N5Pg2wctJc8c9EcvtXl2lhrlnNLsIcB0K0Ix8ACrQ=; b=oobDyOb6eAjXIk
	MTJLGsu07aaWknGnD/YH1pL43MfcjpM7hAW/9JkdYZT5b710+mFyw8ALgC1hB8WaxOWEV2TXGYPmA
	ckz0jEB8UYUsZq4xHV2wzzGjXvpioVYGUnC0qrLefxMh0uUwecw/AHeCx2lYPCit4jm/oj4DTpfC5
	LUPGoz4kBrPmkr5+XW77m7EcsscrgScYtfe5m03f2WsCvei/lSso204Cx6BfI21lweEeu8gtnOGfu
	31Pm0HBKZKHjFK5XKbXGllSOiHs0mTGYrnvdaqhZPJcjFZRZXKz3tMbS8Zi7lli39QD0p9xwQfb7L
	3WAW4jF/WtV+gSARMCfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxsKt-0005DI-R0; Wed, 14 Aug 2019 12:25:03 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxsKn-0004yO-Ev; Wed, 14 Aug 2019 12:24:59 +0000
Received: by mail-wm1-x343.google.com with SMTP id 207so4437829wma.1;
 Wed, 14 Aug 2019 05:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qvNyqHPxqM17Hgwfx7q6qGcw30LiEL2kP6HeS6GNFVk=;
 b=TqzSu3r+JKdRwqwXMxKNEjktlIzFuuB5McOF228N/8JIw1F4JBLqzzcwneQE0o/cKd
 5wICaY7S25HNHsrXXue6xGmC/UviD83CsaZUd5bmETUNFATYt+hI3S4aWmBtSy/tfrti
 mLWrd/+elniaPpb8c2fO8Pacmccxbwnyj1zAT6xIhqUABTnFzaEyj5vUVry4ox1btx48
 tZ07Sy+405SyHtQ836cmoYhbMr11W7XVn2IN28dRLJXmcMHcsRklcyxI3km9skDhRESw
 7Kgu4fYoqdNCbWNoSslPkVJic79u2dD57kRyyGJg3Ru0/JWungE8E8+oing9AgfoHDIk
 lmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qvNyqHPxqM17Hgwfx7q6qGcw30LiEL2kP6HeS6GNFVk=;
 b=KDPD4bOfeXwNNbGt6jNfJK6GZNFUx504SCWIvFAvbMjPuNAnAC2r9VmwIXMjsDREKd
 o6kDpY8JnH8b4pCxm83OFMBVrKJ/g4k2rvS5zhNbaqKnG/rGMTVcjiBL1UX2LGQW3K/H
 vbBqYNDrttSZzuuU6JgaEAlezZupFjpDWiK0qGSHiQkZvwt+q01Qg3AjpjO+YqFGho+X
 rJz279rHIcR+ncCn6CE73OXSS2kPERlEdWRyR8dX4YTYFDGjVAqjvB0Laphg0GArbjyS
 SgsVCyVreAXE37PoZluFJQWzvRp4Lr2cYAa46to0Em9iurma+qUQ8QYZlodZqiHN4oEl
 T70g==
X-Gm-Message-State: APjAAAW+dqG6fRLrV/W0sgPX9uJsLgtHrUaROtEc7/JI/hhLeMFGb9T2
 gl+lY47xvoB6Csct5DvAQlE8Yadikt8=
X-Google-Smtp-Source: APXvYqzkK3WQL9KYB1TyBBzuH6MQ5nCwZyYjF7EGNKE+AniVd85uZ9BfFF8sWaTFPPOyfIqxvfmzrg==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr8649524wmc.89.1565785495404; 
 Wed, 14 Aug 2019 05:24:55 -0700 (PDT)
Received: from [192.168.1.169] ([87.201.30.26])
 by smtp.gmail.com with ESMTPSA id l62sm4544230wml.13.2019.08.14.05.24.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 05:24:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v3 0/6] Add support of New Amlogic temperature sensor for
 G12 SoCs
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20190806130506.8753-1-glaroque@baylibre.com>
Date: Wed, 14 Aug 2019 16:24:51 +0400
Message-Id: <357FACA6-6EAC-4E9D-B6F7-4D8D0D59A20A@gmail.com>
References: <20190806130506.8753-1-glaroque@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_052457_563995_B9E9DFAD 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, khilman@baylibre.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gNiBBdWcgMjAxOSwgYXQgNTowNSBwbSwgR3VpbGxhdW1lIExhIFJvcXVlIDxnbGFyb3F1ZUBi
YXlsaWJyZS5jb20+IHdyb3RlOgo+IAo+IFRoaXMgcGF0Y2hzIHNlcmllcyBhZGQgc3VwcG9ydCBv
ZiBOZXcgQW1sb2dpYyB0ZW1wZXJhdHVyZSBzZW5zb3IgYW5kIG1pbmltYWwKPiB0aGVybWFsIHpv
bmUgZm9yIFNFSTUxMCBhbmQgT0RST0lELU4yIGJvYXJkcy4KPiAKPiBGaXJzdCBpbXBsZW1lbnRh
dGlvbiB3YXMgZG9pbmcgb24gSUlPWzFdIGJ1dCBhZnRlciBjb21tZW50cyBpIG1vdmUgb24gdGhl
cm1hbCBmcmFtZXdvcmsuCj4gRm9ybXVsYXMgYW5kIGNhbGlicmF0aW9uIHZhbHVlcyBjb21lIGZy
b20gYW1sb2dpYy4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAtIGZpeCB5YW1sIGRvY3VtZW50
aW9uIAo+ICAtIHJlbW92ZSB1bm5lZWRlZCBzdGF0dXMgdmFyaWFibGUgZm9yIHRlbXBlcmF0dXJl
LXNlbnNvciBub2RlCj4gIC0gcmV3b3JrIGRyaXZlciBhZnRlciBNYXJ0aW4gcmV2aWV3Cj4gIC0g
YWRkIHNvbWUgaW5mb3JtYXRpb24gaW4gY29tbWl0IG1lc3NhZ2UKPiAKPiBDaGFuZ2VzIHNpbmNl
IHYxOgo+ICAtIGZpeCBlbnVtIHZzIGNvbnN0IGluIGRvY3VtZW50YXRpb24KPiAgLSBmaXggZXJy
b3Igd2l0aCB0aGVybWFsLXNlbnNvci1jZWxscyB2YWx1ZSBzZXQgdG8gMSBpbnN0ZWFkIG9mIDAK
PiAgLSBhZGQgc29tZSBkZXBlbmRlbmNpZXMgbmVlZGVkIHRvIGFkZCBjb29saW5nLW1hcHMKPiAK
PiBEZXBlbmRlbmNpZXMgOgo+IC0gcGF0Y2ggMyw0ICYgNTogZGVwZW5kcyBvbiBOZWlsJ3MgcGF0
Y2ggYW5kIHNlcmllcyA6Cj4gICAgICAgICAgICAgIC0gbWlzc2luZyBkd2MyIHBoeS1uYW1lc1sy
XQo+ICAgICAgICAgICAgICAtIHBhdGNoc2V0cyB0byBhZGQgRFZGUyBvbiBHMTJhWzNdIHdoaWNo
IGhhdmUgZGVwcyBvbiBbNF0gYW5kIFs1XQo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1hbWxvZ2ljLzIwMTkwNjA0MTQ0NzE0LjIwMDktMS1nbGFyb3F1ZUBiYXlsaWJyZS5j
b20vCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAxOTA2MjUx
MjM2NDcuMjYxMTctMS1uYXJtc3Ryb25nQGJheWxpYnJlLmNvbS8KPiBbM10gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDE5MDcyOTEzMjYyMi43NTY2LTEtbmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20vCj4gWzRdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9n
aWMvMjAxOTA3MzEwODQwMTkuODQ1MS01LW5hcm1zdHJvbmdAYmF5bGlicmUuY29tLwo+IFs1XSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljLzIwMTkwNzI5MTMyNjIyLjc1NjYt
My1uYXJtc3Ryb25nQGJheWxpYnJlLmNvbS8KPiAKPiBHdWlsbGF1bWUgTGEgUm9xdWUgKDYpOgo+
ICBkdC1iaW5kaW5nczogdGhlcm1hbDogQWRkIERUIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9y
IEFtbG9naWMKPiAgICBUaGVybWFsCj4gIHRoZXJtYWw6IGFtbG9naWM6IEFkZCB0aGVybWFsIGRy
aXZlciB0byBzdXBwb3J0IEcxMiBTb0NzCj4gIGFybTY0OiBkdHM6IGFtbG9naWM6IGcxMjogYWRk
IHRlbXBlcmF0dXJlIHNlbnNvcgo+ICBhcm02NDogZHRzOiBtZXNvbjogc2VpNTEwOiBBZGQgbWlu
aW1hbCB0aGVybWFsIHpvbmUKPiAgYXJtNjQ6IGR0czogYW1sb2dpYzogb2Ryb2lkLW4yOiBhZGQg
bWluaW1hbCB0aGVybWFsIHpvbmUKPiAgTUFJTlRBSU5FUlM6IGFkZCBlbnRyeSBmb3IgQW1sb2dp
YyBUaGVybWFsIGRyaXZlcgoKVGVzdGVkLWJ5OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5z
aGV3aXR0QGdtYWlsLmNvbT4KCknigJl2ZSB0ZXN0ZWQgdGhpcyBzZXJpZXMgd2l0aCBPZHJvaWQg
TjIgYW5kIEtoYWRhcyBWSU0zLCBYOTYtTWF4LiBQYXRjaGVzIHRvIGFkZApzdXBwb3J0IGZvciBW
SU0zL1g5Ni1tYXggd2lsbCBiZSBzdWJtaXR0ZWQgb25jZSB0aGUgZHJpdmVyIGlzIG1lcmdlZC4K
ClZJTTM6fiAjIGRtZXNnIHwgZ3JlcCB0aGVybWFsClsgICAgMC4wNDYzNzVdIHRoZXJtYWxfc3lz
OiBSZWdpc3RlcmVkIHRoZXJtYWwgZ292ZXJub3IgJ3N0ZXBfd2lzZScKClZJTTM6fiAjIGNhdCAv
c3lzL2RldmljZXMvdmlydHVhbC90aGVybWFsL3RoZXJtYWxfem9uZTAvdGVtcAo1MTMwMAoKVklN
Mzp+ICMgY2F0IC9zeXMvZGV2aWNlcy92aXJ0dWFsL3RoZXJtYWwvdGhlcm1hbF96b25lMS90ZW1w
CjUyODAwCgpDaHJpc3RpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
