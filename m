Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A36FC7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 07:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQLgAYiZ7gF3XVQKB3j+ECbFH8v/MA/Ki6gkH/Vuxgw=; b=DPFJSUIa4AwcPn
	ppddUrV5u/dRiU8YuERrNMeMjsNTbkkqDkZk3o7NxP0VwY1VwiIEHOn/2OPuj/YJQ2OejBLa/2/cj
	FU9YYNb2OvWU+X5fDMzgZwHTy8aH/b76Zk/yhXafRlWkiyNFvy4kXIcBBKfBJkH3MJDt52L5NA5Zn
	y/Z27JZVFiIOL7AfIVYPLqK3vTD4qRbXlOKTGhDV8KGKThKfmNB2+NXMM2jehWLIKEDdhfwUj6NdV
	yLGCN88Xkoj7zcqLBvwxxawcljnTODZq8x1lMCFxWmxN2CvJsCi8VS+7IYPgio8BvdRYBvpnf39M4
	4o/Cz2rT88OSmzk0qswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3u68-00CnxS-1O;
	Tue, 30 May 2023 07:48:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3u65-00Cnwm-2x
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:48:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f6077660c6so26949345e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432928; x=1688024928;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1BKRl0rG6ZKz6K12wAN8zcM1jC2/NzJydK0LKcMFsXg=;
        b=ErL5SY4PpgXcTaAtTXQYwFzQpjnkQ8YOj++Y09s4FWKdnGJauP41PqYhA5ok5ep490
         0NfLswvVeBA6dVwSQdIohA2a72WltxpYoN190+7uTMXKvn9wcg25KJVXNP89/dtPa2zJ
         +VewsJVJsjzcKsjUy/308gki/aVOjhV6YdTcsdI81vAWe5nCrgQhKBtREXE/aquOX0gZ
         mXqpJz2PuNwdy5r36Y9IFrmQSTbRgfc49IxTtogNXh3GRxQ6gWuYhFnonXfgQSUXJGwC
         TDIzoaEWp6XpgPXB3ejMnx3sk3oEW2ZvX4ECPevPHlYVPI5ONqT5qdKq7ve3z8jTPwaL
         UNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432928; x=1688024928;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BKRl0rG6ZKz6K12wAN8zcM1jC2/NzJydK0LKcMFsXg=;
        b=Dh0gBHAskk52SVOJ3ustVQogOGFYNdBUdmTO/pdfz3Y5bT9tmjRZS06qwd66uQCl4p
         3fuiUIrfQA32KPEMRklUp7NIQnCBomjdAUPwU8GZiABLxNOgOfL+iWdyfcylfqw0V5RX
         CicwBGlJaDmCscjPCD3J/9vZWRozQ1PENDnOaui5df9NVxgP39uwmQdzK7GRJLyeM6+i
         dwIwZabKnY+BxKWtK+xUhVNhdmKMUsiGtw2OQLDxCXobHAq9lkNHp1tznp0WnNc56oB2
         qbw5TTa5T/l5pnCzcHfpASKLYrXnsALzeVxx+UznF6R8AYohSux+4v8y52sqJfrjR/vD
         eNkA==
X-Gm-Message-State: AC+VfDyRTMbKqIQ5L8AqaVT0gJkN5aTYe4mzSSKG9H09G9xFWDFcqCs7
	FLLLqbjqKOoZe2ETbdLuRD22lg==
X-Google-Smtp-Source: ACHHUZ5xuANmN4u9XoKI/GIYFwuX2Epf77N8uGbHdxQPS4+AmfAXqxxohIGalR0xb5sLOXfKgyUVGg==
X-Received: by 2002:adf:f351:0:b0:309:4ee8:35ce with SMTP id e17-20020adff351000000b003094ee835cemr918764wrp.21.1685432927727;
        Tue, 30 May 2023 00:48:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87? ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d6910000000b00307a86a4bcesm2320607wru.35.2023.05.30.00.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:48:47 -0700 (PDT)
Message-ID: <b632ba5b-bbd6-aead-058f-f7466499239a@linaro.org>
Date: Tue, 30 May 2023 09:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/3] drm/meson: dw-hdmi: change YUV420 selection logic at
 clock setup
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Cc: kernel@collabora.com
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
 <20230528140001.1057084-2-adrian.larumbe@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230528140001.1057084-2-adrian.larumbe@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_004849_954104_B8E26ED4 
