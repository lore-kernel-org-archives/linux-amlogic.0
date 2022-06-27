Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A3FC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jun 2022 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzoOt6U7BzVmryfcBt5d3IBnRgX2vtNQdZ3RdHcDxXo=; b=NyorewCqI2ZUrR
	twwbvLRd6frQ6dyPNOKdBUYnKPlLVoZl9f+ISubOdcZvXScdnZp2q8FS3RnscEuxzrDlPcU9qft2d
	RYA7kh7SbU8wIALTzrQBUgR3xwaIc/913KWxXnhOI90ILNiB54hQaT9TEk64lCPWAekVBqphPj8UP
	1eXlNO/WOue2t+ez+sELQD1qjp6rGmy8oTV9faU7HGAnWmdLPjFKRgEz9oEwffMHfhbEKm3IDJDWX
	JcsgeskzAf+zEOIPiHeT1/bGp0b6H+ewu9EB5KrDkXUit81UFgtNYcmCwcPN3HqzJwgah4e8xjodo
	ovZlV9Wyu7rJcK9yoeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lFs-00HPP5-5F; Mon, 27 Jun 2022 09:42:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lFc-00HPHl-8o
	for linux-amlogic@lists.infradead.org; Mon, 27 Jun 2022 09:41:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id m6-20020a05600c3b0600b003a0489f412cso1094786wms.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Jun 2022 02:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=tiI5Suow9+IGtf6vNUskcYFcKYyGg2q+eL/GX5BhL34=;
        b=qOo7SDWr4jepKHQ6CdytT7QoufwuInc8GXWvJoC4MdHjyQdyPd3tKtqZK8tY4qwn+2
         xP9JyOxVO8Uo6NckukjCihQLXAUeE73i0bJsSsIsPBX1AxbD/QONjwMjMQ+0u82SSEGO
         FX25E79rrBulTJI8uR6KJiVLax0OhmijMcm8L95DtSflUDsxB/pezhajBNCB+5lO97n8
         Ar/iAHpblpUfQvtXhHXIf+hRlbUx7awbXnqprrlL2/qYDdkDX7ssS9wI5sG9GDwiQIzH
         /5Hxl/UkN8ENGlF74f483/aP+AlNjTreJPpJtAW42lbdTyrKfG4y2MNZ6rNh9TvYnN1J
         YxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=tiI5Suow9+IGtf6vNUskcYFcKYyGg2q+eL/GX5BhL34=;
        b=2WxNDr1lKjRgrlnTh8uU3rgDK/aAajCM/jZ7KOjVe3lCrz/C/2Z1tvlYZMyiS9AMfE
         RSXctgRl5oBvEhLiDoSPr5GEfT5w5j6hYv40amDYahWjuJdBRchm9gUmGXnxoOJRQ4Sx
         uZbUn1tfh+grPjrefp9nAcDkvw1lwcznZWzJdofDBdA8BlneVGJFirathA20PLkA2RFn
         4EbSckumXHNa200g1PUz+WpuHzLUi3B+ecEz3YiNbL9/qIlZ5Uo0nHj9km0rJOw2pc4m
         e4xFJsSLSl+JEgEGRjvUBHQ4z4RvJrZ+TbTw3w/qb0uUk1h3wZ8OAHU48G9FP4AiXEkA
         92lA==
X-Gm-Message-State: AJIora/JuGODdQ6eT+OSe2VZBI4qfYroN0H0RD85HaTzo3vz226L0fiA
	jShmL1LrbFJVockL1SS/TmPt8A==
