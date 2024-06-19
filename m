Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D8CC27C79
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jun 2024 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8o79WvarNUdG7RGr8TGuqotSfunoXti7I3HqNAzaJy0=; b=uPD28M/W6Yhodl
	Y++kbdd6ylC/LkDjJXr/zZkf1/mp/zux/4qbcjx68hl7Ooc3Ag7rIcHKnWECUGL3W2myfv+E9blXu
	v++TdPMx5JgHWMp4bj7WQAYPrvA1YU4TuC3jTIuczHbodskwbZ1CFLMs+9WMedIH7rZfGAoVD8OJP
	yKDOdeaH0YdTzBREcFx3NCJvBl3UiUPklzM4C7mxoq8D0yaeKxJhlg+7QiCTBgOAqtgzjLJXi6KVK
	J8zfUjSu8hFVNMo15YaRSzCXJ4X7XztwUsGfPc91LMCIveITO+TC0mX2+VbtHXcs+5oL5Xf4dG+Ql
	t/LAeRRTb6URIdxYrAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwWJ-00000001cN5-0H5m;
	Wed, 19 Jun 2024 14:42:43 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwWE-00000001cMI-2yNX;
	Wed, 19 Jun 2024 14:42:40 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso111147001fa.1;
        Wed, 19 Jun 2024 07:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718808156; x=1719412956; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrNaD0zVW3DChvXbXhKCNiu4238wS0EYPxxc2VaoSyQ=;
        b=SFX+OgVKT+QsrmYbiQjlWa8iJSixC3TepcDBtQL7kbg24+ysWTUHf5YzLNl5dpDkS0
         tO/OzUZ60a8lGUR70O9sh198ysPkbs525LFivSfy5hLdbKwKzt5JuOCyHfnkX9RveIOT
         md2ill8RHUKwMgNPE2/kKLNE/Yp9g/v9hYATkbDGcT+0ogALMXySriKuCMdzNYrO4OFD
         eUmGouM1wn199iuOuCmH+SmixX6bEQQy+Hdyc8yEdYe6xYhKiIiZdCPAdrANmXPKGhQH
         1AGR2qwHixVHtGlmuF4De+GXf7cAFWtRhO2UohJf2VPZ2YTI9GFdpB7sFgVzl0ZAXbEG
         hOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808156; x=1719412956;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrNaD0zVW3DChvXbXhKCNiu4238wS0EYPxxc2VaoSyQ=;
        b=YVRWg16JTZJ4rcPLQBNq195Gs35c0elR69oczfcGBRvlR1pRlJPXRndvohYOq5zgvc
         tLXC9gYpL1duL9LV8QobxyvVR9p5T+Zsn6YRpjdOo0haS8DJ7A6swkJpmBG9rHsNFwDM
         3nSyWS8Cv8oBimoam4F1V651N7BygJ+qQLYF38dSUXLiIY+XXQ/hJaIHlOD7iq/KeIk8
         zydP5iKcEytTpwl1cUCLHFJ+LhidKXlaSQF4qVEgeL6Iwc4CQx5dxeuVr4vL3U38tC0m
         ZFGzaiibtfJ9JRdPL5lrelxB1B5qLpvyQkGVkYlGL/vlkAg7cr1hkaeTxclH0pslw0Q4
         tfLA==
X-Forwarded-Encrypted: i=1; AJvYcCUEX72SgYkTFs9fju3i3nE6PJ4jyClP5jYciPbEqw2Jqh7LnAgh5zt6b9s0ueXq6vKU3LnFMoBh4ILY1wQbvoZX2ckeUqiXy0uXsg5M9cg4OezZkPwNTYD1r14SPik9LZXI/efvfClRstrNBFeU3gl9zdmw6smTGg==
X-Gm-Message-State: AOJu0Yy8sbyrvQivm1Jd5vVQD07Potu0E7YN+flG1dYWZxyDYLbkhKUy
	/jbLOPk/BvWVwgmOzbrH6YdWxeKxa80BN8/vpQJ4Mh3YUFE6F63M
