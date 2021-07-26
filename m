Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D044C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4543360F37
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4543360F37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIJZpH+aQtKqilbR1zJlLL1AZnStkOgXydmzp9GHxaE=; b=FCPysaLVfQDII2
	RXDLX5y7hp8H3DqiTarF4k450jS8g5WCgFpii7//2Vu7RUCkplds8nxM32erP7o1KwW5dQ+es6/9k
	dMhHNSiDBS4XeVvPhnzkq154AkBU5d9J7lDwArHdA0OZCw8Rz6c+9/FUd9sL/zNe4P8MYo0fhtGm3
	xIieHUYs0bPIOcl6Z7a1g9aFVchXI7yKsXelr4/MYM8JghzpHlgFvcyjcjPOw883z/e6yJVgyrbYF
	ggroqd8PLuuJE/jDzboYyEz2gfTM1rvVaEsOWxRqqpnxPh6GS1xs8msxD9aacTKohEU33uvvR2x6a
	icsJWiuopsuuj2WIePNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vkJ-00A7Xn-MA; Mon, 26 Jul 2021 08:13:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vjH-00A78g-Fr
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 08:12:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id q3so10052017wrx.0
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 01:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4tEJ1EXV/Vdj/aCsuc1acozXg5J8k5N2sXI1v0Cr20c=;
 b=e25I2djGYRs0cUrhNFDYhZ1z1GVsJrH7VpwqSAfKS5YX5c6CASIGCQRY7f3oCDup4u
 aosNR86/MvXBkx7k6ytr8EkWxebxzvsst3gIfun3OLhfxfQybtKbAl0XDl8DpKubZLT1
 f/vaaLEyxSO4AJQu3KRivSOvoYM1ya7oManS63VlsB7T1Z2pOu4NskQwsieRdZ2zJK+5
 QPEblBLEwzzO3KutnQyXSf95omkxXwXUXgfBht6JZL5GnnQlezINWI3byjl+6fGvExWW
 zaN2B6oXU2GxTTUJBx8SVAPwcbBkWySM3YDaZudUoXKOzDh8oXVEyLfSI2J6zZiBV5Gg
 zhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4tEJ1EXV/Vdj/aCsuc1acozXg5J8k5N2sXI1v0Cr20c=;
 b=qzw2nsnG9PV6+LoBYKwBB+egG86pLiB6ybzXfe88TZiiEjws+nwQLTtlEYocklL+5p
 t44qGPzgAzOcZ38cW1tx5ZljOpt3gcSYF3K3PX/zCZNMQFjXHzlWOa3juIjqfIh7RfwM
 0wuLKknj5NLWJetAFFqM0ReiVJ+jz/wVKPRheiQka+2Rg0CDMnWWVgh8fwH8ES45LXb1
 XJVIyXiwE/Gt8njbhzBsM+psv0/qZG7gu8s0JenQMwYGz+2S1s79Qt6No4ieu7XbPeD1
 LQIJd4AOs1zw89i75biFisxaUAbK6zOOknFiIQ/BkEABK2RILVllOVFQmKJ/yKlnL5MP
 YHXg==
X-Gm-Message-State: AOAM530T5ll1P+oyp6wfoIhq8uWZU+/ftBqJ5zgbhpG7VtISz7pq8kx/
 GAv9TnzLh8LNyy7B3k+K1LjbWwoU0oDeY+I0
X-Google-Smtp-Source: ABdhPJz0jNUYacAEh7/L0p/4gEnTv2gAafJV6dTmoqoRNJUxeAdokinO6yIuuxegyZMMW1jIsORE+A==
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr17868370wrx.271.1627287169725; 
 Mon, 26 Jul 2021 01:12:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id c15sm646762wrx.70.2021.07.26.01.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:12:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Anand Moon <linux.amoon@gmail.com>, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dmitry Osipenko <digetx@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCHv2] ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC
Date: Mon, 26 Jul 2021 10:12:38 +0200
Message-Id: <162728713307.14205.5671227677376567217.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715092233.1084-1-linux.amoon@gmail.com>
References: <20210715092233.1084-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_011251_569045_C5C69FC6 
X-CRM114-Status: UNSURE (   7.71  )
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

On Thu, 15 Jul 2021 09:22:25 +0000, Anand Moon wrote:
> Enable CONFIG_MMC_MESON_MX_SDHC so that SDHC host controller
> on Amlogic SoCs boards enable support for eMMC and MMC drivers.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/1] ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC
      https://git.kernel.org/amlogic/c/c8cec81305463d042d51af946b6b273d8367626e

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
