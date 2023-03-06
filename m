Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EE8C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 08:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZotIg9+RhMt4Rk/1gOSNCt7QqJTluzMPzou6WOOsAYg=; b=svry5td2jOGDhq
	j/OvETaEeKDzTDlQTCGtP2CEhcQEEicDuzu/fXZ6tmorx8DFdKF+1AJA05GgL2rzSOC7kRl5aAJKY
	2J0LfMcldzVZ13xPoj8j/oAgPvAIx8TY1T44pS9yPLbWqODrVbG4UoS2gGj7Ni+G8k/tcgnh66XMx
	qzlAXGSFqwWFOkXZdlPfsK74wOvAmIinUXeEoaKTcLLnrpDzBbxN1v3QzGmURN2V7fr5D5V2hT0+L
	jZE7Yhg00+9a7oHvPLVd8nF1etBXToGDCccGsr0ku4DR+o1jRBozB11H5rmFeDrfluVet/Lc7Uld7
	tfxUBYchsU6qw9Vw2Reg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6MR-00BvKv-VG; Mon, 06 Mar 2023 08:38:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6MC-00BvDH-Gk
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 08:38:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so7579631wmb.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 00:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678091885;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBn8YOHpxIfsYVyC9NKPdmAQvu8dSftWMYkzf80yjII=;
        b=W5ml6sum57UIXTAX+I+A6X3qRi6NnIb34wqMkiVjr0JqSBycww3tEpf5jjrQ3q7Fzl
         ZPMte+96aaRvGFd+38kFRgGbeShWJGfwXeEdo+eRV/vJzMUz25l04JpBjIq7LflIqer6
         mQzV/aUA6HBAGzLwmZ5UK1yIH5vmESbMpIzb0NIDdpBjr+xHCrl4kk4xpilPdCHC1E+t
         bpji6/DG3NB5B3TagNg09I3pAY8yozf4p/eIda7pujQx64PMNLAxoD9un8ZIxFCim0Y7
         NxGjrY+zaZt0p3mFyBY3tKHCqTj0/cgImKQ5clOI0jTdBCXC5IgBEUyLeFf4kotNprnV
         KNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678091885;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBn8YOHpxIfsYVyC9NKPdmAQvu8dSftWMYkzf80yjII=;
        b=eebTv7/wGcFkydx+LjJGOc3fqHqGEsse+k0cn81X7To4U5pCPRl7t4OXAoEK03SVyI
         zkgOE4eEvbltVr05WkP7LZHKdz+7l+WBVVvp9+GW0dkFNEsEZnVzyVGiPw73NZ49K2RH
         2irKTMdmOts4SNZcRRwqgRF0RlY9hT1gro2LZzKGs4/Nu7e2WtE6bNaM8pRuZwornqzx
         7C0F5jqIPnJkHhlY/j6H7hEPxB7H4v2RBg5Hcf+mGsDjjWpajyjxORv7FcncH7hroN5F
         ZCs8XeKEQnJdUZjqQNHzIEAEgV75Xx+z7ufbpuUO+2NKCGeYjP8zl8MYnqWeEJGUUmtP
         ND8Q==
X-Gm-Message-State: AO0yUKXuYkx3/nXiWb/lYj0M5BthVe3DbRT90HDQDikh1+x10+gqgVq0
	7C5KiYUL/gJ8BTuHm1Lfanwswbju5864aVjfN/9gnw==
X-Google-Smtp-Source: AK7set/5NtPMS9Adn1TyO9ajOxORLX91lowOP5e2ZAeZ0AY5dK2cmFRB765KQsI8Ua/Zauf+x5EFFg==
X-Received: by 2002:a05:600c:470a:b0:3eb:3843:9f31 with SMTP id v10-20020a05600c470a00b003eb38439f31mr8678171wmo.10.1678091884891;
        Mon, 06 Mar 2023 00:38:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003eb0d6f48f3sm14184064wmn.27.2023.03.06.00.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:38:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230305134512.1596572-1-christianshewitt@gmail.com>
References: <20230305134512.1596572-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: amlogic: Add initial support for BPI-M2S
 variants
Message-Id: <167809188415.8899.9019667584179852304.b4-ty@linaro.org>
Date: Mon, 06 Mar 2023 09:38:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_003808_734774_DA4086BE 
X-CRM114-Status: GOOD (  13.26  )
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

On Sun, 05 Mar 2023 13:45:10 +0000, Christian Hewitt wrote:
> Add support for the BananaPi M2S which ships in two board variants with
> the Amlogic S922X or A311D chipset. Schematics for the board are not
> currently available from Sinovoip so the device-tree is largely derived
> from the Khadas VIM3 (also S922X/A311D) and other recent BPI boards that
> have public documentation. The device-tree also supports the RTL8822CS
> WiFi/BT module. This is optional so the nodes must be enabled though an
> overlay or fdtput.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add support for BananaPi M2S variants
      https://git.kernel.org/amlogic/c/0e1598a112f2e270bdd5771bb821f12852c548ac
[2/2] arm64: dts: meson: add support for BananaPi M2S variants
      https://git.kernel.org/amlogic/c/14e14723d2f58964f13e825738d01f62a8629e90

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
