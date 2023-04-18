Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C183C6FD18
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Apr 2023 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xsej40hE7MSJcSMY2RymbBXozObR3dAUqVdrS7E5Mao=; b=gUWLSTgBLZx3/p
	d11PtEPTVypFxrjG1S1nzw8UcRpi9PVrRFUVPT8O4XwwdOcZIBusGNMk9ee19VhtDsUCH97XVOih2
	HQ2ZdAR9Iu+s8Bg2Af2dteQHdeUfa3bX86ZQZ2vXtgX7OEl8GHmHyzUWlPpYz7gqpKHOStLUpWDHJ
	WfDceoDm1RnYmWmlm3X6wtwSTpQjbtwuvf7rGogLQH1nlKSQHDXVmZzQUQqvfBoC6eXhaBIaAeXX1
	eZErNV+ApkIbkH6IK5R7W1VTm1bXFY2XBkRxqZnzKtZ/NCZDdsvTzxWKeLor9T6UPF+sGUB4vEht+
	vXQNWyY42Vh5fWh21MLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poqBw-0035IF-0v;
	Tue, 18 Apr 2023 18:36:36 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poqBt-0035GA-0y
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Apr 2023 18:36:34 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-24796e21f99so1061005a91.3
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Apr 2023 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681842988; x=1684434988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApsPN1GAt+bKSjbs42LxkANlc6ClVgqELeBRCapEZOY=;
        b=fcvQ6uiiAwbiDHp9ofdozAuOiqo8sbjEaS1wJfZPJdR7ku/k91ggC43xkhzyyW+7nI
         yL05D8fKTVowBu7cH7oGSbwvorwMmpZfZp+be71T12rL9TRGAsRKhgX9BtbLc+iyZwgq
         Qb48G1rKzQZjLEUD5f92333ozX9LrkHTarpi26AV6WxfUdF8E317PyK+GRvYlhJDse5Z
         MEZRohJ9XuAxL4kVb0Aft7cnNRU1ffRIyB+Hpuwglq4gprdj5r075/QYekStmw9Zcc7e
         uJaoVEg0RaJ6z9kkri0qCgyEJPxz6DZVa/1Zx09Yl/HmHiUZVgIL62G/nueZQ1DngeXx
         2F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681842988; x=1684434988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApsPN1GAt+bKSjbs42LxkANlc6ClVgqELeBRCapEZOY=;
        b=dLUQW3ZbwKwLOd3GKQ5GNisb458681BvqQ12PFwWSoLllkAq6ZvG5i7kcGt7PzOLYk
         ltcgrLEmP0H/hkswpSQi1nV+wcVwfttAekoLPsjf1fRz+XTYxTG5Yo5OIY/o4EUt7g1g
         9HwRMfcyR9iC7pTaAI4gfsv4cZGMB4GBsCxmerRKMjbTbM6bw05h0BKeMuVUSqzkPV3r
         f+SVJxNPL9yTM3UXV56TUHx2w2IhcpJV4cfT1a9+lpkOSZ1vGdK+SZJyJcFyxJxEnLF4
         /GTX1Idxf4NZFoNQt+V2CAcaoYszMbjuyOxZ/BZNqf5EbhZzj3f+7sG3jpNkHXesaS4O
         GRig==
X-Gm-Message-State: AAQBX9cPVOmqTXBXMVC3KveCcINfaiYjRTQs4UxY72dEL1vIqaOzU6Br
	eH1yRZJ6MhJYT1nxh7KCVyfnSptPbXVT2c9dhEiUgg==
X-Google-Smtp-Source: AKy350ZShnO2tG7T/57z/jUzMW01PDWOatg+RwsX6uSLq6+zwhs8lAyWd6JaHE6qNghBF+/vCyIJp0/ga1bkMCOPgjE=
X-Received: by 2002:a17:90a:d70b:b0:246:ba3f:4f3e with SMTP id
 y11-20020a17090ad70b00b00246ba3f4f3emr605102pju.6.1681842988421; Tue, 18 Apr
 2023 11:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
