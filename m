Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F02C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 17:30:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5612A64F5F
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 17:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5612A64F5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9KvXt9IKoE7HxI15bU3iNCZ2O7jFWgiTM9WBjjfgD3I=; b=JYNvO7yxtKx75rA3grMd9eGsR
	bNC+jbFnJciwR/inuVWRo9fY+n1O3oFRG8elMuEJl2dHW/pDGWhkF25ziM3AtnxOcGK2/89dejoBZ
	Th/SYu4VE792ySt4QxREvfBjQIGDw5Eklol7/15xPj4jxoefJK77d+rFJ7595Z89cVXV//TQ7Ur+0
	tjpSrt9CMTKoqJ290k9SLiYcFpvTNO7p8lP2jCUlpyOVEOtdx6vvnmWbY4xNOmqww/5ioibkeB6Lh
	PE9qLFgtvQ9tetaHKTJfMigiK3Q8nRkvNcLemu3goLKM6f3KKHSGeFVzHHalXcXCTSfCx71ZFM9gZ
	Ov1op0PIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zV0-0007HM-FW; Tue, 02 Feb 2021 17:29:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zUw-0007GY-UJ
 for linux-amlogic@lists.infradead.org; Tue, 02 Feb 2021 17:29:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id d16so21304963wro.11
 for <linux-amlogic@lists.infradead.org>; Tue, 02 Feb 2021 09:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N//mYDr5nzqzo1nDYiOu11nbcdng7agwCA5cUpFfnE8=;
 b=Uty4T2X0vw5g1J3iUEZnW4rgoCnOfFfHLER9nuzFu/WengBe7IkL35ikXxYPlVC+5K
 V2vYG6DBMG+kKWqcGO8OkyDnKFd+xS6nGDlIRQv4JviGPgKewOHn5rNlNWfRrW/y2xZE
 SAar+RP3NX9mkduI35OPlfjmfVTLKG1LHCuADI+odZplXNomfyQpPDtMZ0uYBfq4kl4Q
 Rwy8IsIPP7XaHY3HJNCucJh5SlSxCPaWTn5Bzz4ZA1LE74eYNiiijIWxVqaX+R47PVP1
 PCcEZHFncc3rbv/kLYEOf+85qWvzqDbSKOzl7KLGFY7AgBCOa0wGKZ2YqIY6lWiFT77b
 HB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=N//mYDr5nzqzo1nDYiOu11nbcdng7agwCA5cUpFfnE8=;
 b=kMq8Zo4RsCIuAseLBHV3zzpBj7UCwuljYPYAdo+1u4Y1Jeq6LPuGgyoXgbJ7OWJh8J
 WVUrL8ar0YQwAph6Se/oDyHjq2ssg56dbeDvbdlx0M2KCNYKinan+uvEu4+EPyQtMoeC
 zoHKp8AIwk4knFDaDHNmCMNFGuiwgGBvOrbMDgo+LkdqZ4SOBFiHmn+UOLrlE1/INTly
 5LXGAgaHayAMhqm69V5nuQStrNK9oWBOwIa+oQyy55KkC4BX7qfk91qBQEIKQgy74N+Z
 IB9rG2lXSgSbxDh/bgQU1iZILcCjDBC64fVPbaC8CVB0JLQn7ogtQESuEWqicUO9z30m
 NlPA==
X-Gm-Message-State: AOAM53210N3t1BBSh9EBTFs0ORCnCl7g0ITOWHmWvTlW/ougDO/OJCbS
 MgQavsQEQaMBd0lJBrj9KfV1ng==
X-Google-Smtp-Source: ABdhPJxVxMQed1MQt4zdZJ4zjEndwfAUkPkZY0yQR0Xz/tGXR1pekqJCA4p7IjYuTusdm2B7h5i3aA==
X-Received: by 2002:adf:ed02:: with SMTP id a2mr13633407wro.197.1612286990011; 
 Tue, 02 Feb 2021 09:29:50 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:e8f5:2d7c:86e5:9992?
 ([2a01:e0a:90c:e290:e8f5:2d7c:86e5:9992])
 by smtp.gmail.com with ESMTPSA id h14sm3583003wmq.39.2021.02.02.09.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 09:29:49 -0800 (PST)
Subject: Re: [PATCH 1/1] arm64: dts: meson: g12b: odroid-n2: Add I2C RTC
 device node