X-CRM114-Status: GOOD (  19.21  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjgvMDUvMjAyMyAxNTo1OSwgQWRyacOhbiBMYXJ1bWJlIHdyb3RlOgo+IFJpZ2h0IG5vdyBj
bG9ja2luZyB2YWx1ZSBzZWxlY3Rpb24gY29kZSBpcyBwcmlvcml0aXNpbmcgUkdCLCBZVVY0NDQg
bW9kZXMKPiBvdmVyIFlVVjQyMCBmb3IgSERNSTIgc2lua3MuIEhvd2V2ZXIsIGJlY2F1c2Ugb2Yg
dGhlIGJ1cyBmb3JtYXQgc2VsZWN0aW9uCj4gcHJvY2VkdXJlIGluIGR3LWhkbWksIGZvciBIRE1J
MiBzaW5rcyBZVVY0MjAgaXMgdGhlIGZvcm1hdCB0aGF0IHdpbGwgYWx3YXlzCj4gYmUgcGlja2Vk
IGR1cmluZyB0aGUgZHJtIGJyaWRnZSBjaGFpbiBjaGVjayBzdGFnZS4KPiAKPiBMYXRlciBvbiBk
d19oZG1pX3NldHVwIHdpbGwgY29uZmlndXJlIGEgY29sb3VyIHNwYWNlIGJhc2VkIG9uIHRoZSBi
dXMKPiBmb3JtYXQgdGhhdCBkb2Vzbid0IG1hdGNoIHRoZSBwaXhlbCB2YWx1ZSB3ZSBoYWQgY2Fs
Y3VsYXRlZCBhcyBkZXNjcmliZWQKPiBhYm92ZS4KPiAKPiBGaXggaXQgYnkgYnJpbmdpbmcgYmFj
ayBkdy1oZG1pIGJ1cyBmb3JtYXQgY2hlY2sgd2hlbiBwaWNraW5nIHRoZSByaWdodAo+IHBpeGVs
IGNsb2NrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkcmnDoW4gTGFydW1iZSA8YWRyaWFuLmxhcnVt
YmVAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jIHwgNiArKysrKysKPiAgIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
d19oZG1pLmMgICAgIHwgNCArKy0tCj4gICBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAg
ICAgICAgICAgICB8IDIgKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuYwo+IGluZGV4IDYwM2JiM2M1MTAyNy4uZDU5YTU0N2Y5Y2IyIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBAQCAtMzM0Niw2ICszMzQ2LDEyIEBA
IHN0YXRpYyBpbnQgZHdfaGRtaV9wYXJzZV9kdChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPiAgIAly
ZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICtib29sIGR3X2hkbWlfYnVzX2ZtdF9pc180MjAoc3RydWN0
IGR3X2hkbWkgKmhkbWkpCj4gK3sKPiArCXJldHVybiBoZG1pX2J1c19mbXRfaXNfeXV2NDIwKGhk
bWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xf
R1BMKGR3X2hkbWlfYnVzX2ZtdF9pc180MjApOwo+ICsKPiAgIHN0cnVjdCBkd19oZG1pICpkd19o
ZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gICAJCQkgICAgICBjb25z
dCBzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0YSkKPiAgIHsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPiBpbmRleCAzZDA0Njg3OGNlNmMuLmI0OWJiMGQ4NmVm
ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+IEBAIC0zNzksOCAr
Mzc5LDggQEAgc3RhdGljIGludCBkd19oZG1pX3BoeV9pbml0KHN0cnVjdCBkd19oZG1pICpoZG1p
LCB2b2lkICpkYXRhLAo+ICAgCQkJIG1vZGUtPmNsb2NrID4gMzQwMDAwID8gNDAgOiAxMCk7Cj4g
ICAKPiAgIAlpZiAoZHJtX21vZGVfaXNfNDIwX29ubHkoZGlzcGxheSwgbW9kZSkgfHwKPiAtCSAg
ICAoIWlzX2hkbWkyX3NpbmsgJiYKPiAtCSAgICAgZHJtX21vZGVfaXNfNDIwX2Fsc28oZGlzcGxh
eSwgbW9kZSkpKQo+ICsJICAgICghaXNfaGRtaTJfc2luayAmJiBkcm1fbW9kZV9pc180MjBfYWxz
byhkaXNwbGF5LCBtb2RlKSkgfHwKPiArCSAgICBkd19oZG1pX2J1c19mbXRfaXNfNDIwKGhkbWkp
KQo+ICAgCQltb2RlX2lzXzQyMCA9IHRydWU7Cj4gICAKPiAgIAkvKiBFbmFibGUgY2xvY2tzICov
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggYi9pbmNsdWRlL2Ry
bS9icmlkZ2UvZHdfaGRtaS5oCj4gaW5kZXggZjY2OGU3NWZiYWJlLi42YTQ2YmFhMDczN2MgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAo+ICsrKyBiL2luY2x1ZGUv
ZHJtL2JyaWRnZS9kd19oZG1pLmgKPiBAQCAtMjA2LDQgKzIwNiw2IEBAIHZvaWQgZHdfaGRtaV9w
aHlfdXBkYXRlX2hwZChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdm9pZCAqZGF0YSwKPiAgIAkJCSAg
ICBib29sIGZvcmNlLCBib29sIGRpc2FibGVkLCBib29sIHJ4c2Vuc2UpOwo+ICAgdm9pZCBkd19o
ZG1pX3BoeV9zZXR1cF9ocGQoc3RydWN0IGR3X2hkbWkgKmhkbWksIHZvaWQgKmRhdGEpOwo+ICAg
Cj4gK2Jvb2wgZHdfaGRtaV9idXNfZm10X2lzXzQyMChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSk7Cj4g
Kwo+ICAgI2VuZGlmIC8qIF9fSU1YX0hETUlfSF9fICovCgpBY2tlZC1ieTogTmVpbCBBcm1zdHJv
bmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
