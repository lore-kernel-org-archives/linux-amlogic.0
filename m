Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34368CD1292
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 17:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynA+JrTI2QAsXUv9HCntkxdQM/IcUj5ygmtoGiFZYGM=; b=AdGycLQF15lhf7
	toT6WMtkoGjc4huZIVc4hR67Be0ur+RKtURwN7GOmoawLX8Z/WvneLiqFyeY0TxX1wTObKAsL5kDR
	fLK4Tg1h6vwgVLhl1Toxyrzb1YZs6ZmP6gGEiunZ5jA8yAbOIljiIqKB3HAPGfiynJBXHxFyqnPkC
	HowYuifMPro7clgNC+bQxGz/uuCDw7kPVEFMnpDnxbltKKApzbZRLAORQ2+k3VXqYx0wXrblt+lBM
	HUy0NnBx4jnY+eOt4Boy+fDnfrHMHYJZ6ppQVHfS9MpAonwOuTPj2sl3JZumPiyQ/59Z+o7vtT2Pb
	YHISHHZ2ipoq3fVxkMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsmL-0000000GLTj-2s1s;
	Mon, 08 Apr 2024 17:27:33 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsmG-0000000GLRo-3RYl;
	Mon, 08 Apr 2024 17:27:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e3f17c64daso12001675ad.3;
        Mon, 08 Apr 2024 10:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1712597247; x=1713202047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOjeDfz9E4F+jzvWRXwUZXbYmoM8nTnojNtQIe47BUs=;
        b=Ey2tgTS3H8DA8MMCFOmgjC5kE9sLFYzAU8P/c1BZXs90R4sCCG7/+ZeywHkIwXGHDD
         StBBvDfeirLQ/eWeBViPwPu9NySjHX8bQUflumKtt5Qj/5UxQl3DWk2I1GpTG8qXdNRx
         +p0tuj6b9E7qxzEPillXKrYR5RjctA0HCuQAsU2t71UaGQM1lPxHQ5kzADi8O+lz6fPj
         MnS7kPpIopXUeC42XrVE6olMnIG8t/nBfODn8jWq1TdYMxRlnELeazT2g7qtn8cxHm2S
         1a+DJN+MGVVLl1hzzipzfAmDGtKjA1HXQJoxCM1bNCITha1c9138E+4hmFJRg6CumycH
         lhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712597247; x=1713202047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOjeDfz9E4F+jzvWRXwUZXbYmoM8nTnojNtQIe47BUs=;
        b=AWcnVu+dYx+rnzNCq3cMEbtHqOILukIBzPLcYSZYbJetNKOkP06dVOcN09eEditJ3L
         GWlGnUJ2hW7MtCwABnUT+mN7s7BUUDlQxdMo1MTKpLEiOkvA6w4magr5JNkeSoAh4dxC
         TzwHbk3g/ct10Yk6XyrvK0foOJ+5OuCnCHChYZ+60B3Q8sMoNK0fzFIIiT2YpOXUOby4
         0giLCtivRRCPZ2P2tT4Rxr+WJ7zypvibElQJr7aZNMaG5GBxh9fn0kiWcp6DSdaLxaPu
         qf/fRree2BFQEWUPlJs/UPcnD1a/3GPKTzaheCpfg2AEYxmGo0JU13L5it5TbwM2kp6L
         eCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcZmZyr/OQKeeLNqu91cdtFZweTF0rAr56gfJ8tLG2T+ZlT622es+/r2CytNnpZD/nHREKE6rF2VmmrQLxhcdLKH61F6OOYAVssIXCvTbR8dNYYQPb41z1U9O4v2arDu1l3vULjozgHgslviPvTt7XcDwM5haTIg==
X-Gm-Message-State: AOJu0YyDIGQyERIsMohlj906jSrml3vtOM1CKsB4PxR468W12HcjW7vd
	C/IDNgK5trJv0XYJpxkEF5D/xfxG4oY6Smbg5Ez3/dX43I2hXxs3pii4Tn/wpxTXPuuvRxqFq1r
	QaDDToQELgVyvI6FBuSIemFd6UXU=
