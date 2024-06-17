Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87888C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 23:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgBNuikvr8yDH7tCj+gZ2p5ZSftm6jcqYxlP9dqWtmA=; b=j5h/hSdXYnMY3m
	9SzetmjcuF088n5kK14U0QOj9ZFpDaGTwO8xrZaZC/aUodxyaKw6W2y9dFUr7zGdHWAPl6tN2PBgI
	BpgQgtEPogiHitA+BMVADyrPanjO3m96XycwNGlGu3Ps8bqaScUTjO0UwSEM5bKDDxdLXODosEhi9
	u8jxJmt1OMiuZCwhIOluyBhkPMAUxsMpntpUI9crKVEtX3BSPF2Sp6k6LoS+d9nxxzBQorDiX72vW
	H4PsB5fwWxLIXt8qvD7zI5t2mi4oDoWXUjua8deNSAJ5Iy0IM8FEPigU25jHmp3NdQPkeutB65nS2
	yzpiGt7FonIfcqyInWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJLg8-0000000Cv0S-38HU;
	Mon, 17 Jun 2024 23:22:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJLg5-0000000CuyH-1umZ;
	Mon, 17 Jun 2024 23:22:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a6f0dc80ab9so738128166b.2;
        Mon, 17 Jun 2024 16:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718666538; x=1719271338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKRTlIR7nnOjM0KXV8XEYm+3gbeEEjKGhoRIr/a9C1M=;
        b=WJNWP/Xw936ZclYyatRu/FNsnrXiWY04FwYiydXnQWxCK0fZh+EOTKRbQzVU8Zjo/d
         SPY/c2uORDLqz0fu2GgtujipeX04XUseJrQZHOY6IosLf49sxREVco5s8shOrct691Dp
         Y9doashiGZ77bgO4sHTHmqGW5aVhvUXcOlsfReQCwyrW7yMD6UaijKVKStvL6MDhUbMl
         Dt46/1vf4cSbZn7G96p4vyzSG1p063ACi24iFTF4bH55W77UZPYxlOomAoE8SDUHGDx2
         Ip/jGRt+mCwgpMTU+e/Ti41y5jKCzL1vcQgoqpWg5dbT4PMpEeN+3BKifogs8rpHng1j
         P6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718666538; x=1719271338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKRTlIR7nnOjM0KXV8XEYm+3gbeEEjKGhoRIr/a9C1M=;
        b=F0YNO/zyo8JFy7oHORUoyNtEeCXFvGahzD6788y8I/eHFp/CV2XoWx3K51aaE6NfmD
         2DWFQReDMBjbxJpKY21+wLhxsts64jzwOpdkEwiw0yUYZIJwkVa3vBzZ+yvNzjbJ3fiR
         ROYbytNRaCEMa8Jumczr35NPUwi/xMt4yni926MRX7xwFeJcphYllQVHiLdmJLlXLiaP
         DXTxdYBikPiC7DWNFugkuWCTN171LLAjKXlcFVY2RX6SytjeZdQA1C59DnzX3riYTScm
         jhbcAdld0Em6EaCMMDwOHjlWyyJRAUUBdrglanHuYzAtWeMr9IR7IT7mY9nlfISKOPvI
         a/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP9M4QVSvt67m122ax/OQG7KA6TAMBynXcNzthJ9UiZE+Pspv24fUeyf5tPTRMSJV9q24+sqGNip3bUCn4FkLdgIXk5USWFdy65ZrEZGp1Scss1fnB0oniZ0+ZbhJ6t8V7/xuvZOZwkppvQTiOc33wmdj0OPA31w==
X-Gm-Message-State: AOJu0YzemN+kRn/sUEFSvFNKw8ZLK44Fm6cRSTzPERsDz6Hk+gmOMTze
	OO22o3HG1ut+wvFLkOhwbkMqnc6dHutbXsRA6k9ZSt/Ilzf2V/Px
X-Google-Smtp-Source: AGHT+IGjp3Ii1wNb0dBKA712QfgjfMKbqZ/mXIwxAYEF4EPT50uybie8uvCZMH9EY/OD9lYqsMYbEw==
X-Received: by 2002:a17:906:d18f:b0:a6f:256c:8163 with SMTP id a640c23a62f3a-a6f60bca7a3mr697845766b.0.1718666537578;
        Mon, 17 Jun 2024 16:22:17 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:b152:a6ad:d6c8:f0e8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f6b2b04f5sm411879666b.192.2024.06.17.16.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 16:22:17 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: tgamblin@baylibre.com
Cc: Michael.Hennerich@analog.com,
	alexandre.torgue@foss.st.com,
	baolin.wang@linux.alibaba.com,
	bcm-kernel-feedback-list@broadcom.com,
	cmo@melexis.com,
	cosmin.tanislav@analog.com,
	ddrokosov@sberdevices.ru,
	festevam@gmail.com,
	hdegoede@redhat.com,
	imx@lists.linux.dev,
	jbrunet@baylibre.com,
	jic23@kernel.org,
	jmaneyrol@invensense.com,
	kernel@pengutronix.de,
	khilman@baylibre.com,
	lars@metafoo.de,
	linus.walleij@linaro.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	martin.blumenstingl@googlemail.com,
	mcoquelin.stm32@gmail.com,
	neil.armstrong@linaro.org,
	nuno.sa@analog.com,
	orsonzhai@gmail.com,
	rjui@broadcom.com,
	s.hauer@pengutronix.de,
	sbranden@broadcom.com,
	shawnguo@kernel.org,
	sravanhome@gmail.com,
	u.kleine-koenig@baylibre.com,
	wens@csie.org,
	zhang.lyra@gmail.com,
	Vasileios Amoiridis <vassilisamir@gmail.com>
Subject: Re: [PATCH v3 35/41] iio: pressure: bmp280-core: make use of
Date: Tue, 18 Jun 2024 01:22:12 +0200
Message-Id: <20240617232212.34280-1-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_162221_523224_56DAD3EE 
X-CRM114-Status: UNSURE (   4.26  )
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

For the bmp280-core.c part, in Patch 35/41:

Tested-By: Vasileios Amoiridis <vassilisamir@gmail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
