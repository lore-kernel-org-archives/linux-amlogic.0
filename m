Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED08BC31E48
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 14:25:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6664208CA
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 14:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LBRd/bFK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DkNlW945"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6664208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TNg/9pcABW1+AtQKIiXa5kBBD2TSi9iyCit4hBvDUE=; b=LBRd/bFKv+mz6w
	0w5VXOrd1M/3YBYhvQNFCSd352XEd4w9SzIW0cXVNUS5V72Bq8bo+G3uj9Ik3UYnp5ruf7eh/9tOF
	S8kdqeINBj6EtYhICxkw4X7w9s9H3eEkU/erUvyHyEOlvtlLodSng8m2m1ISQe6JDJGix/FYz/6iH
	clDRSbcbs0c6wtPJEDLzSASj2CCN0q9Xf8JZwpsHL6lr+8Ol0Rm7rIfx4ge4UX/vbDiRAOECs2kNt
	9MgBoeNKyoAeHRGXEU7DwG4w30s4P+Bqjrvjd3XOla0PT1605lEsLqiD9DBChoxvHSzrfVXxX8v8O
	YiXt4OxGIkU2u84ZgrgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb4C6-00050y-2f; Wed, 12 Jun 2019 14:25:42 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb4Bu-0004qu-K1
 for linux-amlogic@lists.infradead.org; Wed, 12 Jun 2019 14:25:32 +0000
Received: by mail-pg1-x541.google.com with SMTP id s27so9025918pgl.2
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jun 2019 07:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CG5iVPWcjFplF7lR6y3XE62eHLD9eYji1o8inBAtJJY=;
 b=DkNlW945kuLZQ3RMFEaZhtAt/vvk0BfAkLbeAKizzc+dO/m7G5UF9lRQm6NNq+DUQh
 OLjx98iEFsYqoENabN8XQzrRfB0Q9IoWk/uhCskW75d1RLTar/8kKDcJRAxWV50LaX24
 m1lvDmGvJ92HaqHz9OUmZKcjabh54tm4K4IahU9DPDC0JuzJUCJNlET6Y8v5CG9MuDNs
 7inxq7/Pu7rKUo9WkPtzByceY8kkmQdTna1PRVg//7iHjmNAlshnrhZtb5VaiPBqNjFT
 WdX2mmSdhZMr5Iybo/COmIzTsuYbvIaFlP3cddhl+HBvAIaRf7CN1gYZkVTahmdsPgeM
 vHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CG5iVPWcjFplF7lR6y3XE62eHLD9eYji1o8inBAtJJY=;
 b=Pcjbr1AeSJB7T7FQoviee19lchXEyeei/AvUnHZT8JyqZbX/S3EKwT6gP8aImG0XUX
 fF4FCj8K37wm/V5Fwc63N72zDBeJ1eNghp3marc7rHzoOS6xhQ9KNeCctJYFDUFT2hGS
 6qUtsGuSDbl4OHqyLMifvwvE/aXgbwpuJatPjB7bfJey1wGZVXKsbpWgScfIrlivdvDX
 EYTi3kqUxRrSub2ZVPy3RI+4MRj+OJOhyqQt1aiXbZeceeDG8P/v23YeWtkap//NgKll
 HXP6MCB2fnq9Ttn3RMaav5rLePZ2dTg6tTUVLLzB7lCswt348mV8TigUInvZ/XAe/NlJ
 a1Gg==
X-Gm-Message-State: APjAAAV5lGGklCtu2mCW74R29ku/mvVmkz5WaT68AEScWnrIkp8IVLUX
 6P+sqDTSpw6Xc3r80jt2PycxwC5hbp4=
X-Google-Smtp-Source: APXvYqzFJUGgeRa9mS5//wWFpkOuEjJAUvNZgOI1pyCzeAI1Y14G2xwuNekpf+1k+vZZVrtDqAnWDA==
X-Received: by 2002:a63:af44:: with SMTP id s4mr25363352pgo.411.1560349529636; 
 Wed, 12 Jun 2019 07:25:29 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id y14sm121972pjr.13.2019.06.12.07.25.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Jun 2019 07:25:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v5 0/3] arm64: Add initial support for Odroid-N2
In-Reply-To: <20190603091008.2382-1-narmstrong@baylibre.com>
References: <20190603091008.2382-1-narmstrong@baylibre.com>
Date: Wed, 12 Jun 2019 07:25:27 -0700
Message-ID: <7hr27y3mp4.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_072530_682461_ECEB6BFE 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This patchset adds basic support for :
> - Amlogic G12B, which is very similar to G12A
> - The HardKernel Odroid-N2 based on the S922X SoC
>
> The Amlogic G12B SoC is very similar with the G12A SoC, sharing
> most of the features and architecture, but with these differences :
> - The first CPU cluster only has 2xCortex-A53 instead of 4
> - G12B has a second cluster of 4xCortex-A73
> - Both cluster can achieve 2GHz instead of 1,8GHz for G12A
> - CPU Clock architecture is difference, thus needing a different
>   compatible to handle this slight difference
> - Supports a MIPI CSI input
> - Embeds a Mali-G52 instead of a Mali-G31, but integration is the same
>
> Actual support is done in the same way as for the GXM support, including
> the G12A dtsi and redefining the CPU clusters.
> Unlike GXM, the first cluster is different, thus needing to remove
> the last 2 cpu nodes of the first cluster.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Queued for v5.3,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
