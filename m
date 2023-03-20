Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873D3C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJmlxxGexszcz7L6CJjosrfngIQmLlZinr1n+bmejcw=; b=IcWfpOLCGNBlVd
	fxIS5mKTFnhjCoe6PBncYrGkCFhiY2N6WtGBoSLg00MW/6dCP5iprBosdg0h/lGcPS6NPaM3ZHt35
	IYmaWGrJ1PNgIdYH8xtZ1kC0JS0s+f8ZWgNaXLfQg5x4eTyzRMBhKbQbT2Uqny3PLNYVhSGkMx68d
	DwqfF6olFnAX6i+mvt/4vo+VhbLDPyyh9WXW3kSkCO1Z1UnY1noUmeP+6Oow82MqBUV3W61gsyREE
	e4O/7ByojzmBD6w0Z+YJQrtGSNRk6P1kT9KotskM6wTuAFR7ou4WUIwEXMgvjH+dqj+2kNP1RAD+0
	lVk2XLl9HMj14BLLTb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHcB-009ayE-0r;
	Mon, 20 Mar 2023 15:40:03 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHc8-009awj-3D;
	Mon, 20 Mar 2023 15:40:02 +0000
Received: by mail-ed1-x52f.google.com with SMTP id x3so48366495edb.10;
        Mon, 20 Mar 2023 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679326798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjfBd8LURFBkQCdmjFasI4BK9MyPMfZVc7ZkAGHyr88=;
        b=cuC3vyLjdxS4aJOpnFsyjzb1G4OFCfk1JCOE0a/2IgM+a2rkfQ79ipGDHj14qaNG5Q
         tRhYTA9pP5eDgwpb8xSUm32EA3fQPjAN7V1MG7UU+SXOksLA2TZYnhSjKV4dnn46RNyy
         Yd5PtN23/77DR8v3yNA8UR6rX8B5hg6F84Zu/XDk9ii893U3PH943WfW+zatpgn0PQcR
         WaFNBvP29dYRAFIxjANDty+1HtEP/NpYMM4T4mMQSdU625fZjVSvzRsusK/VCRYj9E04
         5+wZwnI4QQp2hCajwTfBZlk+9lC0nRvqzdV96GnI16QXvfbTmMYICejnUHJaZnslGlHe
         a4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679326798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjfBd8LURFBkQCdmjFasI4BK9MyPMfZVc7ZkAGHyr88=;
        b=CPUCp6PaHJSSy8fQwabWGFvDht+eYqhu8mRvSuFIWl88re8HJXc7HvkHNZsm3CoDSY
         s824iU1S5limIsEAgOu7rG0nvUYC3fjTdWRUPVd7uspnuC7mlVC6FtX7QfqPTmBfCG4n
         OaFclJF+SufZ2869RA5yeZQBrT/xk0hVQkYwKdx/wnWSfkcmevoMxR3drCFUD5Dbkk2C
         ++4Hqa0L+VFizLNiOGqqZm9oqXzr+qBEBq9N1zEJ7JngXyz0LapLKf3hEumoDg7gFME2
         6aHx+7xnt82lCrReNUgaGX+/RLLm+BYOCv8ytTtAIUw8/jKvax1TbfOSG9+gkdr4ADIN
         kDHg==
X-Gm-Message-State: AO0yUKVUVDoFSvcypef9VSb9WBpDyt/cJoiPuRnvRtySGA7Z2midZXRG
	Plbyjb739/Dq1Oettal4Hem/X3JXp4kGupgN5sE=
X-Google-Smtp-Source: AK7set/cQBOAzSg9oecwjRF7YkwtVtmfSxm23V2lUrmLZDrszp1xZ1Wb1UUB49bxl+AyY283GL+7LtnaTaMovp6OuMQ=
X-Received: by 2002:a17:906:95c6:b0:92f:41e4:e48b with SMTP id
 n6-20020a17090695c600b0092f41e4e48bmr3950471ejy.6.1679326797634; Mon, 20 Mar
 2023 08:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <d846047f-b714-3fd1-d8c6-9f774902fb9f@gmail.com> <6dbdf458-9f46-613e-de58-b4a56a6cdd9f@gmail.com>
In-Reply-To: <6dbdf458-9f46-613e-de58-b4a56a6cdd9f@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 Mar 2023 16:39:46 +0100
Message-ID: <CAFBinCBHLEAJo8r8kKU-Tou0esM0J=dnh-RO5heO+O9w0jRS5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] base: soc: populate machine name in
 soc_device_register if empty
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_084001_034264_2DE93B9E 
X-CRM114-Status: UNSURE (   9.98  )
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

T24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgMTozN+KAr1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgpbLi4uXQo+ICtzdGF0aWMgdm9pZCBzb2NfZGV2aWNlX2dl
dF9tYWNoaW5lKHN0cnVjdCBzb2NfZGV2aWNlX2F0dHJpYnV0ZSAqc29jX2Rldl9hdHRyKQo+ICt7
Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOwo+ICsKPiArICAgICAgIGlmIChzb2Nf
ZGV2X2F0dHItPm1hY2hpbmUpCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAg
ICBucCA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7Cj4gKyAgICAgICBvZl9wcm9wZXJ0eV9y
ZWFkX3N0cmluZyhucCwgIm1vZGVsIiwgJnNvY19kZXZfYXR0ci0+bWFjaGluZSk7Cj4gKyAgICAg
ICBvZl9ub2RlX3B1dChucCk7CkF0IGZpcnN0IEkgdGhvdWdodCB0aGVyZSdzIGEgcHJvYmxlbSB3
aXRoIG5vbi1PRiBtYWNoaW5lcyBoZXJlLgpCdXQgaWYgQ09ORklHX09GIGlzIGRpc2FibGVkIHRo
ZSBjb2RlIGFib3ZlIGlzIGEgbm8tb3AgYmVjYXVzZSB3ZSdyZQpub3QgY2hlY2tpbmcgYW55IGVy
cm9yL3JldHVybiBjb2Rlcy4KClNvIHRoaXMgZ2V0cyBteToKQWNrZWQtYnk6IE1hcnRpbiBCbHVt
ZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
