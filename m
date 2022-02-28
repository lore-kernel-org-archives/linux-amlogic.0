Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB748C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6VX46/rueNqHwj2IeTz0NfeES0RwCVfq7OchYHBQFk=; b=LrIB+tmfEQjzwk
	lhUgHGvvBLITKW0yxtyPAswfLFFUX8BvJ+CsDn7+GLv3ZKhhC/Swe4ZgtF/KIljuYSELIT/yhCAO5
	YmB1vMx7firUyNjgFCUVxA+/dyRWIG4HB9bBgDo78qrl3s/lvBTH5PhPOePqgHnlT5x42GoSukuBJ
	SesUamy/y06TSb+hez1BJJiFhB5c82PWWjxIbZFeRu60oXDPnn53MiBlwtZF2ZWHXXz3PBvuEglcs
	2VgINCv4Yn8I6sxPmQH4MnTwT9DO22he2MYXx+REdsCV7AwCbUpHwI0FOfz9AgXzLuAvg2RUta0sm
	Kwi0NkIbyFXuNHOW7O7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOh1o-00CtoV-9y; Mon, 28 Feb 2022 14:29:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgme-00CoC1-FB
 for linux-amlogic@lists.infradead.org; Mon, 28 Feb 2022 14:13:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id u1so15646244wrg.11
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Feb 2022 06:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hxrYZWbf+t1SkWdBj7V3c0s4/eY5PWXdIAHGF4Ng3mE=;
 b=sjkiMNjntMCkg8BhMsA+AT9L4II8B+wM8IUbHEQenvbEZ6m657vD5ltKHYBDGWKACo
 cbHq35b0bj3mVfcJoFPXZeY9tSQimWPqWJ9LrwBOZoWF4VlFPIk+BvVoEByVvfGzZut0
 GrnGXZlDlnOwjaEOgBUCv8hixa3e9Wz04Du8/x3MGH2SyNAmmYEccx6szKnawGOVh5av
 34+wA0d3v7HXJoVNQQIH70gTgJzp/OLMAz6tacnwa4C5s58aNhOTS5BtEUsm/0KAKCIP
 wVA38VY2eq9I7mxcpZnsXyiREXYqEAETnPDcM2eWcBn2frCHmS0usKXL8colTZ9ToMVt
 5GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hxrYZWbf+t1SkWdBj7V3c0s4/eY5PWXdIAHGF4Ng3mE=;
 b=3qHZ7gW0yHjiFw4ldDT196bzPlItA5ubzaXk4HG+gBbH2WAhG5w7ahUb2bWX7Ct3HQ
 XGRJLL8rJv1HF4hsEvoNNE7EZMMDt4fxoHB9+YkrD/yOiz/E/YxGLU5jsy+UrQBwECIR
 rAcC0PRLlOM5mb7dO1DwWBiudFDBMlmLCynSwxBsOyOTmlHv8VmugUHj/91FvrNO8bOn
 nq5VfBFmb0Q41xw5c0a3jQZAevUGTexHs9gp/GLzJiGxdpHgXWARoV0Ya0hfaF1Icizj
 M5IVkfS+VV7asTZvFmM7vNgi/A1WzJxLcWjFGb8vSjE0GiWmdQwuVrTzCHjBFcDKM2jC
 LGCA==
X-Gm-Message-State: AOAM533KUXLi/ugs+0NvA4NwqYjwJ0kxrmMjjti6y4CrnCOHd7TEZw2Q
 cTnuDtBSSpx22O23pzA0cSXVBg==
X-Google-Smtp-Source: ABdhPJwYaUoKYjigKtVEJBaIMvwSs88l9Q8uTGiDZw7db/brtNNBh2cmfs/+K0MqPnGExy27Xga+aA==
X-Received: by 2002:a5d:6052:0:b0:1ed:9fcc:3055 with SMTP id
 j18-20020a5d6052000000b001ed9fcc3055mr16885437wrt.438.1646057630394; 
 Mon, 28 Feb 2022 06:13:50 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:6431:1dc7:b58f:6282?
 ([2001:861:44c0:66c0:6431:1dc7:b58f:6282])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a05600c2d4900b0038100a95903sm14131513wmg.41.2022.02.28.06.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 06:13:50 -0800 (PST)
