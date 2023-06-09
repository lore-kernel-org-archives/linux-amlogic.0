Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252FCC7EE2E
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jun 2023 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cZXKM7nQFZLYHUUDi/lRclj2xDMhxYY2FlmbAZ6VVgc=; b=VQjX6ukt2kPKMT
	OJcwnpUZgES6o1oymkuHu4azIkrRdW5NRV3ZCZgRGNzZzC5ay/GcKFejidOlsQfM59QjDOec9CMBx
	5HQg7GPC4NFJU/eTwgFaF9vdkA7cwsCFgMkmN8QGBVDgVtfrV46e6pPim+Nt/ZUGE+VToeJpLKZ/Y
	IegxJHvOm5Zy597S5tqX06IMRTbiCWFPDS1TwrYhnh6xkurMzdemkv/fmtp3Ln1q+IE8X/uxxUxhR
	NL3LCFe9sZP3vF1AfK4Ar1o9QRRPqOy62vB4fOZESeHO7bBHzPRV+qvv2WSUX8sfn8F9kVHlNYh3z
	PXaveIfZmVyL6SsUKmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XMA-00CDKy-10;
	Fri, 09 Jun 2023 08:20:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XM6-00CDIv-2p
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jun 2023 08:20:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f7353993cbso11455245e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jun 2023 01:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686298820; x=1688890820;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEpeYdYoJgKJrTBZbzUOxN9h/0+i+ldA1liMqmnM070=;
        b=IttHGdBwKz5BzftTq7a9nYdXDVtfdpiBfvPla8H3kLnaAjRiP8Ccy4bUCKgCsP4f2W
         bNCY0kOQ5dZePkLrw+IvcsLMa30rr67wHpgpSfBVxKf4NW9LfPV/avOa5uf3hC/JOH8N
         f9he2j5aq5z9m2wbYUixDgDw5MR0cdld3ip9BhysdphI/YSYFnAWMwtiCoLIolfnDJXO
         zJdozKdqwtRMPIsR8M8SZYxRh95DtX4c85Yk1tTf+1MMJXGJRJYhguro/GqIO26Elmcd
         4TSlg+XR050+becIr20JY6978SYUDWpRNg62bA+KqsCs9MEwkvDYQg9XbvQUNxBlY+jB
         9WQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298820; x=1688890820;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEpeYdYoJgKJrTBZbzUOxN9h/0+i+ldA1liMqmnM070=;
        b=WHvdfHybqKSkwvUVhHYYRU6txoUTOwcrwZYYu0NMW/tcF3xoCFiCX7WgumWqyNlbMD
         bpUwx8Uwz+K5d1kOLY9f2kwTQgMAXhjS1iWZi5OFxbexRA+pLerhRnd3mgAxd6NErKZ+
         mMXoa1WfrW98Qfx0RC6ySa75JzGt6EYs7xwy3H+hcNQWWnZ+lo5aYv9oQCvZcH04Zvru
         zC4n+AvVQDqCdCuPdHaTiZL95VWNcwwZlBD4alYhHVSbi3CVwmDi9mrkYojNiRGH+giH
         7NF8JpsVqf8/dBmduRjh0W6nKc0C9uDp2wYeIaioj3ZZueGrb4y/qpPZGe+88yspkCHs
         uXpg==
X-Gm-Message-State: AC+VfDw9LGAPqCwPyx9N4f4UZ/wYch9SEyVgANQQqXdqxY0a4Gs8fbsF
	GPJHIRBB2aTnSMhfQicp4GlNAw==
X-Google-Smtp-Source: ACHHUZ4xQ78rpXA/cCsZSZIGl793WCOnbBE3tBEvgXDFKj/vrsvd+jWt1RkmRnDyLIDZaP2G0jasQw==
X-Received: by 2002:a05:600c:3508:b0:3f8:651:4b37 with SMTP id h8-20020a05600c350800b003f806514b37mr757080wmq.2.1686298820025;
        Fri, 09 Jun 2023 01:20:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c40:3a0f:b23:350f? ([2a01:e0a:982:cbb0:5c40:3a0f:b23:350f])
        by smtp.gmail.com with ESMTPSA id y17-20020adfee11000000b0030af05fce4dsm3784765wrn.77.2023.06.09.01.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 01:20:19 -0700 (PDT)
Message-ID: <21b55df9-3eda-0a0f-cf76-79b1d7735314@linaro.org>
Date: Fri, 9 Jun 2023 10:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.5
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_012022_928066_3EFB0130 
X-CRM114-Status: UNSURE (   6.69  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's an Amlogic ARM DT changeset for v6.5, with only simple low priority fixes.

Neil

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.5

for you to fetch changes up to 98b503c7fb13a17a47d8ebf15fa8f7c10118e75c:

   ARM: dts: meson8: correct uart_B and uart_C clock references (2023-05-31 10:55:46 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.5:
- correct uart_B and uart_C clock references for meson8 & meson8b

----------------------------------------------------------------
Martin Blumenstingl (1):
       ARM: dts: meson8: correct uart_B and uart_C clock references

hfdevel@gmx.net (1):
       ARM: dts: meson8b: correct uart_B and uart_C clock references

  arch/arm/boot/dts/meson8.dtsi  | 4 ++--
  arch/arm/boot/dts/meson8b.dtsi | 4 ++--
  2 files changed, 4 insertions(+), 4 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
