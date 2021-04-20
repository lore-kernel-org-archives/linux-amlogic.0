Return-Path: <SRS0=nS3V=JR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A07C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Apr 2021 13:01:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30EF560233
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Apr 2021 13:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30EF560233
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GCB2L1Au9s0FtkPsUeU09uyTAYYo98mMotRR1MAtesQ=; b=RB6m5f22cRl9gPrEPUYL100oU
	QnE9/YiOUs6ToFndaDtFRsVzqAfJ/F1oWysZ/LjjDrtLBKfCpUJMUsSQcWMJOvZgRoCe/FwWSCZqT
	B7Q2GYsVAGbuk7efEmkNm4peBkUQDkjrCsSw9/RMTWll5judFMxYKfgaHvR2LzRHlZAh0dij+xudX
	OztFL9Lm9jmaFX/GcGh57F34SvkPzhlZqLOjWQHBkj9PNvA8xK72xe5frDWYoB9CwyVanU1rdV6F8
	M6CkyhLuezxXQe8fCTzur8DKufi+C1zcSrGM8gS543R8F2LDKP9emfbWDkynbMBvEfAAQUzEso095
	EK39WFgAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYq0f-00C9ND-GO; Tue, 20 Apr 2021 13:01:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYq0R-00C9KW-CN
 for linux-amlogic@desiato.infradead.org; Tue, 20 Apr 2021 13:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:To:From:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=YZAS7WcIB3gYHNHgqWfRKchD1g1axNNWhVuTSs4d1O8=; b=TUdLUnLQYMJ/ZJ79kjg2TCfPzG
 I+7icygHm04y+sPxBKQOXYJlVOUN8l5jHo+60fr/VzRCahx/7KHc9BkI2f70klqIBIIAmAuhNsAiK
 Bu3jEmOKxAnOzByKy38MAN4bTrWKSIgmslHTM9SYHYD5dcEqedxg948ZNahkLKbUybAJ4vqiWuT3Z
 5pBL/9obg4p5z6ZRp7Nm4OuqEoEqXGzrrVIpw1y5C8AtNkKcd8pOuY5KEAxF7RKvpI9zgI1e6FQW9
 weaHifwKsRa9209WmVN34Jx0GbnZ5zyfmLxPrBuW37UXEpbD7xcQ/fo6NksARIxvcZ/aS5iq1TYMb
 KpW0mWng==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYq0M-00C7bU-9k
 for linux-amlogic@lists.infradead.org; Tue, 20 Apr 2021 13:01:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 n10-20020a05600c4f8ab0290130f0d3cba3so1057217wmq.1
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Apr 2021 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YZAS7WcIB3gYHNHgqWfRKchD1g1axNNWhVuTSs4d1O8=;
 b=C4U77R1ToXIAVSikgZUcoYhRl7MvyCK6uGzmwX/o8VBzegumEdzgIeWtLeCmv2komM
 tzAF8wOUWcunNXoj5apEC6jyvlXO7FA3nTcF76k0HCRcNby1DYlF6rF3PKChQtlnYMfC
 c8XFUn8rscAXDQsHo0WRjXRbw6/2rbKMhQPWf8ViVj1ounvucKNdH7UOI1Yjfa09V0es
 B2+WY6kB3g9n30YqiIy2nTBpnagKj2gyFbiqdRoTbz04HTi+/Vc2C+vyw+obnNEVodRG
 HTLwLkzTAuh+DwZ38KKgm+g5X0etixXc8IKMOzmV+6sBldWWC+qVIpiTc3Y7cTOfBMBr
 SQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YZAS7WcIB3gYHNHgqWfRKchD1g1axNNWhVuTSs4d1O8=;
 b=tgJy1cYq/IceqQDwx5DoHR9Q22/hrH/fufQa/ZkM1Ln/lokoslkH8VMG8Yo9aqncQA
 wgJz7rdFd47rqTDiDc2MDKUzw+qDhOIK8vz/LIjSmG3c7GTUU0LNdTP9Lq5keUCtbEJb
 TAPXCAaIGruJtH4Kxvw9b1wGNbkkQzsG7JGAYXdazd6Pv3U3dQTvNvK3sTT0uA6nesWZ
 KXBg0gY/aPqFLnz+mu+PAk6f4YpvMSQnDe4tzFav8YDSUx1eOm8hUbBN280c302HmlUx
 2ENiNjpni48V03B0SZz0SRSN247iDgBLBQitBWsdtwql6wtraJ7gDp12PlBAwphUE4IH
 hH3Q==
