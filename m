Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C8CC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:44:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E695220717
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:44:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CFuA8aSA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vNiQc0HF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E695220717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4lud6uQvTTvgRG9PnCuXou4MPZB3YvN0t42IDOj7zD4=; b=CFuA8aSASPw5pzacl78/w/x10
	QGqrXSEfTms/5DxMzw6a4BrpEPEuuj1pp/3wUKePb3LA/Lwxh5uPihWFYIQAHl0n+iOhbumTgZdIC
	KnZ4YJLWuTJYdARLR8qq/NyxR5fzHJ1pcKr80yBuE+4hXbLl/xXnyt76csUOrUHmCtWUApFyUdSHN
	extL8MmsS9Q/22WqnQlDXz47N2X7iVrmb+Cv/aI/mV+CBIZoMLMZ5nNiqYRK1SxmJQZPU0CV78vbR
	1csJs3sOu8Kf8Oh3zUFjdcPE/k8JXyBLQI8QMO148uZXBJZSAnc1cPPy+NBVSQ1cNa5ojG2xQtOru
	cG2+zwT6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiPR-0004mP-3t; Fri, 25 Sep 2020 07:44:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiPD-0004hd-Qk
 for linux-amlogic@lists.infradead.org; Fri, 25 Sep 2020 07:44:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id m6so2503271wrn.0
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Sep 2020 00:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=im96TIL9C+k95zzwEvhBlq40VuO2T9igkzJ1/Rl1pDc=;
 b=vNiQc0HFgCjV+BaoS3nk4rHdq2gSipLNzro2j3L8yzJ4G6O+EspYep0wQh5oUqTzFk
 vQuqzmZyBKG0a4hA6IRwd0gRLX20k4mcWPe61vnbeAPvo/9gnXw2HhmV6uwarMaPSCqt
 gC+N2d57vMHdehcuSh8yGEfuDPKvVTPxLKN+atXVs9DUiyEUtlicJV7BmsbSpXGJ0gH0
 dE0rX481dFEpFg7rPXbRNq23h1Qhsl1nKVkHqZwtC/dqgDemVpQEd9VKpitgr1TZotfw
 hljNLgMEjv4alSJC22Ae2nCEJ4DrBnaQ1FdwdEIDeL4VhvyGwsHghT3IIOqdooKL0jJL
 NTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=im96TIL9C+k95zzwEvhBlq40VuO2T9igkzJ1/Rl1pDc=;
 b=bUTTcTvnbYDQMVL/gugnK65iLoUQwQbybYPc7d7iygzgpOBZsSOq7ujFd7CNjpWMIh
 FWwVC07mO8s5j9AmlmAUd6a7t9OA/8Hg+Sk9Wu3xmquhVbYyT2nGIN3Se4CNfpcYByFl
 YA7mXfYlM6UkEvmHOs25BcuJeRzY0wrlqKglFZJjNPSUuWKZvyF4P0xrXdV+wgYfWgz5
 XEM8+jTQJy/8S5pR/Jkawcp/QbJmpnvWX4v3u8LUdvK6c2t1pIh+/iQzKe3CR3HazUUX
 xQli8iw2R5BRaBx8hdXKM2BGAn1nrClP6DLOzKYEMmi5N7rHVaKKaAEfPFlu4ak1bCMc
 dNxA==
X-Gm-Message-State: AOAM532JuuJJS/MNPAZ2EmQkUcy0p6U0pQ9bNNpGMge/vGMX9AQHhJTa
 0VEM2wb8C38EeXRkEuNPvWiFwq8P1Ia8ziSu
X-Google-Smtp-Source: ABdhPJy5lPRLpI/FqRBQkmGGyRIGqZmpmxsK+kybvhTZi87l6KV72lpVte2Wv7u06Vf9MaIGQvZ0yw==
X-Received: by 2002:adf:9405:: with SMTP id 5mr2918720wrq.51.1601019874636;
 Fri, 25 Sep 2020 00:44:34 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:28ac:1772:9398:891a?
 ([2a01:e35:2ec0:82b0:28ac:1772:9398:891a])
 by smtp.gmail.com with ESMTPSA id p11sm1796785wma.11.2020.09.25.00.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 00:44:33 -0700 (PDT)
Subject: Re: [PATCH 6/8] arm64: dts: meson: disable vrtc for VIM3L boards
 meson-khadas-vim3
To: Artem Lapkin <email2tema@gmail.com>
References: <20200925033017.1790973-1-art@khadas.com>
 <20200925033017.1790973-7-art@khadas.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <0b81b4e6-57e7-3191-b7e5-3ec5e69b20ac@baylibre.com>
Date: Fri, 25 Sep 2020 09:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925033017.1790973-7-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_034435_913982_085BC1D4 
X-CRM114-Status: GOOD (  17.53  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyNS8wOS8yMDIwIDA1OjMwLCBBcnRlbSBMYXBraW4gd3JvdGU6Cj4gdnJ0YyBub3Qg
dXNlZCBmb3IgbWVzb24ta2hhZGFzLXZpbTMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcnRlbSBMYXBr
aW4gPGFydEBraGFkYXMuY29tPgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24ta2hhZGFzLXZpbTMuZHRzaSB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1raGFkYXMtdmltMy5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWtoYWRhcy12aW0zLmR0c2kKPiBpbmRleCAzMTExYmYzNWMwZi4uODFiYjg4YTc2ZDUgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWtoYWRhcy12aW0zLmR0
c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24ta2hhZGFzLXZpbTMu
ZHRzaQo+IEBAIC0yODQsNiArMjg0LDEwIEBAICZwd21fZWYgewo+ICAgICAgICAgIHBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7Cj4gIH07Cj4gIAo+ICsmdnJ0YyB7Cj4gKwlzdGF0dXMgPSAiZGlz
YWJsZWQiOwo+ICt9Owo+ICsKPiAgJnNhcmFkYyB7Cj4gIAlzdGF0dXMgPSAib2theSI7Cj4gIAl2
cmVmLXN1cHBseSA9IDwmdmRkYW9fMXY4PjsKPiAKClRoZSBWUlRDIGlzIG9uZSBvZiB0aGUgZGVm
YXVsdCBzdXNwZW5kIHdha2UtdXAgc291cmNlcywgc28gd2h5IHdvdWxkIHlvdSBkaXNhYmxlIGl0
ID8KCklmIGl0IGNvbGxpZGVzIHdpdGggdGhlIHJlYWwgUlRDLCBhZGQgYWxpYXNlcyB0byBtb3Zl
IHRoZSB2cnRjIGluIHJ0YzEgYW5kIHNldCB0aGUgcmVhbCBSVEMgYXMgcnRjMC4KCiDCuyAgICAg
ICBhbGlhc2Vzwrd7CivCuyAgICAgICDCuyAgICAgICBydGMwwrc9wrcmcnRjMDsKK8K7ICAgICAg
IMK7ICAgICAgIHJ0YzHCtz3CtyZ2cnRjOwogwrsgICAgICAgfTsKCk5laWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