X-Google-Smtp-Source: AGHT+IF8o23by08vrZR2GEbNpBf73nw0zhurJP4dptDChRyKgoq8H4Ozt0jNcKGtNTZll6pvAIltKtH5CZD77UZgbDw=
X-Received: by 2002:a17:902:c946:b0:1e4:24bc:48e with SMTP id
 i6-20020a170902c94600b001e424bc048emr3348565pla.22.1712597247611; Mon, 08 Apr
 2024 10:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240408-fix-secpwr-s4-v1-1-01aa7ee72c52@amlogic.com>
In-Reply-To: <20240408-fix-secpwr-s4-v1-1-01aa7ee72c52@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 Apr 2024 19:27:15 +0200
Message-ID: <CAFBinCD=xWuhoX9cWcKU3bSGcsDShKbxnMVTdyfD84AFZQn8aw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: fix S4 power-controller node
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_102728_918532_8AD37311 
X-CRM114-Status: GOOD (  16.90  )
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

T24gTW9uLCBBcHIgOCwgMjAyNCBhdCA1OjI24oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxh
eQo8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4K
PiBGcm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPgo+IFRoZSBw
b3dlci1jb250cm9sbGVyIG1vZHVsZSB3b3JrcyB3ZWxsIGJ5IGFkZGluZyBpdHMgcGFyZW50Cj4g
bm9kZSBzZWN1cmUtbW9uaXRvci4KPgoKUGxlYXNlIGFkZCBhIEZpeGVzIHRhZyBoZXJlIHdpdGgg
dGhlIG9yaWdpbmFsIGNvbW1pdCB3aGVyZSB0aGUKaW5jb3JyZWN0bHkgcGxhY2VkIG5vZGUgd2Fz
IGFkZGVkLgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9n
aWMuY29tPgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRz
aSB8IDExICsrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLXM0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRz
aQo+IGluZGV4IGNlOTBiMzU2ODZhMi4uMjRkMDBkY2U0OTY5IDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPiBAQCAtNjUsMTAgKzY1LDEzIEBAIHh0YWw6
IHh0YWwtY2xrIHsKPiAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICAgICAg
ICAgfTsKPgo+IC0gICAgICAgcHdyYzogcG93ZXItY29udHJvbGxlciB7Cj4gLSAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1zNC1wd3JjIjsKPiAtICAgICAgICAgICAg
ICAgI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwxPjsKPiAtICAgICAgICAgICAgICAgc3RhdHVzID0g
Im9rYXkiOwo+ICsgICAgICAgc206IHNlY3VyZS1tb25pdG9yIHsKPiArICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWd4YmItc20iOwo+ICsKPiArICAgICAgICAgICAg
ICAgcHdyYzogcG93ZXItY29udHJvbGxlciB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLXM0LXB3cmMiOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICNwb3dlci1kb21haW4tY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgIH07CkluIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9hbWxvZ2ljLG1lc29uLWd4
YmItc20ueWFtbAp0aGUgaGllcmFyY2h5IGlzOgpmaXJtd2FyZSB7CiAgc2VjdXJlLW1vbml0b3Ig
ewogICAgIHBvd2VyLWNvbnRyb2xsZXIgewogICAgICAgLi4uCiAgICAgfQogIH0KfQoKSXMgdGhp
cyBwYXRjaCBjb3JyZWN0IChhbmQgdGhlIGRvY3VtZW50YXRpb24gbmVlZHMgdG8gYmUgYWRhcHRl
ZCkgb3IKaXMgdGhlIGRvY3VtZW50YXRpb24gY29ycmVjdCAoYW5kIHRoaXMgcGF0Y2ggaGFzIHRv
IGJlIGFkYXB0ZWQpPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