In-Reply-To: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 11:36:17 -0700
Message-ID: <CAKwvOd=DeCNoQYuTJVfbd0tSddJpGVaKBTEfC-+XUN4OJ4hRRw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-meson8b: Avoid cast to
 incompatible function type
To: Simon Horman <horms@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Huckleberry <nhuck@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_113633_338422_B1377E5A 
X-CRM114-Status: GOOD (  16.40  )
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

T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgNDowN+KAr0FNIFNpbW9uIEhvcm1hbiA8aG9ybXNAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBSYXRoZXIgdGhhbiBjYXN0aW5nIGNsa19kaXNhYmxlX3VucHJl
cGFyZSB0byBhbiBpbmNvbXBhdGlibGUgZnVuY3Rpb24KPiB0eXBlIHByb3ZpZGUgYSB0cml2aWFs
IHdyYXBwZXIgd2l0aCB0aGUgY29ycmVjdCBzaWduYXR1cmUgZm9yIHRoZQo+IHVzZS1jYXNlLgo+
Cj4gUmVwb3J0ZWQgYnkgY2xhbmctMTYgd2l0aCBXPTE6Cj4KPiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVzb244Yi5jOjI3Njo2OiBlcnJvcjogY2FzdCBmcm9t
ICd2b2lkICgqKShzdHJ1Y3QgY2xrICopJyB0byAndm9pZCAoKikodm9pZCAqKScgY29udmVydHMg
dG8gaW5jb21wYXRpYmxlIGZ1bmN0aW9uIHR5cGUgWy1XZXJyb3IsLVdjYXN0LWZ1bmN0aW9uLXR5
cGUtc3RyaWN0XQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9p
ZCgqKSh2b2lkICopKWNsa19kaXNhYmxlX3VucHJlcGFyZSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiBDb21waWxlIHRlc3RlZCBvbmx5
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJuZWwub3JnPgoKVGhh
bmtzIGZvciB0aGUgcGF0Y2ghClJldmlld2VkLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVs
bmllcnNAZ29vZ2xlLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLW1lc29uOGIuYyB8IDggKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZXNvbjhiLmMgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZXNvbjhiLmMKPiBpbmRleCBlOGI1MDdmODhm
YmMuLmY2NzU0ZTM2NDNmMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1tZXNvbjhiLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1tZXNvbjhiLmMKPiBAQCAtMjYzLDYgKzI2MywxMSBAQCBzdGF0
aWMgaW50IG1lc29uX2F4Z19zZXRfcGh5X21vZGUoc3RydWN0IG1lc29uOGJfZHdtYWMgKmR3bWFj
KQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBtZXNvbjhiX2Nsa19k
aXNhYmxlX3VucHJlcGFyZSh2b2lkICpkYXRhKQo+ICt7Cj4gKyAgICAgICBjbGtfZGlzYWJsZV91
bnByZXBhcmUoZGF0YSk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgbWVzb244Yl9kZXZtX2Nsa19w
cmVwYXJlX2VuYWJsZShzdHJ1Y3QgbWVzb244Yl9kd21hYyAqZHdtYWMsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjbGsgKmNsaykKPiAgewo+IEBA
IC0yNzMsOCArMjc4LDcgQEAgc3RhdGljIGludCBtZXNvbjhiX2Rldm1fY2xrX3ByZXBhcmVfZW5h
YmxlKHN0cnVjdCBtZXNvbjhiX2R3bWFjICpkd21hYywKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPgo+ICAgICAgICAgcmV0dXJuIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkd21hYy0+
ZGV2LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCgqKSh2
b2lkICopKWNsa19kaXNhYmxlX3VucHJlcGFyZSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2xrKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWVzb244Yl9jbGtfZGlzYWJsZV91bnByZXBhcmUsIGNsayk7Cj4gIH0KPgo+ICBzdGF0
aWMgaW50IG1lc29uOGJfaW5pdF9yZ21paV9kZWxheXMoc3RydWN0IG1lc29uOGJfZHdtYWMgKmR3
bWFjKQo+CgoKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