X-Gm-Message-State: AOAM532+nSEkzHwBeyRANGhA/CBuAg0A4nVk2SddxMSmh8pKczOPjDMx
 oIWKHVrICa5K6TqClwOA0sIIdlgjHE49t6Mz
X-Google-Smtp-Source: ABdhPJya9/ZD9N+djjZI5UrrsBaVLcS+BktBLh7g4MgoY2LFKBcI6RQRQ6rwIfX4dlQ+qnbRdS+xXg==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr4475283wmb.136.1618923682839; 
 Tue, 20 Apr 2021 06:01:22 -0700 (PDT)
Received: from [10.1.3.29] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 3sm3752192wma.45.2021.04.20.06.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 06:01:22 -0700 (PDT)
Subject: Re: [PATCH] fix green/pink color distortion from HDR set during
 vendor Uboot
From: Neil Armstrong <narmstrong@baylibre.com>
To: Mathias Steiger <mathias.steiger@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <50fb92c7-28f2-f3c8-7986-425cdac77c78@gmail.com>
 <e546b4b8-5380-3c57-4c9c-8dcbe674a3e1@baylibre.com>
Organization: Baylibre
Message-ID: <f7ce8dc7-9066-be14-b351-2443d7630622@baylibre.com>
Date: Tue, 20 Apr 2021 15:01:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e546b4b8-5380-3c57-4c9c-8dcbe674a3e1@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_060126_414494_DFB84396 
X-CRM114-Status: GOOD (  23.31  )
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

