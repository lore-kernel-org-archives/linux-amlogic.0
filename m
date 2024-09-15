Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C43C3ABA0
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iaJg3An1sMdYhacwlZh/4YZELUpN1MepACZruIsqhzg=; b=ZafyGl1NoETGEP
	E1riqbhlKNiexyUSLVsT+oN6X3VNXb0LgdQX2qWgfSIHsLLhAYovyTrAd0eo/ndl7qpV20V0zt6SJ
	pJ4O9y2Ou9ECctXWTDfPo8knsVbRffq77xISpelzah1JbDc7wbBRmhc/fSNRyb0dWX06hYadPRSR8
	DnvMPis31eEsSwWHxu/ykz0ntvF4ZdEqrY30qs3DYaQigqZ4TZGtDiT9u5O8DCtqpqe/+I85ivqwE
	/YXo2ZAEsCDUZWBli6vz+t9UOWL7S0QqpEvehV1CBkZu+IZZsFSD8i7UVAUqyrvfRGLYNeIFm7fqX
	1YCzXobKfo/WCHHrxWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spuoY-00000002ZAR-0CJq;
	Sun, 15 Sep 2024 19:21:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spumc-00000002Ysu-1Kot;
	Sun, 15 Sep 2024 19:19:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2059112f0a7so22211645ad.3;
        Sun, 15 Sep 2024 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726427981; x=1727032781; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=708lwLH8kgUldSdBrGUqEeMSf4JMAe+w/y2GfFKCtek=;
        b=EqNMQq88j4cLdg9B1jHaYzNRoCT03C4+23/AeEgeKutOEC9QXBJzx/kv/1T9vk7eX/
         9A3nB9qr9W6xhfBmx1ON170nClcXJjRbEe5rSkHQfg8zPJsJFHGqFfINzzMsnsVRr2Rr
         /x9Osk55a3rNyCyS5Jr4fy3de40QugO8dYxMnLGqwy+zA7ib9f/ZoXMOwSB4VSpf/cEn
         NlcvtpZf3q08jAKA7exrcGh7gn5e8v1fV5/6dCWdseiKW80QRT99xhUwe/wGtxE9eefz
         pSgBKazchNquWKCGOJxHuQxJS61gGrkHpDAZGI52UdKMbEzlaTtpCNO9YAxGsIEdIRtp
         BXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427981; x=1727032781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=708lwLH8kgUldSdBrGUqEeMSf4JMAe+w/y2GfFKCtek=;
        b=exNXbaYfJbIiMjhAurO4GkTqNyrwiJMPWMgBufQNbPFzyk6dq2LxmjYk/d51RdaeFD
         l/xJ/FR5n7VukVOXtL54XDs0tmCTB5+2G2p7jpbz9A/NS3+zSBYvkNEGPVPZAcNea4us
         ONoqOv+xaLemhzq4Bsc06nTUgI8y4s40NWJ7i4I/bYr3QPKYVZsQpOug98b/CZpsD8o8
         C5YQX5BeA0hinaF7ANFO9k6nk7NTaH53FK8i12R/BZRUcjPGNYh8+B0MUnjbV50g1JMN
         ullqrF5otAuqebhbVX5JeAl65kIO+vyFPSu7K4BfmIHtA5ZbMi+4dZIKF4Bi56SxihVq
         90jg==
X-Forwarded-Encrypted: i=1; AJvYcCVMG5I8HK6Ass8uJJMbJbrDZGmIhGaqNX21Lx2x4LokYATVjjSkIIWOpE9JiZ/mGvh6w+qXN+XKrnHwPqa1@lists.infradead.org, AJvYcCVT1Q5rbC4/BByUvz3I6/MyBVvWAJ1g/oBRywPaKJEx/Q21ZZl42hW67Xc50Xwr0V9c7CyzpZkU6jFSPcq3eYttzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLS2tg3GDEGIGA7ZTsGn+gf9kx0bmx08AxZfTTHgW+IDsK5fKA
	8yOBmBu2ybkJwS40Q7MI2M+Tgrm0LjN8s0arKbKociepdxVLDvK9EAd1hE4+ogOSk5AM1RPwFA9
	kHhe1Vw5aZYIDtOCdIU98NMFdLu8=
X-Google-Smtp-Source: AGHT+IHvTue3VPXMSdl6CALOVywCiXPbGmAkNLVju0FBZP7eje7azk2mvkyRC+3iQA7yFj3s5hKMfwKJ5dqWQggVy6k=
X-Received: by 2002:a17:902:d4d2:b0:205:560d:947c with SMTP id
 d9443c01a7336-20782967acdmr109283835ad.24.1726427981429; Sun, 15 Sep 2024
 12:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-amlogic-hhi-sysctrl-v1-1-b8c3180b2fba@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-amlogic-hhi-sysctrl-v1-1-b8c3180b2fba@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:19:30 +0200
Message-ID: <CAFBinCDYd0X-Bs18dOwT0DN789qxMTip9SHSpo3J5eXTOZwJdQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: adc: amlogic,meson-saradc: also allow
 meson8-saradc to have amlogic,hhi-sysctrl property
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_121942_375806_8BE1732A 
X-CRM114-Status: UNSURE (   8.56  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgNToyOeKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IFRoZSBTQVJBREMgb24gdGhlIEFtbG9naWMg
TWVzb244IFNvQyBhbHNvIHJlcXVpcmVzIHRoZSBhbWxvZ2ljLGhoaS1zeXNjdHJsLAo+IHByb3Bl
cnR5LCBkb2N1bWVudCBpdCBieSBhZGRpbmcgdGhlIGFtbG9naWMsbWVzb244LXNhcmFkYyBjb21w
YXRpYmxlIGluIHRoZQo+IGFkZXF1YXRlIGFsbE9mOmlmOmNvbXBhdGlibGU6Y29udGFpbnM6ZW51
bXMgYWxvbmcgbWVzb244YiBhbmQgbWVzb244bTIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFy
bXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBC
bHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
