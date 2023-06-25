Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BE9EB64DC
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 21:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8lZUI2/2XwfC0X57ai8Kb763omW3UhH3YsL2Fjau28=; b=EOPN5LGBs8xwrR
	ZMzoVQUtOrk09aiZFomLXOMUpIGqphPTct0w+tllKsCyjKweDvUf1YZ/KbLLdPBcg9Z0rn74rXVx1
	LhuKeyWlEwUuM8Y26rYvBiqu6Vacr06f/cjhUYVH58dq4gQJrOUuRnooKiSGQ8Iz6VNm0wmkpiOCi
	S+ysmTkKnLpNIJHlc9LAlIT0fOz3ZuxpqZSrM18YotVMfGoZhylF5spbZApWk147L8cPxajnb5wVk
	Pyg2zRCWrNLXKpT5ofbTns8r3qMRzm7olJCaQRUQuY/2izlCwBL13htaaJnLCkku/5oENQbuhQXwI
	r0c0/hEwliZ1gada4r5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWxx-008ipw-1I;
	Sun, 25 Jun 2023 21:08:13 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWxu-008ioh-1F;
	Sun, 25 Jun 2023 21:08:11 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51d97ba7c01so636899a12.2;
        Sun, 25 Jun 2023 14:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687727282; x=1690319282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXLV4vlHgRblurGbsUNfZOWxcEKocikl7BI0LorFN2o=;
        b=C8SC2P9rHj755edoOtxc5j8w+LrILXSDmfvyygE2DPkqJuul2pP+IygQxoj+bvueOM
         +3vzJX074rgvz9lVM9ELJeAZ6Y9W+sNyQ92RLROKLG2JCXbVTtECrfdLMJyQwKitLzRb
         TUtABquz5c93Ofk1shnxd6Qwhy7ngTfpNgtQ/vEaKWM13gVCciui+UOHXekpaLp1m5NU
         p2RDitu/9ST1A+zV966fPPDfjeBqH+yMV/nCI3PQTkuvR1zF/ktyLTmStiJaFsaVLIoy
         VeF+QEMLkhY1YZF5ILar3vk+hgHpe4nAJVIVKzoEU+q4EbTdX0NnwODMh8BLA95w97sf
         EjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687727282; x=1690319282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXLV4vlHgRblurGbsUNfZOWxcEKocikl7BI0LorFN2o=;
        b=c6Y7OJm90lwsHrHPD8xjYhfi9T3pmVk2Gzx4+FY0NI+vFHc2JXiAe7ssYGq41pS3d6
         R3xPCQubvjI3yhnx63QRjsljcpSel/+vBILsg4WX6IA/Y//YTzB5V9Bvw7Cafnj+3URm
         R0idsFsXibScrOeZojRDkovVs7990qiKv7AJOmM484XiyV0Aa9SIhVqT0KMa/F8l4Hk3
         5W0ybIIPRyhW0QGGcEtH0HMHsY0rQGVQB4x5uFEKY6bwhZBAJipkC0EjsKfxJGqmM3Ds
         oFiCrT9lS4kDFabtCpEV/f2I6GV49OyLfpd01nqqxkpDQYhZKKw5Bj7YQnl4f4mkSojA
         sYtA==
X-Gm-Message-State: AC+VfDwYTUANsAGMma07m0vtmR1l/CkdW5tWQl8OCBbzOelqFuWR+T+b
	ToHzcd9G49N/VX7sMotNoQjTqwkv0bwAJhy5rvE=
X-Google-Smtp-Source: ACHHUZ66yMbvwXQLq2TOx+PDvqUL8KVT85zj9wD4oVpTV44CE9hREhfhvnG3dbD1Lti1brA8yVk9QqOQlZiEYKgsnEs=
X-Received: by 2002:a05:6402:12c6:b0:51d:8ab1:5df4 with SMTP id
 k6-20020a05640212c600b0051d8ab15df4mr2105710edx.21.1687727282228; Sun, 25 Jun
 2023 14:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru> <20230607201641.20982-6-ddrokosov@sberdevices.ru>
