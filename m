Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24CCC67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06hC4Q9flcotPVt5unhL14rGAqIfIERyq+ApKur/Sz4=; b=SPBenpQMxWEjco
	H4Ro7JK3jUwnxWaW2aJQ3XWJCPIvRo9TJ38tyKiVLuTfqjjYAaEQuBivoSHQbSfnq774NIKNKzKte
	4eV2j0grRdbrdoOwlV7Vin7vvFGL4aXmzcpxdkWsBadX8n7GHPhBfFSbzSjhj2j2AV0bxH1b2FNUI
	c+E79VhElvMvUyx8zkEP4TeKL+ixfyDzg+1EyLIIIV192QZycSjO9uZDkinPt6YC068oqxKVRxVQY
	EeyYrEwtixXUeo0IdnON/YE18+0kPrFDAw+Ky1eBUi6TsdpNXI0WVakvkL9dUfRXqrQS7d5VT/h6s
	ohPx/9g2KSfTEb/JgJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsgf-0000000GKTU-2KsR;
	Mon, 08 Apr 2024 17:21:41 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsgc-0000000GKT5-39rm;
	Mon, 08 Apr 2024 17:21:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e3ca546d40so22463895ad.3;
        Mon, 08 Apr 2024 10:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1712596897; x=1713201697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CD+KxDHqdUb5j2VIVvwfKn0QC5O9nZf/3mXOmaOeTAw=;
        b=AF8BA9OZtm9w5qi7PIqmsiMTFMAhDddhKVo9XDNg3SNniZt4d1lFK5UrytORXUlICS
         swoiYOFrw4OplVGZG9vZdYhH2PR8DT4VGl3dVo5dAsFdcphkjfNVee/uJ9HUYbv+CWzD
         jVffLqyqASnvbPq9rzwiKmqrFBX1bNGHwe6FNit4o8uMYeCv4jMvMcaYt/TaBu1ChHaF
         BmlSCUjHJU3ZZRRcLwmnTUkELXMjV1l3mfTj3fvOAsit+aLIKkyl72tH/p6SA4AkKFoK
         itj1koUy3kZPLLmY+WsS/rW+zF3JLCTfxwiSKbFYE15xHhuEvhdl/8y7SgY4JYRp3mDp
         EQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712596897; x=1713201697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CD+KxDHqdUb5j2VIVvwfKn0QC5O9nZf/3mXOmaOeTAw=;
        b=bQT3Azh5+PBtG3loRPLMWOyaUQXl70FoCoApoXFiMKipSV4Zylx/wMFqeH/1fCvNDS
         hQqImMg2hSnaMRHpa8C9u4JbCG9xTUbm0XZGovjIamwN1oRpwE4Cg3Px685u5X3GbuO3
         vElV4dv/E8qtd9JewlrZNkca2hV6KEjLFi2uA+xEh4GIKT/gTb3+599TqlrDpk58xCtV
         SaBdxkQYbBsPASjPhagg2DF9cuNNcY0CS0GKcuGmUWXYMT+ElQ/7OSBSnoDueYsUUJRU
         ZPclL9BLOM3a84fwEYzc73YjvBWMAdH9/k21I6CvqwzaFu2BeQcO4NTbhdI3SVOBREig
         VWtw==
X-Forwarded-Encrypted: i=1; AJvYcCURw9d2WZvQq/X3JC2Yg1MLrONwcUtHNXRUl+TxMW5qGp0zXsx8R6rWuxPWW2z+Wpf1YHc9tezUsj2Goj/4BkaAbKpaOeh2GmW0hux29YngWb4RlSeyllTGufw7acCOXhgwmRcniuN3y1M4sDDXU9QGb88S8WRwCQ==
X-Gm-Message-State: AOJu0YwBRaySJyUxPega+e7nDbB22Hs2Jvh6artV/7ALzuBVVYMa6luy
	rHx+SE0ebWTy4Lg6nvHzLJmfXqRB3aZeAhUlUC35oiQ0dzdm8envRbsCWy/e+aKzP0R390h0s9n
	6Dahjg2PsSCBYB+m2BemBNmg3Ur8=
X-Google-Smtp-Source: AGHT+IHKVZXmaxUYg2//3d3GkHNXzmwnMizOwlMUFZ14NDcEJmhIn3JkJUCLgsKZlmTC21ybmfXcgXIAwiaCdHNERgA=
X-Received: by 2002:a17:903:32cb:b0:1e4:fd4:48cf with SMTP id
 i11-20020a17090332cb00b001e40fd448cfmr3779134plr.41.1712596896729; Mon, 08
 Apr 2024 10:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240408-amlogic-v6-9-upstream-fix-clk-module-license-v1-1-366ddc0f3db9@linaro.org>
In-Reply-To: <20240408-amlogic-v6-9-upstream-fix-clk-module-license-v1-1-366ddc0f3db9@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 Apr 2024 19:21:24 +0200
Message-ID: <CAFBinCBQtMHeQ2drNTJhqtknR32M1pjy+V3nQD7XFRiT8u4DGg@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: fix module license to GPL only
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_102138_838653_8F64679A 
X-CRM114-Status: UNSURE (   7.07  )
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

T24gTW9uLCBBcHIgOCwgMjAyNCBhdCAxMToxOOKAr0FNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEZpeCB0aGUgY2hlY2twYXRjaCB3YXJuaW5n
Ogo+IFdBUk5JTkc6IFByZWZlciAiR1BMIiBvdmVyICJHUEwgdjIiIC0gc2VlIGNvbW1pdCBiZjdm
YmVlYWU2ZGIgKCJtb2R1bGU6IEN1cmUgdGhlIE1PRFVMRV9MSUNFTlNFICJHUEwiIHZzLiAiR1BM
IHYyIiBib2dvc2l0eSIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
