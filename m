Return-Path: <SRS0=cz5x=ER=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1B1C5517A
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2020 19:42:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 579F0207F7
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2020 19:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WTgbH9Ci";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hxxN1bsV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 579F0207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dZTHaoE/teZlXWPYOJR3OUtW6JHlYzy9VaVeNqcjPjI=; b=WTgbH9CirqcAfcFBPwMyAjYSA
	UQLAf/kyfOLXeNZcjk9PyOn1FE45YlE88YjMutrpBf0YnMC4bz2vfjDwoPyIPPavG/3atxCn7LMzp
	ZbntnlVZRifzuDdKp7To7f1PAK0cBOiuGmFhCLPnor1YjWwPobrO81qbdFUCS8EwqnYhV9hlNXUri
	pASjmrk35tazTW6d0YKpa4ELQRAPrxR3s2YLTixLApvoHdwpc7gb3+Wut3OPnfCwFYaYQgvnxo7iV
	lM93p6WSfeScHm/1aBvDEnsxD2uDY3SYHRcM75f3MGvyipeHSH2VkQ+G/0Ye9rHzQNXpMH1jhE1Pe
	DeSDnvlpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcw0Z-0000FY-6H; Wed, 11 Nov 2020 19:42:19 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcw0X-0000EF-9W; Wed, 11 Nov 2020 19:42:18 +0000
Received: by mail-ed1-x543.google.com with SMTP id cq7so3575243edb.4;
 Wed, 11 Nov 2020 11:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kcqgsA1C03N+sBAIpewIwQ5iiWf5Tl1aifp7Xa5kwsU=;
 b=hxxN1bsVIxKHJ2u+OGXh4vbrnNxJtt03MwyFm3BYAAY+F8QzijYemQF0oYHQjHHp57
 l7OyLE/flv2yXl8Q+5Nxs63NVYrl+pfl/o/J7qP8/ChFENuCl79FnQe6EL8rBb7TgAvC
 YhYGzxeZsqT4vTASOaiX7Jk+C6jKE0rs731aj41UbiXSUYsitZiPWR3V79ddeMlupYVD
 C+jONWN/Y+OLtKwwKUq9bwhLr4oqQducG6fdodCglTQAEW8rEhwDgnzxP+nIGVRER5dE
 c87D1e3UbG/7ZwVeH0irqZvbi8i5Ug1enHf6zE1J05nvfuFzgXVp/Q1vYPPqBrf9HKKy
 AF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kcqgsA1C03N+sBAIpewIwQ5iiWf5Tl1aifp7Xa5kwsU=;
 b=A98qhDqtbcvTx74HMDrvJPn/6M2i54KlRj7CR9/POPCQDfQiIQYcgUZtTrNtLAOuz6
 wy7pFk9ApSP3pAhjRmVxMNrZ3F6q+x2NljYQFUxtSLI1fGXddWpK6A1UUV678aecXri5
 P0iyqA3qH+vlPB6S3vwrmBXosn220wBYt9j+rz1TsvE3OTY4P1PbjOggP52rKP8pXQcf
 RGvbnPFevrCBQxDtoJEGHk4y4uegU1y49AabS2wArmuP4VZQTkVt55os8NfrQdqvy5Hr
 gbsYOMv8Fqx87lkFSEhE+yeCKP0wYQN5NhTtyOaQa2mu93bPr6AJZKUDIyK9DFw+otxm
 SGbw==
X-Gm-Message-State: AOAM53006NWYE3eqXWSAId9y5v1wfLd8zDF9zGzTRbOgYo1EpaX4dvrL
 lMbQ3dCN0vDVP2mCbPdwpBrDCa+4xUFIpSpsd58=
X-Google-Smtp-Source: ABdhPJwGxN7mIplXBb44OlVVKoTUN4OC9QCZpvNJmOTEXLHPRh4R7PNPAI5YZU21uteEXmjaSHXn4o2dFfeqxiEvHt0=
X-Received: by 2002:a05:6402:2059:: with SMTP id
 bc25mr1241699edb.13.1605123733810; 
 Wed, 11 Nov 2020 11:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20201111095256.10477-1-zhengzengkai@huawei.com>
In-Reply-To: <20201111095256.10477-1-zhengzengkai@huawei.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 11 Nov 2020 20:42:02 +0100
Message-ID: <CAFBinCANr3zC4VxeGFTXhz1ZmTiOJ44r7DX8EmPwOjezyFAmhQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: meson-g12a: disable clk on error handling path
 in probe
To: Zheng Zengkai <zhengzengkai@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_144217_368216_4E5A0B8C 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: balbi@kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 10:48 AM Zheng Zengkai <zhengzengkai@huawei.com> wrote:
>
> dwc3_meson_g12a_probe() does not invoke clk_bulk_disable_unprepare()
> on one error handling path. This patch fixes that.
>
> Fixes: 347052e3bf1b ("usb: dwc3: meson-g12a: fix USB2 PHY initialization on G12A and A1 SoCs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

many thanks for this fix!


Best regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
