Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152E9C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:01:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA00920709
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KAtEv2pp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OUKerrG1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA00920709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eeysidlSFGvh699wmXcOYHXAaAfYiyf0o5dWMYLNwyo=; b=KAtEv2pp6ZR0YRzvv/4Mk4f4e
	jcJv4ZXxzPjALFi+P2QX8bMpwIu98M2DqaMeyCukZiHSLTlcQPDf2MW3XMGXfSfj5923ldwOFi9+F
	5x1sIhvq/Q8n8sLwLMaARPVgLwWsFRLCykEV17N9e3eOsg8cSIjXUT6HbDW/Foy9Ipg2YcRiXyA6Y
	z7XdCk3G+RsnKWZ6lx4ROEH2zppXcq/OL716Ydi/xU192kA/ojP7VkzSBxUXLopCshPjC4MQvFvOG
	hw86YwhvYjf0IWZn7loQIsz3f4HFmcqVBYyKQUtvgqo9FEkVqVe96v5Xmy5+QIxIGgCkiuuffcBJp
	wo6gdIiPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnDE-0006xd-M6; Tue, 21 Jul 2020 08:01:20 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnD8-0006vN-UV
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 08:01:15 +0000
Received: by mail-wm1-x344.google.com with SMTP id 22so1855211wmg.1
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ewM2HJBUENxVg5qVvtrerZEb13ZbfM5w015hCw1HWwU=;
 b=OUKerrG1CySXbE77AKjQTvZgURBDiJ8f5dM/ZTkNpvjlyjyGvgoRboUhkdz5Q1p2nG
 kdJGeGDV//+zLSfC2HjqH/PxUzr4NIv2rY9wBQy8t1u98pM4dThwBucBBoPtmpLPAgHG
 zVhus9H7/LfdjTONZ+DA/NjkregDNiExdBCWYSjDMr1FXzB/RrRfexbbNe47Znb6jZTN
 ivMpJRXmsYu5zx5XsWUk8lbQT7x1vix5IGyAZqJXz1zvbxfSYJtpB+tKDQ6MS9SVX53e
 TEvu2PeXdVj5pjctiSdnMMoPbnhEhSKW+JzrACP/Mx+AiADzmbVZ2Fc8iOQTl25+sJgL
 thFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ewM2HJBUENxVg5qVvtrerZEb13ZbfM5w015hCw1HWwU=;
 b=leeGU8PubiEYOZGw85heowzbxKC9KzY8JpPLZryH4Pu8oQ2570xTeBNVYELb6SL+J4
 eAjfr7izpa0S1OtQcm+aLeQaAkuUAB9HM7eKINZCuEvhZk03bTDl/NHuPcLpuCeSBzit
 yLpWGrfWoGAJfWdTs0EiF9mLqt7uf8gZX4EbKLmxTFRQSbyUXwbjVgfmkVfD7iTvTv24
 2Cx13JsLk/ihnH32qynSL7MLPp4SSUrre7/AMAzdzgNS4J7hJPOWti0bL0riKGHx0ihk
 Sf/VvxT+W7piLiTwELaSLsxVfWszryxzPRaVpD7F5G3BNNbZjubxfvhJCmr7g+lG8amK
 Ff5g==
X-Gm-Message-State: AOAM531qNMW5Z9Keg72zRNsqrV1N1+9kZUBzgGi69m3X+7uoC8+qCUgj
 ngTE6f8XA6iQ04pJeE+g1AeNhGuCzCvW+Q==
X-Google-Smtp-Source: ABdhPJxoolgSA1w4rtOowZsyDXoO2mjTWJRQ9NaqCcfQ0hJvLcn/3oQWq/h8EGXW56PO81MG40LUDQ==
X-Received: by 2002:a1c:b007:: with SMTP id z7mr2718946wme.37.1595318473343;
 Tue, 21 Jul 2020 01:01:13 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s19sm14322354wrb.54.2020.07.21.01.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 01:01:12 -0700 (PDT)
