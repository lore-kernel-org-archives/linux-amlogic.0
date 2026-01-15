Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450ECD44C46
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jan 2026 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNw2RHb85BjnsFpfJNXUKxwjc2yTOrMHb4AjtAvkwyg=; b=1OAXmvAaBQEpUU
	/B5v5dfYABJ95jrbU0TXnpHy2wLrEon8/fyNBQksCGEJe6ZKohLY+drBqBurgrh5PiKDVnDll4l8c
	Xosnzn4Fpa1R6v0zWPkv2MeJmWSmPcicZxsPBvn80ix4zkkhnmRmsG5VdHCzWrnN+qm/PThMbqOf8
	GeuPH7iB0GdXRxt9bxgqHmvMR8ToBhE7UnT7Ag2Y07kXp8/oyNE3C45A7N22dhZjrqvFtE5fIEpr+
	ETPv3ed0JSqJqKEUoBeZybfnSbGX4gWt0cdeYxXDMWipwGe1YQ+q96uQqZzTfRoP5Cx0bJf7Dqs2Q
	P3/iHqrk2MELd26WpaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNtW-0000000CRp2-2Z0Q;
	Thu, 15 Jan 2026 14:00:14 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNtA-0000000CRly-3ZFW
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Jan 2026 14:00:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso1344884a12.2
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Jan 2026 05:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1768485589; x=1769090389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYIhPG6x60jF1PxiSFq6Xnv+Wsxju3BBfQyn7pIJfb8=;
        b=BjkSDnY07dw+f98Zebzj5k9enm0kXOr24zvwhFIDB+iSfdSzVyKfDBx5tLLE2zl3+K
         k4TqIcSbMQCR9dBxWhFHbn/U6be36fhNeH4FSMYDV9Ys6SBYxCN3ROGxnj9Q1ToG6QoV
         q3UVKeaId4pTd1OPMuiQEgEaHEAozvRFlFN7HAcb9ky3DY6Rv7d45lLW4pGLUSQ+1Qpu
         zl9kNzZsxwI5ebRU/3BA75ptaliO2zg4DVagrqz61A3Dt9O7k8eeJh16Nby+Z8JXOR7c
         p5jcy3ZtCchUBeM754SVrrr710OGZoRmrOUm2DxPnJkq71uJ4XLywdT6tXCYnjUp5GQd
         gL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485589; x=1769090389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYIhPG6x60jF1PxiSFq6Xnv+Wsxju3BBfQyn7pIJfb8=;
        b=AtI126uJ449cAxG3OqraSUpzf1/cv6OTKlLaIHnnkm1cN4bHTsrm8ENrX6/hvDkCwl
         VeUWiN8nBf6e+OPAD9ASJchZmmBYx3Vzi0aOJs0hlrda6FW2N+GVN3OLsQyLUsgLdGNI
         k4HXMvFgAnRz2VjSDfQnwdqg5H59zzBDNDyBmTCEGLhCUXSJnZEVSu3ilVRVMMBAUuaw
         L37oJLO2151tIm1sHkaRwRgkFqmACO6DIi32Ymbf9bgkhO02j6NRQgWXUkydGyK2iYar
         xgUICp6o2czcsDLrrRKbuNz61ABLW8plG4S0fBWjvGq3NMjEScJoh6BMOJJ4lUp6dDJs
         s45Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHHJbi8Fn67dLEkpelJMfonOLYvhm76IU+mglLIMerHL/T8CRjoJd/ah1siRCjmv4ddIQRqKAMT3fMFk3d@lists.infradead.org
X-Gm-Message-State: AOJu0YwXhMymfsd2yFBmOj0XqAHyv0GewLH81uAlg89bgQYOmAp+n3oW
	fAkSwVCwpdK8FdzCu8Xtnwrz33zVybLzJGvoJRvvdYQwGx0mAG/WzXRKApka5rEG8A==
