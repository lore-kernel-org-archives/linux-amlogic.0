Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3749EB64DD
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQBCirVnxFWvwJdoDL+X9Gp26ROrP75NQ7MKm+GhOSQ=; b=isftwdql5EKVsx
	sJoK5smCpGLBEVFd1wMGHCozMKyxQAqyzchgsx8nJl85U9Dq5/c9qNk5F5lLuKOJn6bZ0CBFXIgoz
	JKMbBmBDAG+coeCaqBwxDbQPb5KhsO5B7E34Xoi9v9l3MxWt6ev78hyu+vsa5RfJQmq4e64YmNRx+
	LFVQptqp+6h9gV2zY4+7OTJuaPBCqMxV5GuTRvXvbG48rDutDGp8klf4f2rrJVeHlI+t3n7fCV4OH
	+GnkU+oHwFBMUWsDyB8DWNfFLtdWgpt+hmZbREhYvffRk3nB7Ytcr5UJnzWoOgvFzBlfIbBX2lnrP
	896ChQD3UqrVbyKNPSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWqL-008i4n-24;
	Sun, 25 Jun 2023 21:00:21 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWqJ-008i4I-1A;
	Sun, 25 Jun 2023 21:00:20 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9741caaf9d4so202229166b.0;
        Sun, 25 Jun 2023 14:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687726817; x=1690318817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mJUkbQQcqyDE53aw5MOHAc9VhtcEJr6twJXYLB90jk=;
        b=A7qCeuCgKbtFEgGis1t2x/ErDOE+chG5xjp1mHsbD8UxcMKWjdXBegYJqsorobez3i
         A+P8dZby0eKzlFX25d47RbP/qssp4hyO+4oNOV/c4McI9RAgIvEe0hUWXba/q2dIhN5G
         6yxnSANBsC8Qva4NZLVyvvnsk+Ks5/50zA6nQSYOJkr/++RHIUi7Tha0uWQ7kSar1xwG
         hoqNMpYpQsH7rGKwcXtRqnxWTvTCdWYkM/y6r8WSVAjNMk4Q6pblTz9SrJ1RqwEJ7SWV
         9iJp6Zu+ZvUGorur+Hxo1mDm190O7XE1bPza8P27zKW5NWUIaz6jkLgxJS4c1LuNR7fG
         8vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687726817; x=1690318817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mJUkbQQcqyDE53aw5MOHAc9VhtcEJr6twJXYLB90jk=;
        b=TM/T8O37fPdO9THk/Z8wxY7lQLn8HmEazLaWLSAxDBUyLMup3w6mnJtxKJtcbFSSHe
         boiT2NwMEruLO2q3EJEazg56l6TCH4cQFDQdLeyEuyLhoo4J1BY8lKLnMud8MZcWIxkB
         Ekg5ap9oHVk/28webTykKsv0DDCsMd58EPyh8LWNLKHy97hu3wY6pdUOWxWJIXeLxUdC
         6IOZs5A1La9Y7psvNHmTR92zNd7cX4JYa8nIU3UVf1GBc7EI1TLcygsajS6XMRdYPzzh
         H+JnLX611qRVVAAELEdfGkjssD8/gM0TP9hYNZ+o9jGJCCJ92UMnRV54YQG83p/Ulz0A
         73dg==
X-Gm-Message-State: AC+VfDxw0F5wt1/JWmy/stH41ItVCumT0qbMdL0Y7IsALhv7M8LCwcQs
	pZthlFPf2jITy3uIy9P/uQyLltfne2Sbj3Xag2s=
X-Google-Smtp-Source: ACHHUZ5yBmQinkSkuUlSQyLq8I7zzsqf8l+oBnyvl4CQafqwz9rPZS23Crq7w+vxpQEf+q2F4xwNtxGw+RdXfwGDVss=
X-Received: by 2002:a17:907:a06f:b0:98f:5640:16a with SMTP id
 ia15-20020a170907a06f00b0098f5640016amr1168601ejc.53.1687726817451; Sun, 25
 Jun 2023 14:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru> <20230607201641.20982-2-ddrokosov@sberdevices.ru>
