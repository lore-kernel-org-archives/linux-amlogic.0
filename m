Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7A3C678D4
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 08:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PpT3wsqyetejgbspAlkr8yZ+Q1adR+NplbEx22LXH4=; b=EOK84JtRmBIkGP
	PoUTnUNJ0OZ4yiKOIf92GlxzkEompXL39QgdJXxi23VcwFUltDe0DRoUFeLTxtL53ecFIofyAX8Ul
	wFLvYhD5vEYjSDXL+seaNVhHgYBPT8ryD4l25l27i44no8dFh8tXOxHX6yms54zSGXinjEFH0sl9a
	bReWTw437q49rDURxTV9RtzAjcjs2jecADlnIwNlCBNXKEYvADRwear0rvDPXsgYI62ok9jCmsgxL
	UY6P0cmOLx8d/3gged9gUYi09Jk0D+CuN63HQ+W0Jp35UCrll2vZ8T1rCiRVMVWkrkGohFdlxYkuy
	2JT1/NltIuGqSC5kOY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSLC-00GaYm-OV; Tue, 07 Mar 2023 08:06:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSL7-00GaUk-PB
	for linux-amlogic@lists.infradead.org; Tue, 07 Mar 2023 08:06:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso6654613wmo.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Mar 2023 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678176385;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlixcmRPU0kwlxyRa6XJ1Wvf4b87DZOdNPk167ILrOo=;
        b=he6cKusNCUpkvICX9VIckGy2epdvPViwko/K7fRoU5NihoUHmLgLPMeeh2w/Zz3jrh
         /GlaAAxI5qDtv3W5/Jf43SezLl5FaSNnS9V8OZI8j+nw9zYh+UAQy47tH/mUNa8KXAsi
         6VT/fSI4f9wwXxHzc79DQhVAumzXWp7XgiQiNN0S/LaofJgq951JLwgUbhCZySVnO1cl
         o4/dtStSWUIQWH/orQI/LnfwjFCq7iGbsrlYWPx/fmzNXErTi31vKGx3W/wnCzzbl7ub
         9BS9uhbdAcWHvpPFfB2ruYbTBI2Q/GkodWJh6QVauTmxHF7xN2xftPvNPF/1dAFoJefj
         xBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678176385;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlixcmRPU0kwlxyRa6XJ1Wvf4b87DZOdNPk167ILrOo=;
        b=MjPOylHmmZnRqLARywGN0yVZIwa0WgQ6fx7QLx52jWOUKOt0R9c4fbOEB26g/Ho1HR
         1MLZRcJ7ifRQmm1N+2kk90R0AX77CDejDUsdJVQ9RTs3WIpbnJSW5ZbwVdJElQ1cHR7r
         P+g9yUhW9Pt1OEOJYqIRKxtn/ILS+DIp97UNCOGWWZTlf5rkXv5JDSnKoU5h12dJtJ5R
         RCm7yy/c6xWoQS0Fk54F3RxWGkAp65n2JOL005FhNafoiN5ki01M1VbwPLSlr/0iQhRF
         yGomZpbzEMNQ3sBrZduTteTE8F1GG9/wtmLaHdk0qsYeIoVe6WAb81YyESGZ4NV7JHJ6
         gmKw==
X-Gm-Message-State: AO0yUKVbBsfOt3tteHCjBKgc7+IY05xLkPJd7qlRvEzdbQsBTkali6DB
	7ApJeQHFQaCvdbHeJhUYQrOk4g==
X-Google-Smtp-Source: AK7set9/dRT/dzFhPvrICG4vwvaMfeiVpFBx/GhL+4bReBNVsMts2vq/bj2VLCXRaf4cWgBN6DcMlA==
X-Received: by 2002:a05:600c:3b9b:b0:3eb:3998:36f1 with SMTP id n27-20020a05600c3b9b00b003eb399836f1mr12408519wms.41.1678176385065;
        Tue, 07 Mar 2023 00:06:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id s17-20020adfea91000000b002c6e8cb612fsm11671889wrm.92.2023.03.07.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 00:06:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230303-topic-amlogic-upstream-bpi-cm4-v2-0-2ecfde76fc4d@linaro.org>
References: <20230303-topic-amlogic-upstream-bpi-cm4-v2-0-2ecfde76fc4d@linaro.org>
Subject: Re: [PATCH v2 0/2] arm64: amlogic: Add initial support for BPI-CM4
 module with BPI-CM4IO baseboard
Message-Id: <167817638406.768652.1431202103503389441.b4-ty@linaro.org>
Date: Tue, 07 Mar 2023 09:06:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_000629_855017_621A2750 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 06 Mar 2023 09:31:37 +0100, Neil Armstrong wrote:
> Add support for both the BananaPi BPI-CM4 module and the BananaPi
> baseboard which is comnpatible with the RaspberryPi CM4IO baseboard.
> 
> The BananaPi BPI-CM4 module follows the CM4 specifications at [1],
> but with a single HDMI port and a since DSI output.
> 
> The current CM4IO baseboard DT should work fine on the Raspberry CM4
> baseboard and other derivatives baseboards, but proper DT should
> be written for other baseboards.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/arm64-dt)

[1/2] dt-bindings: arm: amlogic: Document the boards with the BPI-CM4 connected
      https://git.kernel.org/amlogic/c/92c0b261c294f12e329976a6d4ef72651e8f07f2
[2/2] arm64: dts: amlogic: Add initial support for BPI-CM4 module with BPI-CM4IO baseboard
      https://git.kernel.org/amlogic/c/0262f2736978b1763363224698f47112a148dab0

These changes has been applied on the intermediate git tree [1].

The v6.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
