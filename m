Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B324C3ABA0
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtVD8Qu4XJsDe39D90voaIGvmzh8ZoBKAeOmkYd5o4c=; b=t+Q6Rt7oSgFjN1
	VfGw5dtNFMOzla1+8jYdyDQF9hNQRAeRYX7NuFhaothE5u56VsqkCPbwiT+G6chxOR4EUzFG9fxtw
	nYMLEvpfHclbthI+obVgwILcQTcMLfSrEK1d9Dcr11RAf0gZJMyWTLQqE/HynZX+3TAVNkKxTSQsQ
	1zkCKwfhUfTwLmAQKl5LrV/p/AvDt/RVjC9za1UOjQgJVK1dE0C3TomWjbrAIFJEbPggKYxkaLSKp
	oLR8mCvm0QprZ7NRVSMez7EjXE/RSrUatgxAOlM2nWCQm4AWka+Cm7FAadsnmZc/nbsHr89jrbwWY
	knkvgcARuOZkXLY/Tzhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spugc-00000002YGj-17KR;
	Sun, 15 Sep 2024 19:13:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spufW-00000002YBJ-1pmq;
	Sun, 15 Sep 2024 19:12:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-205659dc63aso36771305ad.1;
        Sun, 15 Sep 2024 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726427542; x=1727032342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxbVkHtrWftjJ2Lx66Ozc/KK6sjKVqL5eejGgkG0fY8=;
        b=Tttvr30zMuCjtCVP2IrCXgxCkbPtiYwSaHa9d8XWtipMRy/gMznYbixTw12KG9awL+
         Y+YFkuB6AstzMb8xKQJVFKWCrAggg4m/jg6eypxIIe7PEIqbNUhsx8uRET4FNE4FMZjL
         J2siQoQWbmgs4jbZsDjr5bkjDHpFVOVML/EyKRKOzglj7m3aLKIq/LJC5cpVx6rtzZzx
         KZHgm5KFApFFL6m2C08zTgHTT5DkOZEAgoshY1L6rRB8bsc/CIxyfUWexOSHbQXfWqSI
         mLdS97KeX/phgdljzm5f1oeP23JcMcpchh36hpaHaGk/NBjD6ofoOGgtjJJUsk6+CvPG
         QaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427542; x=1727032342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxbVkHtrWftjJ2Lx66Ozc/KK6sjKVqL5eejGgkG0fY8=;
        b=qW3EjMSdKTM/9hJLifU0FsfZhgj0P4QiXSgzZsx8JMyroyNFTW4sVln82c3la0Llde
         +F4bHNzo27c2/9s6adBGBtd6KBa+ORcEmXSLfe6scF0nrB8HENhCRsDrBAAAA4aeMn2V
         gMuoQrzwrC/oWSkwdo1sn+wFSq7AolVjQL3ooUrgifsB6IjSD5D4B2fvqds4o0Mf560H
         8z58qvMHqNVv8xvOcwQ852k0XfV66xmdrKzdGAj11ggetppXdM8g6P84BxzZsaONwYmG
         mH7hA2AgGBTJMg03VTOapPvI1j3zzZJA+1I8VC1DFsDTJy6K1eSg89t2YV+YDCuU52Ix
         jueQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH1Q1sz02Nf2+OEYDYdaK64SJEce6kEXZERq/c/Dw8MP/meO8Bz1eZelBfx7RsRtG9sO6n5cGOUWeW8uLS@lists.infradead.org, AJvYcCWt6WyjCTkUVHYVdRjd9lGbWLYsWPyi9D5SyywRdiwh7dW84c09gnC0jnEdCcYefGzKqLvYOzNYe0+rt96Vm3VIhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQpB6pq41JddBkfh/0DN44JYPm20k/OaGIsrIbV8O+Jwdiv/62
	y8n4qzNXaaLhzwct7xcNiU8rQst71SiryDM+DohFAO0PGiSfnQ7BQRZg1rj+kxeToI4AlOcXoGc
	VcZ8mCDHGE9p8fDahgaUUbYiV9ug=
X-Google-Smtp-Source: AGHT+IHxCPO0nUOsBlDCzPdjxqDPeTdDXS2walgmZ+6/o28mYOwDrUV87m3jQF+6E8j/0hcYgKfgCATM8QOp7MRaDvM=
X-Received: by 2002:a17:902:e851:b0:205:861c:5c4a with SMTP id
 d9443c01a7336-2076e4ebba0mr150793145ad.60.1726427541541; Sun, 15 Sep 2024
 12:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
 <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-4-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-4-feaabb45916b@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:12:10 +0200