Subject: Re: [PATCH v2 06/14] spi: spi-meson-spicc: Remove set but never used
 variable 'data' from meson_spicc_reset_fifo()
To: Lee Jones <lee.jones@linaro.org>, broonie@kernel.org
References: <20200717135424.2442271-1-lee.jones@linaro.org>
 <20200717135424.2442271-7-lee.jones@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <7509786b-1a89-2238-cb74-c1662f393983@baylibre.com>
Date: Tue, 21 Jul 2020 10:01:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717135424.2442271-7-lee.jones@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_040115_049097_FC9AFFAC 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTcvMDcvMjAyMCAxNTo1NCwgTGVlIEpvbmVzIHdyb3RlOgo+IExvb2tzIGxpa2UgaXQgaGFz
bid0IGV2ZXIgYmVlbiBjaGVja2VkLgo+IAo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5l
bCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYzog
SW4gZnVuY3Rpb24g4oCYbWVzb25fc3BpY2NfcmVzZXRfZmlmb+KAmToKPiAgZHJpdmVycy9zcGkv
c3BpLW1lc29uLXNwaWNjLmM6MzY1OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGRhdGHigJkgc2V0
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgMzY1IHwgdTMyIGRh
dGE7Cj4gIHwgXn5+fgo+IAo+IENjOiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29t
Pgo+IENjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gQ2M6IGxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1tZXNvbi1z
cGljYy5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLW1lc29uLXNwaWNjLmMg
Yi9kcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYwo+IGluZGV4IDc3ZjdkMGUwZTQ2YWQuLmVj
YmE2YjRhNWQ4NWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLW1lc29uLXNwaWNjLmMK
PiArKysgYi9kcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYwo+IEBAIC0zNjIsOCArMzYyLDYg
QEAgc3RhdGljIHZvaWQgbWVzb25fc3BpY2Nfc2V0dXBfeGZlcihzdHJ1Y3QgbWVzb25fc3BpY2Nf
ZGV2aWNlICpzcGljYywKPiAgCj4gIHN0YXRpYyB2b2lkIG1lc29uX3NwaWNjX3Jlc2V0X2ZpZm8o
c3RydWN0IG1lc29uX3NwaWNjX2RldmljZSAqc3BpY2MpCj4gIHsKPiAtCXUzMiBkYXRhOwo+IC0K
PiAgCWlmIChzcGljYy0+ZGF0YS0+aGFzX29lbikKPiAgCQl3cml0ZWxfYml0c19yZWxheGVkKFNQ
SUNDX0VOSF9NQUlOX0NMS19BTywKPiAgCQkJCSAgICBTUElDQ19FTkhfTUFJTl9DTEtfQU8sCj4g
QEAgLTM3Myw3ICszNzEsNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9zcGljY19yZXNldF9maWZvKHN0
cnVjdCBtZXNvbl9zcGljY19kZXZpY2UgKnNwaWNjKQo+ICAJCQkgICAgc3BpY2MtPmJhc2UgKyBT
UElDQ19URVNUUkVHKTsKPiAgCj4gIAl3aGlsZSAobWVzb25fc3BpY2NfcnhyZWFkeShzcGljYykp
Cj4gLQkJZGF0YSA9IHJlYWRsX3JlbGF4ZWQoc3BpY2MtPmJhc2UgKyBTUElDQ19SWERBVEEpOwo+
ICsJCXJlYWRsX3JlbGF4ZWQoc3BpY2MtPmJhc2UgKyBTUElDQ19SWERBVEEpOwo+ICAKPiAgCWlm
IChzcGljYy0+ZGF0YS0+aGFzX29lbikKPiAgCQl3cml0ZWxfYml0c19yZWxheGVkKFNQSUNDX0VO
SF9NQUlOX0NMS19BTywgMCwKPiAKCkFja2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
