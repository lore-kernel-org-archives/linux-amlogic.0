Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CAFCA6015
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 06:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxi9SGBF2bsfr8QUzprgMd0JOAtvM1Y4/jR/3On1V08=; b=xejBZgXX1oh9Kb
	+y8UZsFmn0Httfg17e2Ejb0uT7tUSwmVsixQdebUcik+Q18jFFTPBkyx82TwTf+qSheE+WJ2QLRfn
	Rx0GtDv1A1iO0nTA2sYHJ3yu4AK3gDtN2Bn3O5g8yCLrzrGnNgIPvnVt+yyW2c5ixyvl8emf1Sv38
	JUkQP2q4GSKCu4LOtciMbvEwB+xiipq84GNCZPJnv/9Q+WUfo68fOWdhaWVICpM1tOwvDg5uYiNiP
	4CpQO0+ErOeylX2JWMaYt6rXt2MsyeAWRQa083RpzKPEVzFUHFFS6BMRV/33nqpp/Ff56lDCxbeIG
	S+7Yg8q65SUDQCiIU7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3lu-00000005aXZ-0Ssf;
	Fri, 09 Oct 2026 06:07:58 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3lr-00000005aXF-3pXw
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 06:07:57 +0000
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917a97b39e8so53612296d6.3
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Oct 2026 23:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526074; x=1792130874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWTuV8nTat+7Ise5DAVZrckoXbB3rEEMphlZwWdvIzs=;
        b=axlUr+22W+cgmJ/m3ev3Qq61D0nm0Qz8RjVH900V7IT+3Xvrzh3nFLzXAEnfcXgJuj
         PHA7YsZ2De1q+K7bsw2rsR5Gf1ZNfz/P7Gwf2FZeTmngJfvB9AUPDzVBCQU1y/EhcC4z
         HSLhN4yeiwD5fAtO4cHaRFT2+X/X8GndFECfUJS0xF6MnXfpZhDC5GtVw8gIfM0Wd9HB
         QCP+ZJXNvbGfNPJePt3b/VicfxgwREQmJmVPyndJdBy2+bBiKKMYCmNzTq8FIY3raiiy
         bjIYLrMjhD/aR+j/xjjA+v5/pbVfxRdNqn25MUrLB/m9lnDFP4RujPotV9Uar2XCcW+b
         sHoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw92r9zDoA9LKB6hUf+WTLDhkySXu/3HAeb29Gjuo4SrVtbGS0FI/ZitMtwvSKo55IyJeYvrG5hHjjh3Ic9@lists.infradead.org
X-Gm-Message-State: AFuF++lJE8bGr2Nk2/V+llzKqGJ8JPZLeGL+0PuMCF+x84czxSAc3sop
	SvPJmHBWPjpBxZky3JLF7jh1H0034BrkyyrVaU7ZD9wgqxgM+39bb+A1SK2udU3M+B4=
X-Gm-Gg: AYBFou3pDBYqMRdgcD8jl2AmEj3LqgLjKRy4FKbCg00XJ0U5vtHn5B+iRgW6+S9cR9/
	iojk/A97Bu023bjX/YIMRj9+1dkPH13lxF5OPHZv2jMEWvAj6UL6OSeOt4IXCUpX8uF3/81hWeZ
	ALfg9t3jI24wexAvRxrNMzM6WU+ZGI4wrNWp26SZEcX6KH8FH+XIOBRGhwiTRisarAGmXiQpUYG
	uLVYEXVHOp8Hyt+6WMLcqbbgLOcQXU557+ZE4GvWiDin+5GO2BelpfDgfPxDOXSmmkINjjBCSKc
	HYjZs+O64wqTNMbd+iTUOV5u4Sz9igZl1DKP3uVOLY995SoHpgrHJjS4Dhuxdg/y9L/NcKBnxLH
	Ni4LhxVZws8a16wcjq1B/FvTWic3XN0D4ar+7XMMc4oaR3GT/g+Ob+jv209/yu6hdUDMn0VRls7
	hm0Tf/Ux0K0koRGGF0IMyG1GAxy1tMbmh/q+9juku4FzFwC/AcvcIxD2YPO5pCltcETESbuZI1I
	pjKgDuMpRBHfNb2qIL0PBk0zQk/G1dHgdlZcux4+DPETkzh3ptYLkz55v3r4wpwtKHNlvqAClwu
	5w==
X-Received: by 2002:a05:620a:8013:b0:93e:81b6:cff2 with SMTP id af79cd13be357-93ebd0a21b6mr125760485a.7.1791526074516;
        Thu, 08 Oct 2026 23:07:54 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9896ac4sm111042185a.31.2026.10.08.23.07.54
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:07:54 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5350cc60b51so58923321cf.1
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Oct 2026 23:07:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYnTLhrHxJfJQuGkKhldy779KT9M8TfXttRoxEBEBMMpWdMIRTmpw4fhV3YARNQ1PfOV1cN8H3s2XsYsYL@lists.infradead.org
X-Received: by 2002:a05:690c:ec4:b0:8ae:8d28:77ca with SMTP id
 00721157ae682-8b07edfbad7mr3120487b3.33.1791525600619; Thu, 08 Oct 2026
 23:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
