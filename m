Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AD5C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Mar 2023 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1D+ugd8dtP7CTykK1+AbCCJxTEV/HLXY/ieueLwks9E=; b=So7xJXp14aC/7c
	WHQJo1YKe6HL67xr9HoKiks8h6dh9ARqnKE0jjCOd7iIklmBkQ9pq6kXuWMiQfhOPhXhxZGbHegzf
	nBN6hEkVt34y+2NLT4nBF0eS7usREEdJFvH49LNWIsnq0ypzDHG98P9dD2GYNXpw5UduPqZ5iBtqQ
	ACpdIqD69n2rIvQvjsUwSY+oVtVMtTCUjwQfs4YFbQjsyqnMSKUWuO98u0sh+djPFN6r9i31xOMmO
	fIMB06FmniEOCOCfTh8MvnOUM3rJt5lUUcw5bWcUPeyhmywN2x4S7jwYKYzT7CnE1gS3n5RJwvqyL
	TdcipYjKmFAG62TBaO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg3e8-006jCT-0k;
	Sat, 25 Mar 2023 13:09:24 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg3e3-006jBa-3A;
	Sat, 25 Mar 2023 13:09:21 +0000
Received: by mail-ed1-x52a.google.com with SMTP id t10so18042611edd.12;
        Sat, 25 Mar 2023 06:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679749758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqFjnFx5K8Nv2Fuhq+klMHKhOThHrV4yIw2s3Q8d08g=;
        b=JXSRUAnt1OWri6bUeTV+FNCCtT16Cg6s9TxLF5V9MuqXwsrrXdnKYHl/PYAzL1YZBL
         Nl7SQL22aXzSKvFNmnhtGdI1lESbZtNM03Wmkqe+5scBMGP+JpC3q3C9Y+psDHzluTHP
         PTpWgG4ARke/865E9JqE2qwwTKKTZwANNXO+R+B2U1oHdS8huD3pGQOnv6EGnhc6gHzT
         9655NRvFTJEv87eL6yLnLd3chBk+Jb80GSXGDu0UoTsQquw/0+KyuJitxX+tWH3OVUjc
         4dYmAvSI/ydqkAbHlVoNKPiXkbRCiEkSOqr/khojar3jnakguCEWWo6LkNn7I5T1+opa
         klbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679749758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqFjnFx5K8Nv2Fuhq+klMHKhOThHrV4yIw2s3Q8d08g=;
        b=xq8JiQweBVscRsBflcKx/+W3PdlM6NZ5Q37T0aa05nt+Mqw95WMeqdgA+nER6O6l6m
         5T543OMrLnWSeFblAJKSmRM8RxmzD+01ynFjMcRvPVwDCwOloATK89HgKaHlzNNC7Ycq
         /z9DE7oHwHggdNFS/Z3AMcva1HIjbZ9qWSYBWlAk9y54AGzKm6aN4sL1iJl222kWt1Gm
         KINh6VNltqbrG5MWF1PW11fkmi3lLdcVv+N5emm+yqVvOUwry1hnDfkIJ/65WFzFxnK/
         99dA4r+7BnuTDDUyBtuGyMhncNO4atT9rC0WCOeN8ghjCD9nGJUwoSzqibB+3boeH6fO
         Vdzg==
X-Gm-Message-State: AAQBX9cbdSxGhhE1zxSy9n7lAaon2xfy+1kPpDLfXczijjGLyxzEQjrL
	CXXA1Z+QzqMfaDtOG4SA1lMKm0UFyF8K/HYWaFc=
X-Google-Smtp-Source: AKy350Z4Tja2Mv3L7DZvT+QgRtp4V+RDFFrDnr8BDVPSnRX1CMd96wTPzzl5ZJNlA3HPIGJLkucy/FH68w064fQQTwk=
X-Received: by 2002:a17:907:a46:b0:920:3bf5:7347 with SMTP id
 be6-20020a1709070a4600b009203bf57347mr3796695ejc.0.1679749757656; Sat, 25 Mar
 2023 06:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230324074901.72506-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230324074901.72506-1-yang.lee@linux.alibaba.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 25 Mar 2023 14:09:06 +0100
Message-ID: <CAFBinCC3d78cd7vcrzOznFLfg7HE4+2DRN_aNYZe+cnvRw6VcQ@mail.gmail.com>
Subject: Re: [PATCH -next] nvmem: meson-mx-efuse: Use devm_platform_ioremap_resource()
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: srinivas.kandagatla@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_060920_040558_1C8AD02D 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgODo0OeKAr0FNIFlhbmcgTGkgPHlhbmcubGVlQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKPgo+IEFjY29yZGluZyB0byBjb21taXQgNzk0NWY5MjlmMWE3
ICgiZHJpdmVyczogcHJvdmlkZQo+IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIiks
IGNvbnZlcnQgcGxhdGZvcm1fZ2V0X3Jlc291cmNlKCksCj4gZGV2bV9pb3JlbWFwX3Jlc291cmNl
KCkgdG8gYSBzaW5nbGUgY2FsbCB0byB1c2UKPiBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3Vy
Y2UoKSwgYXMgdGhpcyBpcyBleGFjdGx5IHdoYXQgdGhpcyBmdW5jdGlvbgo+IGRvZXMuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBZYW5nIExpIDx5YW5nLmxlZUBsaW51eC5hbGliYWJhLmNvbT4KUmV2aWV3
ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
