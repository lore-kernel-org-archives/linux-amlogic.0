Return-Path: <SRS0=NF66=K2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46932C47082
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 May 2021 07:20:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1BF26108D
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 May 2021 07:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1BF26108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dmCaZXYAsk1VIypZnUhCOn1vri8Q92Ciwc8XwPVtDzM=; b=z+ygoCpZUo0ytaNnlH9GI6m4RQ
	7gCLkZUstqVa89B07iiHGe2PvCliQXKyDUa0jJgnAuOW+E+EpCnCRLU4owaEEyeapHsoTZwvfcyWz
	1EVgxnod1grNPTpW+X7czgIvn/IScmODEGYKK+3bDm4dHWpKG2H1rq5iG7aps7qy5vK57V899fUGp
	9k/QMOSCr5iI7LypDY0013a9JIeMeNCx+3rkewqvpNlY2ChfvsgbO4tWrEiuXNHrj6ckF9A+WhpT9
	WlmATNmxS4aDUiW7BqIu7Vbioyxi4o/+aGrfNd4/4YbX0ap1q/I+zaRmCsjX1phO0Q8I6Un21O9pn
	b2/wW6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lncEF-00BAEx-8x; Mon, 31 May 2021 07:20:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lncEC-00BAE3-9H
 for linux-amlogic@lists.infradead.org; Mon, 31 May 2021 07:20:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so1222857wmd.5
 for <linux-amlogic@lists.infradead.org>; Mon, 31 May 2021 00:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qoVsbFFh0PjM2QQQD7xPgMLSh1zIQ8lPZ/Hl8DKqcD8=;
 b=BRW8wFkBX0x8mXh9nLKc0Yj1Fbhht0VL1pWZ2hUGufTM9vJV1rZTBna3xWkfNxqguS
 OmFN47SE2uJPc6TkUC4KsIOKkLQQ3+duXZLCvW3K4HPb8C4Q/0QsFr6soXx+BrVdf4ky
 MA4d1pQBGYNnzo4gpV+HusOcM8JIEcBI/Mmvyum+g4IT18hhJgFvhN7VQWC7/D7hyiEg
 Nh8w78KsR4KBVx9ZAfAzdskeYMLEPK4I3Ych3jEpr4GJkIDBfQ7XVoN4WKJ71Arqbs3B
 KzY6m/QyZ47Vqo09MQSAj59C7xI7IVU9/iZuV/ISD1W8ux6egyK+YtXAO1ddixbJBQAq
 4LJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qoVsbFFh0PjM2QQQD7xPgMLSh1zIQ8lPZ/Hl8DKqcD8=;
 b=rspFlLwBAFaHpDY0ItRzFc9ONE03+Xgorw1TbEkTTz54EX9a3Kgta/cT0UxtD5pqT2
 wna4IJFCyiimV1WSvLLbJAvl44qAUCZn2LfQp/hIS0LhSdCUV0LoFa2M9MXnboOqyR9o
 L5sK8iu5NQwNSm2kZpyIa8AUpr7SCaKH0Z2sRykwHJxr0hjcjyNGrRjukINHSKtUvrih
 FjObC9jCl7Ni1w7oFRJ1l1/9BoGGtRJGisVpvnjX7zbjuR8UxfIkSa2QbUyAaRPtRqlT
 l8bfDp0w8RTwfo7h0MDpoATGZYy90AvNC7fTOJbF4jeOjx3vEYyqJXq+nHRoGK329fqi
 kN9Q==
X-Gm-Message-State: AOAM5328oVn2IvPkbJIKa6KMLfb0gpMLUrUaviqdP1fodJZxaGF30QSo
 iRu0JA5AQFkw3W6cEIkyLlPCNQ==
X-Google-Smtp-Source: ABdhPJyMZyeQWAdTM66xnP4Jfp48zbeOloOXHBPdBWB5vha8Y4212jbdxhrJXSHfSAsd/VKdmSJ2hg==
X-Received: by 2002:a05:600c:231a:: with SMTP id
 26mr13484041wmo.92.1622445644902; 
 Mon, 31 May 2021 00:20:44 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6567:aa5c:6dc2:fff8?
 ([2a01:e0a:90c:e290:6567:aa5c:6dc2:fff8])
 by smtp.gmail.com with ESMTPSA id u8sm4520500wrb.77.2021.05.31.00.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 00:20:44 -0700 (PDT)
