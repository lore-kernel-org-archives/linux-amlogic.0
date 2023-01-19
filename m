Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB678C00A5A
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 08:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zC9xmZvByBdbh+XAkxX1Kpz9xCdDk0Pq3j9zvMRLH6s=; b=c9Goph2RHjEZhy
	xX0ACnPoOz8mkwvWySa/p5jqLw3M2kigDxqv0v1NWI2l1jBoDw4HDTVek5K4EKmsfwQ9SuPcbfcso
	/tvzL9UfuqBmIvniwVcs8TCKHthbEACQeBKftWt9wmG9vTcj1slxAUb4zOI1i+OVKet9Fw1E5IGFb
	2HQbn9Tbo0QS+q1comz/xeBmZoe/rE82NdfOKyJ3MqvyVTkJqu+tRsXUGSbag7Zcqh51FHv/mBvKY
	2kh1KMsBjqUd3KNjzNme/BY3i9ewIfkobKoxhassyXQLYDgbQECbkYbURsyx6D6YEd1XBUc5NSwfp
	RRyZRE4djjOKvvGFNovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPqe-0040Xk-5S; Thu, 19 Jan 2023 08:00:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPq2-0040Hp-H0
	for linux-amlogic@lists.infradead.org; Thu, 19 Jan 2023 08:00:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id q10so1009314wrs.2
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 23:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYZCg/3/ut1o/d76SDR2YpB6Reg9gtu46TPyema/J8U=;
        b=l3SXRFR99cRKVe4ziF5/ZZlZYvM8yL6jfi5q1UOpIcyhtsVx2gCMuJKrDts1VDA7mP
         WSyz6+o14u2NecPwikH7ubx1PMJO+TNhjinigGB3BfPFeEYEhcXQ/xtbLRWvXmdoiILL
         BJkkWJzXrHdfII/sLWWE9WuzYY5hFqQx/aEzCHtRGsENqtmfs3EQ7+IP6hLue9p6SOIt
         efuouoMyKDfNLyl4//UyK/JYNpu/6ryz20VydOKs6OGYokIOebXMIvBz+zhq43qTtBOK
         Hy1i4GesLCPD4Ts+CBVrQOWSRfpr9etWv3VI5EY7/nuL89fFFr5kYkPANkFeC0eiD45b
         e6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYZCg/3/ut1o/d76SDR2YpB6Reg9gtu46TPyema/J8U=;
        b=cj3IVsDY98jcuhDlIsn+jMdS5cNYh64Vq4q7hZ4VbpPF/F/PZkPzYBBvVbw/RqLiAe
         yZPhRLmWd8wLULz2FLpwkxomdSLMr3PkAqtyExya1frc+r2637ZryYnr+gGeULhvCU3G
         5i+BmevmQDrrSCWuWR19JJJQebOgo9I+zU6I+/tiJJPw2GoqJ1Tvtw/p0nqKtKiNWF5u
         yrGQUpBNRZQ3NdMJBp3S+4iLwYlVDeTzg1Lfi8E6nZ9TnOxb8HMB3vr+dtB2szdyBMZ5
         wduw/dcLB3nhasp2FQvlTE/8Npn8FGrBz3NnSywlimw8l+Hyu1Jepx8tHElOhCvReb+L
         OglQ==
X-Gm-Message-State: AFqh2koqztC5nnIJ6vzDALsKXQvbJiGBXe9fN9q+Er0q/KsP5iEKRWHE
	1agDPzMaR5XfXm5t219L6zOLKA==
X-Google-Smtp-Source: AMrXdXt7IDRcISpgYHJKFxxxVlaUR8+5HGmdYX3ntg5hNjtazHCiYh+3KWeBHvSoEYDOssuXud1zDg==
X-Received: by 2002:a05:6000:25c:b0:2bd:db3b:33f5 with SMTP id m28-20020a056000025c00b002bddb3b33f5mr8649143wrz.3.1674115196983;
        Wed, 18 Jan 2023 23:59:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f6-20020adffcc6000000b002bbdcd15e44sm29048739wrs.37.2023.01.18.23.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 23:59:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230119053031.21400-1-christianshewitt@gmail.com>
References: <20230119053031.21400-1-christianshewitt@gmail.com>
Subject:  Re: [PATCH] arm64: dts: meson: remove CPU opps below 1GHz for G12A boards
Message-Id: <167411519619.302421.6750539043100229813.b4-ty@linaro.org>
Date: Thu, 19 Jan 2023 08:59:56 +0100
MIME-Version: 1.0
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_235958_592586_EE171B60 
X-CRM114-Status: GOOD (  12.14  )
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

On Thu, 19 Jan 2023 05:30:31 +0000, Christian Hewitt wrote:
> Amlogic G12A devices experience CPU stalls and random board wedges when
> the system idles and CPU cores clock down to lower opp points. Recent
> vendor kernels include a change to remove 100-250MHz and other distro
> sources also remove the 500/667MHz points. Unless all 100-667Mhz opps
> are removed or the CPU governor forced to performance stalls are still
> observed, so let's remove them to improve stability and uptime.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/1] arm64: dts: meson: remove CPU opps below 1GHz for G12A boards
      https://git.kernel.org/amlogic/c/3cbd431c2b34d84605d358c8c57654193fd661fb

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
