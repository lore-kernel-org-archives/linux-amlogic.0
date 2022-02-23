Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A0DC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jYfFv5IvYOrKe11NhBQn7TundQMh2K7u0cEVvuCp+TA=; b=ytRJPXUSkCjPFP
	NnN5UjXnueykdagMHWv2JEd0FB6vHkIpX8eEGzRD67xki5h3x/PBoQkqj2IRr9pvZxTOK2A5V9BZT
	xn/zWZRRlKCdgUQFo0gGdTYI1xvwalyQRaBJWVCjRSCBSNm3FVgkrrsjqS7gzXQSe+2+pbFdv2jay
	KpH75ak5rndaqKxCWExxT6wmYcHUI9INQxhIfHtysve3LQNGdZF8Ylvu1us6P007mMp0O4dMlphGM
	0cgVGucUYvDMq/mNUKA3ZlGWD7StH+w4N78pnBpuqKW03OpFiA8Y4K03bl2VirR2sIGzyn6k13KZt
	MisXK67VHNzdXsHVEbCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvss-00FcC3-AQ; Wed, 23 Feb 2022 17:57:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvsZ-00Fc6i-RU; Wed, 23 Feb 2022 17:56:45 +0000
Received: by mail-ej1-x632.google.com with SMTP id gb39so54240111ejc.1;
 Wed, 23 Feb 2022 09:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :content-language:content-transfer-encoding;
 bh=/PO6oqBBGLbyvnqDkql90p5GH0BalUjP2WrLAq+W6DM=;
 b=X3C0wg3eFLnHA9PM74bynyVtyRjKYKBcIwrmbsmKgoypi6OAPm98mCcej94ww9OypS
 YwcLXyfFURJcodXTmmH8Ai05ohGE2Zsjk+lH3/Ui5KYWDtGZbcnVKDU7hn3kfcdCrQ5X
 BDwTE5FjAY/fEwAYlXmrK5bv917qFcFlc/QrKSX4yl0uIQEHdiOz0bMb0xY6cc9R2bqo
 9/ArYoxhOekhmKcf/2cPKEPqVpXxpmdLygDk1Ris0ZFweTk08cbJk1vqSZcTSJCzHi3r
 t/1uvCd2dYqvNPAwpV5BzJiOyXSD0dJ6uJ54DRIj5dIfayiS+5OOv9CBX7xwwgAiEY/2
 /0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:content-language:content-transfer-encoding;
 bh=/PO6oqBBGLbyvnqDkql90p5GH0BalUjP2WrLAq+W6DM=;
 b=u+y6uUyMmd7k2Nae/S5O2TqHLRSRtN9jEyr4EjNuLQDeqXhQYc1ZVAf8kksz8T5RNO
 zzHXFqkUCW0+69xiuZq6o1t6qrrh937cgw5YAnn6p972Sb34W7E6CR4BMNZsZmkLQZdb
 QiIHby+0oBWz2l4W+i6r2Snj993RrxWZX8SA/pDCPC8fWGp0gQwl1kDDG4Ft5mhl6ybo
 p5JEuNxjxt8hLbtPqRZFCZ66MM5PR6dxXH4coqdtrZf3vP/paQb9QEAefBESgTxFAJwE
 oMW4rO29yhKYGy6jHP2a4KE+q9Cew4GI+pJKemSBL+GEjd91NGdEc4UlAIEjdIsF7Xds
 oJIA==
X-Gm-Message-State: AOAM5328hwfCR7rzmHFmOR0zVt/dEP6JuHUhUT5OaWNDQMyHR+cT9whE
 I/SRbHNF8Gq1p7R4O+qtmcVHRM3Jbng=