To: Alexander Stein <alexander.stein@mailbox.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20210202170846.81685-1-alexander.stein@mailbox.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c63a4da5-b598-2484-24bf-d7b4697e28e1@baylibre.com>
Date: Tue, 2 Feb 2021 18:29:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202170846.81685-1-alexander.stein@mailbox.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_122955_038929_A87FEBD3 
X-CRM114-Status: GOOD (  18.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAwMi8wMi8yMDIxIDE4OjA4LCBBbGV4YW5kZXIgU3RlaW4gd3JvdGU6Cj4gVGhpcyBp
cyB0YWtlbiBmcm9tIHRoZSBkb3duc3RyZWFtIGtlcm5lbCBhbmQgd29ya3Mgb3V0IG9mIHRoZSBi
b3guCgpQbGVhc2Uga2VlcCBhdXRob3JzaGlwIG9mIHRoZSBkb3duc3RyZWFtIGNvbW1pdC4KCj4g
U2ltaWxhciB0byBvdGhlciBib2FyZHMsIHRoaXMgUlRDIHNob3VsZCBiZSB0aGUgcHJpbWFyeSBv
bmUsIHJhdGhlciB0aGFuCj4gdGhlIGludGVybmFsIG9uZS4KPiAKPiBBIHdha2V1cCBhbGFybSBi
eSB3cml0aW5nIHRvIC9zeXMvY2xhc3MvcnRjL3J0YzAvd2FrZWFsYXJtIHdvcmtzIGFzIHdlbGwu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIuc3RlaW5AbWFp
bGJveC5vcmc+Cj4gLS0tCj4gIC4uLi9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItb2Ryb2lk
LW4yLmR0c2kgICAgIHwgMTQgKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLWcxMmItb2Ryb2lkLW4yLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tZzEyYi1vZHJvaWQtbjIuZHRzaQo+IGluZGV4IDA1MDg2MmNkMDk5Ni4uMTBlZGM3Y2U1
ZTg0IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJi
LW9kcm9pZC1uMi5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWcxMmItb2Ryb2lkLW4yLmR0c2kKPiBAQCAtMTMsNiArMTMsOCBAQCAvIHsKPiAgCWFsaWFzZXMg
ewo+ICAJCXNlcmlhbDAgPSAmdWFydF9BTzsKPiAgCQlldGhlcm5ldDAgPSAmZXRobWFjOwo+ICsJ
CXJ0YzAgPSAmcnRjOwo+ICsJCXJ0YzEgPSAmdnJ0YzsKPiAgCX07Cj4gIAo+ICAJZGlvbzIxMzM6
IGF1ZGlvLWFtcGxpZmllci0wIHsKPiBAQCAtNDcxLDYgKzQ3MywxOCBAQCBoZG1pX3R4X3RtZHNf
b3V0OiBlbmRwb2ludCB7Cj4gIAl9Owo+ICB9Owo+ICAKPiArJmkyYzMgewo+ICsJc3RhdHVzID0g
Im9rYXkiOwo+ICsJcGluY3RybC0wID0gPCZpMmMzX3NkYV9hX3BpbnM+LCA8JmkyYzNfc2NrX2Ff
cGlucz47Cj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICsKPiArCXJ0YzogcnRjQDUx
IHsKPiArCQljb21wYXRpYmxlID0gIm54cCxwY2Y4NTYzIjsKPiArCQlyZWcgPSA8MHg1MT47CgpJ
bnRlcnJ1cHQgbGluZSBpcyBtaXNzaW5nLCBBbmFuZCBhZGRlZDoKK8K7ICAgICAgIMK7ICAgICAg
IC8qwrdSVEPCt0lOVMK3Ki8KK8K7ICAgICAgIMK7ICAgICAgIGludGVycnVwdHPCtz3CtzxHUElP
QU9fN8K3SVJRX1RZUEVfTEVWRUxfTE9XPjsKK8K7ICAgICAgIMK7ICAgICAgIGludGVycnVwdC1w
YXJlbnTCtz3CtzwmZ3Bpb19pbnRjPjsKCj4gKwkJd2FrZXVwLXNvdXJjZTsKPiArCX07Cj4gK307
Cj4gKwo+ICAmaXIgewo+ICAJc3RhdHVzID0gIm9rYXkiOwo+ICAJcGluY3RybC0wID0gPCZyZW1v
dGVfaW5wdXRfYW9fcGlucz47Cj4gCk5laWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
