Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644BBEB64DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jun 2023 09:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMXYMdbAOcN4hz2ZXtCOathai64ZZAi9Q+57VjcxHHk=; b=WQvIyAccaI6nfd
	yhL/q2R1878MARy40Q+Mmjpo3cfmxdnmpCY51jRFrYAAZZeVLNLkU4yvF0Sf20nOBmhPaJCC8MrBJ
	cktbVE9gWWTLW9UgJePvWj/Kydltoe4iHOeCx2G9lsOZHQzZho4VlsQ/3DjLTNxAFC3a1Rja57dRk
	Bzm/ffJk3hhgHJu86qQTzrRsQd3qOFNNsS/VaBbJ2AnyK72Y+eHEvKc8/9bmHc5CyCensx+YeiVAY
	DLz2lqDCXU9CjocZ2XBZLE2R/thuyvZb3FJFA4kRgmbTfH4Hp9QFjA3TqJyuLJTm0Z4Cfz3nioCDI
	hXns4ukaEPE2MMJGt1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAnz-007wKE-3A;
	Mon, 19 Jun 2023 09:04:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAnw-007wII-37
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Jun 2023 09:04:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f900cd3f69so16798545e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jun 2023 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687165447; x=1689757447;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yGd3GSbLFhZ5atbejnGL2mGXHbrB6Og1PKpMLfAUrY=;
        b=WOlUKyrsHN+PneEtfTf4PaBEyfLL65+KwXaNw5Dkon4zNvm7CGRnc/jtNmpM3UvOvS
         1uvQm0wF+P0diAvmPDCO0zNETEwCtDclnRsONuk+SowkDZebLc4MAlfoE/SDi8Q0oGAJ
         Ju7H/F34CnjzJaHwnuqvzgBEge/e7ZcNsv91dsFYE1a1BQi0BD2Hxr/PLjk2pXeSqoE7
         jsIsoddCJLKPlN4dXu4FOGJh3q5wtR0KHhudgSmBKKXflbWqHN61HNSXcXFEnps2w1jy
         E19Illjnx+qpLCB1onuQHngO/C3H9PSeB9XWt2NfekFmtzg2TgBGgmyuBAcfuB7cUDym
         WsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687165447; x=1689757447;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yGd3GSbLFhZ5atbejnGL2mGXHbrB6Og1PKpMLfAUrY=;
        b=c6V+bbO8AfRVSy6TBt+gDcVcm5H/WPz5oCodeHwDL2VBddtKb95M3tapqwLpGnEP/x
         09+4eEv933jwbr1P0yD+HObSFIual1IKYhIno0HY6ss4sQ4BLJ2IO0RsZm2oIbQ780Bw
         tcOPdQeEuB6LqemInJ3TFfP/BmPrzfGVvzR+jeTO/GTYWwxC0AFPW6CAhzJtTSUgBQ0g
         H3JwxPXwRkEDpw/IwypEfs2ZHXMnEG03npOzNHvNqVCpV/XoZJAT9aQJ86zEuqGqx8TP
         cNYGoCUdHMDmFl3ODCbkDxaAtRXLhnT2IlT95/SXioMfUEd8NkCh7RO1JCUaw2RNcUcU
         EZRQ==
X-Gm-Message-State: AC+VfDxZz9+Ve/FoaRp1jfqokaS0cX7kZKQtARbe8bdFrb7glpK/3+0z
	pGkHPxhk4VmQQjwkS/faYC1/pw==
X-Google-Smtp-Source: ACHHUZ6Id4Zo9VfB9WYG29OMsmVG3Fwo8v35RDi9Sz8WnpwhfvScLCULE5Z4NMDRo39oZGxlqaxHCQ==
X-Received: by 2002:a05:600c:ca:b0:3f9:163:35d5 with SMTP id u10-20020a05600c00ca00b003f9016335d5mr3859462wmm.2.1687165447362;
        Mon, 19 Jun 2023 02:04:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c6-20020a7bc846000000b003f8fb02c413sm8633213wml.8.2023.06.19.02.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:04:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexey Romanov <avromanov@sberdevices.ru>
Cc: linux-arm-kernel@lists.infradead.org, kernel@sberdevices.ru, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230610090414.90529-1-avromanov@sberdevices.ru>
References: <20230610090414.90529-1-avromanov@sberdevices.ru>
Subject: Re: [PATCH v1] drivers: meson: secure-pwrc: always enable DMA
 domain
Message-Id: <168716544629.1449314.9025193999820850128.b4-ty@linaro.org>
Date: Mon, 19 Jun 2023 11:04:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_020409_024092_06D26E6E 
X-CRM114-Status: UNSURE (   9.14  )
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

On Sat, 10 Jun 2023 12:04:14 +0300, Alexey Romanov wrote:
> Starting from commit e45f243409db ("firmware: meson_sm:
> populate platform devices from sm device tree data") pwrc
> is probed successfully and disables unused pwr domains.
> By A1 SoC family design, any TEE requires DMA pwr domain
> always enabled.
> 
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.5/drivers)

[1/1] drivers: meson: secure-pwrc: always enable DMA domain
      https://git.kernel.org/amlogic/c/0bb4644d583789c97e74d3e3047189f0c59c4742

These changes has been applied on the intermediate git tree [1].

The v6.5/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