Subject: Re: #linux-amlogic IRC channel: move to Libera.Chat or OFTC?
From: Neil Armstrong <narmstrong@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: jbrunet@baylibre.com, khilman@baylibre.com, carlo@caione.org,
 Beniamino Galvani <b.galvani@gmail.com>
References: <CAFBinCBuFzJVXFdDqpy9HgWt4AMMk_jeOWvQ-mYke2z274FXPQ@mail.gmail.com>
 <97572f8e-b5c8-4bc4-8348-a3c284bd9aa9@baylibre.com>
Organization: Baylibre
Message-ID: <10e38e44-1634-e92c-8aa0-b515f9c149b3@baylibre.com>
Date: Mon, 31 May 2021 09:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <97572f8e-b5c8-4bc4-8348-a3c284bd9aa9@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_002048_353511_27AE5A94 
X-CRM114-Status: GOOD (  25.62  )
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

SGkgQWxsLAoKT24gMjcvMDUvMjAyMSAwOTozMiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGkg
TWFydGluLAo+IAo+IFRoYW5rcyBmb3Igc3RhcnRpbmcgdGhpcyB0aHJlYWQuCj4gCj4gT24gMjYv
MDUvMjAyMSAyMDoyNSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+
IHRvZGF5IHRoZSAjbGludXgtYW1sb2dpYyBjaGFubmVsIG9uIEZyZWVub2RlIHdhcyB0YWtlbiBv
dmVyIGJ5IHRoZQo+PiBGcmVlbm9kZSBuZXR3b3JrIGFkbWluaXN0cmF0b3JzOiBbMF0KPj4gSSBi
ZWxpZXZlIGl0IGlzIGJlY2F1c2UgdGhlIGNoYW5uZWwgc3ViamVjdCBjb250YWluZWQgIkFsc28g
b24gTGliZXJhLkNoYXQiLgo+Pgo+PiBEdWUgdG8gdGhlIHJlY2VudCBldmVudHMgZ29pbmcgb24g
d2l0aCBGcmVlbm9kZSBvdGhlciAobGFyZ2UpCj4+IGNvbW11bml0aWVzIGFyZSBhbHNvIGxlYXZp
bmcgRnJlZW5vZGUsIGZvciBleGFtcGxlOgo+PiAtIEFyY2ggTGludXg6IG1pZ3JhdGluZyB0byBM
aWJlcmEuQ2hhdAo+PiAtIE9wZW5XcnQ6IG1pZ3JhdGluZyB0byBPRlRDCj4+IC0gcGFuZnJvc3Qg
YW5kIGxpbWEgZHJpdmVyczogbWlncmF0aW5nIHRvIE9GVEMKPj4gLSAobWFueSBtb3JlKQo+Pgo+
PiBTbyBJIHRoaW5rIHdlIGhhdmUgdHdvIG9wdGlvbnM6Cj4+IDEuIE1vdmluZyB0byBMaWJlcmEu
Q2hhdAo+PiAyLiBNb3ZpbmcgdG8gT0ZUQwo+PiAzLiBUcnlpbmcgdG8gZ2V0IGJhY2sgb3VyICJv
bGQiIGNoYW5uZWwgb24gRnJlZW5vZGUKPiAKPiBJIHNlbnQgYW4gZW1haWwgdG8gdGhlIGNvbnRh
Y3QtdXNAZnJlZW5vZGUubmV0IGJ1dCBoYWQgbm8gYW5zd2VyIHNvIGZhciwgaG9uZXN0bHkgSSBk
b24ndCBleHBlY3QgYSByZXBseS4KCkkgZmluYWxseSBnb3QgYWNjZXNzIGJhY2sgdG8gdGhlIGNo
YW5uZWwgb24gZnJlZW5vZGU6CgpEZWFyIE5laWwsCgpXZSBncmVhdGx5IGFwb2xvZ2l6ZSBmb3Ig
dGhlIGluY29udmVuaWVuY2UsIGFuZCB0aGFuayB5b3Ugc28gbXVjaApmb3IgeW91ciBwYXRpZW5j
ZS4gIFdlIGhhdmUgdHJhbnNmZXJyZWQgI2xpbnV4LWFtbG9naWMgdG8g4oCZbmFybXN0cm9uZ+KA
mQpvbiBmcmVlbm9kZS4KCklmIHlvdSBoYXZlIGFueSBvdGhlciBxdWVzdGlvbnMgb3IgY29tbWVu
dHMsIHBsZWFzZSBkbyBub3QgaGVzaXRhdGUKdG8gcmVhY2ggb3V0LiAgT25jZSBhZ2Fpbiwgd2Ug
YXBvbG9naXplIGZvciB0aGUgaW5jb252ZW5pZW5jZSB0aGlzCmNhdXNlZC4KClRoYW5rIHlvdSBm
b3IgY2hvb3NpbmcgZnJlZW5vZGUuCgpCZXN0IHJlZ2FyZHMsCkFuZHJldwoKQnV0IHRoaXMgZG9l
c24ndCBtZWFuIGl0IHdvbid0IGhhcHBlbiBhZ2Fpbi4KCj4gCj4+Cj4+IFRoZSBzdGVwcyAoYXMg
ZmFyIGFzIEkgY2FuIHRlbGwpIGZvciBzd2l0Y2hpbmcgdG8gYSBuZXcgbmV0d29yayBhcmU6Cj4+
IC0gY3JlYXRpbmcgI2xpbnV4LWFtbG9naWMgb24gdGhlIG5ldyBuZXR3b3JrIChhbHJlYWR5IGRv
bmUgYnkgTmVpbCBvbgo+PiBMaWJlcmEuQ2hhdCBhbmQgT0ZUQykKPj4gLSBpbnZpdGluZyB0aGUg
d2hpdGVxdWFyayBJUkMgbG9nZ2VyIHRvIHRoZSBjaGFubmVsIG9uIHRoZSBuZXcgbmV0d29yawo+
PiAtIHVwZGF0aW5nIHRoZSB0b3BpYyBvZiB0aGUgbmV3IGNoYW5uZWwgdG8gaW5mb3JtIHVzZXJz
IHRoYXQgYWxsCj4+IG1lc3NhZ2VzIGFyZSBsb2dnZWQgYW5kIHRoZSBsb2dzIGFyZSBhdmFpbGFi
bGUgcHVibGljbHkKPj4gLSB1cGRhdGluZyBvdXIgd2lraSB3aXRoIHRoZSBuZXcgSVJDIG5ldHdv
cms6IFsxXQo+Pgo+PiBJIGFtIG5vdCBzdXJlIHdoaWNoIHN0ZXBzIG5lZWQgdG8gYmUgdGFrZW4g
dG8gZ2V0IG91ciAib2xkIiBjaGFubmVsIG9uCj4+IEZyZWVub2RlIGJhY2suCj4+Cj4+IFdoYXQg
ZG8geW91IHRoaW5rPwo+Pgo+PiBQZXJzb25hbGx5IEkgdm90ZSBmb3Igb3B0aW9uICMxIG9yICMy
Lgo+PiBJIGhhdmUgbm8gc3Ryb25nIHByZWZlcmVuY2Ugb24gd2hpY2ggbmV0d29yayB0byBjaG9v
c2UuCj4gCj4gTmVpdGhlciBidXQgaXQgc2VlbXMgdGhlIG1vc3QgdXNlcnMgaGF2ZSBtaWdyYXRl
ZCB0byB0aGUgTGliZXJhLkNoYXQgY2hhbm5lbCwgc28gSSdsbCBiZQo+IGluIGZhdm9yIHRvIHN3
aXRjaCB0byBsaWJlcmEuCj4gCj4gTGV0IHVzIGEgZmV3IGRheXMgdG8gZGVjaWRlIGFnYWluIGFu
ZCBkbyB0aGUgc3dpdGNoIGVhcmx5IG5leHQgd2Vlay4KCkknbSBzdGlsbCBpbiBmYXZvciB0byBz
d2l0Y2ggdG8gTGliZXJhLkNoYXQsCgpOZWlsCgo+IAo+IE5laWwKPiAKPj4KPj4KPj4gQmVzdCBy
ZWdhcmRzLAo+PiBNYXJ0aW4KPj4KPj4KPj4gWzBdIGh0dHBzOi8vZnJlZW5vZGUuaXJjbG9nLndo
aXRlcXVhcmsub3JnL2xpbnV4LWFtbG9naWMvMjAyMS0wNS0yNgo+PiBbMV0gaHR0cDovL2xpbnV4
LW1lc29uLmNvbS8KPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