In-Reply-To: <20230607201641.20982-6-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Jun 2023 23:07:51 +0200
Message-ID: <CAFBinCD-5RD_iszZZRg58XqTHDEHnipJkf2aAex8MdUyh=bVCw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] arm64: dts: meson: a1: introduce UART_AO mux definitions
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, conor+dt@kernel.org, kernel@sberdevices.ru, 
	sdfw_system_team@sberdevices.ru, rockosov@gmail.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Oleg Lyovin <ovlevin@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_140810_440912_E2B7B02F 
X-CRM114-Status: GOOD (  20.07  )
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
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gRnJvbTogT2xlZyBMeW92aW4gPG92bGV2aW5A
c2JlcmRldmljZXMucnU+Cj4KPiBUaGUgQW1sb2dpYyBBMSBoYXMgYSBVQVJUX0FPIHBvcnQsIHdo
aWNoIGNhbiBiZSB1c2VkLCBmb3IgZXhhbXBsZSwgZm9yCj4gQlQgSENJIEg0IGNvbm5lY3Rpb24u
Cj4KPiBUaGlzIHBhdGNoIGFkZHMgbXV4IGRlZmluaXRpb25zIGZvciBpdC4KSW4gdGhlIHBhc3Qg
d2UndmUgb25seSB0YWtlbiB0aGUgcGluY3RybCBkZWZpbml0aW9ucyBpZiB3ZSBoYXZlIGEKYm9h
cmQgdGhhdCB1c2VzIHRoZW0uCk5laWwsIGRvIHdlIHN0aWxsIGhhdmUgdGhlIHNhbWUgcG9saWN5
IGluIHBsYWNlPyBJZiBzbyB0aGlzIHBhdGNoCnNob3VsZCBiZSBzZW50IHdpdGggdGhlIHNlcmll
cyB0aGF0IGFkZHMgc3VwcG9ydCBmb3IgeW91ciBBMSBib2FyZC4KCj4gU2lnbmVkLW9mZi1ieTog
T2xlZyBMeW92aW4gPG92bGV2aW5Ac2JlcmRldmljZXMucnU+Cj4gU2lnbmVkLW9mZi1ieTogRG1p
dHJ5IFJva29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4KPiAtLS0KPiAgYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kgfCAxNiArKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tYTEuZHRzaQo+IGluZGV4IDBlZmQ5MjJjYTdlMS4uM2ViNmFhOWMwMGUw
IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNp
Cj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kKPiBAQCAt
MTE4LDYgKzExOCwyMiBAQCBncGlvOiBiYW5rQDQwMCB7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdwaW8tcmFuZ2VzID0gPCZwZXJpcGhzX3BpbmN0cmwgMCAwIDYy
PjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVhcnRfYV9waW5zOiB1YXJ0X2EgewpPbmx5IG91ciBuZXdlciAu
ZHRzaSAoZS5nLiBtZXNvbi1nMTItY29tbW9uLmR0c2kpIGFyZSBmb2xsb3dpbmcgdGhlCnBhdHRl
cm4gd2hlcmUgbm9kZSBuYW1lcyBzaG91bGQgdXNlIGRhc2hlcyBpbnN0ZWFkIG9mIHVuZGVyc2Nv
cmVzLgpTbyBwbGVhc2UgdXNlOiB1YXJ0X2FfcGluczogdWFydC1hIHsgLi4uCgpbLi4uXQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWFydF9hX2N0c19ydHNfcGluczogdWFydF9h
X2N0c19ydHMgewpzaW1pbGFyIHRvIHRoZSBjb21tZW50IGZyb20gYWJvdmU6CnVhcnRfYV9jdHNf
cnRzX3BpbnM6IHVhcnQtYS1jdHMtcnRzIHsgLi4uCgo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBtdXggewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGdyb3VwcyA9ICJ1YXJ0X2FfY3RzIiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidWFydF9hX3J0cyI7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnVuY3Rpb24g
PSAidWFydF9hIjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBiaWFzLXB1bGwtZG93bjsKT3V0IG9mIGN1cmlvc2l0eTogaXMgdGhpcyBwdWxsIGRvd24g
bmVlZGVkIG9uIGFsbCBib2FyZHMgb3IganVzdCBzcGVjaWZpYyBvbmVzPwpJdCBzZWVtcyBsaWtl
IGFsbCBvdGhlciBTb0NzIHVzZSBiaWFzLWRpc2FibGUgZm9yIHRoZSBSVFMvQ1RTIHBpbnMuCgoK
QmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
