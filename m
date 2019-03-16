Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8729EC43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:41:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56456218E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:41:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="khNKjQfb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JPJ9XkWI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56456218E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmHbTDOuRHe5FSb5pSJm0l61sW5sFvLzoOwziz2AjxM=; b=khNKjQfb8cdOjS
	cfUx8jgw8oFkxKt59LcHydOb5Tz7a+7V9he+J5joXWgu79oAqEnbcnZg8ZI/FR2LuKfH7HZiT+j6f
	c5WcqBVhsRsoSY4lPF+wZGNn1WxWj7cTDz08IMF2wTcLnic3dC3u7BjZPH8jFHTaYK+it7eGLjjgE
	2LU7KEANIyP7tPXWLwfC83E8dWHCxnK21bd9yKbAof57/E30ZrjGVQ/ZxX9idPWvdFMyIbhAC4883
	cHMWxrBxdUDhYOcZQBncgHYqBIpsl6HJTium2cUqwp8hj65XnzkUJGCTnds5+4kKhRfyt5jOvzGM2
	U+Xw0QAxXzVF28iRm7Uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5AVC-00026N-AE; Sat, 16 Mar 2019 14:41:34 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5AV9-00025T-Ji
 for linux-amlogic@lists.infradead.org; Sat, 16 Mar 2019 14:41:32 +0000
Received: by mail-wr1-x441.google.com with SMTP id w1so6499694wrp.2
 for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2019 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=3JRLm6aE8nn8AvGA5lUY5WZdl5snm2+VkOvlXdbMgtI=;
 b=JPJ9XkWIO8HUDvxFf+kq39rqA4rHHGIIFiEcw67Q7gKsJq0mcMInQ+A6zyjIcEBy2l
 BgLOYZPerTuO0DKcGe9vq9E5RvrH2BpS6omPPX2rav1bIgy+KdgXvJ+MNkx7UKI38q+X
 jvJdrcyr3fhhFU9EyNGZ3MTDH4QbDXhI89t6FNjxBj087O+2ETozMRqN1uQXJJ5m3xNI
 HzI3/Oi0Bral0ihWSAWRFa/R5OcgkZr8Ykmvrtvo1pzV/rIdyqGOBDaqUE6QYYJAlMh2
 Xs3pue3fqjuy95eVMpmPchiMq9TTWb4spc3H6wFW6yfevoj8MKRzJyHl77k8eWHbXpSv
 96Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=3JRLm6aE8nn8AvGA5lUY5WZdl5snm2+VkOvlXdbMgtI=;
 b=aMUvPjzEzuy5vzS5kNQ0+4bbZVqgGtg/7wSthRXbOgxal85jbvsKDBXDK5YSLVldnH
 zoiRG16Hi++aXiIV5XRsvPbg+cXhO5qJy16cddqdOgYVZ2C3DlPc2vlK/hVNHikVHwSX
 pZr4tngeH3q+DMVnks0yDZvcognxlkh7nK3hZUtzGYx/oAO9my5UoRkxmWNXbEA+Oeut
 GgogOwPu9K1EcAvFffANPhXzhVlwQyRkPR/ZI9kChX3dfyFjn/0fKI3ngX70Z29y7iJB
 0aczkrIxmswLwWOPpgxmaBIPFcfXrHfF06CrJNAOIjLhNKG4LV6CqL3MSYWx2LYo0uXa
 My4w==
X-Gm-Message-State: APjAAAUKD8V+GsOR779Wnqg2KKjZ5xwB9hJGC89zPtx/va9QVo8HuBmY
 v4AMMvTtCt/lxe31/4ynYSo3MQ==
X-Google-Smtp-Source: APXvYqxJTlTq+VQ5O/KmnNSLpkSECzgV79OMiHzEa8PG0yPJOhl4AaBhfbjnFDbTV8Zx+wTNYtb/CA==
X-Received: by 2002:adf:efc8:: with SMTP id i8mr6360395wrp.164.1552747289844; 
 Sat, 16 Mar 2019 07:41:29 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 r6sm4955723wrx.48.2019.03.16.07.41.28
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 16 Mar 2019 07:41:29 -0700 (PDT)
Message-ID: <5C8D0B18.1070001@baylibre.com>
Date: Sat, 16 Mar 2019 15:41:28 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH 06/11] arm64: dts: meson-g12a-x96-max: add regulators
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-7-narmstrong@baylibre.com>
 <CAFBinCBEeCAKuzOztT5wU1t9UvY=ocVVrdHB6PNG7pp+gXq1=A@mail.gmail.com>
