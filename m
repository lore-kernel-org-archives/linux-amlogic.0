Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847DFC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Feb 2022 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10L2eZVgL85nupuq0MM8f5fCo37f43isVD9540pz3ks=; b=j2ZgCTwOZ5aUIA
	EPDPf/WDvO84+d9bn8WuySU+sorT/nVOZLSWB3+79MYkriyXLkcFcvHlk6e2M0S6STygVP98AGvm5
	0vKKMjHHtyfn+sMrC8R2RkoDcw/0ljaLsAeVbqdPgSrba9RKxMYHo6EI9D8bue5v/JT+pVyp7i3ZN
	4W81veTG0P4KlK0nidpkp0OHzEfN9vUZgVMqCGYUJL96r0FEqooudScnKpc35CzTyznJJDURnaomN
	5PqLaKZOvZisqwb2xkjNut8pRJmw2qR1P+Qlco/lBNGOMF4EQcC3CQP4BR9luaQo2cSIUkaxBTNKy
	F6v30WSHPRYARG0SswOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFtt0-003lPx-R5; Fri, 04 Feb 2022 08:24:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFtsN-003l6b-8k
 for linux-amlogic@lists.infradead.org; Fri, 04 Feb 2022 08:23:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w11so9845986wra.4
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Feb 2022 00:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zf8akufeGhb+PPmP1SAbnaUbaBMJcqn9Z0xu1czGwCg=;
 b=AXj9j3dMMLt36X8aezSoIjs4fCy31D4QAFyxiNWb1N5hGx5LZtrttD5fHlnh46XWvA
 lJOYTG6wlZ63LK6qZTpj0EBTkYM70azohqkXi2CcAytWWV534Nv019b5tVc2qUbWRE7Z
 ulJPFz82hCyLdYUvh3lgGJT1fnxEKf7jC7IdV0yxBypM0AwYeExkbdDIM4QiRajYGsOD
 wr873VB9clThGIThv0Js/0h6PgQ9U2WZwhmZuoLLlPmw7+a8IT9qeReHKkviiEIb6whf
 iNHYBoAaVJx39cGlvM/VuHKvjOFqsliSRUkThbeqtGdkTmTO7dEyqlB/J4br/e5wx703
 WEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zf8akufeGhb+PPmP1SAbnaUbaBMJcqn9Z0xu1czGwCg=;
 b=NM70mCLR4L1dXGYgVrV4O6xMD5DGQ8T69eixTfny0VAJDeQ+/8O7+1CrreBknJlMrV
 34/Oqn0iI0k/h1eJjp0sadtH4f6uft+ONuH2ib3Vh6xckgDrWtYk1edgKDISZLuOWKKF
 ZUno+WDB+h4yHnrf5IPR7ifsJMhwA8RN1L8HFy7JsX3H7IMxu/TkvjVyW+zev+lCIDav
 II4mgWTwR+wB+pyB8iNzGUu/wyrhvmmxaq3ifXbDk+kY6429xwI/S5A3oWEe+MbCTUpL
 U4KOwvE0yP/QhYved6I5Yr7sXalk7oQc/V7te7cQxF4Ugw9shWaf5qL6SOyleZSsSAUo
 gEfw==
X-Gm-Message-State: AOAM5301M/PQe/vewEHMZIZCbZO5k/+S/h6V7nLpb63UY/TjShg0TrBG
 oe5ArDIoGSnB7FOiHitHlEkcGQ==
X-Google-Smtp-Source: ABdhPJwgyM90qtmbsuXHi4DPp4XSzDTrhOZrcaVGWGmQn2thSj0asC/9RiSxtEgsaB+nyDIeoU1Rpg==
X-Received: by 2002:a05:6000:178d:: with SMTP id
 e13mr1491699wrg.199.1643963005941; 
 Fri, 04 Feb 2022 00:23:25 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:3fbe:ff10:110:739])
 by smtp.gmail.com with ESMTPSA id
 s22sm8914078wmj.38.2022.02.04.00.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 00:23:25 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Dongjin Kim <tobetter@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-g12b-odroid-n2: fix typo 'dio2133'
Date: Fri,  4 Feb 2022 09:23:17 +0100
Message-Id: <164396299209.31118.14013385169843675577.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YfKQJejh0bfGYvof@anyang>
References: <YfKQJejh0bfGYvof@anyang>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_002327_372706_5C351D68 
X-CRM114-Status: UNSURE (   6.93  )
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

On Thu, 27 Jan 2022 21:29:25 +0900, Dongjin Kim wrote:
> Typo in audio amplifier node, dioo2133 -> dio2133
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.17/fixes)

[1/1] arm64: dts: meson-g12b-odroid-n2: fix typo 'dio2133'
      https://git.kernel.org/amlogic/c/bc41099f060ea74ac8d02c51bd0f5f46d969bedf

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
