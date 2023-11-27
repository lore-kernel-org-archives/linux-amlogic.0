Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACE6C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1a7HCpS/A+XGy8SUMBX1+mzEmLTlYFujdFPIc/0791E=; b=dIGQB0DXO2xGGW
	WvpvP3xw9aiMJ8oz3KEA7OmqGzrCSy7d5Fqeixw90tl28e36y3DyE4FupBGzxYxzsB2P+eRbVv0Bw
	d5K4PHE/s5XnBjHs5ODpKTKPBBhYXkeO5cRWq38732kNKyEUdyrVAqXPZAEpY4LTJzloJ7G5jV5j3
	u45PQrPPfoROjj2sNIJcE0yRDIA/iP/qK9UDDYpMlCXJFh59A+phMEtg6eU0C5DUpU7z4j7UyIVxB
	jUu4JfaebmxSjUBgo++P1aDqNBeMA9bq9247iMAN7b+jLd0Suwowk0jmdRq7FpjhiX2LHRyGrIucp
	O2WP1by7j+8CzVE2us5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WpU-001oM0-0P;
	Mon, 27 Nov 2023 08:18:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WpQ-001oLG-0M
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:18:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso26977625e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073129; x=1701677929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h89GXbFD81NDzhGTriqWBEbkzw5Rvdu8mS0nXlRxJHI=;
        b=rpXdPKS01N99sdca1U62rugu+fFgH6KMkCKFV5sk1YWKsyzoR5+Jb1G6kJza164AxU
         GlUb0xwaiVMaC3zpRBF7AN86NS15/A7tX0C8QWBj2yLKjAyAxj7kYw7PasulO2ShpE0i
         u3sGYPwqv5Nc9Jy3Q7u8arfFO1nwvgRThvvgd78JYaHnyLhvfRTFU6qYEd4MuZHCXbMR
         UGJVcJKj8tXmLKDPk7VaVF81bi1StCn0MhyM1SKf5QheQ6i3sr7IzDaJTgeewT6FCjqe
         PV5oulQGRtwTVG8BdeadWh+TvDWYy7CZRWVqRyCTfLs4GBae068jNUmj0IGAQ+RUKGF6
         QqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073129; x=1701677929;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h89GXbFD81NDzhGTriqWBEbkzw5Rvdu8mS0nXlRxJHI=;
        b=FzGP0D13jL5JYect2wCZmU5z42jSM/XsBFiesZYFNF/Gu33CSfTgFZzF64d1U8qK4g
         JBpBRRwDSTGzYJTB/4dXmyiWTIFYOUV5DdB9AYH1c5YdyYhHXDxpD2KS2EQ4+SrSSjMz
         hvhhBuSfYtsoLW54OsPv7QbBvV1KpQHAvosTR43jaeEQyy6aElMYu6uobIMtYZMl9UJ5
         Y0NqX0YMoatG9119VaQVjsd4vjbp88obI7cWHfZCN99pVtNQwG1MxoncAqEMaXGCMSSs
         1jg8fTuP3zG4Eqzudb0LeXdZp3NYaX6Sya+UdDhPhhmEz63aZia5FBU/n+BbmUxpMEuJ
         YozQ==
X-Gm-Message-State: AOJu0YwkOfDvgHj1+4dquUQMoin1E6Fvm0bgkM53okfKNgtWpTdIwaQj
	gQ13j/D4dytxS1LwtqZlh1ZqZA==
X-Google-Smtp-Source: AGHT+IE122eG2RYM0HV+QgTktY0OcgpWuFBem0h1klzynMJY5BA3qL25KkkwogUqQew3t81Osn/r/g==
X-Received: by 2002:adf:fa85:0:b0:32d:8eda:ba65 with SMTP id h5-20020adffa85000000b0032d8edaba65mr7922595wrr.66.1701073129284;
        Mon, 27 Nov 2023 00:18:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id w12-20020adfee4c000000b00332f82265b7sm4992855wro.20.2023.11.27.00.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:18:48 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Miles Chen <miles.chen@mediatek.com>, 
 Alexey Romanov <avromanov@salutedevices.com>, 
 Evgeny Bachinin <EABachinin@salutedevices.com>
Cc: kernel@sberdevices.ru, evgen89bachinin@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231108125604.162383-1-EABachinin@salutedevices.com>
References: <20231108125604.162383-1-EABachinin@salutedevices.com>
Subject: Re: [PATCH v1 0/2] firmware: meson_sm: cleanup error paths inside
 probe()
Message-Id: <170107312844.1083555.11730115434079674375.b4-ty@linaro.org>
Date: Mon, 27 Nov 2023 09:18:48 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_001852_221922_B70370EF 
X-CRM114-Status: UNSURE (   9.41  )
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

On Wed, 08 Nov 2023 15:56:02 +0300, Evgeny Bachinin wrote:
> At first, patches series refactors sysfs node creation to avoid extra code
> paths. After that, the resource leak in probe error path is fixed.
> 
> Evgeny Bachinin (2):
>   firmware: meson_sm: refactor serial sysfs entry via dev_groups attrs
>   firmware: meson-sm: unmap out_base shmem in error path
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/drivers)

[1/2] firmware: meson_sm: refactor serial sysfs entry via dev_groups attrs
      https://git.kernel.org/amlogic/c/d397965e584e0f2c6193b927c1e7693d514a6738
[2/2] firmware: meson-sm: unmap out_base shmem in error path
      https://git.kernel.org/amlogic/c/d8385d7433f9c7d718448465e30d6b8c1207b59f

These changes has been applied on the intermediate git tree [1].

The v6.8/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