T24gMTkvMDQvMjAyMSAxNjo1MCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGksCj4gCj4gVGhh
bmtzIGZvciBsb29raW5nIGF0IHRoaXMgIQo+IAo+IFRoZSBzdWJqZWN0IHNob3VsZCBiZSA6Cj4g
ImRybS9tZXNvbjogZml4IGdyZWVuL3BpbmsgY29sb3IgZGlzdG9ydGlvbiBmcm9tIEhEUiBzZXQg
ZHVyaW5nIHZlbmRvciBVYm9vdCIKPiAKPiBPbiAxOS8wNC8yMDIxIDE2OjMzLCBNYXRoaWFzIFN0
ZWlnZXIgd3JvdGU6Cj4+Cj4+IEkgYWxzbyB3cm90ZSBhIHByb2dyYW0gdG8gc2V0IHRoaXMgdmlh
IC9kZXYvbWVtIGZyb20gdXNlciBzcGFjZTogaHR0cHM6Ly9naXRodWIuY29tL2JhbGxlcmJ1cmc5
MDA1L2FuZHJvaWQtdHZib3gtMi1saW51eC1wYy1hbmQtc2VydmVyL2Jsb2IvbWFpbi9maXhfZ3Jl
ZW5waW5rLmMgLgo+Pgo+Pgo+IAo+IFBsZWFzZSBleHBsaWNpdCBoZXJlIHdoYXQgdGhlIHBhdGNo
IGRvZXMsIG5vIG5lZWQgZm9yIHRoZSBleGFtcGxlIHByb2dyYW0sIHRoZSBwYXRjaCBpcyBzZWxm
IGV4cGxpY2l0Lgo+IAo+IFRoZW4gYWRkOgo+IAo+IEZpeGVzOiA3Mjg4ODM5NDhiMGQgKCJkcm0v
bWVzb246IEFkZCBHMTJBIFN1cHBvcnQgZm9yIFZJVSBzZXR1cCIpCgpJIHRlc3RlZCBvbiBhIFZJ
TTMgd2l0aCB0aGUgdmVuZG9yIFUtYm9vdCwgYW5kIGl0IHdvcmtzICEgVGhhbmtzICEKCkFuZCBw
bGVhc2UgYWRkIHRvIHRoZSB2MiBwYXRjaDoKVGVzdGVkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+CgpUaGFua3MsCk5laWwKCj4gCj4gRmluYWxseSwgaXQgYWxz
byBuZWVkcyB5b3VyIHNpZ24tb2ZmIGF0IHRoZSBlbmQgb2YgeW91ciBjb21taXQgbWVzc2FnZSwg
c2ltcGx5IGNvbW1pdCB3aXRoICItcyIuCj4gCj4gCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
ZHJ2LmMKPj4gaW5kZXggNDUzZDhiNGM1Li43ZDkyOWI1YjIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZHJ2LmMKPj4gQEAgLTMwOCw2ICszMDgsMTAgQEAgc3RhdGljIGludCBtZXNvbl9k
cnZfYmluZF9tYXN0ZXIoc3RydWN0IGRldmljZSAqZGV2LCBib29sIGhhc19jb21wb25lbnRzKQo+
PiDCoMKgwqDCoMKgwqDCoCBkcm0tPm1vZGVfY29uZmlnLmZ1bmNzID0gJm1lc29uX21vZGVfY29u
ZmlnX2Z1bmNzOwo+PiDCoMKgwqDCoMKgwqDCoCBkcm0tPm1vZGVfY29uZmlnLmhlbHBlcl9wcml2
YXRlID0gJm1lc29uX21vZGVfY29uZmlnX2hlbHBlcnM7Cj4+Cj4+ICvCoMKgwqDCoMKgwqAgLyog
dW5kbyBzZXR0aW5ncyBtYWRlIGluIHZlbmRvciBVYm9vdCAqLwo+PiArCj4+ICvCoMKgwqDCoMKg
wqAgd3JpdGVsX2JpdHNfcmVsYXhlZCgxNSA8PCAxMywgMCwgcHJpdi0+aW9fYmFzZSArIF9SRUco
T1NEMV9IRFIyX0NUUkwpKTsgLy8gZml4ZXMgZ3JlZW4vcGluayBjb2xvciBkaXN0b3J0aW9uIC0g
cmVnX29ubHlfbWF0IG11c3QgYmUgMAo+PiArCj4gCj4gVGhpcyBzaG91bGQgZ28gaW4gbWVzb25f
dml1LmMgaW4gbWVzb25fdml1X2luaXQgcmlnaHQgYWZ0ZXIgbWVzb25fdml1X3NldF9nMTJhX29z
ZDFfbWF0cml4KCkgZm9yCj4gVlBVX0NPTVBBVElCTEVfRzEyQSAoZXh0ZW5kIHRoZSBlbHNlIGlm
IGNhc2UpLgo+IAo+IFBsZWFzZSBkb2N1bWVudCB0aGUgYml0cyB5b3VyIHdyaXRlIGluIG1lc29u
X3JlZ2lzdGVycy5oIGxpa2U6Cj4gI2RlZmluZSBPU0QxX0hEUjJfQ1RSTF9WRElOMF9IRFIyX1RP
UF9FTiAJQklUKDEzKQo+IAo+IGFuZCBzYW1lIGZvciBiaXRzIG1hdF9vX2VuIGFuZCByZWdfb3V0
X2ZtdCwgdGhlbiB1c2UgdGhlbSBpbiB3cml0ZWxfYml0c19yZWxheGVkKCkKPiAKPj4gwqDCoMKg
wqDCoMKgwqAgLyogSGFyZHdhcmUgSW5pdGlhbGl6YXRpb24gKi8KPj4KPj4gwqDCoMKgwqDCoMKg
wqAgbWVzb25fdnB1X2luaXQocHJpdik7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fcmVnaXN0ZXJzLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmVn
aXN0ZXJzLmgKPj4gaW5kZXggNDQ2ZTc5NjFkLi45MTM1MWY5YTMgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9yZWdpc3RlcnMuaAo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fcmVnaXN0ZXJzLmgKPj4gQEAgLTYzNCw2ICs2MzQsOSBAQAo+PiDC
oCNkZWZpbmUgVlBQX1dSQVBfT1NEM19NQVRSSVhfUFJFX09GRlNFVDIgMHgzZGJjCj4+IMKgI2Rl
ZmluZSBWUFBfV1JBUF9PU0QzX01BVFJJWF9FTl9DVFJMIDB4M2RiZAo+Pgo+PiArLyogb3NkMSBI
RFIgKi8KPj4gKyNkZWZpbmUgT1NEMV9IRFIyX0NUUkwgMHgzOGEwCj4+ICsKPj4gwqAvKiBvc2Qy
IHNjYWxlciAqLwo+PiDCoCNkZWZpbmUgT1NEMl9WU0NfUEhBU0VfU1RFUCAweDNkMDAKPj4gwqAj
ZGVmaW5lIE9TRDJfVlNDX0lOSV9QSEFTRSAweDNkMDEKPj4KPiAKPiBUaGlzIHBhcnQgd2lsbCBi
ZSBvayB3aXRoIHRoZSBiaXRzIGRlZmluZWQuCj4gCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
Cj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKPiAKPiBOZWlsCj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
