Return-Path: <SRS0=+M4W=GR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E4DC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Jan 2021 10:03:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C513623A22
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Jan 2021 10:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C513623A22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5qs8wsYRmz1u7v0vd808XV2/gFxujXSU5nr3ihLyQvA=; b=h/g/jD4e9FvLq4mLwv2U3BPUL
	oNSjEFHThtibJ79+WC3Djn3mVlD+g6LtLWnphbJfyUeCv7my5eWnK8KpWiCiJgwVvRrck+WZOYp6e
	4LvPdvM1YcFVJy7whFzXIesvLMyjKYdrfte6oFGXUMMbrJZ4CtfyoGqTJ5o9RZMAl9SONkETZmZv9
	6JwqNOPKTE9LtUfWqPrquoJrXBMQ3nWChiS44JQ5h7ArWWRqrjVhv3qHYAKlDDL0vqx5Edk74e5QA
	nR75b8asc6ZM10LNys065WJWy7fwLgHGXG84CKJ8YydrqEAqv/ce7f1fAxARs3aU7oG7DYVBu9mPf
	4BbmlGoDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzzTN-0005Un-C9; Thu, 14 Jan 2021 10:03:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzzTI-0005Tr-Hs
 for linux-amlogic@lists.infradead.org; Thu, 14 Jan 2021 10:03:18 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r9so1568452wra.2
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Jan 2021 02:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oVf5kDc7i4gGrzg222CFywiTCholDlEVEzBooRbeXN8=;
 b=lNr9TM2KRK50yFUSVqvQRC2+d8NR6/ezTC8nz87RztuEm0sg8oFVZ8y/GwJu5fmbuy
 fYHUI2RWogLsikN9SnHQipAiHDGDc1iscx3mN0jbaxwjTcDQ0ZVtTW8fUsLtiGBQW1Q1
 AKfeQ1ODq0/1MA3AOJBalS1gNW0n1axzkT2WZXyba4RRsLVzZn2saNJpv/dEYHRUicJF
 cy5rlCwzCpe0zLOzmTd1UhR5H8lUdW/NIPwujCtBAv7zdrfaCFXLG4Tew5MNdkvkGGm0
 1fvVpBLtBl0dMLy8xB3oQ4gsFCDJ3uv0n491bAWkFkP/SVR3QtNXDcjHubOMox2quEnn
 hbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oVf5kDc7i4gGrzg222CFywiTCholDlEVEzBooRbeXN8=;
 b=HAV3Ykq0C2dN2poRWYQJ+l27IoZHK4QRQatC3JlxgiLSeL73R93E6z6Cn1A7pTq/Kv
 59bYc0SLC3L5Wcoey29m5rJmm6/CAXL+1uAttKqIuYQzmAwD9PcPzpsyeeEI1OC0japu
 sJNb5Ug+AKoT3HfW10AotVuw3GVCmEcNrw9HuKCMON9OOHGyjEUY2jJPcATvl/wx9vGJ
 8nGcZq5MOnXtfx1J1VJJSwh0xZ9hSJHXaWtcRwhh9fXuRdcCGtTDRl8tvEe68hY7UIqH
 rw9f6eQ+5PiktWZCd4mXaT2h8E4ZkZR4zOvP+UK8uydhqRcr9+FFf4Ept+dAK7VB7Eqp
 HWAg==
X-Gm-Message-State: AOAM530GlpVjEfHCaJ37xyBIPRDpCm1kK7OY9susde7I0tFavLjn85Oc
 mIxzSa7qB22ecLGKNZJGTj2Wcg==
X-Google-Smtp-Source: ABdhPJx/ZTFqNdbwMrPPQXGb4a5AARaWdvmncwYK2q1w7//JoVyn/n68+kesxeF+gvUR8rMoynCXCw==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr6917001wro.231.1610618595259; 
 Thu, 14 Jan 2021 02:03:15 -0800 (PST)
Received: from dell ([91.110.221.178])
 by smtp.gmail.com with ESMTPSA id b3sm2474771wrn.70.2021.01.14.02.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 02:03:14 -0800 (PST)
