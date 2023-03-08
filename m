Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35A0C6FD19
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLc/jA/w5HwhE64woIZiBOFE31Ylell77Rxcxor4bmY=; b=woy847K7sH6py1
	88Psl03a7gcmlv9knBY/z1fc845BsVkMb6iE91zFR0/f+aFbx78k2TE+lOSMOBBEavyhE3OjrYHoE
	tGUOIyfvVXuFePbVrji4tlHJ4CZl4eiGmICdjSAT1RdSr/boJP6UgPu0sJH+HrkLTOrf+BOdLX4eP
	g3OVmhhPg8b9cIThx0WyFIuoqEsjSKbxvJRfmodwuCe/7cZz1vYnxVD00aq4kGs2h4Ovngy0TNnvP
	ebODabz2kYpbJHyMe41b/lq0XyZJG7mHsbyDjvGgAlxgwvO5KQZlZFi31w/JnYkApldluDTqEmzPb
	mE3dwgy1azYw4rP44IKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1Hp-006pW1-RH; Wed, 08 Mar 2023 21:25:25 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1Hc-006pQ6-T8; Wed, 08 Mar 2023 21:25:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id cw28so71249391edb.5;
        Wed, 08 Mar 2023 13:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678310709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEQQ5y1rU+jovQ+RQSf9fz570XBj+oRwE2jbrv64UoU=;
        b=fABAaGcHA/JuPb3YorxwiN0BG3dM5Jrc4WdT1Gn7VVAIfLK3U7vLy2EJ2Xp4Sm17ht
         29Ifww1kkszG+k5IqQjNXr/Mh5ersO6r3HKPR8x/3nSdp5b7MEn1Oh9LxJdNgSgUt7Fl
         00uwgKmEnn6RZ8oNQrbBdUzNMagOg5I6IRSSCvMEIjN4ZKVAthF8L086oMxrZSu8o/6R
         tWkU4thGaBUQh3WI3aioiNUlcoSyrAnqsfM7+jKYyfdDBBnjG8Q5NklbJTXNuRjZ3wZP
         gf4+bqoKx3Q67FM331Ro0JSoBkcv0c8KBOp69zIl1rcqAYGGsyyVaDC6OWz4sHljtaM8
         Zeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678310709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEQQ5y1rU+jovQ+RQSf9fz570XBj+oRwE2jbrv64UoU=;
        b=FusfojYWmN+iFave7MYniz3Uv+IFBcykeqJ7d4UnWFaD8WeFMKL05oBODmrHGzT9M3
         oFWnW0jS8v/5QqFwKyub1HZ1OZX7nhswaWohuP6T1nne9ktniHOIP0LTkrqj7QtYR+1K
         pdk+O4n5zqd6s/6yh9WaguPfIn6GR9B+TfD4vagvRYe2x7Jpka8WBn8yy2RDO1aON8hk
         kpkrvBce5BV8Fp5C39zDsaxWH3I8PNtfQrpuzT5sfKrd8zbI2L4qW3Y6noWssXiPg+0j
         t+6lQaXk27emw90isaT1NlEcsZ1zcnA24OqzZICiExkdL/IjhN2QIKMmDAL0S/T8U7Ej
         fLLQ==
X-Gm-Message-State: AO0yUKW3sznccpBxT5Eu71JF/iBuSU3B8WgLRXXpJ1WjdG1Ff+kyrRAX
	fXcz4JO9tozswPs4rb2XHHrOVpM4lh5GWBZdFtU=
X-Google-Smtp-Source: AK7set9EbJ+kG0WoXhSVXEi4hP8885ePLJPbBRoToqjisvKkiPtNHvmh0Nsh0/o4zHrybOasiIZDvzc3QK81g6iwFc8=
X-Received: by 2002:a17:906:ce38:b0:8b1:30da:b585 with SMTP id
 sd24-20020a170906ce3800b008b130dab585mr10042710ejb.6.1678310708691; Wed, 08
 Mar 2023 13:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v4-2-34e623dbf789@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v4-2-34e623dbf789@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 8 Mar 2023 22:24:57 +0100
Message-ID: <CAFBinCAiS_1nJyPb1+disehZSJTe=ES72pDTeKxazUdpzX+VAw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: nvmem: convert amlogic-meson-mx-efuse.txt
 to dt-schema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_132512_998482_EC6205E1 
X-CRM114-Status: UNSURE (   7.17  )
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

T24gV2VkLCBNYXIgOCwgMjAyMyBhdCAyOjI34oCvUE0gTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gQ29udmVydCB0aGUgQW1sb2dpYyBNZXNvbjYg
ZUZ1c2UgYmluZGluZ3MgdG8gZHQtc2NoZW1hLgo+Cj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5
OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6
IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
