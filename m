Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574E4ECAAD2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 07:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a43vVbkXyCA0JDc4nMsqSaTC0Nmtnb1KRjT17TZLQXg=; b=Zg/dLvqY5ezQiq
	lV3S4DbVI2QQt6BDNxcmiHWGxcg1H4Nl7VznVLcu+E6YIihxBo9EZf/2nqkiASO6tukOjnhBH+KLk
	hgkOW805Wy0wXnfV81HEiIcATANzjZISpBjR6FsFv7AOcm2FZF3A0QgErz3Sw1scOBTZ9+MPWahvm
	ntUiz3BhF6Ytl3knjgK/+TrdV/t9nhEqLjZhNo8R4urIrPfpja8fGNaq/GGi3J4oNHcyN4D7TLPcD
	oxs9OqUYRuxs+nC7O9rMGcZ8cSnTMm8Ad3A6r3rUxqblJ282tzL2k6+g+tpDiscCy7ZjcTevhcdL6
	jQ8PpuG5/OZEzwql/4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZXr-005q15-4a; Mon, 29 Aug 2022 07:50:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZWp-005pT7-4u
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 07:49:56 +0000
Received: by mail-wr1-x430.google.com with SMTP id b16so1453575wru.7
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=n2NE4QXm0+W3bOY1EadNeANDSpJMut2g9jYTggnpUw0=;
        b=IyRssG71YCgbLKWf/87UdkR9e5crItNHD93AhHv9+iQyTXo01FuwMZyRpnBfTcCikk
         nr+kWaLKB9lBLH4N6003ofv4UB40hcHA6/Of5YwcKQOfL333xggPjfBEaUScX2BbAtwz
         spK3TAAF89sRXl9E90pWNcYkn1DtF7mu2L48F8lDDykZrDPC/0xFG+G9y0+Z8+mvtJ65
         sYWJaAs6GKLyVPx0Fhs+vuLxbkT2alXxE1MsPL4TTu+JdqNTCPjPj6mzqksxKUi8EI6S
         zVKVo6P/M2ViGPscs9wge7glaLTQT4ZS/AQdx0ztHgwgubkiW/16VUpMtY0zxYZiFo3B
         9jwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=n2NE4QXm0+W3bOY1EadNeANDSpJMut2g9jYTggnpUw0=;
        b=RwVtXqVufGGgpkpnaV7oSuYE95ETgg4GeBAI9DxxMTDuS5yGzoqIgg6JobXg8IeV6N
         nJL8FdTAmXS/tJtnGiFp8ETmSocQilS26Tu0kPfSlpaIYFbNoLDRqMWMUJVsmhXmWkxE
         kcw7RvBHhX9Nydoju3Y4wPcajHTG86tO3vVjopH5PbK1JmmIXdPMZKqqehrjFYuzFAIU
         2o59jyy/EWIlEBX+R2rZrDHdjDq+WVQs6JDzGIlBhfpoazxwvocGmpv+E4vIsI07sY5y
         K12fjUq1SA8+GXMyGMN/siXzRJ5zPHEXDkbi7saquTkjKHAaXK4w9xi0X4/ieBTfv+3X
         zXBA==
X-Gm-Message-State: ACgBeo0rbw8thxp+WykzeXa+/V1dv+AdQm4wGK8pUqkxQbZvyz70q9s+
	1eP0vqPtpJZhCGcfhnlOpVMdrA==
X-Google-Smtp-Source: AA6agR4tThWO9mcfcs4H13E20BaSP4QbrdwocE68e46fIYrBrjVy33JZpzJ0osReuetQZAVAHeA1rw==
X-Received: by 2002:a5d:5350:0:b0:225:7560:8403 with SMTP id t16-20020a5d5350000000b0022575608403mr5245387wrv.507.1661759387447;
        Mon, 29 Aug 2022 00:49:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:6124:6b74:2847:d37b])
        by smtp.gmail.com with ESMTPSA id n8-20020adff088000000b002258235bda3sm6179559wro.61.2022.08.29.00.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 00:49:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Fabio Estevam <festevam@denx.de>,
	martin.blumenstingl@googlemail.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-g12a: Remove 'enable-active-low'
Date: Mon, 29 Aug 2022 09:49:45 +0200
Message-Id: <166175938125.23737.7078517350794799355.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220827203813.1742715-1-festevam@denx.de>
References: <20220827203813.1742715-1-festevam@denx.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_004951_481023_BCE786B0 
X-CRM114-Status: GOOD (  12.33  )
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

On Sat, 27 Aug 2022 17:38:12 -0300, Fabio Estevam wrote:
> The 'enable-active-low' property is not a valid one.
> 
> Only 'enable-active-high' is valid, and when this property is absent
> the gpio regulator will act as active low by default.
> 
> Remove the invalid 'enable-active-low' property.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.1/dt64)

[1/2] arm64: dts: meson-g12a: Remove 'enable-active-low'
      https://git.kernel.org/amlogic/c/6b2592f087bb7e35fd0a6616bc92d87d9af63aab
[2/2] arm64: dts: meson-sm1-sei610: Remove 'enable-active-low'
      https://git.kernel.org/amlogic/c/fdfaefa831728110f591764c1dc274fb3739e5c1

These changes has been applied on the intermediate git tree [1].

The v6.1/dt64 branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