In-Reply-To: <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 06:59:49 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
X-Gm-Features: AclHuK8Z8XHB904erYGkjWemp1Y2Gn2Ya3i9_K0CjW0XJN3l42AYcMZ32Srg4dI
Message-ID: <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_230755_952403_950409C3 
X-CRM114-Status: GOOD (  19.75  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgNywgMjAyNiBhdCAyOjAx4oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDA3LCAyMDI2IGF0IDA5OjI2OjIwQU0gKzAxMDAs
IEx1Y2FzIFRhbnVyZSB3cm90ZToKPiA+IFRoZSBUNyBwYWlycyBhIFN5bm9wc3lzIGdpZ2FiaXQg
TUFDIHdpdGggdGhlIHNhbWUgZ2x1ZSByZWdpc3RlcnMgdGhlCj4gPiBHMTJBIGhhcywgYnV0IG5v
dGhpbmcgZGVzY3JpYmVkIGl0LiBUaGlzIGFkZHMgdGhlIGJpbmRpbmcsIHRoZSBkcml2ZXIKPiA+
IHN1cHBvcnQgYW5kIHRoZSBkZXZpY2UgdHJlZSBub2RlcywgYW5kIGVuYWJsZXMgdGhlIHBvcnQg
b24gdGhlIEtoYWRhcwo+ID4gVklNNC4KPiA+Cj4gPiBVbmxpa2UgdGhlIEcxMkEsIHRoZSBjb250
cm9sbGVyIHJlYWNoZXMgRFJBTSB0aHJvdWdoIGEgcGlwZWxpbmUgc3RhZ2UKPiA+IHdpdGggYSBn
YXRlIG9mIGl0cyBvd24sIHN5c19hbXBpcGVfZXRoLiBOb3RoaW5nIGVsc2UgY2xhaW1zIGl0LCBz
bwo+ID4gY2xrX2Rpc2FibGVfdW51c2VkIHN3aXRjaGVzIGl0IG9mZiBhbmQgdHJhbnNmZXJzIHN0
b3AuCj4gPgo+ID4gdjIgY2hhbmdlcyB0aGUgUkdNSUkgZGVsYXlzLCBhZnRlciByZXZpZXcuIHBo
eS1tb2RlIGRlc2NyaWJlcyB0aGUKPiA+IGJvYXJkLCBub3Qgd2hpY2ggY2hpcCBhZGRzIHRoZSBk
ZWxheSwgc28gdGhpcyBib2FyZCBpcyByZ21paS1pZC4KPiA+IGR3bWFjLW1lc29uOGIgZGlkIHRo
ZSBvcHBvc2l0ZSwgYW5kIGlnbm9yZWQgdGhlICotaW50ZXJuYWwtZGVsYXktcHMKPiA+IHByb3Bl
cnRpZXMuIFBhdGNoIDEgZml4ZXMgdGhhdC4gVGhlIFZJTTQgbmVlZHMgaXQgYmVjYXVzZSB0aGUg
UlRMODIxMUYKPiA+IHRyYW5zbWl0IGRlbGF5IGRvZXMgbm90IHdvcmsgaGVyZS4KPgo+IFdoYXQg
aXMgc3BlY2lhbCBhYm91dCB0aGUgUlRMODIxMUY/Ck1heWJlIG5vdGhpbmcsIGl0IG1heSBiZSB0
aGlzIGJvYXJkLiBJIGNhbm5vdCB0ZWxsIGZyb20gaGVyZS4KClRoZSBSVEw4MjExRiBkb2VzIGFk
ZCB0aGUgZGVsYXlzLCB0aGUgZHJpdmVyIHNldHMgYm90aCBiaXRzIGFuZCB0aGUKY2hpcCB0YWtl
cyB0aGVtLiBCdXQgd2hlbiB0aGUgUlRMODIxMUYgYWRkcyB0aGUgdHJhbnNtaXQgZGVsYXksIHRo
aXMKYm9hcmQgZ2V0cyBubyB3b3JraW5nIGxpbmsuCgpJIG1lYXN1cmVkIHRoZSByZWNlaXZlIHNp
ZGUgYnkgc3dlZXBpbmcgdGhlIE1BQyBkZWxheSBhZ2FpbnN0IHRoZSBDUkMKY291bnRlciwgd2l0
aCB0aGUgUEhZIGRlbGF5IG9mZiBhbmQgdGhlbiBvbi4gVGhlIHdpbmRvdyBtb3ZlcyBieQphYm91
dCAyMjAwcHMsIHNvIHRoZSBQSFkgcmVjZWl2ZSBkZWxheSBpcyByaWdodC4KClRyYW5zbWl0IGlz
IHRoZSBwcm9ibGVtLiBXaXRoIHRoZSBQSFkgZG9pbmcgVFggdGhlIHBlZXIgc2VlcyBub3RoaW5n
CndlIHNlbmQuIFdpdGggdGhlIE1BQyBkb2luZyBUWCBpdCBydW5zIGF0IDkzNU1iaXQvcyBib3Ro
IHdheXMgd2l0aCBubwplcnJvcnMuCgpJIGFza2VkIEtoYWRhcyBhYm91dCB0aGUgYm9hcmQsIG5v
IGFuc3dlciB5ZXQuCj4KPiAgICAgIEFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
