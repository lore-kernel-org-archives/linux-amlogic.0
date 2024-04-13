Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4D2C04FF8
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2024 10:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzgOy1ltnY5MbRJ5s1Jfxm7Q9paNDSFh9TeM2ihzYsA=; b=YEyqDacM0CRP3+
	RVO190uVQwI0X7KqPKVZL5vn20gtsHULHr8FZIbycJYipIfj3WP/T0sUuQ/7HBXmc7k36Mw7wxdEe
	RsmQgwq6bsN+KjhDKr9PErohepq5G0lPoo6LcMHKbyLX7uDFUeA7y5L/VZkCzomwkqGKIFvdOswi6
	6vhVB5xLMbp8KtUVCGnDDhdHv1EAdtLqzZpg4OaUfc82rBZ2bZQY61Yx7Op+Q5OFgz7s6TLrLdVXu
	DUzXwEksm7Dup9ZA6nQfJx87g5Pp3KudMUSWCAex9BiB3FH/82+cv6wt0nIUfRUyJ7mn0Qlvs9RDI
	1AriduSZky6zr863/Dwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvax1-00000002z6A-2fsL;
	Sat, 13 Apr 2024 10:49:39 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvawy-00000002z43-0PHS
	for linux-amlogic@lists.infradead.org;
	Sat, 13 Apr 2024 10:49:38 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d87450361fso20204241fa.2
        for <linux-amlogic@lists.infradead.org>; Sat, 13 Apr 2024 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713005373; x=1713610173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8Z3HuYTbXEsN9VPtxZx1iO8X6HOC2T5LUFkkwLy2CY=;
        b=WQU1Z/HrAoNxH4Ug1nPfmb2RpXDPyTqsdGia7AZ8xPAm6KjOvekGkmErQTGGWkyWwH
         lB9ZcrE62dP/Wes0GjfxeIklk49aZbbZ59r8vWLdWsvfnd+YWAukmwyTmJr07e0tyjW2
         Nv9dkWGoP1kSoSb5MsztngcP72fRd3WL3sQdF1cgs7B/qAU5eDxLBnxoXzo/RjO8LdWf
         fpMkt8RIgOlvJfVMs9Pbppz0WyMC8GdhaGjRgHpfcMxiJMvrOqyKf5HotQKXOF3VEmSJ
         GhwPAjki/zSZQbcE3L5kW2tGecxHir0V+lK9Fd80X5CJSvsNQfMm7eAJl7I4e2AUaLuS
         hURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713005373; x=1713610173;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8Z3HuYTbXEsN9VPtxZx1iO8X6HOC2T5LUFkkwLy2CY=;
        b=gQpMf2gckQo1RxLow+FeLTMu8jkAYD4FPbmmH7LcwIZ4aRAVUuL/RUahlrg8VQfAig
         hnMm8pWMmnQpnPbF3LTivxpnfSGwfbcOpBl3HGWdLgPZD4kQMneGbhWv4GjCDxeS6+Pm
         C+lr7UB4AT5HNqnQuAZEhsFR0A6RhTVUC+87DST3PTTtYd6SJzYjWWBBvfzMXI/uca/0
         bTDNS49XqEGRL8nATbBgL2/KJehHwrHwr7hg4vwAvuEAzl38lVamqY0X8M0e2LM9NSAP
         fV/N5yd8cEJ+JP7FbyEFYkradvEYE8SIvvxHc2MNs72yQRk8NWQ73p9bKDOxca7tfSN0
         Lkfg==
X-Forwarded-Encrypted: i=1; AJvYcCWkZTPr16kbfCqPl8J8jEM5+8H45VxrCuTTVdIzmNg0lHkkSs+zPjIw4qorV8p6j7y7AF5iD76Z9Vf5eFi2WkF72t13w5OkdwP/lLykSa4a4ng=
X-Gm-Message-State: AOJu0YwJk0ZDKPR8E5U4aVnmG8PAO5WhO0RUqE7IgSEe4gVmibmduFP4
	3zGDMuehlUs330vIC86VnCyIJHnbhXtpQ6BbiFnr0aM8+cHWNrUSgAeDXP3CqSE=
X-Google-Smtp-Source: AGHT+IFRlSclFgsL2wUSNBWFP88r1//PYF242qEGLw4ADw0HNI/ly/0JDW3YbP3D5Z8Od3QlOEEW+g==
X-Received: by 2002:a2e:7a19:0:b0:2d8:63a2:50d2 with SMTP id v25-20020a2e7a19000000b002d863a250d2mr3328521ljc.6.1713005372978;
        Sat, 13 Apr 2024 03:49:32 -0700 (PDT)
Received: from [172.20.10.4] (82-132-212-30.dab.02.net. [82.132.212.30])
        by smtp.gmail.com with ESMTPSA id iv11-20020a05600c548b00b0041665b6e111sm11732864wmb.12.2024.04.13.03.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 03:49:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: neil.armstrong@linaro.org, khilman@baylibre.com, 
 Mukesh Ojha <quic_mojha@quicinc.com>
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1710259663-14095-1-git-send-email-quic_mojha@quicinc.com>
References: <1710259663-14095-1-git-send-email-quic_mojha@quicinc.com>
Subject: Re: [PATCH v2] nvmem: meson-mx-efuse: Remove nvmem_device from
 efuse struct
Message-Id: <171300537169.23753.14785841851692564085.b4-ty@linaro.org>
Date: Sat, 13 Apr 2024 11:49:31 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_034936_267432_37909275 
X-CRM114-Status: UNSURE (   5.92  )
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


On Tue, 12 Mar 2024 21:37:43 +0530, Mukesh Ojha wrote:
> nvmem_device is used at one place while registering nvmem
> device and it is not required to be present in efuse struct
> for just this purpose.
> 
> Drop nvmem_device and manage with nvmem device stack variable.
> 
> 
> [...]

Applied, thanks!

[1/1] nvmem: meson-mx-efuse: Remove nvmem_device from efuse struct
      commit: 9e29a1dba59bcef937af7015e53d113309f49231

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
