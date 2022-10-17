Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9E5C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Oct 2022 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oysqgrTyv2jJwTxpasDpOhOpL20k4/cy+CCx2eOKy/g=; b=BtYZHnScg3sH6f
	ss/XMSuHEz3VDCEuph4+xqEsOBZTky+0f8TVcqlkc0maO0NKlXXdKsiunvu330dq1Yw1HM3l8X0Sw
	DkvZV5RtO6pylgTEcJPDQ4aG4cdqG/wIGYydrjSy5XZMPOS1dMiNJWNOrbsdtDPoEKu3aoBQ1YuLF
	0hXrOMBOJefSrLCbFZstn+hCVVAkuiTne/YZc4t6aiiXxoe3hlRxIUozcob0785KyknAnQMEZZxsO
	VtyDp3f2ZcS0C4cyj6FJ1URuE7wamzJRU7FkL3qN/YQVv/gT4Nq9ytq+mgLvaxueZChRouBop5gqp
	J2FjTagMWaw5RdNUkdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okRzb-00DEF6-0W; Mon, 17 Oct 2022 15:25:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okRzQ-00DECm-R0
	for linux-amlogic@lists.infradead.org; Mon, 17 Oct 2022 15:25:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u10so19032082wrq.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Oct 2022 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZYVsksDtqwMhKI9pLO96NsNwXlR/Zc6fECSUWcfYvM=;
        b=loV8pcQ0VH7CSJZBQKJNUBD5gUGjphK138G2Vr0pUFl2hnQjhDNQsmcxOUMHVjZdNS
         kp6rLFoXEEZlMKcL018jlO+y3l2Mrp4Jhboi4EwUkUsib0YhBEusEvf31v2voSd90j+x
         RYCnGy22RpUw88J+/P4j1A3vSyzTwga/FtH7lyNU6PFMxuzP0uh72hQArEJhDcPYUk75
         g/QrFG7tmLmllRJWp+2XmsxP1vTIZnVcRfYFlA2ohe9A9yslYIZj8ov0iOUjBcQBm2Fk
         s3j+P9ur4/2ZezPhxzHUzydUoBxp+6dkJf7E9SAzCDI90tNzZBsNH759pk976J2xfQlq
         Tvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZYVsksDtqwMhKI9pLO96NsNwXlR/Zc6fECSUWcfYvM=;
        b=yF/YjZMPVigxubwi3Y7AHdidZTfngiW48bf5pylKYS/RHIQgP7nP/+Hhbi8cVS1EH6
         S9nzDf3S9pba8Y4GefnbEStZUEttN+JKYgLRfA/YdVGdm8vthcIsSYJf2gnvxom8P63Q
         NgWbvrzb38w7tFX73uRqBXuBA1qXUxcatA+E8TFpPOKwD1rxtIYOtg+77IB7UCC5sE6h
         d9VWeE7TELsrpg2o46RUy0cG3vqksrHSRg6HuSIxjS6GQMg3c9PFe02bJjs4N6IEg8By
         q6I1NKHTnCAVOqXhid0M2krw1glifV/sPEIQfcLsUin7jGZMoOBV/uWQsjtUA7o6Q4ec
         hNCA==
X-Gm-Message-State: ACrzQf0TlHzK5hfypKAndkXgVDc8r6sshZz9ijTnVK1i05d+le6C7bYL
	aVMvE10pivIPBTbBKuUAhrUy2Q==
X-Google-Smtp-Source: AMsMyM77wWshVlky9KSI5+U5hfTIhi0l0mEFqE4J649NfP0lv0covsJc7zie3crYcrA5ylJ0MK860A==
X-Received: by 2002:adf:fc10:0:b0:22e:55e5:9bb5 with SMTP id i16-20020adffc10000000b0022e55e59bb5mr6540090wrr.112.1666020313851;
        Mon, 17 Oct 2022 08:25:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id g2-20020a05600c000200b003c5571c27a1sm12894977wmc.32.2022.10.17.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 08:25:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <20221012185234.never.936-kees@kernel.org>
References: <20221012185234.never.936-kees@kernel.org>
Subject: Re: [PATCH] firmware: meson_sm: Fix memcpy vs iomem type warnings
Message-Id: <166602031304.3572695.12870664862275915316.b4-ty@linaro.org>
Date: Mon, 17 Oct 2022 17:25:13 +0200
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_082516_882581_023102F1 
X-CRM114-Status: UNSURE (   9.69  )
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

On Wed, 12 Oct 2022 11:53:16 -0700, Kees Cook wrote:
> Use memcpy_{toio,fromio}() instead of memcpy(). Silences warnings from
> Sparse:
> 
> drivers/firmware/meson/meson_sm.c:170:17: warning: incorrect type in argument 1 (different address spaces)
> drivers/firmware/meson/meson_sm.c:170:17:    expected void const *
> drivers/firmware/meson/meson_sm.c:170:17:    got void [noderef] __iomem *sm_shmem_out_base
> drivers/firmware/meson/meson_sm.c:170:17: warning: incorrect type in argument 2 (different address spaces)
> drivers/firmware/meson/meson_sm.c:170:17:    expected void const *
> drivers/firmware/meson/meson_sm.c:170:17:    got void [noderef] __iomem *sm_shmem_out_base
> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
> drivers/firmware/meson/meson_sm.c:206:9:    expected void *
> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.2/drivers)

[1/1] firmware: meson_sm: Fix memcpy vs iomem type warnings
      https://git.kernel.org/amlogic/c/7dc69c7d073e6004a281db8f7f15cf6ebf702ea0

These changes has been applied on the intermediate git tree [1].

The v6.2/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
