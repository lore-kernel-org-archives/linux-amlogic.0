Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8D9C61DD3
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HV4DwqDr/ohgNDzrDrnOZklsxyLxhv5E0QG+KJDH2PI=; b=E2Uh/dkEWuW9Ie
	4OSfnyrv/IrAb/UTJC2Eej9hKQ5fKqEFUg6pjQNxJ5fmvyaloN8/5cMVD3uwdchxKH0DtAsqBEZhA
	DkX+lTD5xoVkeFBcCOiIZN6eXIm6P49aFmyB+L/8HV8Yb4qnskQih6+yjmw4FuwY5cTuEj7ScrTYA
	87+Z+2Jp5ViNn3nwYXksXDGXVIOMChdWOMB+nqvYeLPyhkvOgFd9afY3tSiXOl8iNivyNDa+fwD3j
	SGP5oxkAIjPAZ172a/s3gBUJ8ClXWdBxcmD7L/B8wqFzex5PL/ppBxx/N0ExrRytSR1EvDzoV+imf
	EQSwl5qjuickmlwAPY/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Jv-0000000H1yx-0e54;
	Thu, 03 Sep 2026 10:05:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Ju-0000000H1yi-06nY
	for linux-amlogic@bombadil.infradead.org;
	Thu, 03 Sep 2026 10:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=sB2LZifEeupjsxCHsRGx0RoKXBpeYPjdfUIFuUgunMM=; b=pdvzsGZ+KHwA0fTcvyoagIHJ+0
	D65L65PqM495j6pDqSpBrCKe+m0oW0MwH/3XB4WUzY/WTSBgGlxb7w6f45deUaYQAUjomlhSMRQak
	NPvmAK9y7E3Onw6GvctDZZTvLgoqbCn7WhwgCOlFwcqnNCU4AFbXdWgM35DoAz0HGG8BXqVlL6c2O
	CQmiV9AxCxH9MkFcfnbZ2vlf16t87epVUIiZNWs2UFND7QBKc/SGxzL2N269koc7bVdYDMpbRj1/Y
	z0/SN/G3EM+/26VxEJXdZyfBBJ6/7EthuNSzF7Mgg++qBRUwkLx5lUgAT5Ol3J47R1a6kb6JYQMtN
	OfMMiJwg==;
Received: from mail-yx1-f42.google.com ([74.125.224.42])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x24Jq-0000000CxVj-32Yj
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 10:05:20 +0000
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66c7e3a2332so2325800d50.2
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 03:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429916; x=1789034716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sB2LZifEeupjsxCHsRGx0RoKXBpeYPjdfUIFuUgunMM=;
        b=sd9pHfnj1PRwoZZsis0n5mgBPDx0apm0v6yoLwvGdqcglaYwdRPXx4R+mfdrux6IY2
         /4rADhQEOeA2XMJxV5mf95XoNcU5/lrOaz3CecFGlBnQgGGYEUdtI7nXiNiFfEM0gSe2
         rpBd2R/HLJ1cfa2eGFHqsR+Oill8eMLPzZklb1uq++DujAUOwpsuL0av/VjyUzAdPoN4
         rMojOYZR6Cr2KEfMod0mGAvpoZGju7EU8qgq+H4yJYQ/4w4w1J1LuWKKYzkgxSbNHULc
         fcg/b5asx9p5FKz7UWKUOaqbrdqGgfaqSuy9C1Pil4JP5Eb+MxEDJiLF28ZKWgQz8fbn
         Us5w==
X-Forwarded-Encrypted: i=1; AKwUvBzt/PTk7+WwnfeNPvnCI8y27lBkABhsVTlTLzP0n0j85SlOix6djIPumw1mLDQCMOVSUC8/gcMhWaHzlVvx@lists.infradead.org
X-Gm-Message-State: AFuF++nX0jVz/J3M5cRU7Jc5RnaoQzmWmWsZ3HbHn/sCRMpIyVuUeD79
	/+P+bjwua5B9LrDqRz3E3PM5vUVKsv2vWuzdUn+JU2lyf46z0WeTBJYqNih3OXY22Uo=
