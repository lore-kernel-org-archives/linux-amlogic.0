Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C678C27C55
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QcWFv3rKyD0gAO3w8S8Yr84Hm2SqXOVnu2kIcLKSMfY=; b=ZfWCOL+AWQZlUv
	e62gyX8fsPaeq9zzoU7kVJNOjU8v3iNkXGtt/7mNWhJCLpa5qWgXfkoRwGqaENGU059xTJoAEXCoh
	VDpGvMPK90PB2oGMohJAeN4cIJ78pn+lEIT93gk9ry6iQKOGfGzuunxWYa52zByefpkp9MPVkU/Ea
	NquZu5mAOlG24QFPj2CKv8Tbeo4PCPy7WfHgwfvwna2TjBadDIEWSGGtqYmcc2C1mwN9926c+tIhz
	10ufnc1Qk3+m1Qz1B1nIROygn4kNayTtuhlWheo20qTD7xCiBJN19gctZy1tISzvwK9yTLdaV9rNP
	UpH4Q36mhPfJde2G89Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Bm-000000093x2-3FBM;
	Thu, 06 Jun 2024 09:13:42 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Bh-000000093s3-2DT3
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 09:13:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42155dfc484so4660365e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 02:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717665216; x=1718270016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeksLIX2BzaZCNAN7y72dDwBN6DfppMxjFM7Q5oi4xQ=;
        b=pb1nGPv9AOP5MUBeYyA0KlMARe9UsTkKnqyOqSyKaAkWkcx3/YV5bUUjhr4a0doYNS
         Yg9veFovqzUNygihcMtslTToTL/d86yemIsMyW5FUxdw6AXVwiFUl8LyYz7Icmv/nkQo
         nZArm0YIKBsI7U5kdg5Me3cWxUnrB8I1jz/bKSZT2sh7kITqEpUuhNKRp+jOJx5ltnho
         W0cPZm1gG68vANqcQsthkAx7K8Gikr5wzKDjdxDGZvEuzaqFCNlKH9UVwE+pfXX0y5wm
         vb07ydytGpg/tq0ssO2A7bFPS8F2us4QS+5lP1Ses9Sq7syAOKww3CtMIOVhr5vZGR+z
         WpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665216; x=1718270016;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeksLIX2BzaZCNAN7y72dDwBN6DfppMxjFM7Q5oi4xQ=;
        b=eXaXs6oVqOSFgUx2ZUBAU/KehkJCAGUlWjsmPQcqInA5P4EiUZYiSj6EF/1E2BsSaq
         yNhieTc42RiRzyq+A/yDcENeL6CVmD5h97NiEPIQ7D5bgCk5HYoeMVcwO/3iPol5ZtSY
         w+qAabf7sXNnNYixSlVS6yxG7sQmcRphZhZyd3nmqhLbfKZY39QSxBB9VFIjy10d21dN
         xBmwzi8F3LDCeHknT+dLIE4wSTqTS2Mew7AUm4AvDxzJ1F83D7wOADNh7gazTDGBTpOu
         ZFzQhSWnojuM14qUcN0pEeE/xbiaflF8dUrZTLvxkYv2M66qD1QVO19CUpsZIMBncOjD
         y7vg==
X-Forwarded-Encrypted: i=1; AJvYcCXlpMyJqPhjAT7j3wr0tiNeg8ZOoGTXhx8k7NiAS17KmxvwI9ckLMUqlzvVp017kvC5HsD0h+/W73YomBjm73hMgw12QR95W9qkOOk56fVuBiE=
X-Gm-Message-State: AOJu0YzGQv3FEdbB3A7dyE6OTrbDx+KGUaI9MEHHU9B6fDBozdjIEFaQ
	REEosa8rQmw3D1zP0b2Z5DmdA8Vy8dsjSZ+/IRRUQGJbbkovbsP8GUq/5ngIZIk=
X-Google-Smtp-Source: AGHT+IGiTcenUwmrVbwMZ8CWLNgOE8eMGra87A9ikPjy4LKrOALDBu62I+rUPEWsyHUIPgFuKNgcsw==
X-Received: by 2002:a05:600c:a03:b0:421:1d8:add4 with SMTP id 5b1f17b1804b1-4215634e602mr46190305e9.35.1717665215936;
        Thu, 06 Jun 2024 02:13:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2a544bsm15038175e9.21.2024.06.06.02.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:13:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240604050752.3312468-1-christianshewitt@gmail.com>
References: <20240604050752.3312468-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: Add S905L ID
Message-Id: <171766521524.3911648.14792995642693649032.b4-ty@linaro.org>
Date: Thu, 06 Jun 2024 11:13:35 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_021337_670105_2A7B41DD 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, 04 Jun 2024 05:07:52 +0000, Christian Hewitt wrote:
> Add the S905L SoC ID observed in several P271 boards:
> 
> kernel: soc soc0: Amlogic Meson GXLX (S905L) Revision 26:a (c1:2) Detected
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/drivers)

[1/1] soc: amlogic: meson-gx-socinfo: Add S905L ID
      https://git.kernel.org/amlogic/c/d1d0f1f6ff6013211e3ee00237e4cc25ad0cd64b

These changes has been applied on the intermediate git tree [1].

The v6.11/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