X-Google-Smtp-Source: AGHT+IEa405I7Zca/4R1by2D1xir1eo+sByG2M6vyPFJq1gddTkxv9fbkpe26ZtAvIt4YYdQlBBtFQ==
X-Received: by 2002:a2e:9210:0:b0:2de:8697:e08b with SMTP id 38308e7fff4ca-2ec3ced12bdmr21232381fa.26.1718808155415;
        Wed, 19 Jun 2024 07:42:35 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fb282b057sm29603566b.31.2024.06.19.07.42.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2024 07:42:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 3/3] arm64: dts: meson: add initial support for Dreambox
 One/Two
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <39d1c5e1-e27b-4736-87e0-ca42ccf8885a@linaro.org>
Date: Wed, 19 Jun 2024 18:42:20 +0400
Cc: kernel test robot <lkp@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AML <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 oe-kbuild-all@lists.linux.dev
Message-Id: <893D54FC-6796-484C-B000-FE6DC185BA22@gmail.com>
References: <20240606094513.3949323-3-christianshewitt@gmail.com>
 <202406071527.fnfhnkUL-lkp@intel.com>
 <FB2C9481-FCA2-496D-B916-E429BB8C0C82@gmail.com>
 <39d1c5e1-e27b-4736-87e0-ca42ccf8885a@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_074238_781524_6F3D1D45 
X-CRM114-Status: GOOD (  15.98  )
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

