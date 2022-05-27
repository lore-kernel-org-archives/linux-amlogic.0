Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7560C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 May 2022 09:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWNr3L9p5yEPiK4PIsoZ+F0JPEfWDhVLL7WGuuU/aoI=; b=c9KmOYrwAutU9h
	t3QiCYZQ8BNO3HN5T8Z+WWUMyXfQS8bE2KLBrffKcWT/0jNokuv619BuTKxKkEuwYT2FBi/ntNHO8
	p8WvpsQQst8xpeH1qVAH9tbmGSOdHT53BAL1SiFTiq/WLJ79W/Cbr/uL4ttzaSyxjhxGO+eQKdWCe
	olALgCtr9m0ZXAJd+3N20/XGoHpwizqhwp/TTtEEN9zCpusuIRZzyAshnCdwvahk0It3f3Jgt94IZ
	m5lKHSQ57vfwMnXVgCZQsoRe+etNtxD+YfdYkK1CAznYc1L+UQN0Fr5Vv9ZBpHPXkFrABCjnfVBES
	UX6cczG5rs2ISf2Q61Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuVpv-00H73N-Fv; Fri, 27 May 2022 09:00:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuVpi-00H70V-0y
	for linux-amlogic@lists.infradead.org; Fri, 27 May 2022 09:00:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 7so1135098wmz.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 May 2022 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KgOndPAfyvmijpJMBj3VbzHjuhYijVFfIUTkT6Spj0I=;
        b=yq2L9Iov93prcrerNONY8meYTbFWpiD9fleBq4FXsdIRRV8zY6ph1xHdNY/dzwUrcH
         vvxyR7HN6/UlVUj1cLMIpxlGYFf4UiDun28TCZzbHE7fNGH0BeuIipqNGnKNpqiAj1Mj
         DBtUJc1PrpN+1hs6oQMc1WoWyoCsE+ZOzGDMWBsXA7EO223rkpH9kKWQIn7gsB3q5h2C
         lAvbqAyNeosmQHZ0E7+ipm13Rfd8quSni+xiz9546V4eiDxUdj10O08iBeIaw+KXjHbP
         MwqfUHMwlumF0Hq84IIh5K4nhvndxXbYTxhG7szKBIBD0U82R5tnmIMQ0FwwZhB5RAb0
         H08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KgOndPAfyvmijpJMBj3VbzHjuhYijVFfIUTkT6Spj0I=;
        b=S8WzR5DlfN+dRnLwOXI3bTBHujfiOyMH0Hc1GjeTv89Qw6mAZQ4j4cwNkB43yvzUNm
         7wBpq2QldQ0mvca/Yxckj3XhGJmczLb0mtP10mgML+g5Wr8qEnn/pT2sGTEmFTBCeXaV
         SBTjfqymQHLzqE64lDLtStgD7+/VUFkvlcMJiU0l1mxvXgphR3nh1Ti03tRGO+ViNypH
         bLe5tbvS+raAz00sZAY0iam8y3Y7Hy1mAnKnAQjf+novrO8eke6X4eLbyNQZANyfDilD
         Qif8bpzF6pMTmIZSGrSaW+okW44ANQyFR0xyZuUWhUjEoW+kfw7DyIVMgHx/KrDh6X4+
         TvdA==
X-Gm-Message-State: AOAM531NmvnAvlTueSTqlyt5mioJOYe1kyNQT16sk/4uNQtL9VTIP2M1
	c9/wY4E93+U3q1bJXjQWUwukdA==
X-Google-Smtp-Source: ABdhPJzkbMuzL2NSPBI/c7uo7e2MnvfNayThyWCQt8pFuNppY95EZcMlvC/RzIZPXwXVBZa2UnWCTQ==
X-Received: by 2002:a05:600c:1e85:b0:397:6bcb:c52c with SMTP id be5-20020a05600c1e8500b003976bcbc52cmr6042990wmb.41.1653642031059;
        Fri, 27 May 2022 02:00:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f081:5ded:fc86:365d])
        by smtp.gmail.com with ESMTPSA id u12-20020a5d6dac000000b0020feb9c44c2sm1347807wrs.20.2022.05.27.02.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 02:00:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	soc@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: adjust whitespace around '='
Date: Fri, 27 May 2022 11:00:29 +0200
Message-Id: <165364202476.67525.12506050494553411270.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
References: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_020034_097068_FAFEAB94 
X-CRM114-Status: GOOD (  11.56  )
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

On Thu, 26 May 2022 22:45:51 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.20/arm64)

[1/2] arm64: dts: amlogic: adjust whitespace around '='
      https://git.kernel.org/amlogic/c/7c928017461a740300ba0d74a5a4e7c09c8f75cd
[2/2] ARM: dts: meson: adjust whitespace around '='
      https://git.kernel.org/amlogic/c/5d08817f99847d0ccff65903a99794703de9ad46

These changes has been applied on the intermediate git tree [1].

The v5.20/arm64 branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
