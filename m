Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B6CC6FA8E
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3fz48LZwAqXEWHZY7u/dfBXC5lOFs4YS4NaU48kJYs=; b=h3Z1xZkEmV2UOq
	xvz9Q/g6KQUQ/xlwioK0Sr66/ccM3rTeEsGxkY5VQ+bVQOiQ1Gqtdmitv7Jq2qEonHNUIhba41QsB
	ldSESbZPD6Xlf8IISgoveqzzhSU3DXnuEGoXrs1svVGzITmU3exc27TrVr74NkfQ/OToPN+g47ADY
	2kNYz7jXLKOnSH0gwuRQU2hef300bzfHKfiDM93GMOR7N8B5RwH6qab/84mfvH0NhHZJbA7v578E9
	Axno+/6pZPJX8YiughXef+KLEqckaA6jp3pNOESH4rXtP2C9c4V05WE2225AhWc2QzL4Q+3FhRlKm
	k80esGl5DNWpGfh7eQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYpOg-00ALds-9W; Sun, 05 Mar 2023 14:31:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYpOO-00ALbL-Ki; Sun, 05 Mar 2023 14:31:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id h14so6421153wru.4;
        Sun, 05 Mar 2023 06:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76w5hvK4+zlxLtKzkGCJU6IxlpJ/8FKM1yUiTkueqfw=;
        b=EPC78ilt/2Sv3mpTyKdo7Co2wo9EdHjph24EPcUvpzV94z2xdlfkosIeZWp1LAKNRh
         qfloU6t55iTaWB3WpJ2gZzkMWQ/13sJ2LF756yXVQ7/rhnpXiihwJjToplBaP7aSuj/d
         5/GDlx0GkB3dThFCNn9Pr8BFwk1LablmGI344bc3ihxcAzBGrQ5cfaJU/VxnvQcMlKam
         1/4LYc+UX2EzBkc1JQjYoAs7mgvKNyyeVLr7e3Ei8FskRH+N4KFJyhvsq/2YGdoWbiT6
         vixq9quNHce1MYwS9Pp7+g/HzouyE7XVmO8qZCs5tWFIxQ1tarUL3SHgcFoLHDsHcJrF
         8OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76w5hvK4+zlxLtKzkGCJU6IxlpJ/8FKM1yUiTkueqfw=;
        b=CmBBtvAwbmgLhfPmyelRIfWbnRiCbnzZKJ4Ncf2JAP5Em1v5QUkEQ5vJ0k3UKDX9ZV
         YgDpD9c2jtZfOhpf4vVfV1Q7g1ORFwf/XJBSZd0gLGhLtM10l/UySfehM7wPKq9gs3VT
         az7DApyZMVLz9DAJJZgs1C1BSk2L0LHOBnWULbYOTUJpY6zY43lTc5PB2SrlLaZxg/nn
         1FrM76oC1v78NNaz562IRnMfj4tylo06N5IaX9pERqgf3rrabUcQY6V95fojLFWhbX8v
         vCEI1WmNHFQosTv6nlcZe+q1kRGxRMq+4HWb7YZv71yjeu3taLE3crvBqV0LCd/dhjfP
         qGkg==
X-Gm-Message-State: AO0yUKWRrjScJ80JNHRKxMX2CRnvG4kbiuyDyaxEZ3zPQGRVTGjvUrPD
	a8Oqm7jB6n5Z0wE+TwNLyAo=
X-Google-Smtp-Source: AK7set+lA5Z7RZ5wappM/Xh2RvI+RSR6CTr5QV7cnxmXjnjqitI1CkfdhyAxO+j1ZaQLPhqbFibimQ==
X-Received: by 2002:adf:dd43:0:b0:2ce:50a9:6d8c with SMTP id u3-20020adfdd43000000b002ce50a96d8cmr2810376wrm.32.1678026674493;
        Sun, 05 Mar 2023 06:31:14 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id f12-20020a5d58ec000000b002c71b4d476asm7456916wrd.106.2023.03.05.06.31.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Mar 2023 06:31:14 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 2/2] arm64: dts: meson: add support for BananaPi M2S
 variants
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <e52c4a1d-951e-8ce5-4aec-7f2b6d4c6c3a@linaro.org>
Date: Sun, 5 Mar 2023 18:31:10 +0400
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org
Message-Id: <82FF9933-B4CF-428B-9EB7-40FCBD285EEE@gmail.com>
References: <20230305132044.1596320-1-christianshewitt@gmail.com>
 <20230305132044.1596320-3-christianshewitt@gmail.com>
 <0d2184ee-679e-371e-8433-c38b22c97799@linaro.org>
 <9CC246C2-28A7-46DF-924F-8FBF5CDE16CA@gmail.com>
 <e52c4a1d-951e-8ce5-4aec-7f2b6d4c6c3a@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_063116_697847_A9F27CFA 
