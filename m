Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF4AC4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:59:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EAB160F38
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EAB160F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqlzqLEYjU8GVieSATh9rJEpt7Is6G5ccfvuqBbMk0U=; b=48mte4ThjHevaW
	crh6KYN/i7qFilrVh0sh1Mk+Q/rUAqtixqtc5LDdgRuOHV5JwG8EzIWrLg8CEswOZzrAZmtLj/8+e
	ik/KQJrRU4/lXwJgjS576eNXpgz1LiZienxuqLFA+/xQvBWRu4g1IQ93Dq7WuCmV4XnASN/qqA3Pr
	EBfJK/+lmdzGzCiTR+cmwDH0Gy3N8Cq5DvaqMBdTCknmA/2HnllQUGgTL4DvJC2rnLM9xIDqjFRZb
	VX0a+TyHFaJ6TsYXEOheKz12+Rujyfwtg4vxGfn+7o1GfTnQo2lxk44qjUk6FB0m/XTGe/G7RibQu
	NESbYYwGH41x4/ktffpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMf8-002qbu-N6; Tue, 10 Aug 2021 07:59:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMes-002qVM-LS
 for linux-amlogic@lists.infradead.org; Tue, 10 Aug 2021 07:58:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id q10so1754525wro.2
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Aug 2021 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8vOzxNlu5NfLvXqdFSx19sPlss9NRbVfvd1D3cx6Wlo=;
 b=hCUQnUYlqyla8ODWNsANP5xwr5ntXLwRwywWNiKydMuoOL0e2F3Cm0hqWTXd2V7zGW
 dTRfn5vTX5cMZrElr+63h2Yvbj0H6vMbSeM7WMwUPEaigXYi08ZQxnvNgfIzR/CuMDu2
 HcTuWCplm7yot7wO9dqvfDjQu3KTSZpm2/JDlH2TraZCJ4N2POkwTWYp2PHmjI9VMF4T
 wjTNGuZ1oLtdl3D37DNAHngAVw5b9qskMeLefCqPz9Rp9m4d/q1jXBasNnKpnTYlkJeO
 iWmhhDMVNsHzoi5cxAqDnh5DogF6ryDrORqpDBUgGnTf55HhVErXOxjVX5s1tvxy+SxB
 CPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vOzxNlu5NfLvXqdFSx19sPlss9NRbVfvd1D3cx6Wlo=;
 b=RFKo7gIM3c6EgCX9snQdN2kxEAFP+NMQJUhTMw8wq0LymSyfvNDBavSEUSmYdlC9QJ
 qT9t1OccrVxu9hfJwdpZFmM13CmwS9VH/5QAeswiJ6LGWwBGfpJeWT5fSRFOOn79UAhE
 0s78cY/s0u2yLpX6tDl7NbMVAy4QPPXjvpopa/ANogJqPqFQ6yN+ThApG8RYZd/YsTIz
 hQuc0XW4XIiooUEACH7H3kOx03ohnwuBTSUAk0MnwnmIUL5x8m8Ea8TNcLlg3aKirjlH
 8noUTgR0XDSh1s4qvBYfu+fw/fi2t2qPRsUH2m/FY3OE1tOfXB+Fr2WuKY2WbiHEDNzI
 ZnoA==
X-Gm-Message-State: AOAM532syVKhIHWfJGFseSHBxshdxBFRKTqTe4FCaMuWfFzIm/zVFRqW
 i5j8nFI+GJhpe/MwlJxpzGWMYiw7g/kTPy0O
X-Google-Smtp-Source: ABdhPJz1UdCSUcy7AiFkdb/onnCvFYJbCuqHXA45ykrkxib/zGQ+1SGggLyKGKHSaSIyEZ7STNj34g==
X-Received: by 2002:a5d:64ce:: with SMTP id f14mr29390738wri.17.1628582325021; 
 Tue, 10 Aug 2021 00:58:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id d5sm22175380wre.77.2021.08.10.00.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 00:58:44 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: add audio playback to nexbox-a1
Date: Tue, 10 Aug 2021 09:58:34 +0200
Message-Id: <162858223387.1486110.3448385617438726477.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804140029.4445-1-christianshewitt@gmail.com>
References: <20210804140029.4445-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_005846_754877_42BC012C 
X-CRM114-Status: UNSURE (   8.10  )
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

On Wed, 4 Aug 2021 14:00:29 +0000, Christian Hewitt wrote:
> Add initial support limited to HDMI i2s and SPDIF (LPCM).

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.15/dt64)

[1/1] arm64: dts: meson: add audio playback to nexbox-a1
      https://git.kernel.org/amlogic/c/c7f5675b345224f212a0006c73a643182e953a5f

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
