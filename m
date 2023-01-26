Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27062C54EED
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 08:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pc38awQTeMMqsix2XcH3UHQqCiZZ0fZqrGMmtzbnB5k=; b=4HB4yBGoqpmozb
	K66u3tAo3TPIzPjJ0qKc+LQTzOIJDOn/IyoIrji8wp3TG40UKID2EUkgCddceBG/3+BgXo76s1Gbn
	yCr4nWssZLEHx8Ar5LtYm95xBAl/MufJKhV6Rv18zZzYLdWUru1f1Wv5CVjoECPPFeGKuYEhHnPkO
	yUzLtZwfoxvRni+II2pVwyPWV2sL8ApA2v8SmlBazWe6ZeVzNSltWYohIOTFZirKo8pnFGHErY0nc
	VgnpWlcnj4luy2XJgfM2EKP5ZuMfdx9A7h+dEmdIQSmuCK9vs//y5dH08oPMzuWXh2MgHhBfFDZLQ
	kcfHbDfe2O2TlsolTQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxol-00A33g-KZ; Thu, 26 Jan 2023 08:41:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxht-009zmS-Hd
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 08:34:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so613607wmc.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 00:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3TzVEfEJ82Zcir6qMcrdd/Fw4l7IDS+8TiKObawjuc=;
        b=TH1l+DrVsmgeFj7NTgYxoGCraCHc5HR5VUTpjIxdUYxbflqE6+yfxwl2+nCMdykwLK
         BB5/5/raFp+gzICKmf/iIWIQ3nqCJ7OKdMYBNxSlj6YLuHpMGiO/qG3KMzyhegwAzOaN
         JxHcLY/yWtXbjPWYhJA+HPaFCZxIR36TAms4hYroiqJrwUc/5hg/xHtzREr/ESEUFYpL
         9XH37Tw2mz9UZixZ+3BwcscTlHtkww6Anv6EWzNUR43DKzb5bHPp9/vFRWlLeJZtL66k
         5fhc2U4Xvqi5b4A8qz2oofsPBihcDoxzHNE6KiIIlCqCc+h0o24qzOcm/rcT4l9EfVMx
         1pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3TzVEfEJ82Zcir6qMcrdd/Fw4l7IDS+8TiKObawjuc=;
        b=aLZQyWrQ6j/NpYbDClfTWWPOCVFKPEG6S6a7DW3+ATeo75ifuQmQ2jOuKwcPzWQlmG
         7P/yo5j6vL3Uu6yuzCR8MhKopljnGh4+oNJgC5ZVr9WyZoSNdZbRcZ2hPne2YSLjDtfJ
         egvw+KnuqqciugW3k3H6pKU+mS/95Lb/FM+cwP+ES5305M5+1Pz+TTdV3DSZSQdrQRlj
         /3rYuIB7PFhrurWzLc65OVkqijdW+raZlm4E61VUb6hdQDDlDeztHxs/J/i12c/emsw5
         zQhhJVWRak3BkCiOqXGEmiSBWqeBJoeFn/avVxVmiaaWDEpLgk7msMeOZfDX5xw51gs1
         UtvQ==
X-Gm-Message-State: AFqh2kpMF+4AJ7E96rSMGbc7qYEoYZU/BLdJCxyDRWlBDmvUdZHPFVE7
	okv8htF8PjHpgovQn26C+OwNwLACxtz4l/Mf4AA=
X-Google-Smtp-Source: AMrXdXt75Poh2V5szcz9pL/nP4XYvAND7gBaK6soFPsY8rk9bokbpwvJ9xGN3KkBu1q+UAXnvVz93A==
X-Received: by 2002:a1c:ed1a:0:b0:3da:c07:c5fe with SMTP id l26-20020a1ced1a000000b003da0c07c5femr31661418wmh.5.1674722041781;
        Thu, 26 Jan 2023 00:34:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c328a00b003d9a86a13bfsm757709wmp.28.2023.01.26.00.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 00:34:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230123065834.2670125-1-christianshewitt@gmail.com>
References: <20230123065834.2670125-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: add audio playback to S905X-P212
 dts
Message-Id: <167472204102.456104.8089896495896736557.b4-ty@linaro.org>
Date: Thu, 26 Jan 2023 09:34:01 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_003405_720355_45C32C63 
X-CRM114-Status: GOOD (  10.30  )
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

On Mon, 23 Jan 2023 06:58:34 +0000, Christian Hewitt wrote:
> Add initial support for the HDMI and Analogue i2s audio outputs.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/1] arm64: dts: meson: add audio playback to S905X-P212 dts
      https://git.kernel.org/amlogic/c/7e01e14e9f75385910d1e42f97a5e98f36244967

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