In-Reply-To: <20230607201641.20982-2-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Jun 2023 23:00:06 +0200
Message-ID: <CAFBinCAO14zcgY66UyJO9UxuCWf1N-Lsx=iYNTJL=cwXoJv__Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] arm64: dts: meson: a1: introduce PLL and
 Peripherals clk controllers
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, conor+dt@kernel.org, kernel@sberdevices.ru, 
	sdfw_system_team@sberdevices.ru, rockosov@gmail.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_140019_407565_22C6709C 
X-CRM114-Status: GOOD (  17.11  )
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

T24gV2VkLCBKdW4gNywgMjAyMyBhdCAxMDoxNuKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhZGRzIGNsa2MgYW5kIGNs
a2NfcGxsIGR0cyBub2RlcyB0byBBMSBTb0MgbWFpbiBkdHNpLgo+IFRoZSBmaXJzdCBvbmUgY2xr
IGNvbnRyb2xsZXIgaXMgcmVzcG9uc2libGUgZm9yIGFsbCBTb0MgcGVyaXBoZXJhbHMKPiBjbG9j
a3MgZXhjbHVkaW5nIGF1ZGlvIGNsb2Nrcy4gVGhlIHNlY29uZCBvbmUgY2xrIGNvbnRyb2xsZXIg
aXMgdXNlZCBieQo+IEExIFNvQyBQTExzLiBBY3R1YWxseSwgdGhlcmUgYXJlIHR3byBkaWZmZXJl
bnQgQVBCIGhlYWRzLCBzbyB3ZSBoYXZlIHR3bwo+IGRpZmZlcmVudCBkcml2ZXJzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogRG1pdHJ5IFJva29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4KPiAt
LS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kgfCAyNiArKysr
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNp
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kKPiBpbmRleCBlZWQ5
NmYyNjI4NDQuLmEyNDIyODgwOGM5YyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tYTEuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1hMS5kdHNpCj4gQEAgLTYsNiArNiw4IEBACj4gICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dw
aW8vbWVzb24tYTEtZ3Bpby5oPgo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svYW1sb2dp
YyxhMS1wbGwtY2xrYy5oPgo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxh
MS1wZXJpcGhlcmFscy1jbGtjLmg+Cj4KPiAgLyB7Cj4gICAgICAgICBjb21wYXRpYmxlID0gImFt
bG9naWMsYTEiOwo+IEBAIC0xMjYsNiArMTI4LDMwIEBAIHVhcnRfQU9fQjogc2VyaWFsQDIwMDAg
ewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsK
PiAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y2xrY19wZXJpcGhzOiBjbG9jay1jb250cm9sbGVyQDgwMCB7CnBsZWFzZSBrZWVwIHRoZSBlbnRy
aWVzIHNvcnRlZCAtIHNvICZjbGtjX3BlcmlwaHMgc2hvdWxkIGNvbWUgYWZ0ZXIKJnBlcmlwaHNf
cGluY3RybAoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
YW1sb2dpYyxhMS1wZXJpcGhlcmFscy1jbGtjIjsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwwIDB4ODAwIDAgMHgxMDQ+Owo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY2xvY2tzID0gPCZjbGtjX3BsbCBDTEtJRF9GQ0xLX0RJVjI+LAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjbGtjX3BsbCBDTEtJRF9GQ0xLX0RJVjM+
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjbGtjX3BsbCBD
TEtJRF9GQ0xLX0RJVjU+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPCZjbGtjX3BsbCBDTEtJRF9GQ0xLX0RJVjc+LAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPCZjbGtjX3BsbCBDTEtJRF9ISUZJX1BMTD4sCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8Jnh0YWw+Owo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiZmNsa19kaXYyIiwgImZjbGtfZGl2MyIs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmY2xrX2Rp
djUiLCAiZmNsa19kaXY3IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgImhpZmlfcGxsIiwgInh0YWwiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH07
ClsuLi5dCgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdwaW9faW50YzogaW50ZXJydXB0LWNv
bnRyb2xsZXJAMDQ0MCB7Cm5vdGUgdG8gc2VsZjogYXQgc29tZSBwb2ludCB3ZSdsbCBoYXZlIHRv
IHJlLW9yZGVyICZncGlvX2ludGMsIGJ1dAp0aGF0J3Mgb3V0IG9mIHNjb3BlIGZvciB0aGlzIHBh
dGNoCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