X-Gm-Gg: AYBFou2WdRlNErFRZlUaSJroJbhTSHP/52uivASiIYnziqZ0SL2PVPAFx+HerYUWKXz
	rWF4i1p7cRBTs/t65hQ2VwHNS9xKhcbAOrtLOXdwmBA5vEiFWmiClsJj+BxCPWqgjqJ3or7CNW3
	GIpk9MjRbigq27O/5IW9zLA4W6VmuDr6nx1BxWfca+qlcLX1Ticg/zrf1NauDr+diF+yyrK+S0g
	/jaIiNWToNGOCyivJfg1wzqHvXTDIFNzgfcDU0PPW4DoXUiY99yidxJVMNC0L4U2WaMySgJu4Pj
	eoRkp4kGoddf3FQdh+83JBPTdxz0WDS7ciNuEReFx/MBV1bbMXxZ+WL/Wj3YVJjJqj8AtQ8izLY
	LnyhuT4Z63cbwVmWMvDT3aHunWuxloHE/Gx0/01n/qN8x6jFqhQ6tSyzIFXXySw5mmYRCBYbrmy
	58AwMTKGpgHOpIROzz369H0XcXa75/NT46ZwK8LWIVGVCnYSBNASHjadcN1TSGFXWxc8xotVdHP
	FmVJ8qBwr8ajQxorGwmkcEimdFxJPFxCDFumTP10UH/Okhp55t5
X-Received: by 2002:a53:a890:0:b0:66d:e3d:59c6 with SMTP id 956f58d0204a3-66f9bb72f21mr3142551d50.22.1788429915199;
        Thu, 03 Sep 2026 03:05:15 -0700 (PDT)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com. [74.125.224.48])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66faa607888sm1320910d50.5.2026.09.03.03.05.14
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66bd7857841so2976860d50.3
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwcJMJx2HAbV5VX9ay7RkksjjvheVZYs+Uk2d1+OPCFFrGvSiHMMvT2rnhrq073GbCoMI9cZri4xM1ybwD3@lists.infradead.org
X-Received: by 2002:a05:690e:4890:20b0:66f:afdc:b49b with SMTP id
 956f58d0204a3-66fafdcb54bmr290871d50.0.1788429913913; Thu, 03 Sep 2026
 03:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260829094758.23248-1-tanure@linux.com> <178818026093.2318126.3676223463693214854.b4-ty@b4>
In-Reply-To: <178818026093.2318126.3676223463693214854.b4-ty@b4>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 3 Sep 2026 11:05:02 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
X-Gm-Features: AcwNN1VRB2D0FTXRpcvHAcbTlWB5xZQpxaG0zutz7J3nfFbo_PpnG2ATadEMYz8
Message-ID: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>, 
	Ronald Claveau <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>, 
	Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_110518_931526_6CD4E2A6 
X-CRM114-Status: GOOD (  20.98  )
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