X-CRM114-Status: GOOD (  11.16  )
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

Cj4gT24gNSBNYXIgMjAyMywgYXQgNjoxNSBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiAKPiBPbiAwNS8wMy8yMDIzIDE0OjQ3
LCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+PiAKPj4+IE9uIDUgTWFyIDIwMjMsIGF0IDU6MzAg
cG0sIEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4g
d3JvdGU6Cj4+PiAKPj4+IE9uIDA1LzAzLzIwMjMgMTQ6MjAsIENocmlzdGlhbiBIZXdpdHQgd3Jv
dGU6Cj4+Pj4gQmFuYW5hUGkgTTJTIHNoaXBzIGluIEFtbG9naWMgUzkyMlggYW5kIEEzMTFEIHZh
cmlhbnRzIHdpdGggdGhlCj4+Pj4gZm9sbG93aW5nIGNvbW1vbiBzcGVjaWZpY2F0aW9uczoKPj4+
PiAKPj4+ICguLi4pCj4+PiAKPj4+PiArCj4+Pj4gKwlsZWRzIHsKPj4+PiArCQljb21wYXRpYmxl
ID0gImdwaW8tbGVkcyI7Cj4+Pj4gKwo+Pj4+ICsJCWJsdWUgewo+Pj4gCj4+PiBsZWQtMAo+Pj4g
Cj4+PiBEb2VzIG5vdCBsb29rIGxpa2UgeW91IHRlc3RlZCB0aGUgRFRTIGFnYWluc3QgYmluZGlu
Z3MuIFBsZWFzZSBydW4gYG1ha2UKPj4+IGR0YnNfY2hlY2tgIChzZWUgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3dyaXRpbmctc2NoZW1hLnJzdAo+Pj4gZm9yIGluc3RydWN0aW9u
cykuCj4+IAo+PiBJ4oCZbSBidWlsZGluZyBldmVyeXRoaW5nIGluIGEgY3Jvc3MtY29tcGlsZSBi
dWlsZCBzeXN0ZW0gdGhhdCBkb2VzbuKAmXQgYWxsb3cKPj4gdGhpcyB0byBiZSBkb25lIHdpdGhv
dXQgYSBwcm9ibGVtIGFtb3VudCBvZiBob29wIGp1bXBpbmcuIEkgbmVlZCB0byB3b3JrIG9uCj4+
IGFub3RoZXIgYXJyYW5nZW1lbnQgdG8gZG8gdGhpcyB0ZXN0aW5nICh3b3JrLWluLXByb2dyZXNz
KS4gVGhhbmtzIGZvciB0aGUKPiAKPiBDcm9zcyBjb21waWxpbmcga2VybmVsIGFuZCBydW5uaW5n
IHRoaXMgKGFsc28gYXMgY3Jvc3MgY29tcGlsZWQpIGlzCj4gdHJpdmlhbCwgc28gd2hhdCBleGFj
dGx5IHN0b3BzIHlvdT8gUGFja2FnaW5nIGtlcm5lbCBmb3IgeW91ciBzeXN0ZW0KPiAoZS5nLiBZ
b2N0bykgaXMgZGlmZmVyZW50IHRvcGljLCBidXQgdGhhdCdzIGZpbmFsIHN0ZXAsIG5vdCBuZWNl
c3NhcnkKPiBmb3IgZGV2ZWxvcG1lbnQgb2YgRFRTLgoKSeKAmW0gcmVhc29uYWJseSBjb21wZXRl
bnQgd2l0aGluIHRoZSBjb25zdHJhaW50cyBvZiB0aGUgZGlzdHJvIGJ1aWxkLXN5c3RlbQplbnZp
cm9ubWVudCB0aGF0IEkgdXNlIGFuZCBrbm93LiBJ4oCZbSB2ZXJ5IGxhY2tpbmcgaW4ga25vd2xl
ZGdlIGlmIHlvdSBzdGVwCm91dHNpZGUgdGhhdC4gSXTigJlzIG1vc3RseSBhbiBvbGQtZG9nL25l
dy10cmljayBwcm9ibGVtLCBhbmQgc29tZXRoaW5nIEkgZG8KbmVlZCB0byBpbXByb3ZlIHVwb24g
KG5vdCBhIGdvb2QgZXhjdXNlLCBJIGtub3cpLgoKQ2hyaXN0aWFuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