X-Google-Smtp-Source: ABdhPJyKbqAtnZB6CoBgZ25tIKyZpF49TmXYoUgQOdRxHjja/3AY3gCHBz6ChJ9vPCjvUTj9+IdTDQ==
X-Received: by 2002:a17:906:848f:b0:6cf:7234:8ae with SMTP id
 m15-20020a170906848f00b006cf723408aemr686250ejx.620.1645639001900; 
 Wed, 23 Feb 2022 09:56:41 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:d12c:c0a:f603:b44d?
 (p200300ea8f4d2b00d12c0c0af603b44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:d12c:c0a:f603:b44d])
 by smtp.googlemail.com with ESMTPSA id j6sm141682eje.158.2022.02.23.09.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 09:56:41 -0800 (PST)
Message-ID: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
Date: Wed, 23 Feb 2022 18:56:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 0/5] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_095643_921981_A0245F3E 
X-CRM114-Status: GOOD (  15.09  )
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

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgVGl0YW5tZWMgVE0xNjI4IDcgc2VnbWVu
dCBkaXNwbGF5CmNvbnRyb2xsZXIuIEl0J3MgYmFzZWQgb24gcHJldmlvdXMgUkZDIHdvcmsgZnJv
bSBBbmRyZWFzIEbDpHJiZXIuClRoZSBSRkMgdmVyc2lvbiBwbGFjZWQgdGhlIGRyaXZlciBpbiB0
aGUgTEVEIHN1YnN5c3RlbSwgYnV0IHRoaXMgd2FzCk5BSydlZCBieSB0aGUgTEVEIG1haW50YWlu
ZXIuIFRoZXJlZm9yZSBJIG1vdmVkIHRoZSBkcml2ZXIgdG8KL2RyaXZlcnMvYXV4ZGlzcGxheSB3
aGF0IHNlZW1zIG1vc3QgcmVhc29uYWJsZSB0byBtZS4KCkZ1cnRoZXIgY2hhbmdlcyB0byB0aGUg
UkZDIHZlcnNpb246Ci0gRHJpdmVyIGNhbiBiZSBidWlsdCBhbHNvIHcvbyBMRUQgY2xhc3Mgc3Vw
cG9ydCwgZm9yIGRpc3BsYXlzIHRoYXQKICBkb24ndCBoYXZlIGFueSBzeW1ib2xzIHRvIGJlIGV4
cG9zZWQgYXMgTEVEJ3MuCi0gU2ltcGxpZmllZCB0aGUgY29kZSBhbmQgcmV3cm90ZSBhIGxvdCBv
ZiBpdC4KLSBEcml2ZXIgaXMgbm93IGtpbmQgb2YgYSBNVlAsIGJ1dCBmdW5jdGlvbmFsaXR5IHNo
b3VsZCBiZSBzdWZmaWNpZW50CiAgZm9yIG1vc3QgdXNlIGNhc2VzLgotIFVzZSB0aGUgZXhpc3Rp
bmcgNyBzZWdtZW50IHN1cHBvcnQgaW4gdWFwaS9saW51eC9tYXBfdG9fN3NlZ21lbnQuaAogIGFz
IHN1Z2dlc3RlZCBieSBHZWVydCBVeXR0ZXJob2V2ZW4uCgpOb3RlOiBUaGVyZSdzIGEgbnVtYmVy
IG9mIGNoaXBzIGZyb20gb3RoZXIgbWFudWZhY3R1cmVycyB0aGF0IGFyZQogICAgICBhbG1vc3Qg
aWRlbnRpY2FsLCBlLmcuIEZENjI4LCBTTTE2MjguIE9ubHkgZGlmZmVyZW5jZSBJIHNhdyBzbwog
ICAgICBmYXIgaXMgdGhhdCB0aGV5IHBhcnRpYWxseSBzdXBwb3J0IG90aGVyIGRpc3BsYXkgbW9k
ZXMuCiAgICAgIFRNMTYyODogNngxMiwgN3gxMQogICAgICBTTTE2MjhDOiA0eDEzLCA1eDEyLCA2
eDExLCA3eDEwCiAgICAgIEZvciB0eXBpY2FsIGRpc3BsYXlzIG9uIGRldmljZXMgdXNpbmcgdGhl
c2UgY2hpcHMgdGhpcwogICAgICBkaWZmZXJlbmNlIHNob3VsZG4ndCBtYXR0ZXIuCgpTdWNjZXNz
ZnVsbHkgdGVzdGVkIG9uIGEgVFgzIE1pbmkgVFYgYm94IHRoYXQgaGFzIGFuIFNNMTYyOEMgYW5k
IGEKZGlzcGxheSB3aXRoIDQgZGlnaXRzIGFuZCA3IHN5bWJvbHMuCgp2MjoKLSAocmUtKWFkZCBB
bmRyZWFzJyBTb0IgdG8gdHdvIHBhdGNoZXMKLSBmaXggWUFNTCBpc3N1ZXMKLSBpbmNsdWRlIGN0
eXBlLmggZXhwbGljaXRseQotIGFkZCBpbmZvIG1lc3NhZ2UgaW4gcHJvYmUoKQoKdjM6Ci0gcmVt
b3ZlIHBhdGNoIDEgYmVjYXVzZSBpdCBoYXMgYmVlbiBhcHBsaWVkIHZpYSB0aGUgU1BJIHRyZWUg
YWxyZWFkeQotIGZpeCByZW1haW5pbmcgWUFNTCBpc3N1ZXMgaW4gcGF0Y2ggMgotIGZvbGxvdyBN
aWd1ZWwncyBzdWdnZXN0aW9uIG9uIHVzYWdlIG9mIENvLURldmVsb3BlZC1ieQoKQW5kcmVhcyBG
w6RyYmVyICgxKToKICBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBBZGQgVGl0YW4gTWlj
cm8gRWxlY3Ryb25pY3MKCkhlaW5lciBLYWxsd2VpdCAoNCk6CiAgZHQtYmluZGluZ3M6IGF1eGRp
c3BsYXk6IEFkZCBUaXRhbiBNaWNybyBFbGVjdHJvbmljcyBUTTE2MjgKICBkb2NzOiBBQkk6IGRv
Y3VtZW50IHRtMTYyOCBhdHRyaWJ1dGUgZGlzcGxheS10ZXh0CiAgYXV4ZGlzcGxheTogYWRkIHN1
cHBvcnQgZm9yIFRpdGFubWVjIFRNMTYyOCA3IHNlZ21lbnQgZGlzcGxheQogICAgY29udHJvbGxl
cgogIGFybTY0OiBkdHM6IG1lc29uLWd4bC1zOTA1dy10eDMtbWluaTogYWRkIHN1cHBvcnQgZm9y
IHRoZSA3IHNlZ21lbnQKICAgIGRpc3BsYXkKCiAuLi4vdGVzdGluZy9zeXNmcy1kZXZpY2VzLWF1
eGRpc3BsYXktdG0xNjI4ICAgfCAgIDcgKwogLi4uL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5t
ZWMsdG0xNjI4LnlhbWwgIHwgIDkyICsrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5k
b3ItcHJlZml4ZXMueWFtbCAgfCAgIDIgKwogLi4uL2R0cy9hbWxvZ2ljL21lc29uLWd4bC1zOTA1
dy10eDMtbWluaS5kdHMgIHwgIDU5ICsrKwogZHJpdmVycy9hdXhkaXNwbGF5L0tjb25maWcgICAg
ICAgICAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvYXV4ZGlzcGxheS9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2F1eGRpc3BsYXkvdG0xNjI4LmMgICAgICAg
ICAgICAgICAgICAgfCAzNzYgKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDU0
NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9BQkkvdGVz
dGluZy9zeXNmcy1kZXZpY2VzLWF1eGRpc3BsYXktdG0xNjI4CiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0x
NjI4LnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2F1eGRpc3BsYXkvdG0xNjI4LmMK
Ci0tIAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