Date: Thu, 14 Jan 2021 10:03:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20210114100312.GL3975472@dell>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228163217.32520-2-post@lespocky.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_050317_301420_80CFF986 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyOCBEZWMgMjAyMCwgQWxleGFuZGVyIERhaGwgd3JvdGU6Cgo+IFRoZSBub2RlIG5h
bWVzIGZvciBkZXZpY2VzIHVzaW5nIHRoZSBwd20tbGVkcyBkcml2ZXIgZm9sbG93IGEgY2VydGFp
bgo+IG5hbWluZyBzY2hlbWUgKG5vdykuICBQYXJlbnQgbm9kZSBuYW1lIGlzIG5vdCBlbmZvcmNl
ZCwgYnV0IHJlY29tbWVuZGVkCj4gYnkgRFQgcHJvamVjdC4KPiAKPiAgIERUQyAgICAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsZS5kdC55YW1sCj4g
ICBDSEVDSyAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LmV4
YW1wbGUuZHQueWFtbAo+IC9ob21lL2FsZXgvYnVpbGQvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsZS5kdC55YW1sOiBwd21sZWRzOiAncGFu
ZWwnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ15sZWQoLVswLTlhLWZdKyk/
JCcsICdwaW5jdHJsLVswLTldKycKPiAgICAgICAgIEZyb20gc2NoZW1hOiAvaG9tZS9hbGV4L3Ny
Yy9saW51eC9sZWRzL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMt
cHdtLnlhbWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgRGFobCA8cG9zdEBsZXNwb2Nr
eS5kZT4KPiBBY2tlZC1ieTogSmVmZiBMYUJ1bmR5IDxqZWZmQGxhYnVuZHkuY29tPgo+IEFja2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+IAo+IE5vdGVzOgo+ICAg
ICB2OCAtPiB2OToKPiAgICAgICAqIGFkZGVkIGZvcmdvdHRlbiBBY2tlZC1ieSAoSmVmZiBMYUJ1
bmR5KQo+ICAgICAgICogcmViYXNlZCBvbiB2NS4xMS1yYzEKPiAgICAgCj4gICAgIHY3IC0+IHY4
Ogo+ICAgICAgICogcmViYXNlZCBvbiByZWNlbnQgcGF2ZWwvZm9yLW5leHQgKHBvc3QgdjUuMTAt
cmMxKQo+ICAgICAgICogYWRkZWQgQWNrZWQtYnkgKFJvYiBIZXJyaW5nKQo+ICAgICAKPiAgICAg
djYgLT4gdjc6Cj4gICAgICAgKiBhZGRlZCB3YXJuaW5nIG1lc3NhZ2UgdG8gY29tbWl0IG1lc3Nh
Z2UgKEtyenlzenRvZiBLb3psb3dza2kpCj4gICAgIAo+ICAgICB2NjoKPiAgICAgICAqIGFkZGVk
IHRoaXMgcGF0Y2ggdG8gc2VyaWVzCj4gCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvaXFzNjJ4LnlhbWwgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpGYWlsZWQgdG8gYXBwbHk6CgpBcHBseWluZzogZHQt
YmluZGluZ3M6IG1mZDogRml4IHNjaGVtYSB3YXJuaW5ncyBmb3IgcHdtLWxlZHMKVXNpbmcgaW5k
ZXggaW5mbyB0byByZWNvbnN0cnVjdCBhIGJhc2UgdHJlZS4uLgpNCURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LnlhbWwKL2hvbWUvbGVlL3Byb2plY3RzL2xpbnV4
L2tlcm5lbC8uZ2l0L3dvcmt0cmVlcy9tZmQvcmViYXNlLWFwcGx5L3BhdGNoOjM0OiBpbmRlbnQg
d2l0aCBzcGFjZXMuCiAgICAgICAgICAgIGxlZC0xIHsKL2hvbWUvbGVlL3Byb2plY3RzL2xpbnV4
L2tlcm5lbC8uZ2l0L3dvcmt0cmVlcy9tZmQvcmViYXNlLWFwcGx5L3BhdGNoOjM1OiBpbmRlbnQg
d2l0aCBzcGFjZXMuCiAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAicGFuZWwiOwp3YXJuaW5n
OiAyIGxpbmVzIGFkZCB3aGl0ZXNwYWNlIGVycm9ycy4KRmFsbGluZyBiYWNrIHRvIHBhdGNoaW5n
IGJhc2UgYW5kIDMtd2F5IG1lcmdlLi4uCkF1dG8tbWVyZ2luZyBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC55YW1sCkNPTkZMSUNUIChjb250ZW50KTogTWVyZ2Ug
Y29uZmxpY3QgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2Mngu
eWFtbApSZWNvcmRlZCBwcmVpbWFnZSBmb3IgJ0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvaXFzNjJ4LnlhbWwnCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBU
ZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0
dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
