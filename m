Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9BBC3DA7A
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Jan 2023 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3AqOc5AmfK7MX33BsSnbQW27Ki834hhvL2tdUigtaiI=; b=slss4q07RB3Oko
	Zaemi8TDyC8KEVd+ZzCiQZJHwxQjDwg/ext1fmNeSjiW4KlnushU+7wtvHHcCRykSq3r12QxuF2AH
	aPIWZ58MXHN7369mHLdbDup4NWtmOXwoxy7q+nPBcfZMauxC26zJV1ikPh32ikKhRSHtRhVrpVCaj
	BD/mRM2Ga+BHXSX1GjY3yRiprgXyWDd8J75z/XDNCxdTa0Vn6bo3JHAd61TrO+X2Dqusmo2ewJotH
	Ak0gMcKlsMIvf25o/jAkmThxHlKFZhTq+7w8SjgNhac0oK8jhpX+N+7c8maa7Eg/nDp7naauR4Dyc
	iWFxT4WzbO4oh0OUitnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHQD-00A3XU-Vi; Mon, 02 Jan 2023 09:47:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHNm-00A2et-QP
	for linux-amlogic@lists.infradead.org; Mon, 02 Jan 2023 09:45:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso20252110wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Jan 2023 01:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LrOzQPa8gD5g9L4P3t7SIyp2Mv9DEJkOptQ3B3iXV8=;
        b=BafktxLPHJuCW6QiDiEOMJh2F3XBEG/ttPYufCQmdjkjvw8Kd8B1JCbLPJDbtv81Pb
         lfTkbJrgND0waoiT9qaArWhLT/I5XmtLFeVKGdJhmL72GkJ9N2Lkl96CNeF3ZiCCshCd
         NxFbz9fF7a7SKsW37+qGDsDp0EcWAAOLd1SFtEnzBYdiC/enBNJqbNhsEFCskSlF5DE2
         CePuOlCKvNn1OyUnhUKJUWckxPiapr8lAFHp5+3TRU53Q/1tYiKdz3ELzttdmexcNhTV
         sRYhWvnVT2Ot38IjeqGUh02oV5ZNSXyWRPXLQVMN4ZBKsAvk5flxeMdK89r/eBB5kayG
         oEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LrOzQPa8gD5g9L4P3t7SIyp2Mv9DEJkOptQ3B3iXV8=;
        b=qP7RoAlniUmjaeowrCg+SInsVGSqAU6rFcFVkqUdjr+1fMD6WjLqzTffbky6AnwPK7
         t1bgw5L4H8875uKrnqw1kEqc4ySL8IeNd1aZoSGhSdDmWCNIVVAIKNWoydyt0WXd13NA
         5GFzkIIocUxsCzoFAQK3A6Th0Vt4h+NzO8oIiCmcu+/v/QTyCiCfKfDkRCEa2T2kQMcr
         ULtTtF05QwElgsQ+f+45JBuzHnuI0fZ10NZnLf+dcmmIs9HtNMgKT2m9qE0orCqizPBy
         89ddNHhxc8NZ8b/j1t7fSmIdFhuS5v+pMlQy/x75bbdma0lbvLJHjRV84ukcjai17NhD
         IYJg==
X-Gm-Message-State: AFqh2kpSawwst0ahl1mHUbta0aam4VKdUlCXakf+beDkjNwFYk/Cmo1l
	WYSgjgF1aVWDS8rOmic8PXNOqg==
X-Google-Smtp-Source: AMrXdXuN+K1vBJMRelJpQcZd+lJtspet80eKKFN6LeiLPG1BkFP4jO4WEIszB8YePk86AM6y94MHAA==
X-Received: by 2002:a05:600c:4f48:b0:3d6:8570:1239 with SMTP id m8-20020a05600c4f4800b003d685701239mr35213480wmq.16.1672652721945;
        Mon, 02 Jan 2023 01:45:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bca41000000b003d1de805de5sm37458526wml.16.2023.01.02.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 01:45:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <20221125144120.476933-1-krzysztof.kozlowski@linaro.org>
References: <20221125144120.476933-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: meson: align LED node names with dtschema
Message-Id: <167265272108.284515.8939989113770770752.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 10:45:21 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_014527_060346_BD1C6575 
X-CRM114-Status: GOOD (  10.25  )
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

On Fri, 25 Nov 2022 15:41:20 +0100, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern:
> 
>   meson8-minix-neo-x8.dtb: gpio-leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm-dt)

[1/1] ARM: dts: meson: align LED node names with dtschema
      https://git.kernel.org/amlogic/c/efccf602b37fc1064214e6b5fdfa9e77879a9bca

These changes has been applied on the intermediate git tree [1].

The v6.3/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