PiBPbiAxOSBKdW4gMjAyNCwgYXQgNjowNuKAr1BNLCBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4gCj4gT24gMDcvMDYvMjAyNCAxMDozMSwgQ2hyaXN0
aWFuIEhld2l0dCB3cm90ZToKPj4+IE9uIDcgSnVuIDIwMjQsIGF0IDEyOjEw4oCvUE0sIGtlcm5l
bCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPiB3cm90ZToKPj4+IAo+Pj4gSGkgQ2hyaXN0aWFu
LAo+Pj4gCj4+PiBrZXJuZWwgdGVzdCByb2JvdCBub3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQg
d2FybmluZ3M6Cj4+PiAKPj4+IFthdXRvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiByb2JoL2Zvci1u
ZXh0XQo+Pj4gW2Fsc28gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIGtyemsvZm9yLW5leHQgbGludXMv
bWFzdGVyIHY2LjEwLXJjMiBuZXh0LTIwMjQwNjA2XQo+Pj4gW2Nhbm5vdCBhcHBseSB0byBrcnpr
LWR0L2Zvci1uZXh0IGtyemstbWVtLWN0cmwvZm9yLW5leHRdCj4+PiBbSWYgeW91ciBwYXRjaCBp
cyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwga2luZGx5IGRyb3AgdXMgYSBub3RlLgo+
Pj4gQW5kIHdoZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScg
YXMgZG9jdW1lbnRlZCBpbgo+Pj4gaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQt
cGF0Y2gjX2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl0KPj4+IAo+Pj4gdXJsOiAgICBodHRwczovL2dp
dGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0NocmlzdGlhbi1IZXdpdHQvZHQt
YmluZGluZ3MtYXJtLWFtbG9naWMtYWRkLXN1cHBvcnQtZm9yLURyZWFtYm94LU9uZS1Ud28vMjAy
NDA2MDYtMTc1NDI3Cj4+PiBiYXNlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3JvYmgvbGludXguZ2l0IGZvci1uZXh0Cj4+PiBwYXRjaCBsaW5rOiAg
ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNjA2MDk0NTEzLjM5NDkzMjMtMy1jaHJp
c3RpYW5zaGV3aXR0JTQwZ21haWwuY29tCj4+PiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0ggMy8zXSBh
cm02NDogZHRzOiBtZXNvbjogYWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgRHJlYW1ib3ggT25lL1R3
bwo+Pj4gY29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMTkuMC4wZ2l0IChodHRwczovL2dpdGh1Yi5j
b20vbGx2bS9sbHZtLXByb2plY3QgZDdkMmQ0ZjUzZmM3OWI0YjU4ZThkOGQwODE1MWI1NzdjMzY5
OWQ0YSkKPj4+IGR0c2NoZW1hIHZlcnNpb246IDIwMjQuNi5kZXYxK2c4MzMwNTRmCj4+PiByZXBy
b2R1Y2U6IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNDA2MDcv
MjAyNDA2MDcxNTI3LmZuZmhua1VMLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQo+Pj4gCj4+PiBJ
ZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3Qg
anVzdCBhIG5ldyB2ZXJzaW9uIG9mCj4+PiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkg
YWRkIGZvbGxvd2luZyB0YWdzCj4+PiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8
bGtwQGludGVsLmNvbT4KPj4+IHwgQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1r
YnVpbGQtYWxsLzIwMjQwNjA3MTUyNy5mbmZobmtVTC1sa3BAaW50ZWwuY29tLwo+Pj4gCj4+PiBk
dGNoZWNrIHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pCj4+PiAgIGFyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2k6MjY2LjMzLTE1NDAuNzog
V2FybmluZyAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IC9zb2MvYnVzQGZmNjAwMDAwL2J1c0AzNDQw
MC9waW5jdHJsQDQwOiBub2RlIGhhcyBhIHVuaXQgbmFtZSwgYnV0IG5vIHJlZyBvciByYW5nZXMg
cHJvcGVydHkKPj4+ICAgICBhbHNvIGRlZmluZWQgYXQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWcxMi1jb21tb24uZHRzaToyNjYuMzMtMTU0MC43Cj4+PiAgIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2k6MjY2LjMzLTE1NDAuNzogV2Fy
bmluZyAoc2ltcGxlX2J1c19yZWcpOiAvc29jL2J1c0BmZjYwMDAwMC9idXNAMzQ0MDAvcGluY3Ry
bEA0MDogbWlzc2luZyBvciBlbXB0eSByZWcvcmFuZ2VzIHByb3BlcnR5Cj4+PiAgICAgYWxzbyBk
ZWZpbmVkIGF0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0
c2k6MjY2LjMzLTE1NDAuNwo+Pj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
ZzEyLWNvbW1vbi5kdHNpOjIyMjAuMjMtMjI2MC42OiBXYXJuaW5nIChhdm9pZF91bm5lY2Vzc2Fy
eV9hZGRyX3NpemUpOiAvc29jL2J1c0BmZmQwMDAwMC9kc2lANzAwMDogdW5uZWNlc3NhcnkgI2Fk
ZHJlc3MtY2VsbHMvI3NpemUtY2VsbHMgd2l0aG91dCAicmFuZ2VzIiBvciBjaGlsZCAicmVnIiBw
cm9wZXJ0eQo+Pj4gICAgIGFsc28gZGVmaW5lZCBhdCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpOjIyMjAuMjMtMjI2MC42Cj4+Pj4+IGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWRyZWFtYm94LW9uZS5kdGI6IC9zb2MvYnVzQGZm
NjAwMDAwL2J1c0A0MjAwMC9jbG9jay1jb250cm9sbGVyQDA6IGZhaWxlZCB0byBtYXRjaCBhbnkg
c2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydhbWxvZ2ljLGcxMmEtYXVkaW8tY2xrYyddCj4+PiAg
IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWRyZWFtYm94LW9uZS5kdGI6
IC9zb2MvYnVzQGZmNjAwMDAwL2J1c0A0MjAwMC9hdWRpby1jb250cm9sbGVyQDc0NDogZmFpbGVk
IHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOiBbJ2FtbG9naWMsZzEyYS10b2hk
bWl0eCddCj4+Pj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWRyZWFt
Ym94LW9uZS5kdGI6IHN5cy1jdHJsQDA6ICcjYWRkcmVzcy1jZWxscycsICcjc2l6ZS1jZWxscycs
ICdyYW5nZXMnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5jdHJsLVswLTld
KycKPj4+ICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
c29jL2FtbG9naWMvYW1sb2dpYyxtZXNvbi1neC1oaGktc3lzY3RybC55YW1sIwo+Pj4gLS0KPj4+
ICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaToyNjYu
MzMtMTU0MC43OiBXYXJuaW5nICh1bml0X2FkZHJlc3NfdnNfcmVnKTogL3NvYy9idXNAZmY2MDAw
MDAvYnVzQDM0NDAwL3BpbmN0cmxANDA6IG5vZGUgaGFzIGEgdW5pdCBuYW1lLCBidXQgbm8gcmVn
IG9yIHJhbmdlcyBwcm9wZXJ0eQo+Pj4gICAgIGFsc28gZGVmaW5lZCBhdCBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpOjI2Ni4zMy0xNTQwLjcKPj4+ICAg
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaToyNjYuMzMt
MTU0MC43OiBXYXJuaW5nIChzaW1wbGVfYnVzX3JlZyk6IC9zb2MvYnVzQGZmNjAwMDAwL2J1c0Az
NDQwMC9waW5jdHJsQDQwOiBtaXNzaW5nIG9yIGVtcHR5IHJlZy9yYW5nZXMgcHJvcGVydHkKPj4+
ICAgICBhbHNvIGRlZmluZWQgYXQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcx
Mi1jb21tb24uZHRzaToyNjYuMzMtMTU0MC43Cj4+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2k6MjIyMC4yMy0yMjYwLjY6IFdhcm5pbmcgKGF2b2lk
X3VubmVjZXNzYXJ5X2FkZHJfc2l6ZSk6IC9zb2MvYnVzQGZmZDAwMDAwL2RzaUA3MDAwOiB1bm5l
Y2Vzc2FyeSAjYWRkcmVzcy1jZWxscy8jc2l6ZS1jZWxscyB3aXRob3V0ICJyYW5nZXMiIG9yIGNo
aWxkICJyZWciIHByb3BlcnR5Cj4+PiAgICAgYWxzbyBkZWZpbmVkIGF0IGFyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2k6MjIyMC4yMy0yMjYwLjYKPj4+Pj4g
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItZHJlYW1ib3gtdHdvLmR0Yjog
L3NvYy9idXNAZmY2MDAwMDAvYnVzQDQyMDAwL2Nsb2NrLWNvbnRyb2xsZXJAMDogZmFpbGVkIHRv
IG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOiBbJ2FtbG9naWMsZzEyYS1hdWRpby1j
bGtjJ10KPj4+ICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItZHJlYW1i
b3gtdHdvLmR0YjogL3NvYy9idXNAZmY2MDAwMDAvYnVzQDQyMDAwL2F1ZGlvLWNvbnRyb2xsZXJA
NzQ0OiBmYWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnYW1sb2dp
YyxnMTJhLXRvaGRtaXR4J10KPj4+Pj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWcxMmItZHJlYW1ib3gtdHdvLmR0Yjogc3lzLWN0cmxAMDogJyNhZGRyZXNzLWNlbGxzJywgJyNz
aXplLWNlbGxzJywgJ3JhbmdlcycgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ3Bp
bmN0cmwtWzAtOV0rJwo+Pj4gICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9zb2MvYW1sb2dpYy9hbWxvZ2ljLG1lc29uLWd4LWhoaS1zeXNjdHJsLnlhbWwj
Cj4+IE5vdGhpbmcgdG8gZml4LiBUaGUgcGF0Y2gganVzdCBkZXBlbmRzIG9uIE5laWzigJlzIGJp
bmRpbmcgZml4ZXMgaGVyZToKPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LWFtbG9naWMvY292ZXIvMjAyNDA2MDYtdG9waWMtYW1sb2dpYy11cHN0cmVhbS1iaW5k
aW5ncy1maXhlcy1kdHMtdjEtMC02MmU4MTI3Mjk1NDFAbGluYXJvLm9yZy8KPiAKPiBDYW4geW91
IHJlc2VudCBidXQga2VlcGluZyB0aGUgYXNzaWduZWQtY2xvY2tzIGluIHRoZSBzb3VuZCBjYXJk
IG5vZGUgPwo+IAo+IEJUVyBrZWVwIHRoZSByZXZpZXdlZC1ieS4KCldpbGwgZG8sIHRoYW5rcy4K
CkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
