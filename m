Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C324C47080
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:28:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A2561003
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8A2561003
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2vdoCD3vOPC6LgMva8pAScfqsEIWIdEyIxXofKXrc8=; b=UTn0TuaMGXaq3B
	krzOnUYT4qCEc84drDuCKw+Jl1vR7viu1mczXrAUXex3gQyxFf2tGD7jnUfOojaOQCGHFx6pHBn91
	giE26+rDSDAqRLAKRhiNd2Iv0kg+g4ySxHluEcSfYhDPB4JtXneIJhfvQhXEicWxKf3Za33/u+BPB
	GD8laluTiamHHw/bCi5k8DDPJps3RXg9VRmQxPJDUOiHl7uZi1hnXhWQKdrsZQfnfdVAqqB4YPZZM
	3+TUZQe+Y82NFDqPi0eJCsY5MWkvpDYe73zyMJTj2jHfI/KfZA0WaAk70FHmqxDZdJLMoS9mBasY+
	BfWD8YqdPLFfH25snZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnzku-00FK1M-6R; Tue, 01 Jun 2021 08:28:08 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnzkg-00FJzb-HK
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 08:27:56 +0000
Received: by mail-wr1-x430.google.com with SMTP id g17so13249832wrs.13
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 01:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MI5T5t/RSz+ApO+As7ezT0+58RDmFWuhI+3uzR4JPe4=;
 b=1zpALENTQHe3VELwLjYwa+30ISnGRBvpQzPITvFEY1PXf3sRSBz5HKuHnufj7UBVXd
 cpkDOQbdRWOhpz8jfujjf4hN6zN6fmaGxheGjP8yGdbqWOfJG2UXXv/6IUiL+16Wi0EP
 1cGF5n16gUCuE0hIPA6D2n+Xa72I7RR6+gkCdZbFGtL/5tFlPANmejVeBcsL6wZ6JOCp
 QLeIGVVV0+Qd9aXvXK4390Yf2NYq8g/JJzo7EebPaHqdSRVxvwpNIGFt9bAcJ++lIC3e
 13gXrSi04vaTUyZ5paX0UfZ52CHfzz8prGYr3lKaTx77+xYjg/Wd92oOcCD3i5vHY24T
 xtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MI5T5t/RSz+ApO+As7ezT0+58RDmFWuhI+3uzR4JPe4=;
 b=IeD4GSdEzttXhdZV8grUTKJ9rANCQTnN91diI9usIR6VChhKEEsq5E7oFn0oOZb1G4
 U1A1OcIa385P0mjZVkXNQhCa8q/gWITtvPj36w8c0TZ/7zdMYXf/Cy7idIcomQQglo3X
 u6OPoNo3mstHHOv3tdtzXqJwkjcdSuqsuJHtzImlZJsKxMyRdB9D6eKJGfVbcYBzOhcP
 iER+aXjFlhZwgwVzdVffaaz733YKkkGrGMPKMUPVWsr5eyuiP6nVxEQbQS6aJyncrhX5
 iMNqY8NnGnyVPQuPIitXVWL5XpxVfRMIfkNEB4100hYqB1JPmlLKYDIPvb3IP7WMWdTK
 ecRQ==
X-Gm-Message-State: AOAM5326hXaTaNo/z59SAG2cQTGVZfy4b11RUiKhcH6V8RPH023B2Kca
 4RjzqUQ91VQjynFhe1Q+DLuQSg==
X-Google-Smtp-Source: ABdhPJyyI2URE4xiLGQHVBO5sTCDl85S7jb21pp1/Y2kp9vGS1CNoRz8Xc5TlzWexfirhG6BqS+x8A==
X-Received: by 2002:adf:a446:: with SMTP id e6mr10999521wra.219.1622536072548; 
 Tue, 01 Jun 2021 01:27:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id
 f7sm17108936wmq.30.2021.06.01.01.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 01:27:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, Neil Armstrong <narmstrong@baylibre.com>,
 jirislaby@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] tty: serial: meson: add amlogic,
 uart-fifosize property
Date: Tue,  1 Jun 2021 10:27:48 +0200
Message-Id: <162253604769.258225.7812835099305638317.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518075833.3736038-1-narmstrong@baylibre.com>
References: <20210518075833.3736038-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_012754_632454_EF389213 
X-CRM114-Status: GOOD (  11.40  )
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

On Tue, 18 May 2021 09:58:30 +0200, Neil Armstrong wrote:
> On most of the Amlogic SoCs, the first UART controller in the "Everything-Else"
> power domain has 128bytes of RX & TX FIFO, so add an optional property to describe
> a different FIFO size from the other ports (64bytes).
> 
> This adds a property in the bindings, reads the property from the driver and updates
> the DT with the new property.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.14/dt64)

[3/3] arm64: dts: meson: set 128bytes FIFO size on uart A
      https://git.kernel.org/amlogic/c/a270a2b24de5

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
