Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF090C001DE
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuaw5KZPyuu2QHjgUjPHVLhbVVgAUVqOkA9DTpGb0e8=; b=Sy4i3kG3ngpWtv
	siIOEP2+b8AAarl5voJqu8WMxaYsAGP92iJ29tqG1Sv71pieymEqqxzPpDav4lOKHKgyGT8aZXxZ/
	sYDrSsANCfe+zo8InE7+Y3AU+NYVeH0Wtv8n/r4I5iJCSxYROtbNmMkFwYW8xBnXSPh/X8Vrcwt//
	a4ZOwniMeiGR5xOzINLsD6MA3JXaHudv1RB7Q6TCEuwLY7AZxVklvqILUFgpMi1l+6RHKdMlS2GAM
	rXxi4CuzEej+y4bDhkIsgGdcTlUqJuLn/CWSAhmaZU5mP3LrTIwPVbt4sMxDHCUNaUg+UfnLXm8/+
	aWnQb7wjHGvkRgMpWYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPVF-00Ep9s-1I;
	Mon, 31 Jul 2023 09:47:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPUZ-00EovM-1N
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:47:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso39830935e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796826; x=1691401626;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qx7Ls/SUOBXHVBMm8UX7N73qmM8FPDs70MQuXYK8erU=;
        b=JAdysYxRIWOzqApA2SmEt9RWP1U+gNpa3LGWAnRD1ZSpjjmjWF1rTf348gp25MwZTs
         eUhb1n9y3CMue2/wKWSGdmXmY+rhTeESB1stJ4bwstrmZ1bt9KsOA7FnXFAVDHVCjS/+
         NCYPny2e/JAvrc3JfSnm8Zem5wDEiK8onfu01IXtk4r55rTnKRwXVhj6TtcaRKs9nmOJ
         8UAdrsTnGpZQRMW8Re6aQT7kOkRK8/qObNnjUNxDqZBEsBcT0OV5Y5ch9xL5z5//ehyT
         d87jXIF7Jdr8n/K36BZDEW9Din2sDqATKOwyVBok62pVe9QOyePcHATrEEvBPRwsLfs5
         4SGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796826; x=1691401626;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qx7Ls/SUOBXHVBMm8UX7N73qmM8FPDs70MQuXYK8erU=;
        b=OUv0oQl5tqUqcWLeU8EE/x4ik1iKNb6oIctZFe3lySuj2o7BUNwLlLo/wI9Fc0kNiP
         kzHJXoA/nYGpCDEAGJA6QgZMacCGegFl2tvxSaCZf1yLXyLMVSPH6RwxBDSxzyR0gqwW
         +I9QoCkxAqlgE3GaEAC9N3sSFGzmVl8S3yKCYWbsrI2K0bN92T7dUgstrnGvdImWM2/D
         5VS6YhZwTry6V1UjvK7KZIjBlu0maPvAeJASx931xaV1M3pA3iBolO7cW5pHbgZH1eCv
         y0gMyc+ER7vzOB1UoUIrOM0+dwOLPmUW+Q0N0NQlIQ3o729aJvPUHx0Hcc/QYd9yZcps
         n+YA==
X-Gm-Message-State: ABy/qLZLresBQYxNSaVm3CqtSmfUDUsWqisnv7VOFrpd8Zl2bMdGmRtX
	CrEagVOjZBA2l5xbalRY7qzPAw==
X-Google-Smtp-Source: APBJJlGMyipzlfbtXhIMjkoYwIcc3r5BAUwgU9QryvtjkDAzuhRSAYVeC8mZ1DYyi797G4rwyvzJYg==
X-Received: by 2002:a05:600c:230b:b0:3fc:e00:5282 with SMTP id 11-20020a05600c230b00b003fc0e005282mr6426612wmo.0.1690796825930;
        Mon, 31 Jul 2023 02:47:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d48c9000000b0031433443265sm12556878wrs.53.2023.07.31.02.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:47:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731093615.148949-1-krzysztof.kozlowski@linaro.org>
References: <20230731093615.148949-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: drop redundant status=okay in
 sound nodes
Message-Id: <169079682486.186625.15061697732696889400.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 11:47:04 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024707_472110_96DE2C90 
X-CRM114-Status: UNSURE (   9.60  )
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

On Mon, 31 Jul 2023 11:36:15 +0200, Krzysztof Kozlowski wrote:
> status=okay is by default.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/arm64-dt)

[1/1] arm64: dts: amlogic: drop redundant status=okay in sound nodes
      https://git.kernel.org/amlogic/c/3eced2a20ad5692af6f3f05e89a682c6378a7a74

These changes has been applied on the intermediate git tree [1].

The v6.6/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
