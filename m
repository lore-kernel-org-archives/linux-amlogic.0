Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779F2C77B61
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8lHUPzvKVnHKeMP7oQPwsgTFnFRDCqZ+MjeS4VU7zCw=; b=njVJtc/OCldwuT
	HB9aAa4j7q4HUeQwo7U7xJPXWB/v7dwa00Jn1BPqh3tAFfo3sZsTmrJ+OYrlRgWQLzN7Svq0KJSMJ
	T4reGHX+gj35UMZaDAAygMnqKDEBcDYO6TXbjCnRlEvvnzDW7OGbJqxm98ujBBknGP1QgfYIsO4OU
	b/JsPQQEuZi7Hgh4LdFoYF7aRZjZhI4CQzWWKR2ZHp22pDO0aVlTeVVs0ItODXZ1NQNWg5akp0THO
	q+u/AMgO1sCEjTClXuO+MB1rcyXwTSL1c8l0Zb00e6mnsQudL37d/2UDgXUPEN/unDK+AnnhiSMRZ
	lyWKqC6GxkGijsZTurjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plqCE-00FBor-2z;
	Mon, 10 Apr 2023 12:00:30 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plqCC-00FBnr-0Y;
	Mon, 10 Apr 2023 12:00:29 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-18447b9a633so2947203fac.7;
        Mon, 10 Apr 2023 05:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681128025; x=1683720025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwzRQ43MPzZ+0En/PxCReyprlGKQZaWmp43PqnWxhn8=;
        b=0wBr2n19ad/sPBcMhhoVJts7UqNv+QhHjEBv3GfMcXQMY1lHDP/gFS99UoFtxDXyaq
         fUBVP4cCXvI2IoQAZnoSS1pMbmmDS3lgfEsmAKfW7np7fppfah5PTF9WZRG6X+hCc9aT
         tGuwlJwPEzCgbkWbhShTF+SbiKfEe7WXKAzNNHyqpg3FcxqoDjqe/F2NE9mpHg9HTckS
         bCkKJQuDifQu25XkDAoPYYcWr6/lxwdr9cvDBo+kf8Bsu1k1Jm3LlRC2Nlb6OEEB3KrQ
         e1Q5+OiKI+8jW2fs5bu+HNh3wa0HF2222HWRQhnTn8B1yy1NDNr1GuodSA+g3LuKYaOU
         g5fA==
X-Gm-Message-State: AAQBX9eITgPPSTPKvXQ2rBr0/jqu7bg8XS96pw9O6Ai5zQYB4fB7jezp
	gDTtjB38duvaOoo5oHzaijo=
X-Google-Smtp-Source: AKy350bn7Zy6Zd8wgM/7uCU7v1NyBl3VX26fotCHAfNXRGwWijIajnJqHa+1xWIXpql08YO37l89iQ==
X-Received: by 2002:a05:6870:ac29:b0:184:222:6655 with SMTP id kw41-20020a056870ac2900b0018402226655mr4551329oab.4.1681128024258;
        Mon, 10 Apr 2023 05:00:24 -0700 (PDT)
Received: from archfamilia.lan ([181.219.149.7])
        by smtp.gmail.com with ESMTPSA id j4-20020a9d7384000000b0069f9203967bsm4141884otk.76.2023.04.10.05.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 05:00:23 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	martin.blumenstingl@googlemail.com,
	narmstrong@baylibre.com,
	stefan@agner.ch,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v2 0/1] Fix Random Kernel panic from when fail to reserve memory
Date: Mon, 10 Apr 2023 08:00:16 -0400
Message-Id: <20230410120017.41664-1-tanure@linux.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_050028_207575_D983827E 
X-CRM114-Status: GOOD (  11.90  )
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

I am trying to fix an issue where the kernel panics randomly on my Vim3
board. The problem happens when the ARM Trusted Firmware memory is not
removed from the available ram.

This happens because my u-boot provides /memreserve/, but it doesn't flag
it as nomap. And the kernel scan of /reserved-memory node can't map as
nomap as the region is already reserved.

The idea now is to scan /memreserve/ after /reserved-memory node, and
/memreserve/ will skip regions already reserved by /reserved-memory node.

V1 Patch series: https://lore.kernel.org/all/20230406151429.524591-1-tanure@linux.com/

Previous Threads:
#regzbot link: https://lore.kernel.org/linux-arm-kernel/40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch/#regzbot
#regzbot link: https://lore.kernel.org/all/CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com/

Change from V1:
 - Instead of allowing to mark nomap a region already reserved, give
precedence to /reserved-memory node scan.

Lucas Tanure (1):
  of: fdt: Scan /memreserve/ last

 drivers/of/fdt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
