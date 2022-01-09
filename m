Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6E5C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jan 2022 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gAXhYiRSYPsQrYeAJ9+VCtnzY3zHfTCVnHGgYGP4FI=; b=oE23r6CSs0v3Zv
	YASMkWWX0coZmPQx+x3JiM6/Gj3LkPQso/GVfpgEjHf/svaSVloI7yIusXHF9z9lScRCyjGi/0B4Y
	sEt1dteQoykJCBC+DLpHhqLdQrry47p8nUeF851KXMXNL/cKeLNyyY0lxScJXEpLUd+mb8UEc/U89
	9Su84wW6Cm/eEytcyI4GKI+TRFjwMd/E/vgs0+X/Yv9uLkMt5qvfp4gxWcs7Ov+5kNs+QiHKtOziL
	+RemaPCw6qkE5d/2OT1mzvvzBPwdH+hHHdpO/ScZVjn9AqaW0xa3OpZkFE4/IeVRhSx471WiUdOa1
	z3AMbqs2pjZUqZIViJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6a6h-0081cj-T9; Sun, 09 Jan 2022 15:27:43 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6a6V-0081a7-72; Sun, 09 Jan 2022 15:27:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id w16so43466952edc.11;
 Sun, 09 Jan 2022 07:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=FvGKVkbPoLk160s03cYFMqXeMrS4eC4Yo28LpR7wSZw=;
 b=LMRe01B2fNbEumBBtKwIIorsxK7i16MNKkIRaXNwdQN5piJeFnHt5MLsVCxOqK5Dmu
 ZYhBMMPXITQZzIyx4qhqpg5KKyZl63kE9tdj1nJRtuKwJu08DsIujwJGqdESIKDGXZoI
 0UCW+SbSuEtYq34Lr3/cVOUQhJ+n8xrqWOXHv38WMkMhLj5Wua59DypjHftzy/h5YF5i
 KXX5oLHiewt2v/r5+aiZ4w0paGjylcxXRztouKbCe0POHWiwltUe2kZydJs5KfXnd4mK
 34eWLUYDZ3jexU4Zms2d3T6iiicTZuCJxEWTre22KavqEWBbS7Q0GaQ9X/e/v6QEJ+O5
 ZRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=FvGKVkbPoLk160s03cYFMqXeMrS4eC4Yo28LpR7wSZw=;
 b=XN9/YWa2Ll8JfrMK3BrhXXLDAB9U2wOoDeVPBPx4CJcwCUhngP3inFHMi7so9TA9b8
 KiBIL5ENiPsX02YnLHYDXxhwEpoJBPpb90ofTGkbiJKAfq2NkA+f+TYKP66+Q75Nf/BK
 AtyD39siT3FDyl0yci1QL0g2iF+pr8f1TVGfqOh/3wQSi570moT0dcFa3zOS/i1rI2ES
 m6pix0tt2IAd+XL1yWBf02ft1fjD0U/CI86je/yVvkLPoGZLn75ZvqDXbaSQNlK/uHIO
 mUmegFw5qA8u6GgVRJ7ezeZs5TulW+RaT0KU13gfTXM0/b5hTTLfuyip/m3Y6VvL9BSv
 s7fA==
X-Gm-Message-State: AOAM530KfBjAoe/ZydVZTkElieyLfcQxOyrsqq3zDXxhyOUCux58Dj6Z
 Njh3ngLN238YVHGpUTkkY5jEMz2NK6siLQ==
X-Google-Smtp-Source: ABdhPJyzMm6ymM4prYuEf17YUomBN2JF7P4yBD4KFNg9QzadE1JGig2uY81GmWpJlxMLir2uCu/rYA==
X-Received: by 2002:a17:906:344d:: with SMTP id
 d13mr11133627ejb.375.1641742048935; 
 Sun, 09 Jan 2022 07:27:28 -0800 (PST)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m12sm2157191edd.86.2022.01.09.07.27.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jan 2022 07:27:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: New binding for
 Meson-S4 SoCs
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20220108084218.31877-2-qianggui.song@amlogic.com>
Date: Sun, 9 Jan 2022 19:27:25 +0400
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Message-Id: <A4441A27-7B49-4A9A-83FD-05144A63E705@gmail.com>
References: <20220108084218.31877-1-qianggui.song@amlogic.com>
 <20220108084218.31877-2-qianggui.song@amlogic.com>
To: Qianggui Song <qianggui.song@amlogic.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_072731_283228_486DB1C4 
X-CRM114-Status: GOOD (  13.31  )
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

Cj4gT24gOCBKYW4gMjAyMiwgYXQgMTI6NDIgcG0sIFFpYW5nZ3VpIFNvbmcgPHFpYW5nZ3VpLnNv
bmdAYW1sb2dpYy5jb20+IHdyb3RlOgo+IAo+IFVwZGF0ZSBkdC1iaW5kaW5nIGRvY3VtZW50IGZv
ciBHUElPIGludGVycnVwdCBjb250cm9sbGVyIG9mIE1lc29uLVM0IFNvQ3MKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBRaWFuZ2d1aSBTb25nIDxxaWFuZ2d1aS5zb25nQGFtbG9naWMuY29tPgo+IC0tLQo+
IC4uLi9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hbWxvZ2ljLG1lc29uLWdwaW8taW50
Yy50eHQgICAgfCAxICsKPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL2FtbG9naWMsbWVzb24tZ3Bpby1pbnRjLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hbWxvZ2ljLG1lc29uLWdwaW8taW50
Yy50eHQKPiBpbmRleCAyM2IxOGI5MmM1NTguLjkzMDA3MzZiZjFlZCAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYW1s
b2dpYyxtZXNvbi1ncGlvLWludGMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FtbG9naWMsbWVzb24tZ3Bpby1pbnRjLnR4
dAo+IEBAIC0xOCw2ICsxOCw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gICAgICJhbWxvZ2lj
LG1lc29uLWcxMmEtZ3Bpby1pbnRjIiBmb3IgRzEyQSBTb0NzIChTOTA1RDIsIFM5MDVYMiwgUzkw
NVkyKQo+ICAgICAiYW1sb2dpYyxtZXNvbi1zbTEtZ3Bpby1pbnRjIiBmb3IgU00xIFNvQ3MgKFM5
MDVEMywgUzkwNVgzLCBTOTA1WTMpCj4gICAgICJhbWxvZ2ljLG1lc29uLWExLWdwaW8taW50YyIg
Zm9yIEExIFNvQ3MgKEExMTNMKQo+ICsgICAgImFtbG9naWMsbWVzb24tYTEtZ3Bpby1pbnRjIiBm
b3IgUzQgU29DcyAoUzgwMlgyLCBTOTA1WTQsIFM4MDVYMkcsIFM5MDVXMikKCl4gc2hvdWxkIGJl
ICJhbWxvZ2ljLG1lc29uLXM0LWdwaW8taW50Y+KAnSA/CgpDaHJpc3RpYW4KCj4gLSByZWcgOiBT
cGVjaWZpZXMgYmFzZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSByZWdpc3RlcnMu
Cj4gLSBpbnRlcnJ1cHQtY29udHJvbGxlciA6IElkZW50aWZpZXMgdGhlIG5vZGUgYXMgYW4gaW50
ZXJydXB0IGNvbnRyb2xsZXIuCj4gLSAjaW50ZXJydXB0LWNlbGxzIDogU3BlY2lmaWVzIHRoZSBu
dW1iZXIgb2YgY2VsbHMgbmVlZGVkIHRvIGVuY29kZSBhbgo+IC0tIAo+IDIuMzQuMQo+IAo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