Message-ID: <29b34655-f820-39c9-4363-878481cd3f63@baylibre.com>
Date: Mon, 28 Feb 2022 15:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V3] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
References: <20220228135530.6918-1-yu.tu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220228135530.6918-1-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_061352_543243_5E4BD7C3 
X-CRM114-Status: GOOD (  21.13  )
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

SGksCgpPbiAyOC8wMi8yMDIyIDE0OjU1LCBZdSBUdSB3cm90ZToKPiBEZXNjcmliZXMgdGhlIGNh
bGN1bGF0aW9uIG9mIHRoZSBVQVJUIGJhdWQgcmF0ZSBjbG9jayB1c2luZyBhIGNsb2NrCj4gZnJh
bWUuIEZvcmdvdCB0byBhZGQgaW4gS2NvbmZpZyBrZXJuZWwgdGVzdCBSb2JvdCBjb21waWxhdGlv
biBlcnJvcgo+IGR1ZSB0byBDT01NT05fQ0xLIGRlcGVuZGVuY3kuCj4gCj4gRml4ZXM6ICgidHR5
OiBzZXJpYWw6bWVzb246IERlc2NyaWJlcyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIFVBUlQgYmF1
ZCByYXRlIGNsb2NrIHVzaW5nIGEgY2xvY2sgZnJhbWXigJwpCgpBcyBJIGFscmVhZHkgcmVwbGll
ZCBvbiBWMiBvZiB0aGlzIHBhdGNoLCB5b3UncmUgaW52aXRlZCB0byBhcHBseSB0aGVzZSBmaXhl
cyBkaXJlY3RseQpvbiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHlvdXIgIlVzZSBDQ0YgdG8gZGVzY3Jp
YmUgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIiBwYXRjaHNldAphbmQgbm90IGFzIGEgc2VwYXJh
dGUgcGF0Y2guCgpUaGFua3MsCk5laWwKCj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90
IDxsa3BAaW50ZWwuY29tPgo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWXUgVHUgPHl1LnR1QGFtbG9naWMuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcgICAgICB8ICAxICsKPiAgIGRy
aXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgfCAzNyArKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnIGIv
ZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcKPiBpbmRleCBlOTUyZWM1YzdhN2MuLmEwZjJiODJm
YzE4YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwo+ICsrKyBiL2Ry
aXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCj4gQEAgLTIwMCw2ICsyMDAsNyBAQCBjb25maWcgU0VS
SUFMX0tHREJfTk1JCj4gICBjb25maWcgU0VSSUFMX01FU09OCj4gICAJdHJpc3RhdGUgIk1lc29u
IHNlcmlhbCBwb3J0IHN1cHBvcnQiCj4gICAJZGVwZW5kcyBvbiBBUkNIX01FU09OIHx8IENPTVBJ
TEVfVEVTVAo+ICsJZGVwZW5kcyBvbiBDT01NT05fQ0xLCj4gICAJc2VsZWN0IFNFUklBTF9DT1JF
Cj4gICAJaGVscAo+ICAgCSAgVGhpcyBlbmFibGVzIHRoZSBkcml2ZXIgZm9yIHRoZSBvbi1jaGlw
IFVBUlRzIG9mIHRoZSBBbWxvZ2ljCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9t
ZXNvbl91YXJ0LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4gaW5kZXggYmY2
YmU1NDY4YWFmLi45NzJmMjEwZjM0OTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFs
L21lc29uX3VhcnQuYwo+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPiBA
QCAtNzgwLDI4ICs3ODAsMzcgQEAgc3RhdGljIGludCBtZXNvbl91YXJ0X3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJCXJldHVybiByZXQ7Cj4gICAKPiAgIAlpcnEgPSBw
bGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+IC0JaWYgKGlycSA8IDApCj4gLQkJcmV0dXJuIGly
cTsKPiArCWlmIChpcnEgPCAwKSB7Cj4gKwkJcmV0ID0gaXJxOwo+ICsJCWdvdG8gZXJyX291dF9j
bGtfZGlzYWJsZTsKPiArCX0KPiAgIAo+ICAgCW9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRl
di5vZl9ub2RlLCAiZmlmby1zaXplIiwgJmZpZm9zaXplKTsKPiAgIAo+ICAgCWlmIChtZXNvbl9w
b3J0c1twZGV2LT5pZF0pIHsKPiAgIAkJZGV2X2VycigmcGRldi0+ZGV2LCAicG9ydCAlZCBhbHJl
YWR5IGFsbG9jYXRlZFxuIiwgcGRldi0+aWQpOwo+IC0JCXJldHVybiAtRUJVU1k7Cj4gKwkJcmV0
ID0gLUVCVVNZOwo+ICsJCWdvdG8gZXJyX291dF9jbGtfZGlzYWJsZTsKPiAgIAl9Cj4gICAKPiAg
IAlwb3J0ID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZihzdHJ1Y3QgdWFydF9wb3J0
KSwgR0ZQX0tFUk5FTCk7Cj4gLQlpZiAoIXBvcnQpCj4gLQkJcmV0dXJuIC1FTk9NRU07Cj4gKwlp
ZiAoIXBvcnQpIHsKPiArCQlyZXQgPSAtRU5PTUVNOwo+ICsJCWdvdG8gZXJyX291dF9jbGtfZGlz
YWJsZTsKPiArCX0KPiAgIAo+ICAgCXBvcnQtPm1lbWJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2UoJnBkZXYtPmRldiwgcmVzX21lbSk7Cj4gLQlpZiAoSVNfRVJSKHBvcnQtPm1lbWJhc2UpKQo+
IC0JCXJldHVybiBQVFJfRVJSKHBvcnQtPm1lbWJhc2UpOwo+ICsJaWYgKElTX0VSUihwb3J0LT5t
ZW1iYXNlKSkgewo+ICsJCXJldCA9IFBUUl9FUlIocG9ydC0+bWVtYmFzZSk7Cj4gKwkJZ290byBl
cnJfb3V0X2Nsa19kaXNhYmxlOwo+ICsJfQo+ICAgCj4gICAJcHJpdmF0ZV9kYXRhID0gZGV2bV9r
emFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqcHJpdmF0ZV9kYXRhKSwKPiAgIAkJCQkgICAgR0ZQ
X0tFUk5FTCk7Cj4gLQlpZiAoIXByaXZhdGVfZGF0YSkKPiAtCQlyZXR1cm4gLUVOT01FTTsKPiAr
CWlmICghcHJpdmF0ZV9kYXRhKSB7Cj4gKwkJcmV0ID0gLUVOT01FTTsKPiArCQlnb3RvIGVycl9v
dXRfY2xrX2Rpc2FibGU7Cj4gKwl9Cj4gICAKPiAgIAlpZiAoZGV2aWNlX2dldF9tYXRjaF9kYXRh
KCZwZGV2LT5kZXYpKQo+ICAgCQlwcml2YXRlX2RhdGEtPnVzZV94dGFsX2NsayA9IHRydWU7Cj4g
QEAgLTgyMiw3ICs4MzEsNyBAQCBzdGF0aWMgaW50IG1lc29uX3VhcnRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgIAo+ICAgCXJldCA9IG1lc29uX3VhcnRfcHJvYmVfY2xv
Y2tzKHBvcnQpOwo+ICAgCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiArCQlnb3RvIGVycl9v
dXRfY2xrX2Rpc2FibGU7Cj4gICAKPiAgIAltZXNvbl9wb3J0c1twZGV2LT5pZF0gPSBwb3J0Owo+
ICAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHBvcnQpOwo+IEBAIC04MzEsOSArODQwLDE1
IEBAIHN0YXRpYyBpbnQgbWVzb25fdWFydF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICAgCW1lc29uX3VhcnRfcmVzZXQocG9ydCk7Cj4gICAKPiAgIAlyZXQgPSB1YXJ0X2Fk
ZF9vbmVfcG9ydCgmbWVzb25fdWFydF9kcml2ZXIsIHBvcnQpOwo+IC0JaWYgKHJldCkKPiArCWlm
IChyZXQpIHsKPiAgIAkJbWVzb25fcG9ydHNbcGRldi0+aWRdID0gTlVMTDsKPiArCQlnb3RvIGVy
cl9vdXRfY2xrX2Rpc2FibGU7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gICAKPiArZXJyX291
dF9jbGtfZGlzYWJsZToKPiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShwY2xrKTsKPiAgIAlyZXR1
cm4gcmV0Owo+ICAgfQo+ICAgCj4gCj4gYmFzZS1jb21taXQ6IGMyZmFmNzM3YWJmYjEwZjg4ZjJk
MjYxMmQ1NzNlOWVkYzNjNDJjMzcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
