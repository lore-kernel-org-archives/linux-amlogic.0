Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D4FCD4F3C
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NpIK6S7U4GdwruszLk3aEo/xUxpPIA/XflmujVnTFMM=; b=3BAJH2zAGU9s/M
	qVnN4Tggq53Up4Giky5vQOxAlALCKP1yoeSrjty2HpolqyLfZZUoIz3JYL4lNLIBC5XSe9uY3vRnS
	9f84vr6z90wEGYPOUWZc1QzQ9pRHno4+sANykSgundOo0M698aSCIrNaqgqEeTwTCiOW4T/cAZANM
	JfTQsjiojWfjQd1rvjsgln72l4ey8P1Z6uvkgMNutUqVv2smN55bh82MOymLS8fSNHwKuqStoTEWq
	nN/vsdJ/HNhbwmzeBNCKXB5/XxbUorvsLMGu7GeWN6TqhAJtxtDwMzeY/nXXRNgxEEAQ0QpnUBZoE
	Ao7w74gPMUnGtWkx6VqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pr-00000002VVt-0Luh;
	Wed, 13 May 2026 12:37:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pm-00000002VSF-1ZhT
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 12:37:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso45995835e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675824; x=1779280624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOt16YkryKexmXJipwSE2igWxVT46laeHn0nxx/qJ1E=;
        b=Prm32rwLTAlcrQYdtd4fa+gl+K8n2yD96slHlhKf87F9sVl3/L9/qLPIGTG6gGKKCx
         BV4GB41X9sDRPF3qv1xpzM7W4ouOtIAsDJLnPync+AbMCX+x16YXhmRWxjHAoV0IdW/3
         Fr3TxlGT/bEm3NUZ30GfsJ1yFt4K8g/eJLcoSKDKlgqq8/oMTOusZxZXT5jIYGqBVjMT
         nYOKjpoU3ULMSv/rZxKYO90GOrLPTwcWcoKOCOmiZFbCqBmoCbtnrWQIBL34dGiODszA
         qsC8pOGqI6xNCi+lXAf2OXB4t81UU/0gp7S0E90eyWq6N3JN4GkdHUs+XuFX2QzBxzrD
         ZrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675824; x=1779280624;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YOt16YkryKexmXJipwSE2igWxVT46laeHn0nxx/qJ1E=;
        b=Gw9DKXPexHhthZip7RnI9a6Htkvd2xmuhh2dbCMPm4IYKTG5EkbNQCwqWajrcR/VXy
         SrWsvt257M3SY4j407zO51H1jQmTHz1j7N3Gjdf9bzw3b0kgpuDEN94ujqWui+Rb90ap
         Y7bSMqWvQ+++sh+B/jM22PM8f+F6B4oaXa9em6a42smiG0+/qFB21oSAo76H+8AVzIZx
         qPTHnNg6G5/4cHfVNsuTm6d0tDA1zgYqNYCK1YIZzNA9e8Y1yS6UIKne4OKoNwx7N3a5
         8p3OEWntskUaweIf82jkDBabmK493dXz3hH622aRNTZivZ8Lv3KNFXXZbB/fs2RZjkU7
         ujzw==
X-Forwarded-Encrypted: i=1; AFNElJ/h0rLR8GuN+Qm4eNJzA35YwqJctHj534Z22UWduShs9H3pBypR3aI9bVXk7RgeesY7ts88+Jx5rw0wkvwm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb7BzMqKzckVwaN6TGaHHJB3aK6YHEbQV8rGcJMgx/uSaR/K2i
	We1oE8W04ocN8Ip0QzIAGTcTb2jH0Jm3hoZKvfa/H9i3tCvtsuQIx4ZHhJfHCXkxuc0=
X-Gm-Gg: Acq92OFb9lz2CZJWOsZxcRT+CAFwJWX8Ee8Y59eiFpf3Ox6AMGO7nh5QfIaeZ9BH7N2
	QcLkgZFwNFpnP7LV2NevdII6wlBIRkNc/csuybMcbSldRUPZ7+E5kKRmxVTwAlSVh5I2zgR7uxI
	k4SvNqw1pYH7/uejv2Kw9Oay6A6IyOvAagYeFNoknnpL6HHL5NCEcNmQMb0wPihqubiLnip76+m
	++8ASex0/4HAyalyvPMh/KcGNxtiUZOpqeiHhsSn09e6AI5EZnWjKGKFm1noPwxVOZaoceeVUNo
	xTUvkMi4QJaBulx9TrCcFsaNCp5QZm9K36x9oBHoxUUg8lcBC6NhTOOvbHPqqAN7WxrXxkz0C5/
	p+7k+Mg79sptKvWcGG+HOEJkUAeG9qm6AcDED9pvLvsfkKiSB/AX9vchsZ7M0Ka0DV1pIBs5TZ1
	nOYIoaG3rXsiLOkpSv4mSvzTBYZp+BtKaFT0ECSWCPny/L
X-Received: by 2002:a05:600c:3ba2:b0:48a:563c:c8d6 with SMTP id 5b1f17b1804b1-48fc9a0dd8cmr50279545e9.7.1778675824336;
        Wed, 13 May 2026 05:37:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d74536sm75006895e9.15.2026.05.13.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260331-fix-aml-t7-null-reset-v1-2-eb95b625234c@aliel.fr>
References: <20260331-fix-aml-t7-null-reset-v1-2-eb95b625234c@aliel.fr>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: amlogic: t7: Fix missing
 required reset property
Message-Id: <177867582359.1433419.10249035871609628577.b4-ty@b4>
Date: Wed, 13 May 2026 14:37:03 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053706_461101_CB7C4CA3 
X-CRM114-Status: UNSURE (   9.38  )
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

On Tue, 31 Mar 2026 16:24:05 +0200, Ronald Claveau wrote:
> CHECK_DTBS shows missing reset required property in T7 DTBS.
> A new CHECK_DTBS with this patch does not show this anymore.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.2/arm64-dt)

[2/2] arm64: dts: amlogic: t7: Fix missing required reset property
      https://git.kernel.org/amlogic/c/068bad69dc4d3ffdd8ecf41b455cc9e1617d00bc

These changes has been applied on the intermediate git tree [1].

The v7.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
