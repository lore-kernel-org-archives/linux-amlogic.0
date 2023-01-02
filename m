Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16F8C5479D
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Jan 2023 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGhT1Y2/uhfILrSqIVC3MZOjyFfivbSuz8xjFnUctJs=; b=xOMrVgeViqAD8d
	a5youVsq62fQ0QI/KrrJ9kWGoKgJuqRsxb2g+NDv+71q1oq9XbWHZERg7jxj9XHnHvz3FX6+bu1uV
	lRWKgC68qYb8BvMGQAU/gMjMA1zd7gwsl2Kgijq9R7QmeNcYLvlmXfM2i5/mRCBM5P8PpxXBV3mE+
	q19vF3VrXv5jpUtSHy4NRILrQ1qA3yWdIdRa/cS6lOoImOxS2goLb6KUGd5mF81Q0wYCkMGXqlSOk
	rt52mClbubByZePoa2qJJtft0yjZGwItEvCv01seNvtCY+f8dadtieLATreizlcnymBPkRE6NL7nX
	azEH6z0DPC++by8lUzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHQK-00A3am-I1; Mon, 02 Jan 2023 09:48:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHOD-00A2zV-Sd
	for linux-amlogic@lists.infradead.org; Mon, 02 Jan 2023 09:46:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id bn26so6404668wrb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Jan 2023 01:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUhOJ4IoESrQwEIJSXhHd8/46+wScNtzOgrodDR1Dto=;
        b=oo6SENSI5d9/g3PhqgDoHzVbQ5cD6rh1VWKeuXQn3vlANcOrokLilbxnAxyM5UlHXl
         NW96zGRIUmun6vb9ckp49ZgwikZ7sZrboZyRRiThuBBn9y5xWmfBykLHIu1IdnLnGQ3a
         9nNvpcfClWaP5z7dQId8GeiFQqpTeE/gx76JytQgkGu7Yd0h4R7X/j8S+UWVkeETOr16
         fDJ1asbSbKq83gH+RH+7IpxCHymaTtY19T46BhFSd1ADz39WGC+tB1djzJWwk/oc843O
         atp+7Jz6bLGqPL1DgOZZnJd4hvobHrwXD6n9OqRfAQRvR87meShvntxl7ysot1dEMKzp
         XKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUhOJ4IoESrQwEIJSXhHd8/46+wScNtzOgrodDR1Dto=;
        b=EHUWhHB7X/GJNLY9IhhD5PIzqDsNH2avBlzYVaRjCSgPyKZbeJa9aIl6+msFUGJE4J
         cMr3J69nd8If3m4hX+02X63tjyC1kSTLO2QrFxmEqTxMKYLoSEYcanL1uVCWTU5+Smxy
         k/OG5uDbFAFOcbL6m0MqTL6cPm7UjAr4vz+ewOxkPUdZbLnsoiCCsg+PcXLotF0qC8oR
         /QKqeQyqM3boyTnjRSBn8lZUH52zpKBwnQtXaHbxP/drkJfySldvWKlc36f8j5ki5PQC
         0/GE1XEh1y9/JRQT1lzV+uuvG2c5YfVwcHi3MRQPnW1H/B+SB8j90tgLS8Z/EbwSpLLL
         Ha+A==
X-Gm-Message-State: AFqh2kofuDMIRvYtsKaYncteIQ1ihnaL2yuvNYPqbXcr3ummlvwslEvy
	ycQVNDh2N614QS3ARapoao0DmpgJ2c+rs3Gw
X-Google-Smtp-Source: AMrXdXuba2JBxmozJhuTBAIpVh1ksFcfIJoDILKrHE0lEw6Hh/gGocGCnufZZbFqajhZ7nbidMvIlg==
X-Received: by 2002:a5d:620f:0:b0:242:9e3:72b8 with SMTP id y15-20020a5d620f000000b0024209e372b8mr28311651wru.31.1672652751312;
        Mon, 02 Jan 2023 01:45:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y6-20020adfdf06000000b002879c013b8asm14413840wrl.42.2023.01.02.01.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 01:45:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
References: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
Message-Id: <167265275027.299493.747557222929331927.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 10:45:50 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_014554_761383_BF8D4FAA 
X-CRM114-Status: GOOD (  10.35  )
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

On Fri, 25 Nov 2022 15:41:41 +0100, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern:
> 
>   amlogic/meson-sm1-bananapi-m5.dtb: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/1] arm64: dts: amlogic: align LED node names with dtschema
      https://git.kernel.org/amlogic/c/ac7f40c28bce2fd1a771e634531ca4b0dd9576f7

These changes has been applied on the intermediate git tree [1].

The v6.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
