Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65A1C43458
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jul 2026 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+v7u+TFsrhdMprV5LSkui+CsjFBpkXs0/PdxdY7RDMA=; b=vaS/Cof0Ope5xY
	P04TEGXyiUO+67f9HuWoxNC9HGcy7ZWmiYakxrI6qG7oZ6HgqxHbGZpwEfSENm25YD9zJelQlLU0v
	io0Wwn/30R4JVmiiS48fkwzPu4GpzMi3p87WwjOK+w0Zvnu6k7zmLwbfO/tY9W8gCNMYlKtrfsNCn
	2bJPhOGvGLo3I2Oi8V01v8/g3CckA6u+Y/4tpmTC18wsKd/7yUn7GXcqTb/BFp9lL817My7Az6qvs
	yJStJZWO4ERlMB/xrAV6/pPSLki4Q9tWKSqjj2PPBV2l2aFxEllIAvxyqY3n/aIqZXjFrYmqmy0o5
	QJcMi4LR8FHg5tJZrs5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwZi-00000007b2P-12pz;
	Sun, 12 Jul 2026 15:58:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwZf-00000007b1R-1QrM
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Jul 2026 15:58:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cace91f112so19248995ad.0
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 08:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783871914; cv=none;
        d=google.com; s=arc-20260327;
        b=bomVaEoyTlvQqQEweRzUpPvwLAxik4fl8CAKaSsuYRytJkCs70priy7ub5HQQAVT+v
         P0ewsUKtpCynQuq6w0L/g7UGIm3o+eTa328BZIeoSNuIT9mXvuYjmlobRQyM+c3ecai/
         iEzovSQ5ATZWMq6rrgrXXrhR1fkeXzYEcuamU+mvUB0KjGPxl1Kf7JxN+l/cNvltb+/v
         0T+QCz9WDeeMWlipFDThRPCwp8AALgk3pm2T1KYtnYJ/B6lK//BpurpoMi8nW4l/SAFz
         OfzRHgCqC6SehPcoQ75ZPDQfz6vyOMps0AC2quBcum8JGJhUYpQ1UKOKptih2qHb5tdc
         DdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2qoHPnf7RHTkFcOSnpyDI8RpBT/XeamlmMbf/yeH5Pg=;
        fh=Ooc4UBvqknDxUm3vebLSzvEtVHnGsZwjHKgzAwz2gic=;
        b=NOAS4ZBp3HXEARflrtvVqFxDZxvKJvdZeoKVbE87aicWoA0a/j7omVeg3fzXaKLNJ/
         uwp1g93CpT4Usa/Kr1YMyvd26eDj41BjD/P9jbX0abzPxn4OU1wTj+w6mzEydwZwIYm3
         Ff4DbwcRc5LKE0FagKT1SXu9pQHlrT+UYw799D517Bw+YLsd5kqFK3TwIjQJxbkIAVvw
         X+R0E3XUUpk7AgpLeYUOM+GC/XUMUlUFlCDdz06bPO7WDpPzeBzY21WNg2qeaXEB+wKC
         RhBTBhDj+oOv5DklJweh4uVkGQW7s+wMwgSASqvHU7ufPh4y19b1BLuUWRFoKKJ2h2y6
         5t9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783871914; x=1784476714; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2qoHPnf7RHTkFcOSnpyDI8RpBT/XeamlmMbf/yeH5Pg=;
        b=n8zjbCGk2Jvn/N5d6mcwXqQz4Hw94X7H5vIB3zpw0aDh7NrWHk5l84t6WgwyMdCLSa
         13oFCpi5X+6ouux3Ofma6s0JjXnzw8YA9AoSVFtE/+R30eoZ9MTWDk2e/Z9tgb8GeYy/
         E7lZtHqLRd7HjWxo+EN3/WAZwH77iDBtstiZg1ScYGBnzu+/ygFqqBU5jCw3+RM6fgHL
         skbiomeZvWpTM6GQdL7+W5lBauoYdLlHgaTcviwU41lY3GoOIR6WAV/YOoRncbeealXJ
         txiZgu6kcw1cI7qH1S2TryqgAvkfT/4We67Ois0XjwT9uaKeknakupkgU49tQ76gh4WV
         imsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871914; x=1784476714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qoHPnf7RHTkFcOSnpyDI8RpBT/XeamlmMbf/yeH5Pg=;
        b=Mitd9DbCfOQWL5vAT3RUycoZsHeaafNsCmZ3It6pdmJ4T43wWfb9tEE1phNMgSqodi
         PnJEUgx5DgylrEXDoOr+X/lHyjSCGIGoLQVFKY2wqIjjcprczfCzEjS1OMxoeXKXJN8j
         V5A6EhFoKKTYY81FH+FG9jlcEpA/k6wzfViMR1Y+NusIisPyVGJWWOH1ptiQuXn62EWo
         Zl6L5yZ9cFpK+8cEifOq8DYygb0TbxzuaQAzGCFQc7vx7kG3rEHNh9+giMuv7Tlg8yMC
         09jD4cR2aLPtdg9li9FeukhQuN31JGSevrlgUv1SF81eMVyncMQlSr25+0E3/3Ac/RDx
         szzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5nDCGDypTSVuiHTSSqbTn4BuoqPp8kb8XhxV5/gL56QVuIo/j6yr70bcfdBL1CWnojQ+ODYvuuHFgAyev@lists.infradead.org
