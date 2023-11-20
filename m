Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9D9C5AD4C
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Nov 2023 19:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryBIl+px2tbuBPQDgWy/2CQkBqKzcOBiW2HMe9M2xfE=; b=ZRvydAhOWoZP7P
	V1kOxgr7G1Ma6g+r4PG58lBsJgyCNYpQ7CyEcZcd0Lin+SE9KjckZWVRFRi+dyVWpxKEy2Mvlu8vt
	d+kuNktJZoGrO1gVnFZmOXirFwy9jkdwzPYeTB57p3shc3ybCPzhZ2YTukoZ5W5SIYPLRstjgeiU9
	gh+rvVWi5Ao20+4atNSdjIxSbdBObiBMn6Do89Ka4+S5kSUmy8ua4j4EpgYMtgHwQVLWw6PpXjSSC
	WVRShXzv5Kws1WSLAZEbFtgNrkPRUDT9RzCCAvgX2PPtk/ZY0C7MQSkei3k6xSc9nfyS46UPppOu9
	2Sx73ytYudCKgjMv9xUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r59nX-00Egjp-21;
	Mon, 20 Nov 2023 19:19:07 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r59nQ-00Egge-1c;
	Mon, 20 Nov 2023 19:19:02 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5ca11922cedso16326567b3.2;
        Mon, 20 Nov 2023 11:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700507937; x=1701112737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GifO7/JOpk0NmY1mNUiYBsJ2MaEkt42xKaLVw+ulB/A=;
        b=PRPfnSWI1yEdUehiO6BZH3ijLjAc5nxhKrdQQwEt02y4LeO+giTr8C44JovJw8rVHW
         qKyVn4hkpQ5fGjsMNXTlF4+5rSpneVnWOn29P1VJh4s6mMabgTr++YpLeMtxC4AiLG1C
         o+jXD3COAADC7ZY4mImPXMrWGuzYwNjGASRalLeNLzOU/B1kNgSJKDotqo81we++7P11
         1xp2nyO92tauSPHH72vlvKWTHxhJlqmaMHdfJWqSs/5R2rJaMu7zNNyJa+RZPGeHDys5
         aW7dTkpJ/CH5C4x9/h8bH4F/U6MVHn99mXxfL79dNqKr+dNH7dRfHeZYHo4Pd2ecTQ1L
         jvzg==
X-Gm-Message-State: AOJu0YxPthwNQOPp1zohn/K5oIQZgcLWQKmz/4eP6/NY62/ryWVV8Jsb
	4NCLD4gCLyyKjD9RvuUKYlYtF9Y0L0p83A==
X-Google-Smtp-Source: AGHT+IFU+oM9Aq/hDuXaXPs1gcio5Qe4CnDMNKqdnjyaduuH/+TIocMvVTCgjuEKNUyojhr4rStrVw==
X-Received: by 2002:a81:9a8d:0:b0:5ca:7b75:4ecd with SMTP id r135-20020a819a8d000000b005ca7b754ecdmr3667595ywg.22.1700507937232;
        Mon, 20 Nov 2023 11:18:57 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id q126-20020a815c84000000b005a7c829dda2sm2516045ywb.84.2023.11.20.11.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 11:18:55 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-db3a09e96daso1190784276.3;
        Mon, 20 Nov 2023 11:18:54 -0800 (PST)
X-Received: by 2002:a5b:f4a:0:b0:da0:c49a:5103 with SMTP id
 y10-20020a5b0f4a000000b00da0c49a5103mr7300082ybr.47.1700507934171; Mon, 20
 Nov 2023 11:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com> <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
In-Reply-To: <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Nov 2023 20:18:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4WPJT0Km7w8RWrGJaztk6QDGoFAn0bdGbrEsw81R1FA@mail.gmail.com>
Message-ID: <CAMuHMdW4WPJT0Km7w8RWrGJaztk6QDGoFAn0bdGbrEsw81R1FA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_111900_537236_9A71B0C1 
X-CRM114-Status: GOOD (  24.71  )
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