Message-ID: <CAFBinCD+txhz0x20LXhydZpLk=u4d9FT4=1sOX1bKuDeQqsMjQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] ARM: dts: amlogic: meson6: delete undocumented nodes
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_121222_499489_47FC6215 
X-CRM114-Status: GOOD (  11.74  )
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

SGkgTmVpbCwKCk9uIFdlZCwgU2VwIDExLCAyMDI0IGF0IDEyOjE54oCvUE0gTmVpbCBBcm1zdHJv
bmcKPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gRGVsZXRlIG5vZGVzIGlu
IG1lc29uNi5kdHNpIHRoYXQgYXJlIGNsZWFybHkgdW5kb2N1bWVudGVkICYgdW51c2VkIGZvciBt
ZXNvbjYsCj4gZml4aW5nIHRoZSBmb2xsb3dpbmcgY2hlY2sgZXJyb3JzOgo+IGF1ZGlvLWNvbnRy
b2xsZXJANTQwMDogY29tcGF0aWJsZTowOiAnYW1sb2dpYyxhaXUnIGlzIG5vdCBvbmUgb2YgWydh
bWxvZ2ljLGFpdS1neGJiJywgJ2FtbG9naWMsYWl1LWd4bCcsICdhbWxvZ2ljLGFpdS1tZXNvbjgn
LCAnYW1sb2dpYyxhaXUtbWVzb244YiddCj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL2FtbG9naWMsYWl1LnlhbWwjCj4gYXVkaW8t
Y29udHJvbGxlckA1NDAwOiBjb21wYXRpYmxlOiBbJ2FtbG9naWMsYWl1J10gaXMgdG9vIHNob3J0
Cj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L3NvdW5kL2FtbG9naWMsYWl1LnlhbWwjCj4gL3NvYy9idXNAYzExMDAwMDAvcHdtQDg1NTA6IGZh
aWxlZCB0byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydhbWxvZ2ljLG1lc29u
LXB3bSddCj4gL3NvYy9idXNAYzExMDAwMDAvcHdtQDg2NTA6IGZhaWxlZCB0byBtYXRjaCBhbnkg
c2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydhbWxvZ2ljLG1lc29uLXB3bSddCj4gcGh5QDg4MDA6
IGNvbXBhdGlibGU6ICdvbmVPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhl
ZDoKPiAgICAgICAgIFsnYW1sb2dpYyxtZXNvbi1teC11c2IyLXBoeSddIGlzIHRvbyBzaG9ydAo+
ICAgICAgICAgJ2FtbG9naWMsbWVzb24tbXgtdXNiMi1waHknIGlzIG5vdCBvbmUgb2YgWydhbWxv
Z2ljLG1lc29uOC11c2IyLXBoeScsICdhbWxvZ2ljLG1lc29uOGItdXNiMi1waHknLCAnYW1sb2dp
YyxtZXNvbjhtMi11c2IyLXBoeSddCj4gICAgICAgICAnYW1sb2dpYyxtZXNvbi1neGJiLXVzYjIt
cGh5JyB3YXMgZXhwZWN0ZWQKPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvcGh5L2FtbG9naWMsbWVzb244Yi11c2IyLXBoeS55YW1sIwo+IHBo
eUA4ODIwOiBjb21wYXRpYmxlOiAnb25lT2YnIGNvbmRpdGlvbmFsIGZhaWxlZCwgb25lIG11c3Qg
YmUgZml4ZWQ6Cj4gICAgICAgICBbJ2FtbG9naWMsbWVzb24tbXgtdXNiMi1waHknXSBpcyB0b28g
c2hvcnQKPiAgICAgICAgICdhbWxvZ2ljLG1lc29uLW14LXVzYjItcGh5JyBpcyBub3Qgb25lIG9m
IFsnYW1sb2dpYyxtZXNvbjgtdXNiMi1waHknLCAnYW1sb2dpYyxtZXNvbjhiLXVzYjItcGh5Jywg
J2FtbG9naWMsbWVzb244bTItdXNiMi1waHknXQo+ICAgICAgICAgJ2FtbG9naWMsbWVzb24tZ3hi
Yi11c2IyLXBoeScgd2FzIGV4cGVjdGVkCj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BoeS9hbWxvZ2ljLG1lc29uOGItdXNiMi1waHkueWFt
bCMKPiAvc29jL2J1c0BjMTEwMDAwMC9tbWNAOGMyMDogZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hl
bWEgd2l0aCBjb21wYXRpYmxlOiBbJ2FtbG9naWMsbWVzb24tbXgtc2RpbyddCj4gbW1jQDhlMDA6
IGNvbXBhdGlibGU6MDogJ2FtbG9naWMsbWVzb24tbXgtc2RoYycgaXMgbm90IG9uZSBvZiBbJ2Ft
bG9naWMsbWVzb244LXNkaGMnLCAnYW1sb2dpYyxtZXNvbjhiLXNkaGMnLCAnYW1sb2dpYyxtZXNv
bjhtMi1zZGhjJ10KPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvbW1jL2FtbG9naWMsbWVzb24tbXgtc2RoYy55YW1sIwo+IG1tY0A4ZTAwOiBj
b21wYXRpYmxlOiBbJ2FtbG9naWMsbWVzb24tbXgtc2RoYyddIGlzIHRvbyBzaG9ydAo+ICAgICAg
ICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tbWMvYW1s
b2dpYyxtZXNvbi1teC1zZGhjLnlhbWwjCj4gcmVtb3RlcHJvY0AxYzogY29tcGF0aWJsZTowOiAn
YW1sb2dpYyxtZXNvbi1teC1hby1hcmMnIGlzIG5vdCBvbmUgb2YgWydhbWxvZ2ljLG1lc29uOC1h
by1hcmMnLCAnYW1sb2dpYyxtZXNvbjhiLWFvLWFyYyddCj4gICAgICAgICBmcm9tIHNjaGVtYSAk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3JlbW90ZXByb2MvYW1sb2dpYyxtZXNv
bi1teC1hby1hcmMueWFtbCMKPiByZW1vdGVwcm9jQDFjOiBjb21wYXRpYmxlOiBbJ2FtbG9naWMs
bWVzb24tbXgtYW8tYXJjJ10gaXMgdG9vIHNob3J0Cj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3JlbW90ZXByb2MvYW1sb2dpYyxtZXNvbi1t
eC1hby1hcmMueWFtbCMKPgo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPgpHZW5lcmFsbHkgSSdtIGZpbmUgd2l0aCB0aGlzLiBJJ20gd29u
ZGVyaW5nIGlmIHdlIHNob3VsZCBnbyBvbmUgc3RlcApmdXJ0aGVyIGJ5IGRlY29tbWlzc2lvbmlu
ZyBNZXNvbjYgc3VwcG9ydD8KVG8gYmUgc3BlY2lmaWMgaGVyZSwgSSdtIHRoaW5raW5nIG9mIHJl
bW92aW5nIE1BQ0hfTUVTT042IGZyb20KYXJjaC9hcm0vbWFjaC1tZXNvbi9LY29uZmlnIGFuZCBk
ZWxldGluZyBtZXNvbjZ7LmR0c2ksLWF0djEyMDAuZHRzfQoKSSBkb24ndCBoYXZlIGFueSBib2Fy
ZHMgd2l0aCBNZXNvbjYgU29DLCB0aGVyZSdzIG5vIHVwc3RyZWFtIEdQSU8sCnBpbmN0cmwsIGNs
b2NrLCBNTUMsIDx5b3UgbmFtZSBpdD4gZHJpdmVyIGZvciB0aGF0IFNvQyBlaXRoZXIuClNvIGFs
bCB3ZSBoYXZlIHVwc3RyZWFtIGlzIHRoZSBhYmlsaXR5IHRvIGJvb3QgdG8gaW5pdHJhbWZzIGFu
ZCB1c2UKc2VyaWFsIGNvbnNvbGUocykuCklmIHNvbWVvbmUgaXMgaW50ZXJlc3RlZCBpbiBNZXNv
bjYgc3VwcG9ydCB0aGV5IHNob3VsZCBicmluZyBpdCBiYWNrCmFsb25nIHdpdGggYSBmZXcgbW9y
ZSBwYXRjaGVzIGZvciB1cHN0cmVhbSBzdXBwb3J0IG9mIGZ1cnRoZXIKcGVyaXBoZXJhbHMuCgoK
QmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
