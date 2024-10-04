Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD2CCF854E
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2024 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyuoEo/CR4JMmqHLiYFa/MjJ8al8Rs2GvaVSoXifl/E=; b=DTO/8UhH2IBuAp
	byt7I8ZErupaT9CkXYNWPPe4X2ToiqMiRlez5Om3JHvg6BZ+zz6UYvA/4pw0Yfy4U9aEA7WN+b1cJ
	oeg0f4UPZCrkeFpn0yiKxdv1oe5nvMCN/CkUqqksImuJZsK8h2+sDZPhIOWyhBrXpsHbWo4yZQ3cL
	gOpsZGIVXaBC77CsVuRs7Glh6rL3sTBLUtmIRLyrKJcOApi98L8lvY/sMorOYFGrOEwK2LNi8po2N
	uhTCV0YxfTQWzfD0e7ZxD66t5NbpJ8D9xZQQnG3AHcLhRpD9c4sKVwyqlrP8uVRhjYHBNLZe0zqPe
	iLKOMRb9r397KxKz6jnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swiw5-0000000CgEm-348w;
	Fri, 04 Oct 2024 14:05:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swiOE-0000000CXW0-44gE
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Oct 2024 13:30:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so17235785e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Oct 2024 06:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728048635; x=1728653435; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PL12oHhNupzORthJ0SyLBGQ2sKgGXlY+AklWKmc3OZs=;
        b=LD4IMpmZHPh2Bv0raojFslPYttlL5ND8N1bChIAGxwu/zBB6uj5sd0D3fgso+rrOvK
         ar30Ve0AHydqpcwx0dq/d16V1/WT9hZ8udwU9c9Ei9o8CTPPXg3LRSRw5PWnwUf4twE5
         OktpwDNi/TbGLOD0jlW1BLpDwLm8EgDEvYgSRXOj4fvUyNVk4jdcIBnBSGnl6f6C/Dgx
         TIc2OB5rpEoCfg7hlNkfjZBMoJUZJvI6WkWYtm+SukCElgWxadOXzP8Ju6YmaKWM60jx
         5fQg1bcN3RoFr6fSueM4Znoy70h5gMTeC3TjnqWqIv1OtkY3jJVf3HioYKs4zZNnOV4O
         uB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728048635; x=1728653435;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PL12oHhNupzORthJ0SyLBGQ2sKgGXlY+AklWKmc3OZs=;
        b=Iwx8bx5Twp/iwJPCZp5W8I+Fn1Y8NGahjlgA7NbQFHIP5BE9zQ+VQVqFwVSIfv0HE8
         W6Z2gE8JIpSiKG2BB+xFaPt6guwxEZNsaDWBcnXuWvZWCx6nTF6qm2qY29DmToVoiGbS
         iTD9rWEtjUJ5jaKcDLZhVeI5vqD1YlfZx/qBfu0iGip+uuARN6Gaprqn2flSRPJZnVTn
         egQkUrmHwe42kgt23ul4O7H3y3J0Ukhw4sLTv7fy6JO0r//mO62djcntW34vB8Gxa23W
         5EcL37XN2Oxop/SfBn7pORZ1599C7P33KibXgQvxFBWKcuZvlLVXQahKfdTRkeODkOkz
         GEsg==
X-Forwarded-Encrypted: i=1; AJvYcCVzC7sr8X2saCwRNWDZ665i5EQzdCk5vz/2i4M6KoT3QFEs9+Ck0+fpngi7xHM9g+v9fvhSuwGCO5+fnr0u@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ1cCGxVQdqG+/F22dsBc3xHKMimL2zy18qPAxiCH3p5D8QSQ5
	jJmrgjwmiSw5WNSK9R/7nXCYce7Ac2pWqVCEhbBXlpE4QsgQhsaMA6no0DCgQf0=
X-Google-Smtp-Source: AGHT+IHtZmn6OQssLbni+42dDDNbAXZ5rxq7ZlG7Jnlgb+spldqzmQavRoTAVSMSi1whdFtbCdGAbw==
X-Received: by 2002:a05:600c:1c23:b0:426:63b4:73b0 with SMTP id 5b1f17b1804b1-42f85af551cmr20227755e9.34.1728048635370;
        Fri, 04 Oct 2024 06:30:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6080:c6bd:7a14:2250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b444a4sm15637085e9.29.2024.10.04.06.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 06:30:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Jiucheng Xu
 <jiucheng.xu@amlogic.com>,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/9] reset: amlogic: split the device core and
 platform probe
In-Reply-To: <01aff9c0f129f8c1cf41c7ae53dac38048aa34a8.camel@pengutronix.de>
	(Philipp Zabel's message of "Mon, 30 Sep 2024 18:56:05 +0200")
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
	<20240910-meson-rst-aux-v5-8-60be62635d3e@baylibre.com>
	<8cb81058c8f45e378675e078e296336a2cf74308.camel@pengutronix.de>
	<1jldzwkpsu.fsf@starbuckisacylon.baylibre.com>
	<01aff9c0f129f8c1cf41c7ae53dac38048aa34a8.camel@pengutronix.de>
Date: Fri, 04 Oct 2024 15:30:28 +0200
Message-ID: <1jsetcro5n.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_063039_026990_AC07CB90 
X-CRM114-Status: UNSURE (   7.61  )
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

On Mon 30 Sep 2024 at 18:56, Philipp Zabel <p.zabel@pengutronix.de> wrote:


> I've applied them to reset/next them unchanged, at:
> https://git.pengutronix.de/cgit/pza/linux/commit/?id=5b93105afcdc
> and sent a follow-up patch to fix the alignment.

Thanks Philipp.

Would it be possible for you to tag it, so I can pull it the amlogic
without waiting for the next rc1 ?

We have couple of changes pending depending on this.

>
> regards
> Philipp

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