X-Gm-Gg: AY/fxX6hltjQYNzgjhMF7p/PTBKEtSBf6CgqO4O+lguTgkXuSWqGdm7B37Ozu3W3ryu
	m7NsKOb9KOYelKonfI/ss+UxLHRziX6sc/zZe7bcNK4g9FZz+Wpf04ImD7GbCn7dnR5DgH/+EjR
	vwLaQ+UP1bS7gNnU6S21k5kOfiLOY8kaKMlD61ZNLgFpprfrzE5spkv3ffHPeT85KKsFPURSp0i
	j4Kt2zba9XTSSoNfgqSIZH6cBsLdgRQlAlD7CXZDECHWyKeYdcE+aDNK6H8BSewT+H/9XsU7X2s
	wkyyx5r0xMi3ejKRCftsd7NxZqXVZS8EWr1fj6sBvr8vEdxMBvrsshDqe3auO++Hzyd5K24JsBm
	7eyoA6HhQc81+MBFQniQIk8QmZiJoG2ukQvWtnz/iR83xghflbNjSFxs1TUusrhWuTiTPdltuRj
	RXpibSv10AAezzBOMdL6yaIvZ2N/SR9zKCJx4tb1CKuQ+8nZBSVa4X4cRnEzMNGPWOYW9BNzml/
	DCSae3i9aaO9XfnrjbBTs5cMClS/Z0iCQ+9tqMMAlfnNLPbySXFgx9/rg==
X-Received: by 2002:a17:907:3f21:b0:b73:8b79:a31a with SMTP id a640c23a62f3a-b8761059dc7mr555045166b.16.1768485589247;
        Thu, 15 Jan 2026 05:59:49 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:ed4f:c8ed:4383:1c08? (2a02-a466-4d7a-0-ed4f-c8ed-4383-1c08.fixed6.kpn.net. [2a02:a466:4d7a:0:ed4f:c8ed:4383:1c08])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f0d6d7c6sm1614104466b.42.2026.01.15.05.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:59:48 -0800 (PST)
Message-ID: <1f256bf2-2739-4785-88fd-25101df9dad9@pardini.net>
Date: Thu, 15 Jan 2026 14:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add the type-c controller on
 Radxa Zero 2
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
 <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-2-8b5cdf328fde@pardini.net>
 <aeaee3b5-5f08-4abe-b646-a45ab79a35ab@linaro.org>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <aeaee3b5-5f08-4abe-b646-a45ab79a35ab@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_055952_977349_8AE7E208 
X-CRM114-Status: GOOD (  15.83  )
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