In-Reply-To: <CAFBinCBEeCAKuzOztT5wU1t9UvY=ocVVrdHB6PNG7pp+gXq1=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_074131_646959_0DDD303E 
X-CRM114-Status: GOOD (  13.83  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAxNS8wMy8yMDE5IDIzOjA1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoKPiBI
aSBOZWlsIGFuZCBHdWlsbGF1bWUsCj4gCj4gT24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMTE6MDQg
QU0gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPj4KPj4g
RnJvbTogR3VpbGxhdW1lIExhIFJvcXVlIDxnbGFyb3F1ZUBiYXlsaWJyZS5jb20+Cj4+Cj4+IEFk
ZCBzeXN0ZW0gcmVndWxhdG9ycyBmb3IgdGhlIFg5NiBNYXggU2V0LVRvcC1Cb3guCj4gdGhlIGhp
bnQgZnJvbSB0aGUgIm1lc29uLWcxMmEtc2VpNTEwOiBhZGQgcmVndWxhdG9ycyIgcGF0Y2ggd291
bGQgYmUKPiBncmVhdCBoZXJlIGFzIHdlbGw6Cj4gICBTdGlsbCBtaXNzaW5nCj4gICAqIFZERF9F
RSAoMC44ViAtIFBXTSBjb250cm9sbGVkKQo+ICAgKiBWRERfQ1BVKFBXTSBjb250cm9sbGVkKQo+
ICAgKiBWRERRMV81CgpXaWxsIGFkZCB0aGUgY29tbWVudAoKPiAKPiBJJ20gbm90IHN1cmUgd2hl
dGhlciB0aGlzIGJvYXJkIGFsc28gaGFzIFZERFExXzUgdGhvdWdoLCBidXQgVkREX0VFCj4gYW5k
IFZERF9DUFUgc2hvdWxkIGJlIHZlcnkgc2ltaWxhciAob3IgZXZlbiBpZGVudGljYWwpCgpJdCdz
IGJhc2VzIG9uIGEgcmVmIGRlc2lnbiwgd2UgY2FuIGFzc3VtZSBpdCdzIHRoZSBzYW1lIHllcwoK
PiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIExhIFJvcXVlIDxnbGFyb3F1ZUBiYXls
aWJyZS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KPj4gLS0tCj4+ICAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLXg5
Ni1tYXguZHRzICAgfCA2NSArKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwg
NjUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWcxMmEteDk2LW1heC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tZzEyYS14OTYtbWF4LmR0cwo+PiBpbmRleCAwZWRiZDAwYjM1OGYuLjIxZTVkZTQ4
NjEzZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcx
MmEteDk2LW1heC5kdHMKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWcxMmEteDk2LW1heC5kdHMKPj4gQEAgLTIxLDYgKzIxLDcxIEBACj4+ICAgICAgICAgICAgICAg
ICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+PiAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAw
eDAgMHgwIDB4NDAwMDAwMDA+Owo+PiAgICAgICAgIH07Cj4+ICsKPj4gKyAgICAgICBmbGFzaF8x
djg6IHJlZ3VsYXRvci1mbGFzaF8xdjggewo+PiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJyZWd1bGF0b3ItZml4ZWQiOwo+PiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAi
RkxBU0hfMVY4IjsKPj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0g
PDE4MDAwMDA+Owo+PiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8
MTgwMDAwMD47Cj4+ICsgICAgICAgICAgICAgICB2aW4tc3VwcGx5ID0gPCZ2Y2NfM3YzPjsKPj4g
KyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1hbHdheXMtb247Cj4+ICsgICAgICAgfTsKPj4gKwo+
PiArICAgICAgIG1haW5fMTJ2OiByZWd1bGF0b3ItbWFpbl8xMnYgewo+PiArICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+PiArICAgICAgICAgICAgICAgcmVn
dWxhdG9yLW5hbWUgPSAiMTJWIjsKPj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWlj
cm92b2x0ID0gPDEyMDAwMDAwPjsKPj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWlj
cm92b2x0ID0gPDEyMDAwMDAwPjsKPj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1hbHdheXMt
b247Cj4+ICsgICAgICAgfTsKPiBtaW5lIGhhcyBhIDVWIERDIGluLiBjYW4geW91IHBsZWFzZSBj
aGVjayB0aGlzIG9uIHlvdXIgYm9hcmQ/Cj4gCj4gCj4gUmVnYXJkcwo+IE1hcnRpbgo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