SGkgS3J6eXN6dG9mLAoKT24gTW9uLCBOb3YgMjAsIDIwMjMgYXQgMzo1M+KAr1BNIEtyenlzenRv
ZiBLb3psb3dza2kKPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24g
MjAvMTEvMjAyMyAxNTowMSwgTWljaGFsIFNpbWVrIHdyb3RlOj4gPgo+ID4gT24gMTEvMjAvMjMg
MDk6NDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPj4gRG9jdW1lbnQgcHJlZmVycmVk
IGNvZGluZyBzdHlsZSBmb3IgRGV2aWNldHJlZSBzb3VyY2VzIChEVFMgYW5kIERUU0kpLAo+ID4+
IHRvIGJyaW5nIGNvbnNpc3RlbmN5IGFtb25nIGFsbCAoc3ViKWFyY2hpdGVjdHVyZXMgYW5kIGVh
c2UgaW4gcmV2aWV3cy4KCj4gPj4gK09yZ2FuaXppbmcgRFRTSSBhbmQgRFRTCj4gPj4gKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gPj4gKwo+ID4+ICtUaGUgRFRTSSBhbmQgRFRTIGZpbGVzIHNo
b3VsZCBiZSBvcmdhbml6ZWQgaW4gYSB3YXkgcmVwcmVzZW50aW5nIHRoZSBjb21tb24KPiA+PiAr
KGFuZCByZS11c2FibGUpIHBhcnRzIG9mIHRoZSBoYXJkd2FyZS4gIFR5cGljYWxseSB0aGlzIG1l
YW5zIG9yZ2FuaXppbmcgRFRTSQo+ID4+ICthbmQgRFRTIGZpbGVzIGludG8gc2V2ZXJhbCBmaWxl
czoKPiA+PiArCj4gPj4gKzEuIERUU0kgd2l0aCBjb250ZW50cyBvZiB0aGUgZW50aXJlIFNvQyAo
d2l0aG91dCBub2RlcyBmb3IgaGFyZHdhcmUgbm90IHByZXNlbnQKPiA+PiArICAgb24gdGhlIFNv
QykuCj4gPj4gKzIuIElmIGFwcGxpY2FibGU6IERUU0kgd2l0aCBjb21tb24gb3IgcmUtdXNhYmxl
IHBhcnRzIG9mIHRoZSBoYXJkd2FyZSAoZS5nLgo+ID4+ICsgICBlbnRpcmUgU3lzdGVtLW9uLU1v
ZHVsZSkuCj4gPgo+ID4gRFRTL0RUU0kgLSBTT01zIGNhbiBhY3R1YWxseSBydW4gYXMgdGhleSBh
cmUgdGhhdCdzIHdoeSBpdCBpcyBmYWlyIHRvIHNheSB0aGF0Cj4gPiB0aGVyZSBkb2Vzbid0IG5l
ZWQgdG8gYmUgRFRTIHJlcHJlc2VudGluZyB0aGUgYm9hcmQuCj4KPiBJIGhhdmUgbmV2ZXIgc2Vl
biBhIFNvTSB3aGljaCBjYW4gcnVuIHdpdGhvdXQgZWxhYm9yYXRlIGhhcmR3YXJlLWhhY2tpbmcK
PiAoZS5nLiBjb25uZWN0aW5nIG11bHRpcGxlIHdpcmVzIHRvIHRoZSBTb00gcGlucykuIFRoZSBk
ZWZpbml0aW9uIG9mIHRoZQo+IFNvTSBpcyB0aGF0IGl0IGlzIGEgbW9kdWxlLiBNb2R1bGUgY2Fu
IGJlIHJlLXVzZWQsIGp1c3QgbGlrZSBTb0MuCgovbWUgbG9va3MgYXQgaGlzIGJvYXJkIGZhcm0u
Li4KClRoZSBSZW5lc2FzIFdoaXRlLUhhd2sgQ1BVIGJvYXJkIGNhbiBiZSB1c2VkIHN0YW5kYWxv
bmUsIGFuZCBoYXMgYQpzZXBhcmF0ZSBwb3dlciBpbnB1dCBjb25uZWN0b3IgZm9yIHRoaXMgb3Bl
cmF0aW9uIG1vZGUuICBBcyBpdCBoYXMgUkFNLApFdGhlcm5ldCwgc2VyaWFsIGNvbnNvbGUsIGVN
TUMsIGFuZCBldmVuIG1pbmktRFAsIGl0IGNhbiBzZXJ2ZSB1c2VmdWwKcHVycG9zZXMgb24gaXRz
IG93bi4KSSBhZ3JlZSBpdCdzIG5vdCBhIHN1cGVyLWdvb2QgZXhhbXBsZSwgYXMgdGhlIGJvYXJk
IGlzIG5vdCByZWFsbHkgYQoiU29NIiwgYW5kIHdlIGN1cnJlbnRseSBkb24ndCBoYXZlIHI4YTc3
OWcwLXdoaXRlLWhhd2stY3B1LmR0cywgb25seQpyOGE3NzlnMC13aGl0ZS1oYXdrLWNwdS5kdHNp
LgoKVGhlIFJaL0EyTSBDUFUgQm9hcmQgaXMgYSByZWFsIFNvTSwgd2hpY2ggY2FuIGJlIHBvd2Vy
ZWQgb3ZlciBVU0IuCkl0IGhhcyBsZXNzIHN0YW5kYXJkIGNvbm5lY3RvcnMgKG1pY3JvU0QsIFVT
QiwgTUlQSSBDU0ktMiksIGJ1dCBzdGlsbApzdWZmaWNpZW50IGZlYXR1cmVzIHRvIGJlIHVzYWJs
ZSBvbiBpdHMgb3duLgpBZ2Fpbiwgd2UncmUgZG9pbmcgYSBiYWQgam9iLCBhcyB3ZSBvbmx5IGhh
dmUgYSBEVFMgZm9yIHRoZSBmdWxsIGV2YWwKYm9hcmQgKHI3czkyMTAtcnphMm1ldmIuZHRzKS4K
CkkgZ3Vlc3MgdGhlcmUgYXJlIChtYW55KSBvdGhlciBleGFtcGxlcy4uLgoKR3J7b2V0amUsZWV0
aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhv
ZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgt
bTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFs
aXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