X-Gm-Message-State: AOJu0YwxJO2lGJNTXDEcNVtrg7aPCu7bnV8HlAvfUjRiiiJrzaK/pOPW
	IhXOSAN5ihpuI8fqWd8CYhBS3Ekne1FdUZ5NwutuTnAE4b/+3KEC1AT+1X1Jj8GABammVS6EiRf
	Ape9DlrfkujVK07Oem9R2L19rKrtHe5s=
X-Gm-Gg: AfdE7cnZPVVsvkjEqx3LgqdUGixewMPp5U2hhAZBUKfCu0m9GB7bzhNRnqt9vv6J0fp
	MsPNcoiTcswkU3koFmF9grkPf5JUiO8EnlHDYnkc6g0XI6id9UiOfRTbspcDWx1MU42ND+5wKIV
	vkkbgVOEiGNvKL84RVXrpexQHaxoGNlSUimdLhZ9bjyH9uT2HDz89+1FtTd58fHV7Uq7Yaok6Ay
	C+n9AqIgqR0kyRC+7W1aAR85JdGvSXTX5tKc3lgq7ChJGYdFyc63FSJ4SLwo77lovyehA8lYZG1
	nOS+O3H1Rst/Kx/JNekcUcTt5D4YFA==
X-Received: by 2002:a17:902:d987:b0:2cc:ae2b:b6d2 with SMTP id
 d9443c01a7336-2ce9eac1d98mr62500805ad.15.1783871914381; Sun, 12 Jul 2026
 08:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jul 2026 17:58:23 +0200
X-Gm-Features: AUfX_mxcpSIQ4DLxW6ZIvnxFvpspk6KaYmziRMf8gxBgAEDT5L34RLygHbWHhs8
Message-ID: <CAFBinCDvwvc+qO-_-XUUf9orypOL1XJo+nukC4ZXnB7UtKMj4A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop redundant $ref of
 firmware-name property
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_085835_381033_8D462ED9 
X-CRM114-Status: UNSURE (   8.09  )
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

T24gU3VuLCBKdWwgMTIsIDIwMjYgYXQgNDo1N+KAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgRFQgc2No
ZW1hIGNvcmUgZGVmaW5lcyB0aGUgdHlwZSAoJHJlZikgb2YgJ2Zpcm13YXJlLW5hbWUnIHByb3Bl
cnR5Cj4gYXMgc3RyaW5nLWFycmF5LCBzbyBpbmRpdmlkdWFsIHNjaGVtYXMgZG8gbm90IG5lZWQg
dG8uICBUaGV5IGFsc28gc2hvdWxkCj4gbm90IHJlZGVmaW5lIGl0IHRvIGEgc2luZ2xlIHN0cmlu
ZywgYnV0IGluc3RlYWQganVzdCBzZXQgbnVtYmVyIG9mCj4gZXhwZWN0ZWQgZmlybXdhcmUgbmFt
ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQG9zcy5xdWFsY29tbS5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rpbmds
IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