T24gTW9uLCBBdWcgMzEsIDIwMjYgYXQgMTo0NOKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gU2F0LCAyOSBBdWcgMjAy
NiAxMDo0Nzo1NCArMDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gVGhlIEtoYWRhcyBWSU00
IGhhcyBuZWVkZWQgY2xrX2lnbm9yZV91bnVzZWQgdG8gYm9vdCByZWxpYWJseS4gV2l0aG91dCBp
dAo+ID4gdGhlIGJvYXJkIGhhbmdzIGF0IHJhbmRvbSwgbG9zZXMgc3RvcmFnZSBhbmQgY29ycnVw
dHMgbWVtb3J5LCBhbmQgdGhlCj4gPiBmYWlsdXJlcyBtb3ZlIGFyb3VuZCBmcm9tIGJvb3QgdG8g
Ym9vdC4KPiA+Cj4gPiBTaXggb2YgdGhlIFNvQydzIFBXTSBvdXRwdXRzIGRyaXZlIHRoZSBib2Fy
ZCdzIHZvbHRhZ2UgcmVndWxhdG9yczogdGhlCj4gPiBhbHdheXMtb24gZG9tYWluLCBib3RoIENQ
VSBjbHVzdGVycywgdGhlIEdQVSwgdGhlIE5QVSBhbmQgdGhlIERSQU0uIE5vbmUKPiA+IG9mIHRo
ZW0gd2VyZSBkZXNjcmliZWQsIHNvIExpbnV4IHNhdyB0aGUgb3V0cHV0cyBhcyB1bnVzZWQgYW5k
IHN3aXRjaGVkCj4gPiB0aGVtIG9mZiBhYm91dCBhIHNlY29uZCBpbnRvIGJvb3QuIFRoZSByZWd1
bGF0b3JzIHRoZW4gZHJpZnRlZCBhd2F5IGZyb20KPiA+IHRoZSBsZXZlbHMgdGhlIGJvb3Rsb2Fk
ZXIgaGFkIHNldCwgd2hpY2ggaXMgd2hlcmUgdGhlIGNvcnJ1cHRpb24gYW5kIHRoZQo+ID4gcmFu
ZG9tIGhhbmdzIGNhbWUgZnJvbS4KPiA+IFRoYW5rcyB0byBDaHVhbiBMaXUgZnJvbSBBbWxvZ2lj
IGZvciBoZWxwaW5nIG1lIGluZGV0aWZ5IHdoaWNoIGNsb2NrcyBhcmUKPiA+IGNyaXRpY2FsLgo+
ID4KPiA+IFsuLi5dCj4KPiBUaGFua3MsIEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYW1sb2dpYy9saW51eC5naXQgKHY3LjMvZml4ZXMp
Cj4KPiBbMi80XSBhcm02NDogZHRzOiBhbWxvZ2ljOiB0NzogZml4IHRoZSBwaW4gZ3JvdXBzIG9m
IHR3byBQV00gb3V0cHV0cwo+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYW1sb2dpYy9j
L2FlN2JlNWM1OGE4MTkyNTllNWViOThhM2FiZmE2MDg0MjQ3OGYyYWUKPiBbMy80XSBhcm02NDog
ZHRzOiBhbWxvZ2ljOiB0Nzoga2hhZGFzLXZpbTQ6IGFkZCB0aGUgUFdNLWRyaXZlbiBzdXBwbGll
cwo+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYW1sb2dpYy9jLzFlNWE1M2JkMTZhYzUw
MWU2ODQ2M2U4NDAyM2QxYmZmNTQzY2M2OTYKPiBbNC80XSBhcm02NDogZHRzOiBhbWxvZ2ljOiB0
NzogZml4IHRoZSBwaW4gZ3JvdXBzIG9mIHRoZSB2c3luYyBQV00KPiAgICAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL2FtbG9naWMvYy80MDYyOTJmZDc1Zjk1YWEzMDEwZmVjOTViNWJlYjVhOGI3
ZTNiYTNhCj4KPiBUaGVzZSBjaGFuZ2VzIGhhcyBiZWVuIGFwcGxpZWQgb24gdGhlIGludGVybWVk
aWF0ZSBnaXQgdHJlZSBbMV0uCj4KPiBUaGUgdjcuMy9maXhlcyBicmFuY2ggd2lsbCB0aGVuIGJl
IHNlbnQgdmlhIGEgZm9ybWFsIFB1bGwgUmVxdWVzdCB0byB0aGUgTGludXggU29DIG1haW50YWlu
ZXJzCj4gZm9yIGluY2x1c2lvbiBpbiB0aGVpciBpbnRlcm1lZGlhdGUgZ2l0IGJyYW5jaGVzIGlu
IG9yZGVyIHRvIGJlIHNlbnQgdG8gTGludXMgZHVyaW5nCj4gdGhlIG5leHQgbWVyZ2Ugd2luZG93
LCBvciBzb29uZXIgaWYgaXQncyBhIHNldCBvZiBmaXhlcy4KPgo+IEluIHRoZSBjYXNlcyBvZiBm
aXhlcywgdGhvc2Ugd2lsbCBiZSBtZXJnZWQgaW4gdGhlIGN1cnJlbnQgcmVsZWFzZSBjYW5kaWRh
dGUKPiBrZXJuZWwgYW5kIGFzIHNvb24gdGhleSBhcHBlYXIgb24gdGhlIExpbnV4IG1hc3RlciBi
cmFuY2ggdGhleSB3aWxsIGJlCj4gYmFja3BvcnRlZCB0byB0aGUgcHJldmlvdXMgU3RhYmxlIGFu
ZCBMb25nLVN0YWJsZSBrZXJuZWxzIFsyXS4KPgo+IFRoZSBpbnRlcm1lZGlhdGUgZ2l0IGJyYW5j
aGVzIGFyZSBtZXJnZWQgZGFpbHkgaW4gdGhlIGxpbnV4LW5leHQgdHJlZSBbM10sCj4gcGVvcGxl
IGFyZSBlbmNvdXJhZ2VkIHRlc3RpbmcgdGhlc2UgcHJlLXJlbGVhc2Uga2VybmVscyBhbmQgcmVw
b3J0IGlzc3VlcyBvbiB0aGUKPiByZWxldmFudCBtYWlsaW5nLWxpc3RzLgo+Cj4gSWYgcHJvYmxl
bXMgYXJlIGRpc2NvdmVyZWQgb24gdGhvc2UgY2hhbmdlcywgcGxlYXNlIHN1Ym1pdCBhIHNpZ25l
ZC1vZmYtYnkgcmV2ZXJ0Cj4gcGF0Y2ggZm9sbG93ZWQgYnkgYSBjb3JyZWN0aXZlIGNoYW5nZXNl
dC4KPgo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9hbWxvZ2ljL2xpbnV4LmdpdAo+IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0Cj4gWzNdIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQKPgo+IC0t
Cj4gTmVpbAo+CkhpLApQbGVhc2UgZG9uJ3QgdGFrZSB0aGlzLiBJIHdpbGwgc3VibWl0IGEgYmV0
dGVyIHZlcnNpb24uCnN5c19hbXBpcGVfbmFuZCBzaG91bGQgbm90IGJlIGNyaXRpY2FsLgoKVGhh
bmtzLApMdWNhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