SGkgTmVpbCwKCk9uIDE1LzAxLzIwMjYgMTQ6MDAsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgoKPj4g
VGhlIFJhZHhhIFplcm8yIGhhcyBhbiBGVVNCMzAyIGNvbnRyb2xsZXIgb24gaTJjMyBhdCBhZGRy
ZXNzIDB4MjIgYW5kCj4+IElOVCMgd2lyZWQgdG8gR1BJT0EtMTMuCj4+Cj4+ICvCoMKgwqDCoMKg
wqDCoCBpbnRlcnJ1cHRzID0gPDEzIElSUV9UWVBFX0xFVkVMX0xPVz47Cj4gCj4gT0sgaXQgc2Vl
bXMgSSBkaWQgcmVhZCB0b28gZmFzdCwgdGhpcyBzaG91bGQgYmUgNzQgIQo+IAo+IFM5MjJYIERh
dGFzaGVldCAoc2FtZSBhcyBBMzExRCBmb3IgdGhpcykKPiAKPiBUYWJsZSA2LTMyIEdQSU8gSW50
ZXJydXB0IFNvdXJjZXMKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiB8IElucHV0IE11eCBMb2NhdGlvbsKgwqDCoCB8wqDCoMKgIERlc2NyaXB0aW9u
IHwKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiB8IFs3
Njo2MV3CoMKgwqDCoMKgwqDCoCB8wqDCoMKgIGdwaW9BWzE1OjBdIHwKPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiBTbyBncGlvQTEzID09PiA3NAoK
SW5kZWVkLiBTb3JyeSBmb3IgdGhpcy4KCj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHZidXMtc3Vw
cGx5ID0gPCZhb181dj47Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsK
PiAKPiBBbmQgSSBnZXQ6Cj4gCj4gIMKgIERUQyBbQ10gYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWcxMmItcmFkeGEtemVybzIuZHRiCj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWcxMmItcmFkeGEtemVybzIuZHRiOiBmdXNiMzAyQDIyIAo+IChmY3MsZnVzYjMw
Mik6ICdjb25uZWN0b3InIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiAgwqDCoMKgwqDCoMKgwqAg
ZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy91c2IvIAo+IGZj
cyxmdXNiMzAyLnlhbWwjCj4gCj4gUGxlYXNlIGFkZCBhIG1pbmltYWwgY29ubmVjdG9yLCBsaWtl
Ogo+IAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbm5lY3RvciB7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAidXNi
LWMtY29ubmVjdG9yIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbGFiZWwgPSAiVVNCLUMiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkYXRhLXJvbGUgPSAiaG9zdCI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvd2VyLXJvbGUgPSAic291cmNlIjsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc291cmNlLXBkb3MgPSA8UERP
X0ZJWEVEKDUwMDAsIDIwMDAsIAo+IFBET19GSVhFRF9VU0JfQ09NTSk+Owo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gCj4gSSdsbCBkcm9wIHRoaXMgY2hhbmdlIGZyb20gbXkg
dHJlZS4KCkFnYWluLCBteSBiYWQuIE15IGludGVudGlvbiBoZXJlIHdhcyBhICJtaW5pbWFsIiBk
ZXNjcmlwdGlvbiwgbW9zdGx5IHRvIApyZXNlcnZlIDB4MjIgc28gZW5kLXVzZXJzIGNhbiBydW4g
YGkyY2RldGVjdGAgb3Igc3VjaCBvbiB0aGUgNDAtcGluIApleHBvc2VkIGkyYzMgYW5kIG5vdCBi
ZSBzdXJwcmlzZWQuIEd1ZXNzIEkgZGlkbid0IHJ1biBkdGJzX2NoZWNrIGhhcmQgCmVub3VnaCBh
bmQgbWlzc2VkIHRoZSByZXF1aXJlZCBjb25uZWN0b3IuCgo+IAo+IEFuZCB5b3UgbWF5IGFsc28g
YWRkIHN1cHBvcnQgZm9yIHRoZSBzdXBlcnNwZWVkIG11eCB0byBzd2l0Y2ggdGhlIFVTQjMgCj4g
cG9sYXJpdHkuCj4gCj4gSSBoYXZlIGEgcHJvdG90eXBlIGF0IGh0dHBzOi8vZ2l0bGFiLmNvbS9z
dXBlcm5hOTk5OS9saW51eC8tL3RyZWUvdG9waWMvIAo+IGFtbG9naWMvcmFkeGEtemVybzIvZnVz
YjMwMj9yZWZfdHlwZT1oZWFkcwoKSSdsbCB0cnkgeW91ciBwcm90b3R5cGUuIEkgaGFkIG5vIGlk
ZWEgaXQgYWN0dWFsbHkgaGFkIHRob3NlIGNhcGFiaWxpdGllcy4KCkRvIHlvdSB0aGluayBpdCBp
cyB3b3J0aCB0byByZXNlbmQgdGhpcyB3aXRoIGp1c3QgdGhlIGZpeGVkIDc0IHBpbiAmIHRoZSAK
bWluaW1hbCBjb25uZWN0b3IgYXMgeW91IHN1Z2dlc3RlZD8gTm93IHRoYXQgSSd2ZSBzZWVuIHlv
dXIgd29yaywgYSAiYWRkIApGVVNCMzAyIiB0aGF0IGRvZXMgbm90aGluZyAod2hpbGUgYmVpbmcg
Y2FwYWJsZSkgZmVlbHMgZnJpdm9sb3VzIGFuZCAKY29uZnVzaW5nLgoKVGhhbmtzLApSaWNhcmRv
CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