X-Google-Smtp-Source: AGRyM1sphSeaef4wiCHZVmk12eLndmvwJJ3yA/cjWUmw9Vpe4DwrqlSPck0VuScvWyVri2J3YA98VA==
X-Received: by 2002:a1c:4e1a:0:b0:3a0:3b9a:24f3 with SMTP id g26-20020a1c4e1a000000b003a03b9a24f3mr14440442wmh.156.1656322904525;
        Mon, 27 Jun 2022 02:41:44 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c? ([2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b00397122e63b6sm12688559wmq.29.2022.06.27.02.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 02:41:44 -0700 (PDT)
Message-ID: <11a93076-e9bb-c9b0-08c6-aaa268639d97@baylibre.com>
Date: Mon, 27 Jun 2022 11:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: VIM/S905x: Unable to handle kernel NULL pointer dereference at
 virtual address 0000000000000038
Content-Language: en-US
To: =?UTF-8?B?5bygIOWugQ==?= <zhangn1985@outlook.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Cc: "zhang1985@outlook.com" <zhang1985@outlook.com>
References: <OS0P286MB064100964669BC707C8DDE67CDB79@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <OS0P286MB064100964669BC707C8DDE67CDB79@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_024148_570320_22D4D207 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

SGksDQoNCk9uIDI2LzA2LzIwMjIgMDE6NDMsIOW8oCDlroEgd3JvdGU6DQo+IGhpLCBtYWludGFp
bmVycw0KPiANCj4gZG9tYWluLTAgaW5pdCBkdmZzOiBbICAgIDguNzk1MzgxXSBVbmFibGUgdG8g
aGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNz
IDAwMDAwMDAwMDAwMDAwMzgNCj4gWyAgICA4Ljc5ODc2MV0gTWVtIGFib3J0IGluZm86DQo+IFsg
ICAgOC44MDE0NzNdICAgRVNSID0gMHg5NjAwMDAwNA0KPiBbICAgIDguODA0NDY2XSAgIEVDID0g
MHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cw0KPiBbICAgIDguODA5NzYwXSAg
IFNFVCA9IDAsIEZuViA9IDANCj4gWyAgICA4LjgxMjc3Ml0gICBFQSA9IDAsIFMxUFRXID0gMA0K
PiBbICAgIDguODE1ODMxXSAgIEZTQyA9IDB4MDQ6IGxldmVsIDAgdHJhbnNsYXRpb24gZmF1bHQN
Cj4gWyAgICA4LjgyMDcwMF0gRGF0YSBhYm9ydCBpbmZvOg0KPiBbICAgIDguODIzNTA4XSAgIElT
ViA9IDAsIElTUyA9IDB4MDAwMDAwMDQNCj4gWyAgICA4LjgyNzMzMl0gICBDTSA9IDAsIFduUiA9
IDANCj4gWyAgICA4LjgzMDI2OV0gdXNlciBwZ3RhYmxlOiA0ayBwYWdlcywgNDgtYml0IFZBcywg
cGdkcD0wMDAwMDAwMDdkMzU1MDAwDQo+IFsgICAgOC44MzY2NTFdIFswMDAwMDAwMDAwMDAwMDM4
XSBwZ2Q9MDAwMDAwMDAwMDAwMDAwMCwgcDRkPTAwMDAwMDAwMDAwMDAwMDANCj4gWyAgICA4Ljg0
MzM3OF0gSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDk2MDAwMDA0IFsjMV0gU01QDQo+IFsgICAgOC44
NDgxNzldIE1vZHVsZXMgbGlua2VkIGluOiBzY3BpX2h3bW9uKCspIGNsa19zY3BpKCspIGV2ZGV2
IHNoYTUxMl9nZW5lcmljIHNoYTUxMl9hcm02NCBnaGFzaF9jZSBnZjEyOG11bCBkcmJnIHNoYTJf
Y2UgZ292ZXJub3Jfc2ltcGxlb25kZW1hbmQgc2hhMjU2X2FybTY0IGFuc2lfY3BybmcgbWVzb25f
ZHJtIHNoYTFfY2UgaXJfbmVjX2RlY29kZXIgbGltYSBncHVfc2NoZWQgYWVzX25lb25fYnMgc25k
X3NvY19tZXNvbl9neF9zb3VuZF9jYXJkIHNuZF9zb2NfbWVzb25fYWl1IHNuZF9zb2NfbWVzb25f
Y2FyZF91dGlscyBkcm1fc2htZW1faGVscGVyIGRybV9jbWFfaGVscGVyIHNuZF9zb2NfbWVzb25f
Y29kZWNfZ2x1ZSBzbmRfc29jX2NvcmUgZWNkaF9nZW5lcmljKCspIHJma2lsbCBlY2MgcmNfa2hh
ZGFzIGFlc19uZW9uX2JsayBwbGF0Zm9ybV9taHUgc25kX3BjbV9kbWFlbmdpbmUgbWVzb25fZHdf
aGRtaSBtZXNvbl9jYW52YXMgbWVzb25faXIgc3VucnBjIG1lc29uX3JuZyBzbmRfcGNtIHJuZ19j
b3JlIGR3X2hkbWkgY2VjIHNuZF90aW1lciBhZXNfY2VfYmxrIHJjX2NvcmUgYWVzX2NlX2NpcGhl
ciBzbmQgYW1sb2dpY19neGxfY3J5cHRvIG1lc29uX3NhcmFkYyBzb3VuZGNvcmUgcHdtX21lc29u
IG1lc29uX2d4YmJfd2R0IGNyeXB0b19lbmdpbmUgbnZtZW1fbWVzb25fZWZ1c2UgZGlzcGxheV9j
b25uZWN0b3IgbGVkc19wd20gZHJtX2ttc19oZWxwZXIgYmluZm10X21pc2MgZHJtIGZ1c2UgY29u
ZmlnZnMgaXBfdGFibGVzIHhfdGFibGVzIGF1dG9mczQgZXh0NCBjcmMxNiBtYmNhY2hlIGpiZDIg
Y3JjMzJjX2dlbmVyaWMgbWVzb25fZ3hsIHhoY2lfcGxhdF9oY2QgZHdtYWNfZ2VuZXJpYyB4aGNp
X2hjZCBkd21hY19tZXNvbjhiIHN0bW1hY19wbGF0Zm9ybSBzdG1tYWMgZHdjMiBkd2MzIHBjc194
cGNzIHBoeWxpbmsgdWRjX2NvcmUgbWRpb19tdXhfbW1pb3JlZyBtZGlvX211eCB1c2Jjb3JlIHVs
cGkgb2ZfbWRpbyBmaXhlZF9waHkNCj4gWyAgICA4Ljg0ODQ1M10gIGZ3bm9kZV9tZGlvIHB0cCBs
aWJwaHkgcHBzX2NvcmUgbWVzb25fZ3hfbW1jIGR3YzNfbWVzb25fZzEyYSBjcmN0MTBkaWZfY2Ug
Y3JjdDEwZGlmX2NvbW1vbiBjbGtfcHdtIHJvbGVzIHVzYl9jb21tb24gcnRjX21lc29uX3ZydGMg
aTJjX21lc29uIGFybV9zY3BpIGZpeGVkIGFkY19rZXlzIGluZHVzdHJpYWxpbw0KPiBbICAgIDgu
OTUxMTY3XSBDUFU6IDMgUElEOiAyNjAgQ29tbTogc3lzdGVtZC11ZGV2ZCBOb3QgdGFpbnRlZCA1
LjE4LjAtMi1hcm02NCAjMSAgRGViaWFuIDUuMTguNS0xDQo+IFsgICAgOC45NTk2OThdIEhhcmR3
YXJlIG5hbWU6IEtoYWRhcyBWSU0gKERUKQ0KPiBbICAgIDguOTYzNzUwXSBwc3RhdGU6IDYwMDAw
MDA1IChuWkN2IGRhaWYgLVBBTiAtVUFPIC1UQ08gLURJVCAtU1NCUyBCVFlQRT0tLSkNCj4gWyAg
ICA4Ljk3MDY0OV0gcGMgOiBzY3BpX2R2ZnNfcmVjYWxjX3JhdGUrMHg0Yy8weDZjIFtjbGtfc2Nw
aV0NCj4gWyAgICA4Ljk3NjE2OV0gbHIgOiBfX2Nsa19yZWdpc3RlcisweDRiMC8weDg0NA0KPiBb
ICAgIDguOTgwMzA4XSBzcCA6IGZmZmY4MDAwMDg1MzM3OTANCj4gWyAgICA4Ljk4MzU4NV0geDI5
OiBmZmZmODAwMDA4NTMzNzkwIHgyODogZmZmZmFjNzJkZjMyYjA2MCB4Mjc6IDAwMDAwMDAwMDAw
MDAwMDANCj4gWyAgICA4Ljk5MDY1OV0geDI2OiBmZmZmNmUwMjRjMWNlYTg4IHgyNTogMDAwMDAw
MDAwMDAwMDAwMCB4MjQ6IGZmZmY2ZTAyYmZiZTk2YjANCj4gWyAgICA4Ljk5NzczMl0geDIzOiBm
ZmZmNmUwMjRjMWNlYTg4IHgyMjogZmZmZjZlMDI0MzU0YWU4MCB4MjE6IDAwMDAwMDAwMDAwMDAw
MDANCj4gWyAgICA5LjAwNDgwNF0geDIwOiBmZmZmNmUwMjQzNTRhMTgwIHgxOTogZmZmZjZlMDI0
YzEzMTIwMCB4MTg6IGZmZmZmZmZmZmZmZmZmZmYNCj4gWyAgICA5LjAxMTg3Nl0geDE3OiAwMDAw
MDAwMDBmOWY1YWIyIHgxNjogZmZmZmFjNzM0ZmEwNjMwMCB4MTU6IDAwMDAwMDAwMDAwM2ZlMDAN
Cj4gWyAgICA5LjAxODk0OV0geDE0OiAwMDAwMDAwMDAwMDNiMDAwIHgxMzogMDAwMDAwMDAwMDAw
MDAwMCB4MTI6IGZmZmZhYzczNGZjOTY0NDANCj4gWyAgICA5LjAyNjAyMl0geDExOiBmZmZmYWM3
MzUwODJlYmEwIHgxMDogZmZmZmMxOGVmMzgxNTI3OCB4OSA6IGZmZmZhYzcyZGVkMjg4OTANCj4g
WyAgICA5LjAzMzA5NF0geDggOiAwMTAxMDEwMTAxMDEwMTAxIHg3IDogZmZmZmMxOGY2ZjdiNzAw
MCB4NiA6IDAwMDAwMDAwMWEzMjc5MTQNCj4gWyAgICA5LjA0MDE2Nl0geDUgOiAwMGZmZmZmZmZm
ZmZmZmZmIHg0IDogMDAwMDAwMDAwMDAwMDAwMCB4MyA6IDAwMDAwMDAwMDAwMDAwMDANCj4gWyAg
ICA5LjA0NzIzOV0geDIgOiAwMDAwMDAwMDAwMDAwMDAwIHgxIDogMDAwMDAwMDAwMDAwMDAxMCB4
MCA6IDAwMDAwMDAwMDAwMDAwMjgNCj4gWyAgICA5LjA1NDMxM10gQ2FsbCB0cmFjZToNCj4gWyAg
ICA5LjA1NjcyNV0gIHNjcGlfZHZmc19yZWNhbGNfcmF0ZSsweDRjLzB4NmMgW2Nsa19zY3BpXQ0K
PiBbICAgIDkuMDYxOTAyXSAgZGV2bV9jbGtfaHdfcmVnaXN0ZXIrMHg2OC8weGU0DQo+IFsgICAg
OS4wNjYwNDFdICBzY3BpX2Nsb2Nrc19wcm9iZSsweDFkOC8weDNmNCBbY2xrX3NjcGldDQo+IFsg
ICAgOS4wNzEwNDRdICBwbGF0Zm9ybV9wcm9iZSsweDc0LzB4ZjANCj4gWyAgICA5LjA3NDY2NV0g
IHJlYWxseV9wcm9iZSsweDE4NC8weDNkMA0KPiBbICAgIDkuMDc4Mjg4XSAgX19kcml2ZXJfcHJv
YmVfZGV2aWNlKzB4MTFjLzB4MTkwDQo+IFsgICAgOS4wODI2ODddICBkcml2ZXJfcHJvYmVfZGV2
aWNlKzB4NDQvMHhmNA0KPiBbICAgIDkuMDg2NzQxXSAgX19kcml2ZXJfYXR0YWNoKzB4ZDgvMHgx
ZjANCj4gWyAgICA5LjA5MDUzNl0gIGJ1c19mb3JfZWFjaF9kZXYrMHg3Yy8weGUwDQo+IFsgICAg
OS4wOTQzMzBdICBkcml2ZXJfYXR0YWNoKzB4MzAvMHg0MA0KPiBbICAgIDkuMDk3ODY2XSAgYnVz
X2FkZF9kcml2ZXIrMHgxNTQvMHgyNDANCj4gWyAgICA5LjEwMTY2Ml0gIGRyaXZlcl9yZWdpc3Rl
cisweDg0LzB4MTQwDQo+IFsgICAgOS4xMDU0NTddICBfX3BsYXRmb3JtX2RyaXZlcl9yZWdpc3Rl
cisweDM0LzB4NDANCj4gWyAgICA5LjExMDExNF0gIHNjcGlfY2xvY2tzX2RyaXZlcl9pbml0KzB4
MmMvMHgxMDAwIFtjbGtfc2NwaV0NCj4gWyAgICA5LjExNTYzNV0gIGRvX29uZV9pbml0Y2FsbCsw
eDUwLzB4MjQwDQo+IFsgICAgOS4xMTk0MjldICBkb19pbml0X21vZHVsZSsweDUwLzB4MjYwDQo+
IFsgICAgOS4xMjMxMzhdICBsb2FkX21vZHVsZSsweDIzYTgvMHgyODAwDQo+IFsgICAgOS4xMjY4
NDddICBfX2RvX3N5c19maW5pdF9tb2R1bGUrMHhhYy8weDEzMA0KPiBbICAgIDkuMTMxMTYwXSAg
X19hcm02NF9zeXNfZmluaXRfbW9kdWxlKzB4MmMvMHg0MA0KPiBbICAgIDkuMTM1NjQ1XSAgaW52
b2tlX3N5c2NhbGwrMHg1MC8weDEyMA0KPiBbICAgIDkuMTM5MzUzXSAgZWwwX3N2Y19jb21tb24u
Y29uc3Rwcm9wLjArMHhkYy8weDEwMA0KPiBbICAgIDkuMTQ0MDk3XSAgZG9fZWwwX3N2YysweDM0
LzB4YTANCj4gWyAgICA5LjE0NzM3NF0gIGVsMF9zdmMrMHgzYy8weDEwMA0KPiBbICAgIDkuMTUw
NDc5XSAgZWwwdF82NF9zeW5jX2hhbmRsZXIrMHhhNC8weDEzMA0KPiBbICAgIDkuMTU0NzA2XSAg
ZWwwdF82NF9zeW5jKzB4MThjLzB4MTkwDQo+IFsgICAgOS4xNTgzMzNdIENvZGU6IGY5NDAwYmYz
IGY5NDAwNDIxIGE4YzI3YmZkIGQ1MDMyM2JmIChiODYwNjgyMCkNCj4gWyAgICA5LjE2NDM3MF0g
LS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+IA0KPiBrZXJuZWw6DQo+IHVu
YW1lIC1hDQo+IExpbnV4IFZJTSA1LjE4LjAtMi1hcm02NCAjMSBTTVAgRGViaWFuIDUuMTguNS0x
ICgyMDIyLTA2LTE2KSBhYXJjaDY0IEdOVS9MaW51eA0KPiANCj4gZHRibzoNCj4gDQo+IC9kdHMt
djEvOw0KPiAvcGx1Z2luLzsNCj4gLyB7DQo+ICAgICAgZnJhZ21lbnRAMCB7DQo+ICAgICAgICAg
IHRhcmdldC1wYXRoID0gIi9yZXNlcnZlZC1tZW1vcnkvbGludXgsY21hIjsNCj4gICAgICAgICAg
X19vdmVybGF5X18gew0KPiAgICAgICAgICAgICAgc2l6ZSA9IDwweDAgMHgzODAwMDAwMD47DQo+
ICAgICAgICAgIH07DQo+ICAgICAgfTsNCj4gICAgICBmcmFnbWVudEAxIHsNCj4gICAgICAgICAg
dGFyZ2V0LXBhdGggPSAiL3NvYy9idXNAYzgxMDAwMDAiOw0KPiAgICAgICAgICBfX292ZXJsYXlf
XyB7DQo+ICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gICAgICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDI+Ow0KPiAgICAgICAgICAgICAgcnRjQGE4IHsNCj4gICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tdnJ0YyI7DQo+ICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MCAweDAwMGE4IDB4MCAweDQ+Ow0KPiAgICAgICAgICAgICAgfTsNCj4g
ICAgICAgICAgfTsNCj4gICAgICB9Ow0KPiB9Ow0KPiANCj4gaXQncyBub3QgMTAwJSBjcmFzaC4g
YWJvdXQgMS8zIG9yIGxlc3MuDQo+IA0KDQpUaGlzIGhhcHBlbnMgb24gdGhvc2Ugb2xkIHBsYXRm
b3JtcyB3aGVuIFNDUEkgZHJpdmVycyBhcmVuJ3QgYnVpbHQgaW4gdGhlIGtlcm5lbCwNCnRyeSB0
byBtb3ZlIHRoZW0gYnVpbHQtaW4uDQoNCk5laWwNCg0KPiANCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QNCj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYw0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
