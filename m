Return-Path: <SRS0=TbEC=5B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A87C18E5B
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 16:36:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A90D920663
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 16:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gzfALzn6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oDcg/c24"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A90D920663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3Mk3ECBIjD4+76PELJP43VxkkMgmzYP77qRD/XTja8=; b=gzfALzn6xj05lH
	F1O+hEHGncONB8CrJHQad1ux6lqw5Ep0tc4l0qJO1CkBxEsi714nggFIvn8Wrrk2YBd5zCoTYiJXp
	6oZLjCbHLhV8q5VQsNNzq+b09tQE4xrZaBEq5pXTpM76NVn+iJUCqGvc9xuwrV9W7sLhDVI7BGeh3
	Q4BRYuv5+Ylsw1IlBnF7yayI9Igqrann6FWCf9Fosmq8SqcNtpuglYDS5LebUl5MsrrgoP5S8MPrA
	vHkmBgQKxEwrD2TLAV9FITLwgLS3SeHuC6goW2UYPWONiMvZhq9RlYrIBqlVSvQzPQew7Z4hMlYdP
	1hskL6ejKZUKouyTbvTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDsjQ-0006sc-4u; Mon, 16 Mar 2020 16:36:48 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDsjN-0006s3-C9
 for linux-amlogic@lists.infradead.org; Mon, 16 Mar 2020 16:36:47 +0000
Received: by mail-pg1-x542.google.com with SMTP id y30so10029607pga.13
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2020 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=KkJ9BnhYk/HajXNXxuOjIzsUkQMklV19EP7QhHmBLp8=;
 b=oDcg/c24mMcUeBjQQMh9AiJP4ybO1A/zCQx7APejdiexTnF3qsz0/mkn/oFKSttXua
 sHRSR4mMQOUu4IhbLUuO2O6qGclfBFOIg6oSNByxaLEeqB5dgK4nkHTaB+JnrVM1GPUw
 Byymm05q0BmS2JLAMtCyLpqexNAb31NQBgv5m+MCNadcyxthMcIN0ixrCwm8QTH98Vis
 048ZkMr7v6qbsLpYNEsbDINHIOXmN7/0UMBA+tBrIvDTbiwAeC72BLI5YH3/NwRQkWIC
 /vkLGDn3JcvphZXiRUsNwS48aJEA4wF9IcFK19cGkQAX6reB8HvYfuSC6OalZp0/kiI2
 HVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=KkJ9BnhYk/HajXNXxuOjIzsUkQMklV19EP7QhHmBLp8=;
 b=O7hJ5YVyZyQ0FVPtCE9sNcWpDbNcPX/J3aN6vF3AMHCepJlf6kIOKcm3szho5elRzl
 JFOHfqfFMNpqPfzVZ4EeR4hCfXFYsmYn73L/1xfFGLtvD8656n26zfXah0fHFXCBt6y6
 VahWkiTk4WzR5H3tx8D1K1+fMh+FMEVeusiX7NIo7Qxh03tC1TIBlgHJGT7zg/uMqrlo
 5gIGZq9HbarXYOnTGpOJvqJCR1OkDziRenmPhnPnWqfBHznS/uDROcijRSAhc0evBvai
 Do1kx+TMHUaxDXlXnBgw9wNvYPZBVnU5hDNAAdr863NBZxGv0p+ggL+x9yCVVpBvjC1Y
 NmoA==
X-Gm-Message-State: ANhLgQ0dvVN5aj7xAq4pUPUHxu0HPdU92q50NrSvxNIPkDQV09nXiXYT
 qh4HJBulfWOY+SXrJmiYcfo+ng==
X-Google-Smtp-Source: ADFU+vsnDU0kNyNu7bXSOxb3qeKHSd2QhwQJDm7Wj7JSzaOFa60zGw8tmrmt6d6868XiIqOT9Y1DIA==
X-Received: by 2002:a65:5a8a:: with SMTP id c10mr678539pgt.315.1584376604453; 
 Mon, 16 Mar 2020 09:36:44 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:dcc4:2a10:1b38:3edc])
 by smtp.gmail.com with ESMTPSA id h198sm411587pfe.76.2020.03.16.09.36.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 09:36:43 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] arm64: dts: meson: add support for the SmartLabs
 SML-5442TW
In-Reply-To: <1583987886-6288-4-git-send-email-christianshewitt@gmail.com>
References: <1583987886-6288-1-git-send-email-christianshewitt@gmail.com>
 <1583987886-6288-4-git-send-email-christianshewitt@gmail.com>
Date: Mon, 16 Mar 2020 09:36:43 -0700
Message-ID: <7ha74gw92c.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_093645_547795_2E7AA2D7 
X-CRM114-Status: UNSURE (   6.65  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Andreas =?utf-8?Q?F?= =?utf-8?Q?=C3=A4rber?= <afaerber@suse.de>,
 =?utf-8?Q?Jer=C3=B4me?= Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> The SmartLabs SML-5442TW is broadly similar to the P231 reference design
> but with the following differences:

Can you can create a P231 .dtsi that can be shared between the two?

I'd really like to keep all of these designs that are based on Amlogic
ref designs using shared .dtsi whereever possible.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
