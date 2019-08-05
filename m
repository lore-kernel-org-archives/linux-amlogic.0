Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EBBC0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 21:34:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 256DF214C6
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 21:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AoCgL3rz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0Nz+Ta1F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 256DF214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxG7IcDcxdIdgs5wEBc82C1ACFzQ3JEK6wBVcZLbRcc=; b=AoCgL3rzhrgxUK
	I65I0W6oIynhrOzzvFaSBnertL9fqwK4GJT3seQBU8xWi5Sm925aVF62jB9aNCu7PrHq4ZIQAWGxx
	pgmsLq79u9YQuOLjzVH3bTG75E2/NN3kzv3GNJX/o7zqM87djabOcwn2bTzkbgiB5mxV+F4ot6IEX
	Ksv/4vG4NLw+O/PBftMsHx94H9H1OUroIJVnaiGBH0qbCNIgMGKcI9pLNiIsbgiKFuQO9IBVqCGuP
	M2tv6lC0dLssKw80IZHiP1xXoe7+BunxPM2fzQaM9AE2DYFntZ5AzdhCvaEUOLiWG3ebMPxggLCEE
	F5hKnAgyps4NY4c/6EBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hukce-0000gT-20; Mon, 05 Aug 2019 21:34:28 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hukcV-0000Xb-Ik
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 21:34:20 +0000
Received: by mail-pg1-x542.google.com with SMTP id l21so40380806pgm.3
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 14:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=F2uX64SYkhXuVAYwXPHtsBUqPh5ENofxUHIKVtQKuPM=;
 b=0Nz+Ta1FZkq2bl59Lnwi+ADIQcEtXpO7GoSmDFotlB4DDbx+MfHAbnl61CnjEeLRy+
 MWFV38AZ15AuMNS6p9cPpTYUCALo+IltkAN2X/O/AFJcVXAHeaeV7ROG/y0UVWG+bDFt
 G+sbx4WHyImCYjwFN8l4zcfLkq5UEFFEYWxY9ps3T4TwX7CAlkSxzMYGGD4+Rz9mhdHn
 /PXXyCGtg93mkG9P0G8kEdgNiScGdTEtKIv0Wn5qElyULIj+P25BeogD08x2Y/1+cZ4e
 1qVea2envtU49RtTa59QgbP5VgV06N2hf868AljN+byIUwSl7hO9j9TlarrWG9LQmV8n
 yqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=F2uX64SYkhXuVAYwXPHtsBUqPh5ENofxUHIKVtQKuPM=;
 b=aCZv/6Dm5ahsxmYQMU++VQCiXsYxOrl7yqxBPxPkdp8VGpFJlZpCK+tyqJhe8FO/k/
 WIrHPeXFEfO9pTNLB5ijFejtzSKM9vo9/I5PA2nbt17DyV/5eVLfHy5hcxVFfQ8FzzFC
 AaV1nTeMynykDU75MjVs4d1gXqdDqp6mOaTVbr8xwoYaFZgMw5AaXBDuIfwWaFUobpBy
 hbcBcR5KlPZpYwnrmDqEFhrvrTB2POswAHtY7cXJGfWcDdE0XerbAfgvq5Ce0JFAgRjn
 T4P5zcaHjT2sce+m0aVBCvjGzWSjK9upyb4DYOo9fanzI/y1MKC8BPfqWyeheM30yYQc
 vUdQ==
X-Gm-Message-State: APjAAAX0AN3zLpOJtv9nQrAW0y5u2/ZkbwOOZ6bof1+QqvKM59erIPj1
 jujG8VoJGNjOw/iZO9kkonYvlA==
X-Google-Smtp-Source: APXvYqyTRc9wk/7gZzo3oYc7gfG6drD7WGtyiftHDhpF6Sr+RFqFazws+aVRlqNv57SQeqkPNr2eOw==
X-Received: by 2002:a62:5883:: with SMTP id m125mr87689pfb.248.1565040856849; 
 Mon, 05 Aug 2019 14:34:16 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:7483:80d6:7f67:2672])
 by smtp.googlemail.com with ESMTPSA id
 j5sm101076110pfi.104.2019.08.05.14.34.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Aug 2019 14:34:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, srinivas.kandagatla@linaro.org, 
Subject: Re: [PATCH v2 0/4] Rework secure-monitor driver
In-Reply-To: <20190731082339.20163-1-ccaione@baylibre.com>
References: <20190731082339.20163-1-ccaione@baylibre.com>
Date: Mon, 05 Aug 2019 14:34:15 -0700
Message-ID: <7hftmfguug.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_143419_617944_F0DEF7C2 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Srinivas,

Carlo Caione <ccaione@baylibre.com> writes:

> The secure-monitor driver is currently in really bad shape, not my 
> proudest piece of code (thanks Jerome for pointing that out ;). I tried 
> to rework it a bit to make it a bit more tolerable.
>
> I needed to change a bit the APIs and consequently adapt the only user 
> we have, that is the nvmem/efuses driver. To not break bisectability I 
> added one single commit to change both the drivers.

With your ack on the nvmem bindings and nvmem part of patch 4/4, I can
take the series take the rest of this series through my tree for Amlogic
SoCs.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
